import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_dto.freezed.dart';
part 'reset_password_dto.g.dart';

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  const ResetPasswordDto._();

  const factory ResetPasswordDto({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'status') required String status,
  }) = _ResetPasswordDto;

  ResetPassword toDomain() {
    return ResetPassword(
      status: status,
      success: success,
    );
  }

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}
