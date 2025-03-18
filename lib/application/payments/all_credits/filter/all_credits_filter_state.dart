part of 'all_credits_filter_bloc.dart';

@freezed
class AllCreditsFilterState with _$AllCreditsFilterState {
  const AllCreditsFilterState._();
  const factory AllCreditsFilterState({
    required AllCreditsFilter filter,
    required List<String> statuses,
    required bool showErrorMessages,
  }) = _AllCreditsFilterState;

  factory AllCreditsFilterState.initial() => AllCreditsFilterState(
        filter: AllCreditsFilter.defaultFilter(),
        showErrorMessages: false,
        statuses: <String>[
          'Open',
          'Cleared',
        ],
      );
}
