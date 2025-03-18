part of 'faq_bloc.dart';

@freezed
class FaqEvent with _$FaqEvent {
  const factory FaqEvent.getFaq({
    required SalesOrg salesOrg,
  }) = _GetFaq;

  const factory FaqEvent.loadMoreAFaq({
    required SalesOrg salesOrg,
  }) = _LoadMoreFaq;
  const factory FaqEvent.filterByFaqCategory({
    required FAQCategory selectedCategory,
  }) = _FilterByFaqCategory;
  const factory FaqEvent.updateSearchKey({
    required SearchKey searchKey,
  }) = _UpdatedSearchFaq;
}
