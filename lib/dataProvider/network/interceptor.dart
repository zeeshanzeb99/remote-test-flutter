import 'dart:io';

import 'package:dio/dio.dart';


class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? jwt = '';
    options.headers[HttpHeaders.authorizationHeader] = "Bearer $jwt";
      super.onRequest(options, handler);
  }
}

