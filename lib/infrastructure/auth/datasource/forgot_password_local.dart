import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:flutter/services.dart';

class ForgotPasswordLocalDataSource {
  Future<ForgotPassword> requestResetPassword() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/request_reset_password_link/requestResetPasswordLinkResponse.json',
      ),
    );

    return ForgotPasswordDto.fromJson(data['data']['requestResetPassword'])
        .toDomain();
  }

  Future<bool> validateResetPasswordKey() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/validate_reset_password_key/validateResetPasswordKeyResponse.json',
      ),
    );

    return data['data']['validateResetPasswordKey']['isValid'];
  }
}
