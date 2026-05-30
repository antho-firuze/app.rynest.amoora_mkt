import 'dart:io';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/services/loading_service.dart';
import 'package:amoora_mkt/cff/services/snackbar_service.dart';
import 'package:amoora_mkt/cff/core/app_base.dart';
import 'package:amoora_mkt/cff/utils/dio_service.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Ref ref;
  ApiService(this.ref);

  final _kLogName = 'API-SERVICE';

  Future call({required Reqs reqs, bool showBusy = true, bool showError = true, bool withToken = true}) async {
    try {
      // Token Validating
      String? token;
      if (withToken) {
        token = await ref.read(authCtrlProvider.notifier).getValidToken();
      }

      final dio = ref.read(dioTokenProvider(token));

      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      FormData? formData;
      // Check if any files to be upload
      if (reqs.filePath != null) {
        // if (showLog) log("Adding file : {${reqs.fileKey} : ${reqs.filePath}}", name: _kLogName);

        dio.options.headers['Content-Type'] = 'multipart/form-data';

        Map<String, dynamic> payload = {}..addAll(reqs.data ?? {});
        payload[reqs.fileKey] = await MultipartFile.fromFile(reqs.filePath!);
        formData = FormData.fromMap(payload);
      }

      if (showBusy) LoadingService.show();
      final response = await dio.post(url, data: formData ?? reqs.data);
      if (showBusy) LoadingService.dissmiss();

      return response.data;
    } on DioException catch (e, st) {
      if (showBusy) LoadingService.dissmiss();
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final endPoint = "\nEndpoint: $url";
      final err = _dioErrorHandler(e);
      final errCode = err['code'];
      final errMsg = err['message'];
      logE("[$errCode] $errMsg $endPoint", stackTrace: st, name: _kLogName);

      if (showError) SnackBarService.show(message: "[$errCode] $errMsg");
      throw Exception("$errMsg");
    } catch (e, st) {
      if (showBusy) LoadingService.dissmiss();
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();
      final endPoint = "\nEndpoint: $url";

      logE("Error: call $endPoint", error: e, stackTrace: st, name: _kLogName);
      rethrow;
    }
  }

  Future fetch({required Reqs reqs}) async {
    try {
      // Check if provider is already disposed before creating Dio instance, to avoid memory leak when user sign out while API call is still in progress
      // This issue are often happen while fetching data and then user closed the page quickly
      // This is also called debouncing to prevent multiple API call quickly
      var didDispose = false;
      ref.onDispose(() => didDispose = true);

      await Future.delayed(const Duration(milliseconds: 500));

      if (didDispose) {
        throw Exception("DIO Provider disposed, cancel creating Dio instance");
      }
      // End of debounce check

      // Token Validating
      String? token = await ref.read(authCtrlProvider.notifier).getValidToken();

      final dio = ref.read(dioTokenProvider(token));
      ref.onDispose(dio.close);

      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      FormData? formData;
      // Check if any files to be upload
      if (reqs.filePath != null) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';

        Map<String, dynamic> payload = {}..addAll(reqs.data ?? {});
        payload[reqs.fileKey] = await MultipartFile.fromFile(reqs.filePath!);
        formData = FormData.fromMap(payload);
      }

      final response = await dio.post(url, data: formData ?? reqs.data);
      return response.data;
    } on DioException catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final endPoint = "\nEndpoint: $url";
      final err = _dioErrorHandler(e);
      final errCode = err['code'];
      final errMsg = err['message'];
      logE("[$errCode] $errMsg $endPoint", stackTrace: st, name: _kLogName);
      throw Exception("$errMsg");
    } catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();
      final endPoint = "\nEndpoint: $url";

      logE("Error: fetch $endPoint", error: e, stackTrace: st, name: _kLogName);
      rethrow;
    }
  }

  Future get({required Reqs reqs, bool showLog = false}) async {
    try {
      final dio = ref.read(dioProvider);

      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final response = await dio.get(url);

      if (response.data == null) {
        if (showLog) logX("Data response: null", name: _kLogName);
      }

      return response.data;
    } on DioException catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final endPoint = "\nEndpoint: $url";
      final err = _dioErrorHandler(e);
      final errCode = err['code'];
      final errMsg = err['message'];
      logE("[$errCode] $errMsg $endPoint", stackTrace: st, name: _kLogName);
      SnackBarService.show(message: "[$errCode] $errMsg");
      throw Exception("$errMsg");
    } catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();
      final endPoint = "\nEndpoint: $url";

      logE("Error: get $endPoint", error: e, stackTrace: st, name: _kLogName);
      rethrow;
    }
  }

  Future refreshToken({required Reqs reqs, String? refreshToken, bool showLog = false}) async {
    try {
      final dio = ref.read(dioProvider);

      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final options = Options(headers: {HttpHeaders.authorizationHeader: "Bearer $refreshToken"});
      final response = await dio.post(url, options: options);

      if (response.data == null) {
        if (showLog) logX("Data response: null", name: _kLogName);
      }

      return response.data;
    } on DioException catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

      final endPoint = "\nEndpoint: $url";
      final err = _dioErrorHandler(e);
      final errCode = err['code'];
      final errMsg = err['message'];
      logE("[$errCode] $errMsg $endPoint", stackTrace: st, name: _kLogName);
      SnackBarService.show(message: "[$errCode] $errMsg");
      throw Exception("$errMsg");
    } catch (e, st) {
      final url = Uri.parse(
        reqs.url ?? AppBase.apiUrl,
      ).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();
      final endPoint = "\nEndpoint: $url";

      logE("Error: refreshToken $endPoint", error: e, stackTrace: st, name: _kLogName);
      rethrow;
    }
  }

  Future upload() async {}

  Future download() async {}

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

final apiServiceProvider = Provider(ApiService.new);
