part of 'download_payment_attachments_bloc.dart';

@freezed
class DownloadPaymentAttachmentsState with _$DownloadPaymentAttachmentsState {
  const factory DownloadPaymentAttachmentsState({
    required DownloadPaymentAttachment fileUrl,
    required bool isDownloadInProgress,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _DownloadPaymentAttachmentsState;

  factory DownloadPaymentAttachmentsState.initial() =>
      DownloadPaymentAttachmentsState(
        failureOrSuccessOption: none(),
        isDownloadInProgress: false,
        fileUrl: DownloadPaymentAttachment.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganization: SalesOrganisation.empty(),
      );
}
