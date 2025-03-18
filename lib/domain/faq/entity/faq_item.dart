import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_category_group.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_item.freezed.dart';

@freezed
class FAQItem with _$FAQItem {
  const FAQItem._();
  const factory FAQItem({
    required String question,
    required String answer,
    required FAQCategory category,
  }) = _FAQItem;

  factory FAQItem.empty() => FAQItem(
        question: '',
        answer: '',
        category: FAQCategory(''),
      );
}

extension FAQItemExtension on List<FAQItem> {
  List<FAQCategoryGroup> get getFAQItemList {
    return List<FAQItem>.from(this)
        .groupListsBy((item) => item.category)
        .entries
        .map(
          (entry) => FAQCategoryGroup(
            faqItem: entry.value,
            displayName: entry.key.getOrDefaultValue(''),
          ),
        )
        .toList();
  }
}
