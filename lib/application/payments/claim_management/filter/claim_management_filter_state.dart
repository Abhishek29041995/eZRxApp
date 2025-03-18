part of 'claim_management_filter_bloc.dart';

@freezed
class ClaimManagementFilterState with _$ClaimManagementFilterState {
  const ClaimManagementFilterState._();
  const factory ClaimManagementFilterState({
    required ClaimManagementFilter filter,
  }) = _ClaimManagementFilterState;

  factory ClaimManagementFilterState.initial() => ClaimManagementFilterState(
        filter: ClaimManagementFilter.empty(),
      );
}
