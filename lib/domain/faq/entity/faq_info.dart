import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_info.freezed.dart';

@freezed
class FAQInfo with _$FAQInfo {
  const FAQInfo._();

  const factory FAQInfo({
    required String endCursor,
    required List<FAQItem> faqList,
  }) = _FAQInfo;

  factory FAQInfo.empty() => const FAQInfo(
        faqList: <FAQItem>[],
        endCursor: '',
      );

  bool get isFaqListEmpty => faqList
      .where((e) => e.question.isNotEmpty && e.answer.isNotEmpty)
      .isEmpty;
}
