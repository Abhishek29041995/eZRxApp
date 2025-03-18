import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FailureHandler test', () {
    test(
      '- Server Exception message test',
      () {
        final handleFailure = FailureHandler.handleFailure(
          ServerException(message: 'FAKE_ERROR'),
        );
        expect(
          handleFailure.failureMessage.message,
          'FAKE_ERROR',
        );
      },
    );
  });
}
