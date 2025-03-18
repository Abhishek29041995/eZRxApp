part of 'combo_deal_list_bloc.dart';

@freezed
class ComboDealListEvent with _$ComboDealListEvent {
  const factory ComboDealListEvent.initialize() = _Initialize;
  const factory ComboDealListEvent.fetchMaterialDeal({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required PriceComboDeal priceComboDeal,
  }) = _FetchMaterialDeal;
  const factory ComboDealListEvent.fetchPrincipleGroupDeal({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required PriceComboDeal priceComboDeal,
  }) = _FetchPrincipleGroupDeal;
}
