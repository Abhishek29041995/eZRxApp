part of 'tender_contract_bloc.dart';

@freezed
class TenderContractState with _$TenderContractState {
  const factory TenderContractState({
    required List<TenderContract> tenderContractList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required TenderContract selectedTenderContract,
  }) = _TenderContractState;

  factory TenderContractState.initial() => TenderContractState(
        tenderContractList: <TenderContract>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        selectedTenderContract: TenderContract.empty(),
      );
}
