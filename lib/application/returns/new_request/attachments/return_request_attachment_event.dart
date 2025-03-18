part of 'return_request_attachment_bloc.dart';

@freezed
class ReturnRequestAttachmentEvent with _$ReturnRequestAttachmentEvent {
  const factory ReturnRequestAttachmentEvent.initialized() = _Initialized;
  const factory ReturnRequestAttachmentEvent.uploadFile({
    required String assignmentNumber,
    required String returnUuid,
    required UploadOptionType uploadOptionType,
    required User user,
  }) = _UpLoadFile;
  const factory ReturnRequestAttachmentEvent.deleteFile({
    required PoDocuments file,
  }) = _DeleteFile;
  const factory ReturnRequestAttachmentEvent.downloadFile({
    required PoDocuments file,
  }) = _DownloadFile;
}

enum UploadOptionType { file, gallery }
