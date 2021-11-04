import 'package:dio/dio.dart';

import 'logging_interceptors.dart';

class DioClient {
  final String apiBaseUrl;
  final bool isDebug;

  DioClient({required this.apiBaseUrl, required this.isDebug});
  Dio get dio => _getDio();

  Dio _getDio() {
    var options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 50000,
      sendTimeout: 50000,
    );
    var dio = Dio(options);
    dio.interceptors.add(LoggingInterceptors(
      isDebug: isDebug,
    ));
    return dio;
  }
}