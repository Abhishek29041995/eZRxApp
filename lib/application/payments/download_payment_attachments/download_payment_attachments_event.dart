part of 'download_payment_attachments_bloc.dart';

@freezed
class DownloadPaymentAttachmentEvent with _$DownloadPaymentAttachmentEvent {
  const factory DownloadPaymentAttachmentEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganization,
  }) = _Initialized;
  const factory DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl({
    required AllInvoicesFilter queryObject,
    required bool isMarketPlace,
  }) = _FetchAllInvoiceUrl;

  const factory DownloadPaymentAttachmentEvent.fetchAllCreditUrl({
    required AllCreditsFilter queryObject,
    required bool isMarketPlace,
  }) = _FetchAllCreditUrl;

  const factory DownloadPaymentAttachmentEvent.fetchFullSummaryUrl({
    required FullSummaryFilter queryObject,
    required bool isMarketPlace,
  }) = _FetchFullSummaryUrl;

  const factory DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl({
    required PaymentSummaryFilter paymentSummaryFilter,
    required bool isMarketPlace,
  }) = _FetchPaymentSummaryUrl;

  const factory DownloadPaymentAttachmentEvent.downloadPaymentAttachment({
    required DownloadPaymentAttachment files,
  }) = _DownloadPaymentAttachment;

  const factory DownloadPaymentAttachmentEvent.downloadSOA({
    required SoaData soaData,
  }) = _DownloadSOA;
}
