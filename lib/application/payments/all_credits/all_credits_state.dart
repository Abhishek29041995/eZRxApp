part of 'all_credits_bloc.dart';

@freezed
class AllCreditsState with _$AllCreditsState {
  //Constructor created for Getter
  const AllCreditsState._();
  const factory AllCreditsState({
    required AllCreditsFilter appliedFilter,
    required List<CreditAndInvoiceItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _AllCreditsState;

  factory AllCreditsState.initial() => AllCreditsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        appliedFilter: AllCreditsFilter.defaultFilter(),
        items: <CreditAndInvoiceItem>[],
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
      );
}
