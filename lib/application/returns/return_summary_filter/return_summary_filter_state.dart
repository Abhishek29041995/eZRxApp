part of 'return_summary_filter_bloc.dart';

@freezed
class ReturnSummaryFilterState with _$ReturnSummaryFilterState {
  const ReturnSummaryFilterState._();

  const factory ReturnSummaryFilterState({
    required ReturnSummaryFilter returnSummaryFilter,
    required bool isSubmitting,
    required bool showErrorMessages,
  }) = _ReturnSummaryFilterState;

  factory ReturnSummaryFilterState.initial() => ReturnSummaryFilterState(
        isSubmitting: false,
        returnSummaryFilter: ReturnSummaryFilter.empty(),
        showErrorMessages: false,
      );
}
