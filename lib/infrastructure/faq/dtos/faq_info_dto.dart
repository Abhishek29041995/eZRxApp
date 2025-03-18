import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/faq/dtos/faq_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_info_dto.freezed.dart';
part 'faq_info_dto.g.dart';

@freezed
class FAQInfoDto with _$FAQInfoDto {
  const FAQInfoDto._();

  const factory FAQInfoDto({
    @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue,
    )
    required String endCursor,
    @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
    required List<FAQItemDto> faqList,
  }) = _FAQInfoDto;

  FAQInfo get toDomain => FAQInfo(
        endCursor: endCursor,
        faqList: faqList.map((e) => e.toDomain).toList(),
      );

  factory FAQInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FAQInfoDtoFromJson(json);
}
