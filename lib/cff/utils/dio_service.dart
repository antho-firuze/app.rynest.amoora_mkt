import 'package:amoora_mkt/cff/utils/dio_busy_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'log_utils.dart';

// DIO WITHOUT TOKEN
// =======================
final dioProvider = Provider.autoDispose((ref) {
  final dio = Dio();
  // ref.onDispose(dio.close);

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(logLevel: LogLevel.debug, printResponseTime: true),
    ),
  );

  return dio;
});

// DIO WITH JWT-TOKEN
// ==================================
final dioTokenProvider = Provider.family.autoDispose<Dio, String?>((ref, token) {
  final dio = Dio();
  // ref.onDispose(dio.close);

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(logLevel: LogLevel.debug, printResponseTime: true),
    ),
  );

  dio.options.headers['Authorization'] = "Bearer $token";

  return dio;
});

// DIO FOR API FILE UPLOAD WITH JWT-TOKEN
// ======================================
final dioUploadWithTokenProvider = Provider.family.autoDispose<Dio, String?>((ref, token) {
  final dio = Dio();
  // ref.onDispose(dio.close);

  dio.interceptors.add(DioBusyInterceptor(ref));
  dio.interceptors.add(TalkerDioLogger(talker: talker, settings: TalkerDioLoggerSettings(printResponseTime: true)));

  dio.options.headers['Authorization'] = "Bearer $token";
  dio.options.headers['Content-Type'] = 'multipart/form-data';

  return dio;
});

// DIO FOR FILE DOWNLOAD
// =======================
final dioFileDownloadProvider = Provider.autoDispose((ref) {
  final dio = Dio();
  // ref.onDispose(dio.close);

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(printResponseData: false, printResponseTime: true),
    ),
  );
  dio.options.responseType = ResponseType.bytes;
  dio.options.followRedirects = false;
  dio.options.validateStatus = (status) => status! < 500;

  return dio;
});

// DIO FOR WEBSOCKET CONNECTION WITH JWT-TOKEN
// ===========================================
final dioStreamWithTokenProvider = Provider.family.autoDispose<Dio, String?>((ref, token) {
  final dio = Dio();
  // ref.onDispose(dio.close);

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(TalkerDioLogger(talker: talker, settings: TalkerDioLoggerSettings(printResponseTime: true)));

  dio.options.headers['Authorization'] = "Bearer $token";
  dio.options.headers['Cache-Control'] = 'no-cache';
  dio.options.headers['Accept'] = 'text/event-stream';
  dio.options.headers['Content-Type'] = 'text/event-stream';
  dio.options.responseType = ResponseType.stream;
  return dio;
});

// DIO FOR CHECK LINK/URL VALIDITY
// ======================================
final dioIsValidUrlProvider = FutureProvider.autoDispose.family<bool, String?>((ref, url) async {
  final dio = Dio();

  if (url == null) {
    return false;
  }

  var type = url.substring(0, 4).toLowerCase();
  if (type != 'http') {
    return false;
  }

  final state = await AsyncValue.guard(() async => await dio.get(url));

  return !state.hasError;
});
