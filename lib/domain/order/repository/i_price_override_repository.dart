import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/order/entities/price.dart';

abstract class IPriceOverrideRepository {
  Future<Either<ApiFailure, Price>> updateItemPrice({
    required PriceAggregate item,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  });
}
