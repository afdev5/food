import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptors extends Interceptor {
  final bool isDebug;

  LoggingInterceptors({
    required this.isDebug,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (isDebug) {
      debugPrint('\n'
          '-- Request Url --\n'
          '${options.uri} \n'
          '-- Headers --\n'
          '${options.headers.toString()} \n'
          '');
    }
    return super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (isDebug) {
      debugPrint('\n'
          '-- Response Status Code --\n'
          '${response.statusCode} \n'
          '-- Body Request --\n'
          '${jsonEncode(response.requestOptions.data)} \n'
          '-- Response Data --\n'
          '${jsonEncode(response.data).replaceAll('�', '')} \n'
          '');
    }
    return super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (isDebug) {
      debugPrint('Dio Response Error --> $err');
    }
    if (err.response != null) {
      if (err.response!.statusCode != 200) {
        debugPrint('Dio Fatal Error -> ${err.response}');
      }
    }
    return super.onError(err, handler);
  }
}