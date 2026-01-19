import 'package:dio/dio.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //this is were you would auth tokens for your requests
    options.headers["Content-Type"] = "application/json; charset=UTF-8";
    options.headers["Accept"] = "application/json";
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //Here is were you would handle token refreshes, and errors globally
    return handler.next(err);
  }
}
