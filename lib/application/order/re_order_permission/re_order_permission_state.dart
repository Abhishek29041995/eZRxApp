part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionState with _$ReOrderPermissionState {
  const ReOrderPermissionState._();

  const factory ReOrderPermissionState({
    required List<PriceAggregate> validOrderItems,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required OrderNumber orderNumberWillUpsert,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required User user,
  }) = _ReOrderPermissionState;

  factory ReOrderPermissionState.initial() => ReOrderPermissionState(
        orderNumberWillUpsert: OrderNumber(''),
        validOrderItems: <PriceAggregate>[],
        isFetching: false,
        failureOrSuccessOption: none(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        user: User.empty(),
      );

  Map<MaterialNumber, TenderContract> get availableTenderContract =>
      <MaterialNumber, TenderContract>{
        for (final item in validOrderItems)
          item.materialInfo.materialNumber: item.tenderContract,
      };
}
