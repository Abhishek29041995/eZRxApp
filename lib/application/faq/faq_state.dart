part of 'faq_bloc.dart';

@freezed
class FaqState with _$FaqState {
  const FaqState._();

  const factory FaqState({
    required FAQInfo faqInfo,
    required bool isFetching,
    required bool canLoadMore,
    required FAQCategory selectedCategory,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _FaqState;

  factory FaqState.initial() => FaqState(
        isFetching: false,
        faqInfo: FAQInfo.empty(),
        canLoadMore: true,
        apiFailureOrSuccessOption: none(),
        selectedCategory: FAQCategory(''),
        searchKey: SearchKey.empty(),
      );
  List<FAQItem> get selectedFaqItem => selectedCategory.isAll
      ? faqInfo.faqList
      : faqInfo.faqList
          .where(
            (element) => element.category == selectedCategory,
          )
          .toList();

  List<FAQItem> get getSearchedFaqList {
    if (!searchKey.validateNotEmpty) {
      return selectedFaqItem;
    }

    final searchTerm = searchKey.getOrDefaultValue('').toLowerCase();

    return selectedFaqItem
        .where(
          (element) =>
              element.answer.toLowerCase().contains(searchTerm) ||
              element.question.toLowerCase().contains(searchTerm),
        )
        .toList();
  }

  bool get showCategoryChip =>
      getSearchedFaqList.isNotEmpty || searchKey.validateNotEmpty;
}
