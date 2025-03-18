import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IReturnListRepository {
  Future<Either<ApiFailure, List<ReturnItem>>> fetchReturnListByItem({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  });

  Future<Either<ApiFailure, List<ReturnItem>>> fetchReturnListByRequest({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  });

  Future<Either<ApiFailure, PermissionStatus>> getDownloadPermission();

  Future<Either<ApiFailure, String>> getFileUrl({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrg salesOrg,
    required bool isViewByReturn,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  });

  Future<Either<ApiFailure, File>> downloadFile({
    required String url,
  });
}
