import 'package:aurora/api/request_interceptor.dart';
import 'package:dio/dio.dart';

abstract class ApiClient {
  late Dio dio;
}

class NetworkClient implements ApiClient {
  static final client = Dio();

  NetworkClient() {
    client.interceptors.add(RequestInterceptor());
  }

  @override
  Dio get dio => client;

  @override
  set dio(_) {}
}
