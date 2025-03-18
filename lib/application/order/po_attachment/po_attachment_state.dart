part of 'po_attachment_bloc.dart';

@freezed
class PoAttachmentState with _$PoAttachmentState {
  const PoAttachmentState._();
  const factory PoAttachmentState({
    required bool isFetching,
    required List<PoDocuments> fileUrl,
    required List<PlatformFile> localFiles,
    required FileOperationMode fileOperationMode,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PoAttachmentState;
  factory PoAttachmentState.initial() => const PoAttachmentState(
        isFetching: false,
        fileUrl: <PoDocuments>[],
        localFiles: <PlatformFile>[],
        fileOperationMode: FileOperationMode.none,
        failureOrSuccessOption: None(),
      );

  bool get moreThanOneUploaded => fileUrl.length > 1;

  List<PoDocuments> get fileInOperation => isFetching ? fileUrl : [];

  bool get fileUploading =>
      fileInOperation.isNotEmpty &&
      fileOperationMode == FileOperationMode.upload &&
      isFetching;

  bool get fileUploaded =>
      fileOperationMode == FileOperationMode.upload && !isFetching;

  List<PoDocuments> get uploadInProgressPoDocument =>
      fileOperationMode == FileOperationMode.upload ? fileInOperation : [];

  bool get fileDownloading =>
      fileOperationMode == FileOperationMode.download ||
      fileOperationMode == FileOperationMode.view;

  bool get isDownloadOperation =>
      fileOperationMode == FileOperationMode.download;
  bool get isAttachmentUploaded =>
      isFetching && fileOperationMode == FileOperationMode.upload;
}

enum FileOperationMode { view, download, upload, none, delete }

extension PoAttachmentListExtension on List<PlatformFile> {
  bool hasFileExeed(int maximumUploadSize) => any(
        (PlatformFile element) =>
            element.size > (maximumUploadSize * pow(1024, 2)),
      );

  bool totalFilesExceed(int maximumUploadSize) {
    final totalFilesSize =
        fold(0, (previousValue, element) => previousValue + element.size);

    return totalFilesSize > (maximumUploadSize * pow(1024, 2));
  }
}
