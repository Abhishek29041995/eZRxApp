import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

abstract class IViewByOrderRepository {
  Future<Either<ApiFailure, ViewByOrder>> getViewByOrders({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required User user,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String sort,
    required SearchKey searchKey,
    required ViewByOrdersFilter viewByOrdersFilter,
    required ViewByOrder viewByOrder,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool isDetailsPage,
  });
}
