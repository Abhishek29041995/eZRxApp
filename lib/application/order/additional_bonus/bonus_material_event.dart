part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialEvent with _$BonusMaterialEvent {
  const factory BonusMaterialEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SearchKey searchKey,
    required bool isGimmickMaterialEnabled,
    required PrincipalData principalData,
  }) = _Fetch;
  factory BonusMaterialEvent.loadMoreBonusItem({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required PrincipalData principalData,
    required bool isGimmickMaterialEnabled,
  }) = _LoadMoreBonusItem;
  factory BonusMaterialEvent.validateBonusQuantity({
    required MaterialInfo bonusMaterial,
  }) = _ValidateBonusQuantity;
  factory BonusMaterialEvent.updateBonusItemQuantity({
    required MaterialInfo updatedBonusItem,
  }) = _UpdateBonusItemQuantity;
  factory BonusMaterialEvent.updateAddedBonusItems({
    required List<BonusSampleItem> addedBonusItemList,
  }) = _UpdateAddedBonusItems;
  const factory BonusMaterialEvent.updateProductStock({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<MaterialInfo> items,
  }) = _UpdateProductStock;
}
