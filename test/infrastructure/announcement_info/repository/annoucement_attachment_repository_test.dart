import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_locale.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class MockConfig extends Mock implements Config {}

class AnnouncementAttachmentDownloadLocalDataSourceMock extends Mock
    implements AnnouncementAttachmentDownloadLocalDataSource {}

class AnnouncementAttachmentDownloadRemoteDataSourceMock extends Mock
    implements AnnouncementAttachmentDownloadRemoteDataSource {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class PermissionServiceMock extends Mock implements PermissionService {}

void main() {
  late Config mockConfig;

  late AnnouncementAttachmentDownloadRemoteDataSource remoteDataSource;
  late AnnouncementAttachmentDownloadLocalDataSource localDataSource;
  late DeviceInfo deviceInfo;
  late PermissionService permissionService;
  late AnnouncementAttachmentRepository repository;
  late FileSystemHelper fileSystemHelper;
  const error = ApiFailure.other('fake-error');
  const path = 'fake-path';
  final buffer = AttachmentFileBuffer(
    buffer: Uint8List.fromList([1, 2, 3]),
    name: path,
  );
  final file = File(path);

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockConfig = Config()..appFlavor = Flavor.mock;

    localDataSource = AnnouncementAttachmentDownloadLocalDataSourceMock();
    remoteDataSource = AnnouncementAttachmentDownloadRemoteDataSourceMock();
    fileSystemHelper = FileSystemHelperMock();
    deviceInfo = DeviceInfoMock();
    permissionService = PermissionServiceMock();
    repository = AnnouncementAttachmentRepository(
      deviceInfo: deviceInfo,
      permissionService: permissionService,
      filePickerService: FilePickerService(),
      fileSystemHelper: fileSystemHelper,
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Announcement Attachment Repository test - ', () {
    test(' get Announcement Article Tag successfully locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.fileDownload(path),
      ).thenAnswer(
        (invocation) async => buffer,
      );

      when(
        () => fileSystemHelper.getDownloadedFile(buffer),
      ).thenAnswer(
        (invocation) async => file,
      );

      final result = await repository.downloadFiles(
        url: Attachment(path),
      );

      expect(
        result,
        Right(file),
      );
    });

    test(' get Announcement Article Tag failure locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.fileDownload(path),
      ).thenThrow(error);

      final result = await repository.downloadFiles(
        url: Attachment(path),
      );

      expect(
        result,
        Left(FailureHandler.handleFailure(error)),
      );
    });

    test(' get Announcement Article Tag successfully remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.fileDownload(path, path),
      ).thenAnswer(
        (invocation) async => buffer,
      );

      when(
        () => fileSystemHelper.getDownloadedFile(buffer),
      ).thenAnswer(
        (invocation) async => file,
      );

      final result = await repository.downloadFiles(
        url: Attachment(path),
      );

      expect(
        result,
        Right(file),
      );
    });

    test(' get Announcement Article Tag failure remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.fileDownload(path, path),
      ).thenThrow(error);

      final result = await repository.downloadFiles(
        url: Attachment(path),
      );

      expect(
        result,
        Left(FailureHandler.handleFailure(error)),
      );
    });

    test(' get download Permission ios', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final result = await repository.downloadPermission();

      expect(
        result,
        const Right(PermissionStatus.granted),
      );
    });

    test(' get download Permission android != 33 granted', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      when(
        () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
      ).thenAnswer((_) => Future.value(false));

      when(
        () => permissionService.requestStoragePermission(),
      ).thenAnswer((_) => Future.value(PermissionStatus.granted));

      final result = await repository.downloadPermission();

      expect(
        result,
        const Right(PermissionStatus.granted),
      );
    });

    test(' get download Permission android != 33 access denied', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      when(
        () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
      ).thenAnswer((_) => Future.value(false));

      when(
        () => permissionService.requestStoragePermission(),
      ).thenAnswer((_) => Future.value(PermissionStatus.denied));

      final result = await repository.downloadPermission();

      expect(
        result,
        const Left(ApiFailure.storagePermissionFailed()),
      );
    });

    test(' get download Permission exception failed', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      when(
        () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
      ).thenAnswer((_) => Future.value(false));

      when(
        () => permissionService.requestStoragePermission(),
      ).thenThrow(error);

      final result = await repository.downloadPermission();

      expect(
        result,
        Left(FailureHandler.handleFailure(error)),
      );
    });
  });
}
