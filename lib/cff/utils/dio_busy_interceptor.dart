import 'package:amoora_mkt/cff/services/loading_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioBusyInterceptor implements Interceptor {
  final Ref ref;
  DioBusyInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // ref.read(busyProvider.notifier).state = false;
    LoadingService.dissmiss();
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ref.read(busyProvider.notifier).state = true;
    LoadingService.show();
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ref.read(busyProvider.notifier).state = false;
    LoadingService.dissmiss();
    return handler.next(response);
  }
}
