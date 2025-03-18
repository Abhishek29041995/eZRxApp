import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';

abstract class IMaterialBundleListRepository {
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialBundleList({
    required User user,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required SalesOrganisation salesOrganisation,
  });
}
