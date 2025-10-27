import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late Dio _dio;
  factory ApiClient() => _instance;

  ApiClient._internal() {
    final baseUrl = dotenv.get('base_url');

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        log('응답은요 : ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        final requestOptions = e.requestOptions;

        return handler.next(e);
      },
    ));

    /// Log Interceptor 추가
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (obj) {
        log("서버통신 $obj");
      },
    ));
  }
  Dio get dio => _dio;
}
