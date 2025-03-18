part of 'tender_contract_detail_bloc.dart';

@freezed
class TenderContractDetailState with _$TenderContractDetailState {
  const TenderContractDetailState._();

  const factory TenderContractDetailState({
    required List<TenderContract> tenderContractList,
    required bool tenderContractEnable,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required TenderContract selectedTenderContract,
    required int inputQty,
  }) = _TenderContractDetailState;

  factory TenderContractDetailState.initial() => TenderContractDetailState(
        tenderContractList: <TenderContract>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        tenderContractEnable: false,
        inputQty: 1,
        selectedTenderContract: TenderContract.empty(),
      );

  TenderContract get currentTenderContract =>
      tenderContractEnable ? selectedTenderContract : TenderContract.empty();

  bool get isExceedQty =>
      currentTenderContract.remainingTenderQuantity < inputQty &&
      currentTenderContract.isNotEmpty;

  bool get isNonContractAvailable =>
      tenderContractEnable && currentTenderContract.isEmpty;

  bool get isInsufficientQuantity =>
      tenderContractEnable && isNonContractAvailable;
}
