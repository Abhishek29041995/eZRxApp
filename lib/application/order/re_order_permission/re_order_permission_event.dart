part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionEvent with _$ReOrderPermissionEvent {
  const factory ReOrderPermissionEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required User user,
  }) = _Initialized;
  const factory ReOrderPermissionEvent.fetchOrder({
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItems,
    required OrderNumber orderNumberWillUpsert,
  }) = _FetchOrder;
  const factory ReOrderPermissionEvent.fetchItem({
    required OrderHistory orderHistoryDetail,
    required OrderHistoryItem item,
  }) = _FetchItem;
  const factory ReOrderPermissionEvent.fetchPrice({
    required List<PriceAggregate> reorderItems,
  }) = _FetchPrice;
  const factory ReOrderPermissionEvent.resetOrderNumberWillUpsert({
    required OrderNumber orderNumberWillUpsert,
  }) = _ResetOrderNumberWillUpsert;
}
