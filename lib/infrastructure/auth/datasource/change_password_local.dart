import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:flutter/services.dart';

class ChangePasswordLocalDataSource {
  Future<ResetPassword> changePassword() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/change_password/changePasswordResponse.json',
      ),
    );

    return ResetPasswordDto.fromJson(data['data']['changePassword']).toDomain();
  }

  Future<ResetPassword> resetPassword() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/reset_password_v3/resetPasswordV3Response.json',
      ),
    );

    return ResetPasswordDto.fromJson(data['data']['resetPasswordV3'])
        .toDomain();
  }

  Future<ResetPassword> changePasswordForFirstTime() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/change_password_first_time/changePasswordFirstTimeResponse.json',
      ),
    );

    return ResetPasswordDto.fromJson(data['data']['changePasswordFirstTime'])
        .toDomain();
  }
}
