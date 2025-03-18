import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:universal_io/io.dart';

class HttpService {
  late Dio _dio;
  Dio dio() => _dio;

  HttpService({
    required Config config,
    required List<Interceptor> interceptors,
  }) {
    // We only enable network log when run on debug mode and not in test mode
    final enableLog =
        kDebugMode && !Platform.environment.containsKey('FLUTTER_TEST');

    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl(),
        sendTimeout: Duration(milliseconds: config.httpSendTimeout),
        connectTimeout: Duration(milliseconds: config.httpConnectTimeout),
        receiveTimeout: Duration(milliseconds: config.httpReceiveTimeout),
        validateStatus: (int? status) => status != null && status > 0,
      ),
    );
    // https://github.com/cfug/dio/issues/2106
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () => HttpClient()
        ..idleTimeout = Duration(
          milliseconds: config.httpIdleTimeout,
        ),
    );
    _dio.interceptors.addAll([
      ...interceptors,
      if (enableLog)
        PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          convertFormData: true,
          canShowLog: kDebugMode,
          showCUrl: false,
        ),
    ]);
  }

  HttpService.mockDio(Dio dio) : _dio = dio;

  Future<Response> request({
    required String method,
    required String url,
    dynamic data = const {}, // can be Map<String, dynamic> or FormData
    ResponseType responseType = ResponseType.json,
    bool overrideBaseUrl = false,
    String cacheControl = '',
    Map<String, dynamic> headers = const <String, dynamic>{},
  }) async {
    try {
      if (overrideBaseUrl) _dio.options.baseUrl = url;

      _dio.options.method = method;
      _dio.options.responseType = responseType;
      _dio.options.headers['cache-control'] = cacheControl;
      for (final headerInfo in headers.entries) {
        _dio.options.headers[headerInfo.key] = headerInfo.value;
      }

      return await _dio.request(
        url,
        data: data,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        return e.response!;
      }

      rethrow;
      // switch (e.error.runtimeType) {
      //   case SocketException:
      //     throw SocketException(message: e.message);
      //   case TimeoutException:
      //     throw TimeoutException(message: e.message);
      //   case HttpException:
      //     throw ServerException(message: e.message);
      //   case FormatException:
      //     throw FormatException(message: e.message);
      //   default:
      //     throw OtherException(message: e.message);
      // }
    }
  }

  // String _readAbleErrorMessage(DioError error) {
  //   switch (error.error.runtimeType) {
  //     case SocketException:
  //       return 'Network Connection Error';
  //     case TimeoutException:
  //       return 'Timeout Error';
  //     default:
  //       return error.message;
  //   }
  // }
}
