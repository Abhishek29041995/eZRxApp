import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_details_dto.freezed.dart';
part 'contact_us_details_dto.g.dart';

@freezed
class ContactUsDetailsDto with _$ContactUsDetailsDto {
  const ContactUsDetailsDto._();

  const factory ContactUsDetailsDto({
    @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String content,
    @JsonKey(
      name: 'preloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String preloginSendToEmail,
    @JsonKey(
      name: 'postloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String postloginSendToEmail,
  }) = _ContactUsDetailsDto;

  ContactUsDetails get toDomain => ContactUsDetails(
        content: HtmlContent(content),
        postloginSendToEmail: postloginSendToEmail,
        preloginSendToEmail: preloginSendToEmail,
      );

  factory ContactUsDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDetailsDtoFromJson(json);
}
