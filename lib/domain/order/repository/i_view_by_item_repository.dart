import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IViewByItemRepository {
  Future<Either<ApiFailure, OrderHistory>> getViewByItems({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  });
  Future<Either<ApiFailure, OrderHistory>> getViewByItemDetails({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required User user,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  });

  Future<Either<ApiFailure, Map<StringValue, InvoiceData>>>
      getOrdersInvoiceData({
    required List<OrderNumber> orderNumbers,
  });

  Future<Either<ApiFailure, InvoiceDetailResponse>> getInvoiceDetailsForOrder({
    required OrderNumber orderNumber,
    required CustomerCodeInfo customerCodeInfo,
    required Language language,
    required int offset,
  });
}
