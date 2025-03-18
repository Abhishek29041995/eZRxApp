part of 'product_search_bloc.dart';

@freezed
class ProductSearchState with _$ProductSearchState {
  const factory ProductSearchState({
    required bool isSearching,
    required List<MaterialInfo> suggestedProductList,
    required bool canLoadMore,
    required ProductSuggestionHistory productSuggestionHistory,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter materialFilter,
    required User user,
  }) = _ProductSearchState;

  factory ProductSearchState.initial() => ProductSearchState(
        apiFailureOrSuccessOption: none(),
        isSearching: false,
        canLoadMore: false,
        productSuggestionHistory: ProductSuggestionHistory.empty(),
        suggestedProductList: <MaterialInfo>[],
        searchKey: SearchKey.search(''),
        configs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        materialFilter: MaterialFilter.empty(),
        user: User.empty(),
      );
}
