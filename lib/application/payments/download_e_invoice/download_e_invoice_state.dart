part of 'download_e_invoice_bloc.dart';

@freezed
class DownloadEInvoiceState with _$DownloadEInvoiceState {
  const DownloadEInvoiceState._();
  const factory DownloadEInvoiceState({
    required bool isDownloading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required DownloadPaymentAttachment eInvoiceUrl,
    required AttachmentFileBuffer eInvoice,
  }) = _DownloadEInvoiceState;

  factory DownloadEInvoiceState.initial() => DownloadEInvoiceState(
        isDownloading: false,
        failureOrSuccessOption: none(),
        eInvoiceUrl: DownloadPaymentAttachment.empty(),
        eInvoice: AttachmentFileBuffer.empty(),
      );

  bool get isDownloadSuccess => eInvoice != AttachmentFileBuffer.empty();
}
