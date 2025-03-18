part of 'product_search_bloc.dart';

@freezed
class ProductSearchEvent with _$ProductSearchEvent {
  const factory ProductSearchEvent.initialized({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
  }) = _Initialized;

  const factory ProductSearchEvent.searchProduct({
    required SearchKey searchKey,
    required MaterialFilter materialFilter,
  }) = _SearchProduct;

    const factory ProductSearchEvent.saveSearchHistory({
    required SearchKey searchKey,
  }) = _SaveSearchHistory;

  const factory ProductSearchEvent.loadMoreProductList() = _LoadMoreProductList;

  const factory ProductSearchEvent.clearSearch() = _ClearSearch;

  const factory ProductSearchEvent.clearProductSearchSuggestionHistory() =
      _ClearProductSearchSuggestionHistory;
}
