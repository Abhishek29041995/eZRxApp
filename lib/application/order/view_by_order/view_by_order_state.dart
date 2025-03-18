part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderState with _$ViewByOrderState {
  const ViewByOrderState._();
  const factory ViewByOrderState({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required String sortDirection,
    required ViewByOrder viewByOrderList,
    required bool canLoadMore,
    required bool isFetching,
    required SearchKey searchKey,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ViewByOrdersFilter appliedFilter,
    required ShipToInfo shipToInfo,
  }) = _ViewByOrderState;
  factory ViewByOrderState.initial() => ViewByOrderState(
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        user: User.empty(),
        sortDirection: 'desc',
        viewByOrderList: ViewByOrder.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        searchKey: SearchKey.empty(),
        failureOrSuccessOption: none(),
        appliedFilter: ViewByOrdersFilter.empty(),
        shipToInfo: ShipToInfo.empty(),
      );

  bool displayBuyAgainButton(
    DocumentType type,
    bool isMarketPlace,
  ) {
    if (user.disableCreateOrder) {
      return false;
    }
    if (customerCodeInfo.status.isEDI) {
      return false;
    }
    if (!salesOrgConfigs.enableMarketPlace && isMarketPlace) {
      return false;
    }
    final isCovidOrderType =
        (salesOrgConfigs.salesOrg.isPH && type.isCovidOrderTypeForPH) ||
            (salesOrgConfigs.salesOrg.isSg && type.isCovidOrderTypeForSG);

    final isCustomer = user.role.type.isCustomer;

    if (isCovidOrderType && !isCustomer) {
      return false;
    }

    return true;
  }

  bool get hasSearchFilter =>
      searchKey.validateNotEmpty || appliedFilter.appliedFilterCount > 0;
}
