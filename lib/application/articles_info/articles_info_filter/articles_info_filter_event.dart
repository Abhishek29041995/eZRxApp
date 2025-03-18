part of 'articles_info_filter_bloc.dart';

@freezed
class ArticlesInfoFilterEvent with _$ArticlesInfoFilterEvent {
  const factory ArticlesInfoFilterEvent.categoryChanged(
    String filterCategory,
    bool selected,
  ) = _CategoryChanged;
  const factory ArticlesInfoFilterEvent.setCategoryWhileOpenBottomSheet(
    List<String> filterCategory,
  ) = _SetCategoryWhileOpenBottomSheet;
  const factory ArticlesInfoFilterEvent.resetCategory() = _ResetCategory;
  const factory ArticlesInfoFilterEvent.fetchCategory({
    required SalesOrg salesOrg,
  }) = _FetchCategory;
}
