import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_restriction_list_raw_meta_data_dto.freezed.dart';
part 'user_restriction_list_raw_meta_data_dto.g.dart';

@freezed
class UserRestrictionListRawMetaDataDto
    with _$UserRestrictionListRawMetaDataDto {
  UserRestrictionListRawMetaDataDto._();

  factory UserRestrictionListRawMetaDataDto({
    required List<String> usernames,
  }) = _UserRestrictionRawMetaDataDto;

  factory UserRestrictionListRawMetaDataDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserRestrictionListRawMetaDataDtoFromJson(json);
}
