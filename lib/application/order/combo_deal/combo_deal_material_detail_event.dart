part of 'combo_deal_material_detail_bloc.dart';

@freezed
class ComboDealMaterialDetailEvent with _$ComboDealMaterialDetailEvent {
  const factory ComboDealMaterialDetailEvent.initialize({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesConfigs,
  }) = _Initialize;
  const factory ComboDealMaterialDetailEvent.setPriceInfo({
    required Map<MaterialNumber, MaterialPriceDetail> priceMap,
  }) = _SetPriceInfo;
  const factory ComboDealMaterialDetailEvent.updateItemQuantity({
    required MaterialNumber item,
    required int qty,
  }) = _UpdateItemQuantity;
  const factory ComboDealMaterialDetailEvent.updateItemSelection({
    required MaterialNumber item,
  }) = _UpdateItemSelection;
  const factory ComboDealMaterialDetailEvent.fetchComboDealDetail({
    required ComboDeal comboDeal,
    required MaterialNumber parentMaterialNumber,
    required Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
  }) = _FetchComboDealDetail;

  const factory ComboDealMaterialDetailEvent.search({
    required SearchKey searchKey,
  }) = _Search;

  const factory ComboDealMaterialDetailEvent.cartContainsCurrentCombo({
    required bool contain,
  }) = _CartContainsCurrentCombo;

  const factory ComboDealMaterialDetailEvent.clearSearch() = _ClearSearch;

  const factory ComboDealMaterialDetailEvent.fetchComboDealPrincipal({
    required ComboDeal comboDeal,
    required Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
    required List<String> principles,
    required MaterialNumber parentMaterialNumber,
  }) = _FetchComboDealPrincipal;

  const factory ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal({
    required ComboDeal comboDeal,
    required List<String> principles,
  }) = _LoadMoreComboDealPrincipal;

  const factory ComboDealMaterialDetailEvent.clearSelectedItem() =
      _ClearSelectedItem;
}
