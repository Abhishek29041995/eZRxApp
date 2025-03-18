import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  const LoginDto._();

  const factory LoginDto({
    @JsonKey(
      name: 'eZRxJWT',
      readValue: JsonReadValueHelper.convertAccessToken,
    )
    required String access,
    @JsonKey(
      name: 'eZRxRefreshJWT',
      readValue: JsonReadValueHelper.convertRefreshToken,
    )
    required String refresh,
    @Default(UserDto.emptyUserDto) @JsonKey(name: 'user') UserDto user,
  }) = _LoginDto;

  Login toDomain() {
    return Login(
      access: JWT(access),
      refresh: JWT(refresh),
      user: user.toDomain(),
    );
  }

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}
