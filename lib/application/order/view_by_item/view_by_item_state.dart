part of 'view_by_item_bloc.dart';

@freezed
class ViewByItemsState with _$ViewByItemsState {
  const ViewByItemsState._();

  const factory ViewByItemsState({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
    required OrderHistory orderHistory,
    required bool canLoadMore,
    required bool isFetching,
    required bool isFetchingInvoices,
    required int nextPageIndex,
    required ViewByItemFilter appliedFilter,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByItemsState;

  factory ViewByItemsState.initial() => ViewByItemsState(
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        orderHistory: OrderHistory.empty(),
        canLoadMore: true,
        isFetching: false,
        isFetchingInvoices: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
        searchKey: SearchKey.empty(),
        appliedFilter: ViewByItemFilter.empty(),
      );

  bool get hasSearchFilter =>
      searchKey.validateNotEmpty || appliedFilter.appliedFilterCount > 0;
}
