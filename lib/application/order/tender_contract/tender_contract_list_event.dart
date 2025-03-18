part of 'tender_contract_list_bloc.dart';

@freezed
class TenderContractListEvent with _$TenderContractListEvent {
  const factory TenderContractListEvent.initialize() = _Initialize;
  const factory TenderContractListEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<MaterialNumber> materialNumbers,
  }) = _Fetch;
}
