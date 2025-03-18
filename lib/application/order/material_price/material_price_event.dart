part of 'material_price_bloc.dart';

@freezed
class MaterialPriceEvent with _$MaterialPriceEvent {
  const factory MaterialPriceEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
  }) = _Initialized;
  const factory MaterialPriceEvent.fetch({
    required List<MaterialInfo> materials,
    required bool comboDealEligible,
  }) = _Fetch;
  const factory MaterialPriceEvent.fetchPriceCartProduct({
    required List<MaterialInfo> products,
    required bool comboDealEligible,
  }) = _FetchPriceCartProduct;

  const factory MaterialPriceEvent.fetchPriceForZDP5Materials({
    required MaterialInfo materialInfo,
  }) = _FetchPriceForZDP5Materials;
}
