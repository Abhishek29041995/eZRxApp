import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IReOrderPermissionRepository {
  Future<Either<ApiFailure, List<ValidMaterial>>> getReorderPermission({
    required SalesOrganisation salesOrganisation,
    required List<MaterialNumber> materialNumbers,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  });

  Future<Either<ApiFailure, ValidMaterial>> getReorderItemPermission({
    required SalesOrganisation salesOrganisation,
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  });
}
