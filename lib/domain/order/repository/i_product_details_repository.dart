import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IProductDetailRepository {
  Future<Either<ApiFailure, MaterialInfo>> getProductDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  });

  Future<Either<ApiFailure, List<MaterialInfo>>> getProductListDetail({
    required List<MaterialNumber> materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required List<MaterialInfoType> types,
  });

  Future<Map<MaterialNumber, MaterialInfo>> getBundleListDetail({
    required List<MaterialNumber> bundleCodes,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  });

  Future<Either<ApiFailure, MaterialInfo>> getMaterialDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  });

  Future<Either<ApiFailure, MaterialInfo>> getBundleDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
    required MaterialInfoType type,
  });

  Future<Either<ApiFailure, List<MaterialInfo>>> getSimilarProduct({
    required MaterialNumber materialNumber,
    required PrincipalCode principalCode,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Language language,
  });

  Future<Either<ApiFailure, ProductMetaData>> getProductsMetaData({
    required List<MaterialNumber> materialNumbers,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  });
}
