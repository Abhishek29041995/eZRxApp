part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderEvent with _$ViewByOrderEvent {
  const factory ViewByOrderEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required String sortDirection,
    required ShipToInfo shipToInfo,
  }) = _Initialized;
  const factory ViewByOrderEvent.fetch({
    required ViewByOrdersFilter filter,
    required SearchKey searchKey,
    required bool isDetailsPage,
  }) = _Fetch;
  const factory ViewByOrderEvent.loadMore() = _LoadMore;
}
