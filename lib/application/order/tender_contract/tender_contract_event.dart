part of 'tender_contract_bloc.dart';

@freezed
class TenderContractEvent with _$TenderContractEvent {
  const factory TenderContractEvent.initialized() = _Initialized;
  factory TenderContractEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialInfo materialInfo,
    required TenderContract defaultSelectedTenderContract,
  }) = _Fetch;
  const factory TenderContractEvent.selected({
    required TenderContract tenderContract,
  }) = _Selected;
  const factory TenderContractEvent.unselected() = _Unselected;
}
