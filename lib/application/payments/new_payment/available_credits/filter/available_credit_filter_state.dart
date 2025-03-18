part of 'available_credit_filter_bloc.dart';

@freezed
class AvailableCreditFilterState with _$AvailableCreditFilterState {
  const AvailableCreditFilterState._();

  const factory AvailableCreditFilterState({
    required AvailableCreditFilter filter,
    required bool showErrorMessage,
  }) = _AvailableCreditFilterState;

  factory AvailableCreditFilterState.initial() => AvailableCreditFilterState(
        filter: AvailableCreditFilter.defaultFilter(),
        showErrorMessage: false,
      );
}
