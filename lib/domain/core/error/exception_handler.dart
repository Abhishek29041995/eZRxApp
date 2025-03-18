import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';

class DataSourceExceptionHandler {
  Future<dynamic> handle(Function function) async {
    try {
      return await function();
    } catch (e) {
      rethrow;
    }
  }

  bool isServerResponseError({
    required Response<dynamic> res,
    bool? additionalCondition,
  }) {
    final isServerResponseError = res.data is Map &&
        res.data['errors'] != null &&
        (res.data['errors'] is List) &&
        res.data['errors'].isNotEmpty;
    if (additionalCondition != null) {
      return isServerResponseError || additionalCondition;
    }

    return isServerResponseError;
  }

  bool _isPropertyError({
    required Response<dynamic> res,
    String? property,
  }) {
    if (property == null) return false;
    if (res.data['data'] == null || res.data['data'].isEmpty) return true;

    if (res.data['data'][property] == null) return true;

    return false;
  }

  void handleExceptionChecker({
    required Response<dynamic> res,
    bool? additionalCondition,
    Function(Response<dynamic>)? onCustomExceptionHandler,
    String? property,
  }) {
    if (onCustomExceptionHandler != null) {
      onCustomExceptionHandler(res);
    }
    if (isServerResponseError(
      res: res,
      additionalCondition: additionalCondition,
    )) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (_isPropertyError(res: res, property: property)) {
      throw ServerException(message: 'Some thing went wrong');
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
