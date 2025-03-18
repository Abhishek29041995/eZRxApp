import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

abstract class IProductSearchRepository {
  Future<Either<ApiFailure, MaterialResponse>> searchProductList({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SearchKey searchKey,
    required int pageSize,
    required int offset,
    required MaterialFilter materialFilter,
    required User user,
  });

  Future<Either<ApiFailure, ProductSuggestionHistory>> getSearchKeys();

  Future<Either<ApiFailure, void>> saveSearchHistory(SearchKey searchKey);

  Future<Either<ApiFailure, void>> clearSearchHistory();

  Future<Either<ApiFailure, MaterialInfo>> getScanProduct({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Ean eanNumber,
    required SalesOrganisationConfigs salesOrgConfig,
    required User user,
    required MaterialFilter materialFilter,
  });
}
