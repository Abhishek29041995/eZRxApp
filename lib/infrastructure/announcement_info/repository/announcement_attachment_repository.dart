import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_attachment_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_locale.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_remote.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';

class AnnouncementAttachmentRepository
    implements IAnnouncementAttachmentRepository {
  final Config config;
  final AnnouncementAttachmentDownloadRemoteDataSource remoteDataSource;
  final AnnouncementAttachmentDownloadLocalDataSource localDataSource;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FilePickerService filePickerService;
  final FileSystemHelper fileSystemHelper;

  AnnouncementAttachmentRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.deviceInfo,
    required this.permissionService,
    required this.filePickerService,
    required this.fileSystemHelper,
  });

  @override
  Future<Either<ApiFailure, File>> downloadFiles({
    required Attachment url,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final downloadedFile =
            await localDataSource.fileDownload(url.getFileNameFromPath);

        final localFile = await fileSystemHelper.getDownloadedFile(
          downloadedFile,
        );

        return Right(localFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final downloadedFile = await remoteDataSource.fileDownload(
        url.getOrCrash(),
        url.getFileNameFromPath,
      );

      final localFile = await fileSystemHelper.getDownloadedFile(
        downloadedFile,
      );

      return Right(localFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> downloadPermission() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus =
          await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : const Left(ApiFailure.storagePermissionFailed());
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
