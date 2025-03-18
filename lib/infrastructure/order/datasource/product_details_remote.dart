import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';

class ProductDetailRemoteDataSource {
  HttpService httpService;
  ProductDetailQuery productDetailQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  ProductDetailRemoteDataSource({
    required this.httpService,
    required this.productDetailQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });
  Future<MaterialInfo> getProductDetails({
    required String materialNumber,
    required String language,
    required String salesOrg,
    required String customerCode,
    required String shipToCode,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = productDetailQuery.getMaterialDetails(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
        remoteConfigService.enableProductTypeFilter,
      );

      final variables = {
        'materialNumber': materialNumber,
        'language': language,
        'salesOrg': salesOrg,
        'customerCode': customerCode,
        'shipToCode': shipToCode,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);
      final finalData = res.data['data']['materialDetails'];

      return ProductDetailDto.fromJson(finalData).toDomain();
    });
  }

  Future<List<MaterialInfo>> getSimilarProduct({
    required String materialNumber,
    required String language,
    required String customerCode,
    required String shipToCode,
    required String principalCode,
    required String salesOrg,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = productDetailQuery.getSimilarProductQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'request': {
          'Customer': customerCode,
          'SalesOrg': salesOrg,
          'ShipTo': shipToCode,
          'First': 4,
          'After': 0,
          'OrderByName': 'asc',
          'Language': language,
          'principalCodeList': principalCode,
          'excludeMaterialNumber': materialNumber,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);
      final finalData = makeResponseCamelCase(
        jsonEncode(res.data['data']['GetAllProducts']['Products']),
      );

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<ProductMetaData> getProductsMetaData({
    required List<String> materialIDs,
    required String salesOrg,
    required String customerCode,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': productDetailQuery.getProductMetaData(),
          'variables': {
            'request': {
              'materialID': materialIDs,
              'customerCode': customerCode,
              'salesOrg': salesOrg,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);

    final data = res.data['data']['getProduct'];

    return ProductMetaDataDto.fromJson(data).toDomain;
  }
}
