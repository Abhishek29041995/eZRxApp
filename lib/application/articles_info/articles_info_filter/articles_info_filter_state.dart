part of 'articles_info_filter_bloc.dart';

@freezed
class ArticlesInfoFilterState with _$ArticlesInfoFilterState {
  const ArticlesInfoFilterState._();

  const factory ArticlesInfoFilterState({
    required List<String> filterCategoryKeyList,
    required List<String> categoryKeyList,
    required bool isLoading,
  }) = _ArticlesInfoFilterState;

  factory ArticlesInfoFilterState.initial() => const ArticlesInfoFilterState(
        filterCategoryKeyList: <String>[],
        categoryKeyList: <String>[],
        isLoading: false,
      );
}
