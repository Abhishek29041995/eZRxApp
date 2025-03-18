part of 'claim_management_filter_bloc.dart';

@freezed
class ClaimManagementFilterEvent with _$ClaimManagementFilterEvent {
  const factory ClaimManagementFilterEvent.initialized() = _Initialized;

  const factory ClaimManagementFilterEvent.openFilterBottomSheet({
    required ClaimManagementFilter appliedFilter,
  }) = _OpenFilterBottomSheet;

  const factory ClaimManagementFilterEvent.claimTypeChange({
    required ClaimType claimType,
    required bool selected,
  }) = _StatusChanged;

  const factory ClaimManagementFilterEvent.clearAll() = _ClearAll;
}
