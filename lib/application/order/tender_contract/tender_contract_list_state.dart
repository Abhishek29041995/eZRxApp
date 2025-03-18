part of 'tender_contract_list_bloc.dart';

@freezed
class TenderContractListState with _$TenderContractListState {
  const factory TenderContractListState({
    required Map<MaterialNumber, List<TenderContract>> tenderContracts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
  }) = _TenderContractListState;

  factory TenderContractListState.initial() => TenderContractListState(
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        tenderContracts: {},
      );
}
