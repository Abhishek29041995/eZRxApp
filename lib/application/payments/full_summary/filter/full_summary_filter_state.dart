part of 'full_summary_filter_bloc.dart';

@freezed
class FullSummaryFilterState with _$FullSummaryFilterState {
  const FullSummaryFilterState._();
  const factory FullSummaryFilterState({
    required FullSummaryFilter filter,
    required List<String> statuses,
    required bool showErrorMessages,
  }) = _FullSummaryFilterState;

  factory FullSummaryFilterState.initial() => FullSummaryFilterState(
        filter: FullSummaryFilter.defaultFilter(),
        showErrorMessages: false,
        statuses: <String>[
          'Open',
          'In progress',
          'Overdue',
          'Cleared',
          'Outstanding',
        ],
      );
}
