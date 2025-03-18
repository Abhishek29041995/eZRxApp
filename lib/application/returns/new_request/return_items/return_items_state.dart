part of 'return_items_bloc.dart';

@freezed
class ReturnItemsState with _$ReturnItemsState {
  const ReturnItemsState._();
  const factory ReturnItemsState({
    required User user,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required ReturnItemsFilter appliedFilter,
    required SearchKey searchKey,
    required List<ReturnMaterial> items,
    required Option<Either<ApiFailure, ReturnMaterialList>>
        failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _ReturnItemsState;

  factory ReturnItemsState.initial() => ReturnItemsState(
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        appliedFilter: ReturnItemsFilter.empty(),
        items: <ReturnMaterial>[],
        searchKey: SearchKey.search(''),
      );
}
