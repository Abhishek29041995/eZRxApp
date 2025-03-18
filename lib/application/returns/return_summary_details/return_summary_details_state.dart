part of 'return_summary_details_bloc.dart';

@freezed
class ReturnSummaryDetailsState with _$ReturnSummaryDetailsState {
  const factory ReturnSummaryDetailsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ReturnRequestInformation requestInformation,
    required ReturnRequestInformationHeader requestInformationHeader,
    required List<PoDocuments> downloadingAttachments,
    required PoDocuments downloadedAttachment,
    required Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption,
  }) = _ReturnSummaryDetailsState;

  factory ReturnSummaryDetailsState.initial() => ReturnSummaryDetailsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        requestInformation: ReturnRequestInformation.empty(),
        requestInformationHeader: ReturnRequestInformationHeader.empty(),
        downloadingAttachments: <PoDocuments>[],
        downloadedAttachment: PoDocuments.empty(),
        downloadFailureOrSuccessOption: none(),
      );
}
