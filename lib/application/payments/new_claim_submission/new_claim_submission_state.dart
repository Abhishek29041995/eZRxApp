part of 'new_claim_submission_bloc.dart';

@freezed
class NewClaimSubmissionState with _$NewClaimSubmissionState {
  const NewClaimSubmissionState._();
  const factory NewClaimSubmissionState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool isPrincipalLoading,
    required bool showUploadExeedMessage,
    required ClaimSubmission claimSubmission,
    required List<PrincipalData> principalList,
  }) = _NewClaimSubmissionState;

  factory NewClaimSubmissionState.initial() => NewClaimSubmissionState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isPrincipalLoading: false,
        showUploadExeedMessage: false,
        claimSubmission: ClaimSubmission.empty(),
        principalList: <PrincipalData>[],
      );

  bool get formValidated => claimSubmission.isValid && !showUploadExeedMessage;
}
