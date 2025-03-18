import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_point_token_response_dto.freezed.dart';
part 'ez_point_token_response_dto.g.dart';

@freezed
class EZPointTokenResponseDto with _$EZPointTokenResponseDto {
  const EZPointTokenResponseDto._();
  const factory EZPointTokenResponseDto({
    @JsonKey(name: 'ezPointToken', defaultValue: '')
        required String ezPointToken,
  }) = _EZPointTokenResponseDto;

  factory EZPointTokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EZPointTokenResponseDtoFromJson(json);

  EZPointToken get toDomain => EZPointToken(ezPointToken: ezPointToken);
}
