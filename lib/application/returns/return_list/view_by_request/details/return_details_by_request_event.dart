part of 'return_details_by_request_bloc.dart';

@freezed
class ReturnDetailsByRequestEvent with _$ReturnDetailsByRequestEvent {
  const factory ReturnDetailsByRequestEvent.initialized() = _Initialized;
  const factory ReturnDetailsByRequestEvent.fetch({
    required String returnId,
  }) = _Fetch;
  const factory ReturnDetailsByRequestEvent.downloadFile({
    required PoDocuments file,
  }) = _DownloadFile;
}
