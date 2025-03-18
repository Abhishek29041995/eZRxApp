import 'dart:math';

import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PoAttachmentState mockState;
  group('Bundle Add To Cart State test', () {
    setUpAll(() {
      final fakePoDocument = PoDocuments.empty().copyWith(
        name: 'fake-file',
        url: 'fake-url',
      );
      final fakePoDocument1 = PoDocuments.empty().copyWith(
        name: 'fake-file-1',
        url: 'fake-url-1',
      );
      mockState = PoAttachmentState.initial().copyWith(
        fileUrl: [fakePoDocument, fakePoDocument1],
      );
    });
    test('Check moreThanOneUploaded', () {
      expect(mockState.moreThanOneUploaded, true);
    });
    test('Check fileInOperation', () {
      expect(
        mockState.fileInOperation,
        [],
      );
    });
    test('Check fileUploading', () {
      expect(
        mockState
            .copyWith(
              fileOperationMode: FileOperationMode.upload,
              isFetching: true,
            )
            .fileUploading,
        true,
      );
    });
    test('Check fileUploaded', () {
      expect(
        mockState.fileUploaded,
        false,
      );
    });

    test('Check uploadInProgressPoDocument', () {
      expect(
        mockState.uploadInProgressPoDocument,
        [],
      );
    });
    test('Check fileDownloading', () {
      expect(
        mockState.fileDownloading,
        false,
      );
    });
    test('Check isDownloadOperation', () {
      expect(
        mockState.isDownloadOperation,
        false,
      );
    });
    test('Check isAttachmentUploaded', () {
      expect(
        mockState
            .copyWith(
              isFetching: true,
              fileOperationMode: FileOperationMode.upload,
            )
            .isAttachmentUploaded,
        true,
      );
    });

    test('Check hasFileExeed', () {
      expect(
        [
          PlatformFile(name: 'fake-name', size: 20 * pow(1024, 2).round()),
          PlatformFile(name: 'fake-name', size: 10 * pow(1024, 2).round()),
        ].hasFileExeed(15),
        true,
      );
    });
  });
}
