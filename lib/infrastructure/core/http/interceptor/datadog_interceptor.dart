import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';

class DatadogInterceptor extends Interceptor {
  final DatadogService datadogService;

  DatadogInterceptor({
    required this.datadogService,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final operationName =
        _extractOperationNameFromGraphQL(options.data.toString());

    if (operationName.isNotEmpty) {
      datadogService.addRumAttribute(key: 'api_endpoint', value: operationName);
    }

    final requestString =
        '***REQUEST***\n**URL**: ${options.uri.toString()}\n**DATA**: ${options.data.toString()}\n**HEADERS**: ${options.headers.toString()}';
    datadogService.logs?.info(requestString);

    return super.onRequest(options, handler);
  }

  String _extractOperationNameFromGraphQL(String jsonString) {
    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final query = (jsonMap['query'] as String?)?.trim() ?? '';
      if (query.isEmpty) return '';

      final operationType = _getOperationType(query);
      if (operationType.isEmpty) return '';

      return query
          .split(RegExp(r'[{(]'))
          .first
          .replaceFirst(operationType, '')
          .trim()
          .split('(')
          .first
          .trim();
    } catch (e) {
      return '';
    }
  }

  String _getOperationType(String query) {
    if (query.startsWith('query')) return 'query';
    if (query.startsWith('mutation')) return 'mutation';
    if (query.startsWith('subscription')) return 'subscription';

    return '';
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    datadogService.logs?.info('***RESPONSE***: ${response.toString()}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorString =
        '***ERROR***\n**URL**: ${err.requestOptions.uri.toString()}\n**DATA**: ${err.requestOptions.data.toString()}\n**HEADERS**: ${err.requestOptions.headers.toString()}\n**MESSAGE**: ${err.message}';
    datadogService.logs?.error(errorString);

    return super.onError(err, handler);
  }
}
