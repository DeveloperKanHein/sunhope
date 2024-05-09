import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  final String baseUrl;
  final String token;
  DioConfig({required this.baseUrl, required this.token});
  late Dio _dio;
  Dio init() {
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl, headers: {"authorization": "Bearer $token"}));

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true));
    }
    return _dio;
  }
}
