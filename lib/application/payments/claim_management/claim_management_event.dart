part of 'claim_management_bloc.dart';

@freezed
class ClaimManagementEvent with _$ClaimManagementEvent {
  const factory ClaimManagementEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Initialized;
  const factory ClaimManagementEvent.fetch({
    required ClaimManagementFilter appliedFilter,
  }) = _Fetch;
  const factory ClaimManagementEvent.applyFilter({
    required ClaimManagementFilter appliedFilter,
  }) = _ApplyFilter;
}
