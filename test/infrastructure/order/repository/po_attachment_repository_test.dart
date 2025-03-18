import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/take_picture_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../common_mock_data/user_mock.dart';

class FileMock extends Mock implements File {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class MockConfig extends Mock implements Config {}

class PoDocumentLocalDataSourceMock extends Mock
    implements PoDocumentLocalDataSource {}

class PoDocumentRemoteDataSourceMock extends Mock
    implements PoDocumentRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class PermissionServiceMock extends Mock implements PermissionService {}

class TakePictureServiceMock extends Mock implements TakePictureService {}

class TestFile extends FileMock {
  final String _path;
  final Uint8List _bytes;
  TestFile(this._path, this._bytes) {
    when(lengthSync).thenReturn(10);
    when(readAsBytesSync).thenReturn(_bytes);
    when(() => path).thenReturn(_path);
  }
}

void main() {
  late PoAttachmentRepository poAttachmentRepository;
  late Config mockConfig;
  late PoDocumentLocalDataSource poDocumentLocalDataSourceMock;
  late PoDocumentRemoteDataSource poDocumentRemoteDataSourceMock;
  late DeviceInfo deviceInfoMock;
  late FilePickerService filePickerServiceMock;
  late PermissionService permissionServiceMock;
  late FileSystemHelperMock fileSystemHelperMock;
  late TakePictureService takePictureServiceMock;

  const fakeFileName = 'fake-name';
  const fakeUrl = 'fake-url';
  final fakeException = Exception('fake_error');
  final file = File(fakeUrl);
  final fakeOpenResult = OpenResult(message: 'fake_message');
  final fakeOpenResultError = OpenResult(
    type: ResultType.error,
    message: 'fake_message',
  );
  final fakePlatformFile = PlatformFile(
    name: fakeFileName,
    size: 0,
    path: fakeUrl,
  );
  final fakePODocuments = PoDocuments.empty();
  const fakeImagePaths = ['fake-path'];
  final fakeBytes = Uint8List(10);

  setUpAll(() {
    mockConfig = MockConfig();
    locator.registerLazySingleton(() => mockConfig);
    poDocumentLocalDataSourceMock = PoDocumentLocalDataSourceMock();
    poDocumentRemoteDataSourceMock = PoDocumentRemoteDataSourceMock();
    deviceInfoMock = DeviceInfoMock();
    filePickerServiceMock = FilePickerServiceMock();
    permissionServiceMock = PermissionServiceMock();
    fileSystemHelperMock = FileSystemHelperMock();
    takePictureServiceMock = TakePictureServiceMock();
    poAttachmentRepository = PoAttachmentRepository(
      config: mockConfig,
      localDataSource: poDocumentLocalDataSourceMock,
      remoteDataSource: poDocumentRemoteDataSourceMock,
      deviceInfo: deviceInfoMock,
      filePickerService: filePickerServiceMock,
      permissionService: permissionServiceMock,
      fileSystemHelper: fileSystemHelperMock,
      takePictureService: takePictureServiceMock,
    );
    when(() => mockConfig.maximumUploadSize).thenReturn(10);
  });

  group('PoAttachmentRepository fileDownload test  ', () {
    test('download file successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((_) async => false);
      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          fakeFileName,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );
      when(
        () => fileSystemHelperMock.getDownloadedFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => file,
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl)],
      );
      expect(
        result.isRight(),
        true,
      );
      expect(result.getOrElse(() => []), [file]);
    });

    test('download file fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => poDocumentLocalDataSourceMock.fileDownload(fakeFileName))
          .thenThrow(
        fakeException,
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [
          PoDocuments.empty().copyWith(
            name: fakeFileName,
            url: fakeUrl,
          ),
        ],
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('download file successfully remote', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((_) async => false);
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          fakeFileName,
          fakeUrl,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );

      when(
        () => fileSystemHelperMock.getDownloadedFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => file,
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl)],
      );
      expect(
        result.isRight(),
        true,
      );
      debugDefaultTargetPlatformOverride = null;
      expect(result.getOrElse(() => []), [file]);
    });

    test('download file fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          fakeFileName,
          fakeUrl,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await poAttachmentRepository.downloadFiles(
        files: [PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl)],
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
  });

  group('PoAttachmentRepository Open file test  ', () {
    test('file open successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          fakeFileName,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );
      when(
        () => fileSystemHelperMock.openFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => fakeOpenResult,
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isRight(),
        true,
      );
      expect(result.getOrElse(() => OpenResult()), fakeOpenResult);
    });

    test('file open successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          fakeFileName,
          fakeUrl,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );
      when(
        () => fileSystemHelperMock.openFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => fakeOpenResult,
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isRight(),
        true,
      );
      expect(result.getOrElse(() => OpenResult()), fakeOpenResult);
    });

    test('file open local error', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          fakeFileName,
        ),
      ).thenThrow(fakeException);

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
    test('file open remote error', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          fakeFileName,
          fakeUrl,
        ),
      ).thenThrow(fakeException);

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('file open remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => poDocumentRemoteDataSourceMock.fileDownload(
          fakeFileName,
          fakeUrl,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );
      when(
        () => fileSystemHelperMock.openFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => fakeOpenResultError,
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(
          FailureHandler.handleFailure(
            fakeOpenResultError.message,
          ),
        ),
      );
    });

    test('file open local fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => poDocumentLocalDataSourceMock.fileDownload(
          fakeFileName,
        ),
      ).thenAnswer(
        (invocation) async =>
            AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
      );
      when(
        () => fileSystemHelperMock.openFile(
          AttachmentFileBuffer.empty().copyWith(name: fakeFileName),
        ),
      ).thenAnswer(
        (invocation) async => fakeOpenResultError,
      );

      final result = await poAttachmentRepository.openFile(
        files: PoDocuments.empty().copyWith(name: fakeFileName, url: fakeUrl),
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(
          FailureHandler.handleFailure(
            fakeOpenResultError.message,
          ),
        ),
      );
    });
  });
  group('PoAttachmentRepository getPermission test  ', () {
    test('android 33 permission', () async {
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => true);

      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.file,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => PermissionStatus.denied),
        PermissionStatus.granted,
      );
    });

    test('ios file permission', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => false);

      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.file,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => PermissionStatus.denied),
        PermissionStatus.granted,
      );
      debugDefaultTargetPlatformOverride = null;
    });

    test('ios photo permission denied', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => false);
      when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
        (invocation) async => PermissionStatus.denied,
      );
      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.gallery,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        const Left(ApiFailure.photoPermissionFailed()),
      );
      debugDefaultTargetPlatformOverride = null;
    });

    test('ios photo permission granted', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => false);
      when(() => permissionServiceMock.requestPhotoPermission()).thenAnswer(
        (invocation) async => PermissionStatus.granted,
      );
      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.gallery,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => PermissionStatus.denied),
        PermissionStatus.granted,
      );
      debugDefaultTargetPlatformOverride = null;
    });

    test('android permission denied', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => false);
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (invocation) async => PermissionStatus.denied,
      );
      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.gallery,
      );
      expect(
        result.isLeft(),
        true,
      );
      debugDefaultTargetPlatformOverride = null;
      expect(
        result,
        const Left(ApiFailure.storagePermissionFailed()),
      );
    });

    test('android permission granted', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenAnswer((invocation) async => false);
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (invocation) async => PermissionStatus.granted,
      );
      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.gallery,
      );
      expect(
        result.isRight(),
        true,
      );
      debugDefaultTargetPlatformOverride = null;
      expect(
        result.getOrElse(() => PermissionStatus.denied),
        PermissionStatus.granted,
      );
    });

    test('get permission error', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33())
          .thenThrow(fakeException);
      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.gallery,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeException)),
      );
    });

    test('take photo permission granted', () async {
      when(() => permissionServiceMock.requestCameraPermission())
          .thenAnswer((invocation) async => PermissionStatus.granted);

      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.takePhoto,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => PermissionStatus.denied),
        PermissionStatus.granted,
      );
    });

    test('take photo permission denied', () async {
      when(() => permissionServiceMock.requestCameraPermission())
          .thenAnswer((invocation) async => PermissionStatus.denied);

      final result = await poAttachmentRepository.getPermission(
        uploadOptionType: UploadOptionType.takePhoto,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        const Left(
          ApiFailure.cameraPermissionFailed(
            false,
          ),
        ),
      );
    });
  });

  group('PoAttachmentRepository pickFiles test  ', () {
    test('pickFiles Error', () async {
      when(() => filePickerServiceMock.pickFiles()).thenThrow(
        (invocation) => fakeException,
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.gallery,
        submitTicketFileExtension: false,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, const Left(ApiFailure.invalidFileFormat()));
    });

    test('pickFiles no file selected', () async {
      when(() => filePickerServiceMock.pickFiles()).thenAnswer(
        (invocation) async => null,
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.gallery,
        submitTicketFileExtension: false,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(
          () => [
            fakePlatformFile,
          ],
        ),
        [],
      );
    });

    test('pickFiles file selected with empty path', () async {
      when(() => filePickerServiceMock.pickFiles()).thenAnswer(
        (invocation) async =>
            FilePickerResult([PlatformFile(name: fakeFileName, size: 0)]),
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.gallery,
        submitTicketFileExtension: false,
      );
      expect(
        result.getOrElse(
          () => [
            fakePlatformFile,
          ],
        ),
        [],
      );
    });

    test('pickFiles success with normal allowedExtensions', () async {
      when(() => mockConfig.allowedExtensions).thenReturn(['jpg']);
      when(
        () => filePickerServiceMock.pickFiles(
          allowMultiple: true,
          fileType: FileType.custom,
          allowedExtensions: ['jpg'],
        ),
      ).thenAnswer(
        (invocation) async => FilePickerResult(
          [
            fakePlatformFile,
          ],
        ),
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.file,
        submitTicketFileExtension: false,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(
          () => [],
        ),
        [fakePlatformFile],
      );
    });

    test('pickFiles success with ezcs ticket file extension', () async {
      when(() => mockConfig.allowedExtensionsEzcsTicket)
          .thenReturn(['jpg,zip,png']);
      when(
        () => filePickerServiceMock.pickFiles(
          allowMultiple: true,
          fileType: FileType.custom,
          allowedExtensions: ['jpg,zip,png'],
        ),
      ).thenAnswer(
        (invocation) async => FilePickerResult(
          [
            fakePlatformFile,
          ],
        ),
      );
      final result = await poAttachmentRepository.pickFiles(
        uploadOptionType: UploadOptionType.file,
        submitTicketFileExtension: true,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(
          () => [],
        ),
        [fakePlatformFile],
      );
    });

    test('pickFiles with UploadOptionType.takePhoto success', () async {
      await IOOverrides.runZoned(
        () async {
          when(
            () => takePictureServiceMock.takePicture(),
          ).thenAnswer(
            (invocation) async => fakeImagePaths,
          );
          final result = await poAttachmentRepository.pickFiles(
            uploadOptionType: UploadOptionType.takePhoto,
            submitTicketFileExtension: false,
          );
          final fileList = [
            PlatformFile(
              name: fakeImagePaths.first,
              size: 10,
              bytes: fakeBytes,
              path: fakeImagePaths.first,
            ),
          ];
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => [],
            ),
            fileList,
          );
        },
        createFile: (String path) => TestFile(path, fakeBytes),
      );
    });
  });

  group('PoAttachmentRepository uploadFiles test  ', () {
    test('uploadFiles local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileUpload(),
      ).thenAnswer(
        (invocation) async => fakePODocuments,
      );
      final result = await poAttachmentRepository.uploadFiles(
        files: [
          fakePlatformFile,
        ],
        user: fakeClientUser,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(
          () => [],
        ),
        [fakePODocuments],
      );
    });

    test('uploadFiles local fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => poDocumentLocalDataSourceMock.fileUpload(),
      ).thenThrow(fakeException);
      final result = await poAttachmentRepository.uploadFiles(
        files: [
          PlatformFile(name: fakeFileName, size: 0),
        ],
        user: fakeClientUser,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('uploadFiles remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final file = MultipartFile.fromBytes([1, 2, 3]);
      when(
        () => fileSystemHelperMock.toMultipartFile(
          name: any(named: 'name'),
          path: any(named: 'path'),
        ),
      ).thenReturn(file);
      when(
        () => poDocumentRemoteDataSourceMock.fileUpload(
          file: file,
          userName: fakeClient.username.getOrCrash(),
        ),
      ).thenAnswer((_) async => fakePODocuments);
      final result = await poAttachmentRepository.uploadFiles(
        files: [fakePlatformFile],
        user: fakeClientUser,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(
          () => [],
        ),
        [fakePODocuments],
      );
    });

    test('uploadFiles remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final file = MultipartFile.fromBytes([1, 2, 3]);
      when(
        () => fileSystemHelperMock.toMultipartFile(
          name: any(named: 'name'),
          path: any(named: 'path'),
        ),
      ).thenReturn(file);
      when(
        () => poDocumentRemoteDataSourceMock.fileUpload(
          file: file,
          userName: fakeClient.username.getOrCrash(),
        ),
      ).thenThrow(fakeException);

      final result = await poAttachmentRepository.uploadFiles(
        files: [
          fakePlatformFile,
        ],
        user: fakeClientUser,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('uploadFiles remote try upload bigger file', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await poAttachmentRepository.uploadFiles(
        files: [
          PlatformFile(
            name: fakeFileName,
            size: (20 * pow(1024, 2) + 1).toInt(),
          ),
        ],
        user: fakeClientUser,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(result, const Left(ApiFailure.uploadedFileSizeExceed()));
    });
  });

  group('PoAttachmentRepository deleteFile test', () {
    test('deleteFile local success', () async {
      when(() => mockConfig.appFlavor).thenAnswer((_) => Flavor.mock);
      when(() => poDocumentLocalDataSourceMock.deleteFile()).thenAnswer(
        (_) => Future.value(true),
      );
      final result = await poAttachmentRepository.deleteFile(filePath: fakeUrl);
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => false,
        ),
        true,
      );
    });

    test('deleteFile local failure', () async {
      when(() => mockConfig.appFlavor).thenAnswer((_) => Flavor.mock);
      when(() => poDocumentLocalDataSourceMock.deleteFile()).thenThrow(
        fakeException,
      );
      final result = await poAttachmentRepository.deleteFile(filePath: fakeUrl);
      expect(result.isLeft(), true);
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('deleteFile remote success', () async {
      when(() => mockConfig.appFlavor).thenAnswer((_) => Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.deleteFile(
          filePath: fakeUrl,
        ),
      ).thenAnswer(
        (_) => Future.value(true),
      );
      final result = await poAttachmentRepository.deleteFile(filePath: fakeUrl);
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => false,
        ),
        true,
      );
    });

    test('deleteFile remote failure', () async {
      when(() => mockConfig.appFlavor).thenAnswer((_) => Flavor.dev);
      when(
        () => poDocumentRemoteDataSourceMock.deleteFile(
          filePath: fakeUrl,
        ),
      ).thenThrow(
        fakeException,
      );
      final result = await poAttachmentRepository.deleteFile(filePath: fakeUrl);
      expect(result.isLeft(), true);
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
  });
  group('PoAttachmentRepository downloadPermission test', () {
    test('downloadPermission ios', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final result = await poAttachmentRepository.downloadPermission();
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => PermissionStatus.denied,
        ),
        PermissionStatus.granted,
      );
    });

    test('downloadPermission android sdk 30', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (_) async => true,
      );

      final result = await poAttachmentRepository.downloadPermission();
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => PermissionStatus.denied,
        ),
        PermissionStatus.granted,
      );
    });

    test('download permission granted android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (_) async => false,
      );
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      final result = await poAttachmentRepository.downloadPermission();
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => PermissionStatus.denied,
        ),
        PermissionStatus.granted,
      );
    });

    test('download permission limited android', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (_) async => false,
      );
      when(() => permissionServiceMock.requestStoragePermission()).thenAnswer(
        (_) async => PermissionStatus.limited,
      );
      final result = await poAttachmentRepository.downloadPermission();
      expect(result.isRight(), true);
      expect(
        result.getOrElse(
          () => PermissionStatus.denied,
        ),
        PermissionStatus.limited,
      );
    });

    test('downloadPermission failure', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      when(() => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
        (_) async => false,
      );
      when(() => permissionServiceMock.requestStoragePermission()).thenThrow(
        fakeException,
      );
      final result = await poAttachmentRepository.downloadPermission();
      expect(result.isLeft(), true);
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
  });

  group('PoAttachmentRepository saveAssetImagesToGallery test', () {
    test('saveAssetImagesToGallery ios permission failed', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => permissionServiceMock.requestAddPhotoPermission()).thenAnswer(
        (_) async => PermissionStatus.denied,
      );
      final result = await poAttachmentRepository.saveAssetImagesToGallery(
        fileList: fakeImagePaths,
      );
      expect(result.isLeft(), true);
      expect(
        result,
        const Left(ApiFailure.photoPermissionFailed()),
      );
    });

    test('saveAssetImagesToGallery ios success', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => permissionServiceMock.requestAddPhotoPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(
        () =>
            fileSystemHelperMock.saveAssetImageToGallery(fakeImagePaths.first),
      ).thenAnswer(
        (_) => Future.value(),
      );
      final result = await poAttachmentRepository.saveAssetImagesToGallery(
        fileList: fakeImagePaths,
      );
      expect(result.isRight(), true);
      expect(
        result,
        const Right(true),
      );
    });

    test('saveAssetImagesToGallery android failed', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      when(
        () =>
            fileSystemHelperMock.saveAssetImageToGallery(fakeImagePaths.first),
      ).thenThrow(
        fakeException,
      );
      final result = await poAttachmentRepository.saveAssetImagesToGallery(
        fileList: fakeImagePaths,
      );
      expect(result.isLeft(), true);
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeException)),
      );
    });

    test('saveAssetImagesToGallery android success', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      when(
        () =>
            fileSystemHelperMock.saveAssetImageToGallery(fakeImagePaths.first),
      ).thenAnswer(
        (_) => Future.value(),
      );
      final result = await poAttachmentRepository.saveAssetImagesToGallery(
        fileList: fakeImagePaths,
      );
      expect(result.isRight(), true);
      expect(
        result,
        const Right(true),
      );
    });
  });
}
