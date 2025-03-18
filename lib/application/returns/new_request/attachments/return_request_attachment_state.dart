part of 'return_request_attachment_bloc.dart';

@freezed
class ReturnRequestAttachmentState with _$ReturnRequestAttachmentState {
  const ReturnRequestAttachmentState._();
  const factory ReturnRequestAttachmentState({
    required bool isFetching,
    required String returnUuid,
    required List<PoDocuments> uploadedFiles,
    required FileOperationMode fileOperationMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ReturnRequestAttachmentState;
  factory ReturnRequestAttachmentState.initial() =>
      ReturnRequestAttachmentState(
        isFetching: false,
        returnUuid: '',
        uploadedFiles: <PoDocuments>[],
        fileOperationMode: FileOperationMode.none,
        failureOrSuccessOption: none(),
      );

  bool get moreThanOneUploaded => uploadedFiles.length > 1;
}

enum FileOperationMode {
  delete,
  upload,
  download,
  none,
}
