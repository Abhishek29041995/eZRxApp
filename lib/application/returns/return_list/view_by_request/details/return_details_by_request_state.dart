part of 'return_details_by_request_bloc.dart';

@freezed
class ReturnDetailsByRequestState with _$ReturnDetailsByRequestState {
  const factory ReturnDetailsByRequestState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<ReturnRequestInformation> requestInformation,
    required ReturnRequestInformationHeader requestInformationHeader,
    required List<PoDocuments> downloadingAttachments,
    required PoDocuments downloadedAttachment,
    required Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption,
  }) = _ReturnSummaryDetailsState;

  factory ReturnDetailsByRequestState.initial() => ReturnDetailsByRequestState(
        failureOrSuccessOption: none(),
        isLoading: false,
        requestInformation: <ReturnRequestInformation>[],
        requestInformationHeader: ReturnRequestInformationHeader.empty(),
        downloadingAttachments: <PoDocuments>[],
        downloadedAttachment: PoDocuments.empty(),
        downloadFailureOrSuccessOption: none(),
      );
}
