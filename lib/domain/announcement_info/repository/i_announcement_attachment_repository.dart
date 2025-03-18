import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IAnnouncementAttachmentRepository {
  Future<Either<ApiFailure, File>> downloadFiles({
    required Attachment url,
  });

  Future<Either<ApiFailure, PermissionStatus>> downloadPermission();
}
