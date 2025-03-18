import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';

abstract class IComboDealRepository {
  Future<Either<ApiFailure, List<ComboDeal>>> getComboDealList({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required PriceComboDeal comboDealInfo,
  });

  Future<Either<ApiFailure, ComboDeal>> getComboDeal({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required PriceComboDeal comboDealInfo,
  });
}
