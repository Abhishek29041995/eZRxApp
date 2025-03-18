part of 'download_e_invoice_bloc.dart';

@freezed
class DownloadEInvoiceEvent with _$DownloadEInvoiceEvent {
  const factory DownloadEInvoiceEvent.initialized() = _initialized;
  const factory DownloadEInvoiceEvent.fetchUrl({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required String invoiceNumber,
  }) = _FetchUrl;
  const factory DownloadEInvoiceEvent.download() = _Download;
  const factory DownloadEInvoiceEvent.openFile() = _OpenFile;
}
