import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClientOptions {
  final String baseUrl;
  final Duration connectTimeout;
  final bool showLogs;
  final bool acceptJson;
  final bool contentTypeJson;

  final Map<String, dynamic> headers;

  ApiClientOptions({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 60),
    this.showLogs = true,
    this.acceptJson = true,
    this.contentTypeJson = true,
    this.headers = const {},
  });
}

class ApiClient {
  static getApi({required ApiClientOptions options}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: options.baseUrl,
      connectTimeout: options.connectTimeout,
      headers: {
        'Accept': options.acceptJson ? 'application/json' : '',
        'Content-Type': options.contentTypeJson ? 'application/json' : '',
      }..addAll(options.headers),
    );
    Dio dio = Dio(baseOptions);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
      ));
    }
    return dio;
  }
}
