import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_category_group.freezed.dart';

@freezed
class FAQCategoryGroup with _$FAQCategoryGroup {
  factory FAQCategoryGroup({
    required String displayName,
    required List<FAQItem> faqItem,
    
  }) = _FAQCategoryGroup;

  factory FAQCategoryGroup.empty() => FAQCategoryGroup(
        faqItem: <FAQItem>[],
        displayName: '',
      );
}
