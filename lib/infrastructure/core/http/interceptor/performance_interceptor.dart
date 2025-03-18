import 'package:dio/dio.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/performance_monitor.dart';

class PerformanceInterceptor extends Interceptor {
  final PerformanceMonitorService performanceMonitorService;
  PerformanceInterceptor({required this.performanceMonitorService});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await performanceMonitorService.networkOnRequest(options);

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    await performanceMonitorService.networkOnResponse(response);

    return super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    await performanceMonitorService.networkOnError(err);

    return super.onError(err, handler);
  }
}
