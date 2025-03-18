import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_item_dto.freezed.dart';
part 'faq_item_dto.g.dart';

@freezed
class FAQItemDto with _$FAQItemDto {
  const FAQItemDto._();

  const factory FAQItemDto({
    required String name,
    @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
    required String answer,
    @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
    required String question,
    @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
    required String displayName,
  }) = _FAQItemDto;

  factory FAQItemDto.fromJson(Map<String, dynamic> json) =>
      _$FAQItemDtoFromJson(json);

  FAQItem get toDomain => FAQItem(
        question: question,
        answer: answer,
        category: FAQCategory(displayName),
      );
}
