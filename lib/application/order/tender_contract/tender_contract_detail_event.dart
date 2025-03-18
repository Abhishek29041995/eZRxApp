part of 'tender_contract_detail_bloc.dart';

@freezed
class TenderContractDetailEvent with _$TenderContractDetailEvent {
  const factory TenderContractDetailEvent.initialized() = _Initialized;
  factory TenderContractDetailEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialNumber materialNumber,
  }) = _Fetch;
  const factory TenderContractDetailEvent.updateQty({
    required int qty,
  }) = _UpdateQty;
  const factory TenderContractDetailEvent.select({
    required TenderContract tenderContract,
  }) = _Select;
  const factory TenderContractDetailEvent.toggleSwitch({
    required bool enable,
  }) = _ToggleSwitch;
  const factory TenderContractDetailEvent.setDefaultValueForEdit({
    required TenderContract tenderContract,
  }) = _SetDefaultValueForEdit;
}
