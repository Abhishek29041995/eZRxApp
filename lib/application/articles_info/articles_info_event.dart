part of 'articles_info_bloc.dart';

@freezed
class ArticlesInfoEvent with _$ArticlesInfoEvent {
  const factory ArticlesInfoEvent.initialize({
    required User user,
    required SalesOrg salesOrg,
    required ShipToInfo shipToInfo,
  }) = _Initialize;

  const factory ArticlesInfoEvent.getArticles() = _GetArticles;

  const factory ArticlesInfoEvent.loadMoreArticles() = _LoadMoreArticles;

  const factory ArticlesInfoEvent.setSearchKey({
    required SearchKey searchKey,
  }) = _SetSearchKey;

  const factory ArticlesInfoEvent.setCategoryKey({
    required List<String> categoryKeyList,
  }) = _SetCategoryKey;
}
