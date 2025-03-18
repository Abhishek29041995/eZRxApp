import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_language_response_dto.freezed.dart';
part 'update_language_response_dto.g.dart';

@freezed
class UpdateLanguageResponseDto with _$UpdateLanguageResponseDto {
  UpdateLanguageResponseDto._();
  factory UpdateLanguageResponseDto({
    @JsonKey(name: 'success', defaultValue: false) required bool success,
  }) = _UpdateLanguageResponseDto;

  factory UpdateLanguageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateLanguageResponseDtoFromJson(json);

  UpdateLanguageResponse get toDomain =>
      UpdateLanguageResponse(success: success);
}
