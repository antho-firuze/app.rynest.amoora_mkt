import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _kLogName = 'SSE-SERVICE2';

class SSEService2 {
  final String url;
  final String? token;
  final Map<String, dynamic>? data;

  SSEService2({
    required this.url,
    this.token,
    this.data,
  });

  late Stream<SseMessage> _stream;
  String? _token;
  Stream<SseMessage> get getStream => _stream;

  Future connect({bool reconnecting = true, bool showError = true, bool showLog = true}) async {
    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);

      dio.interceptors.add(
        TalkerDioLogger(
          talker: TalkerFlutter.init(),
          settings: TalkerDioLoggerSettings(
            // printRequestHeaders: true,
            // printResponseHeaders: true,
            printResponseTime: true,
          ),
        ),
      );

      _token ??= '330f6a0a37d5d14357fe136b3ea11e06';
      dio.options.headers.putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer $_token");
      dio.options.headers['Cache-Control'] = 'no-cache';
      dio.options.headers['Accept'] = 'text/event-stream';
      dio.options.headers['Content-Type'] = 'text/event-stream';
      dio.options.responseType = ResponseType.stream;

      FormData? formData = data != null ? FormData.fromMap(data!) : null;

      Response<ResponseBody>? response = await dio.get(url, data: formData);

      if (response.data == null) {
        if (showLog) log("Data response: null", name: _kLogName);
      }

      // Transform stream value Uint8List to SseMessage
      _stream = response.data!.stream
          .transform(uInt8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .transform(const SseTransformer());
    } on DioException catch (e, s) {
      final endPoint = "\nEndpoint: $url";
      final err = _dioErrorHandler(e);
      final errCode = err['code'];
      final errMsg = err['message'];
      log("[$errCode] $errMsg $endPoint", error: e, stackTrace: s, name: _kLogName);

      log("Error: connect [sse] $endPoint", error: e, stackTrace: s, name: _kLogName);
      if (reconnecting) {
        log("SSE reconnecting... $url", name: _kLogName);
        await Future.delayed(Duration(seconds: 5), () => connect());
      } else {
        throw Exception("$errMsg");
      }
    } catch (e, s) {
      final endPoint = "\nEndpoint: $url";
      log("Error: connect [sse] $endPoint", error: e, stackTrace: s, name: _kLogName);
      if (reconnecting) {
        log("SSE reconnecting... $url", name: _kLogName);
        await Future.delayed(Duration(seconds: 5), () => connect());
      } else {
        rethrow;
      }
    }
  }

  Map<String, dynamic> _dioErrorHandler(DioException e) {
    Map<String, dynamic> err = {"code": 0, "message": ""};

    // When not connected (RTO)
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        err["code"] = e.type.index;
        err["message"] = "Connection Timeout !";
      // err["message"] = e.message;
      case DioExceptionType.connectionError:
        err["code"] = e.type.index;
        err["message"] = "Connection Error !";
      // err["message"] = e.message;
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        err["code"] = e.response?.statusCode;
        err["message"] = e.response?.statusMessage;

        final data = e.response?.data;
        if (data != null) {
          err["message"] = data['message'];
        }
    }

    return err;
  }
}

StreamTransformer<Uint8List, List<int>> uInt8Transformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) => sink.add(List<int>.from(data)),
);

class SseTransformer extends StreamTransformerBase<String, SseMessage> {
  const SseTransformer();

  @override
  Stream<SseMessage> bind(Stream<String> stream) {
    return Stream.eventTransformed(stream, (sink) => SseEventSink(sink));
  }
}

class SseEventSink implements EventSink<String> {
  final EventSink<SseMessage> _eventSink;
  SseEventSink(this._eventSink);

  String? _id;
  String _event = "message";
  String _data = "";
  int? _retry;

  @override
  void add(String data) {
    if (data.startsWith("id:")) {
      _id = data.substring(3).trimLeft();
      return;
    }
    if (data.startsWith("event:")) {
      _event = data.substring(6).trimLeft();
      return;
    }
    if (data.startsWith("data:")) {
      _data = data.substring(5).trimLeft();
      return;
    }
    if (data.startsWith("retry:")) {
      _retry = int.tryParse(data.substring(6).trimLeft());
      return;
    }
    if (data.isEmpty) {
      _eventSink.add(SseMessage(id: _id, event: _event, data: _data, retry: _retry));
      _id = null;
      _event = "message";
      _data = "";
      _retry = null;
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _eventSink.addError(error, stackTrace);
  }

  @override
  void close() {
    _eventSink.close();
  }
}

class SseMessage {
  final String? id;
  final String event;
  final String data;
  final int? retry;

  const SseMessage({
    this.id,
    required this.event,
    required this.data,
    this.retry,
  });
}
