import 'dart:async';
import 'package:ezrxmobile/domain/account/error/cart_exception.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/domain/payments/error/payment_exception.dart';
import 'package:universal_io/io.dart';

import 'package:ezrxmobile/domain/account/error/price_override_exception.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:flutter/services.dart';

class FailureHandler {
  static ApiFailure handleFailure(Object error) {
    if (error is AuthException) {
      return error.map(
        invalidEmailAndPasswordCombination: (_) =>
            const ApiFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const ApiFailure.accountLocked(),
        accountExpired: (_) => const ApiFailure.accountExpired(),
        invalidUserName: (_) => const ApiFailure.userNameNotFound(),
        accountBlocked: (_) => const ApiFailure.accountBlocked(),
        cannotProxyLoginFromDiffferentSalesOrg: (_) =>
            const ApiFailure.cannotProxyLoginFromDiffferentSalesOrg(),
        cannotProxyLoginRootAdmin: (_) =>
            const ApiFailure.cannotProxyLoginRootAdmin(),
        cannotProxyLoginWithCurrentRole: (_) =>
            const ApiFailure.cannotProxyLoginWithCurrentRole(),
        cannotProxyLoginZPAdminWhenIsZPAdmin: (_) =>
            const ApiFailure.cannotProxyLoginZPAdminWhenIsZPAdmin(),
        passwordResetKeyInvalid: (_) =>
            const ApiFailure.passwordResetKeyInvalid(),
      );
    } else if (error is UserException) {
      return error.map(
        userNotFound: (_) => const ApiFailure.userNotFound(),
      );
    } else if (error is PriceException) {
      return error.map(
        priceNotFound: (_) => const ApiFailure.priceOverrideNotFound(),
      );
    } else if (error is CartException) {
      return error.map(
        cartHasDifferentAddress: (_) =>
            const ApiFailure.cartHasDifferentAddress(),
        addAnimalHealthWithNormalProductToCart: (_) =>
            const ApiFailure.addAnimalHealthWithNormalProductToCart(),
      );
    } else if (error is PaymentException) {
      return error.map(
        missingzzHtmcs: (_) => const ApiFailure.missingzzHtmcs(),
      );
    } else {
      switch (error.runtimeType) {
        case const (MockException):
          return ApiFailure.other((error as MockException).message);
        case const (CacheException):
          return ApiFailure.other((error as CacheException).message);
        case const (ServerException):
          final message = (error as ServerException).message;
          if (message.toLowerCase() == 'authentication failed' ||
              message.toLowerCase() ==
                  'status: 401, message: token has either expired or its not valid') {
            return const ApiFailure.authenticationFailed();
          }

          return ApiFailure.serverError(message);
        case const (SocketException):
          return const ApiFailure.poorConnection();
        case const (TimeoutException):
          return const ApiFailure.serverTimeout();
        case const (PlatformException):
          return ApiFailure.other('${(error as PlatformException).message}');
        case const (OtherException):
          return ApiFailure.other((error as OtherException).message);
        case const (StockInfoException):
          return const ApiFailure.stockInfoNotAvailable();

        default:
          return ApiFailure.other(error.toString());
      }
    }
  }
}
