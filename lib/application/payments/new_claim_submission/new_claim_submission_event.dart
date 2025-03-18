part of 'new_claim_submission_bloc.dart';

@freezed
class NewClaimSubmissionEvent with _$NewClaimSubmissionEvent {
  const factory NewClaimSubmissionEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _initialized;
  const factory NewClaimSubmissionEvent.fetchPrincipalList() =
      _FetchPrincipalList;
  const factory NewClaimSubmissionEvent.onSelectPrincipal({
    required PrincipalData principal,
  }) = _OnSelectPrincipal;
  const factory NewClaimSubmissionEvent.onSelectClaimType({
    required ClaimType claimType,
  }) = _OnSelectClaimType;
  const factory NewClaimSubmissionEvent.onClaimAmountChange({
    required double amount,
  }) = _OnClaimAmountChange;
  const factory NewClaimSubmissionEvent.onClaimDetailsChange({
    required String claimDetails,
  }) = _OnClaimDetailsChange;
  const factory NewClaimSubmissionEvent.addPoDocument({
    required List<PlatformFile> poDocuments,
  }) = _AddPoDocument;
  const factory NewClaimSubmissionEvent.removePoDocument({
    required PlatformFile poDocument,
  }) = _RemovePoDocument;
  const factory NewClaimSubmissionEvent.submit({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Submit;
}
