import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/take_picture_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart' as ofs;
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

const int _maxUpload = 10;

class PoAttachmentRepository implements IpoAttachmentRepository {
  final Config config;
  final PoDocumentRemoteDataSource remoteDataSource;
  final PoDocumentLocalDataSource localDataSource;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FilePickerService filePickerService;
  final FileSystemHelper fileSystemHelper;
  final TakePictureService takePictureService;

  PoAttachmentRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.deviceInfo,
    required this.permissionService,
    required this.filePickerService,
    required this.fileSystemHelper,
    required this.takePictureService,
  });

  @override
  Future<Either<ApiFailure, List<File>>> downloadFiles({
    required List<PoDocuments> files,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = Future.wait(
          files.map(
            (e) async {
              final downloadedFile = await localDataSource.fileDownload(e.name);

              return await fileSystemHelper.getDownloadedFile(
                downloadedFile,
              );
            },
          ).toList(),
        );

        return Right(await localFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = Future.wait(
        files.map(
          (e) async {
            final downloadedFile = await remoteDataSource.fileDownload(
              e.name,
              e.url,
            );

            return await fileSystemHelper.getDownloadedFile(
              downloadedFile,
            );
          },
        ).toList(),
      );

      return Right(await localFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, OpenResult>> openFile({
    required PoDocuments files,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.fileDownload(
          files.name,
        );
        final result = await fileSystemHelper.openFile(localFile);
        if (result.type != ofs.ResultType.done) {
          return Left(
            FailureHandler.handleFailure(result.message),
          );
        }

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = await remoteDataSource.fileDownload(
        files.name,
        files.url,
      );
      final result = await fileSystemHelper.openFile(localFile);

      if (result.type != ofs.ResultType.done) {
        return Left(
          FailureHandler.handleFailure(result.message),
        );
      }

      return Right(result);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PoDocuments>>> uploadFiles({
    required List<PlatformFile> files,
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.fileUpload();

        return Right([localFile]);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      if ((files.length) > _maxUpload) {
        return const Left(
          ApiFailure.uploadCountExcideLimit(),
        );
      }
      final biggerFile = files.where(
        (PlatformFile element) =>
            element.size > (config.maximumUploadSize * pow(1024, 2)),
      );
      if (biggerFile.isNotEmpty) {
        return const Left(ApiFailure.uploadedFileSizeExceed());
      }
      final upLoadedFiles = Future.wait(
        files
            .map(
              (file) async => await remoteDataSource.fileUpload(
                file: fileSystemHelper.toMultipartFile(
                  name: file.name,
                  path: file.path ?? '',
                ),
                userName: user.username.getOrCrash(),
              ),
            )
            .toList(),
      );

      return Right(await upLoadedFiles);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required UploadOptionType uploadOptionType,
  }) async {
    try {
      switch (uploadOptionType) {
        case UploadOptionType.takePhoto:
          final permissionStatus =
              await permissionService.requestCameraPermission();

          return permissionStatus == PermissionStatus.granted ||
                  permissionStatus == PermissionStatus.limited
              ? Right(permissionStatus)
              : Left(
                  ApiFailure.cameraPermissionFailed(
                    permissionStatus == PermissionStatus.permanentlyDenied,
                  ),
                );

        case UploadOptionType.gallery:
        case UploadOptionType.file:
          if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
            return const Right(PermissionStatus.granted);
          }

          final isIos = defaultTargetPlatform == TargetPlatform.iOS;
          if (isIos && uploadOptionType == UploadOptionType.file) {
            return const Right(PermissionStatus.granted);
          }

          final permissionStatus = isIos
              ? await permissionService.requestPhotoPermission()
              : await permissionService.requestStoragePermission();

          return permissionStatus == PermissionStatus.granted ||
                  permissionStatus == PermissionStatus.limited
              ? Right(permissionStatus)
              : Left(
                  isIos
                      ? const ApiFailure.photoPermissionFailed()
                      : const ApiFailure.storagePermissionFailed(),
                );
      }
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required UploadOptionType uploadOptionType,
    required bool submitTicketFileExtension,
  }) async {
    try {
      if (uploadOptionType == UploadOptionType.takePhoto) {
        final result = await takePictureService.takePicture();

        final renamedFiles = result.map(
          (imagePath) {
            final image = File(imagePath);
            final name = image.path.split('/').last;

            return PlatformFile(
              name: name,
              size: image.lengthSync(),
              path: image.path,
              bytes: image.readAsBytesSync(),
            );
          },
        ).toList();

        return right(renamedFiles);
      } else {
        final result = await filePickerService.pickFiles(
          allowMultiple: true,
          fileType: uploadOptionType == UploadOptionType.file
              ? FileType.custom
              : FileType.image,
          allowedExtensions: uploadOptionType == UploadOptionType.file
              ? submitTicketFileExtension
                  ? config.allowedExtensionsEzcsTicket
                  : config.allowedExtensions
              : null,
        );
        final files = List<PlatformFile>.from(result?.files ?? [])
          ..removeWhere((element) => (element.path ?? '').isEmpty);

        final renamedFiles = files
            .map(
              (element) => PlatformFile(
                path: element.path,
                name: element.name,
                size: element.size,
                bytes: element.bytes,
                readStream: element.readStream,
                identifier: element.identifier,
              ),
            )
            .toList();

        return right(renamedFiles);
      }
    } catch (e) {
      return const Left(
        ApiFailure.invalidFileFormat(),
      );
    }
  }

  @override
  Future<Either<ApiFailure, bool>> deleteFile({
    required String filePath,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.deleteFile();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.deleteFile(
        filePath: filePath,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
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

  @override
  Future<Either<ApiFailure, bool>> saveAssetImagesToGallery({
    required List<String> fileList,
  }) async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        final permissionStatus =
            await permissionService.requestAddPhotoPermission();
        if (permissionStatus != PermissionStatus.granted &&
            permissionStatus != PermissionStatus.limited) {
          return const Left(ApiFailure.photoPermissionFailed());
        }
      }

      for (final assetPath in fileList) {
        await fileSystemHelper.saveAssetImageToGallery(assetPath);
      }

      return const Right(true);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
