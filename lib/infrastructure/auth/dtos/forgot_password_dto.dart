import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_dto.freezed.dart';
part 'forgot_password_dto.g.dart';

@freezed
class ForgotPasswordDto with _$ForgotPasswordDto {
  const ForgotPasswordDto._();
  factory ForgotPasswordDto({
    @JsonKey(name: 'success', defaultValue: false) required bool success,
    @JsonKey(name: 'email', defaultValue: '') required String email,
  }) = _ForgotPasswordDto;

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);

  ForgotPassword toDomain() => ForgotPassword(
        success: success,
        email: email,
      );
}
