part of 'full_summary_bloc.dart';

@freezed
class FullSummaryState with _$FullSummaryState {
  const FullSummaryState._();
  const factory FullSummaryState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required FullSummaryFilter appliedFilter,
    required List<CreditAndInvoiceItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _FullSummaryState;

  factory FullSummaryState.initial() => FullSummaryState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        appliedFilter: FullSummaryFilter.defaultFilter(),
        items: <CreditAndInvoiceItem>[],
      );
}
