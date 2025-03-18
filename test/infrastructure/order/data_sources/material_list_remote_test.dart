import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late MaterialListRemoteDataSource remoteDataSource;
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  const fakeEnableProductTypeFilter = true;
  const pageSize = 24;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      when(() => remoteConfigService.enableProductTypeFilter)
          .thenReturn(fakeEnableProductTypeFilter);
      remoteDataSource = MaterialListRemoteDataSource(
        httpService: service,
        config: Config(),
        materialListQuery: ProductsQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group('Get Product List - ', () {
    test('Success', () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake-customer-code',
          'First': pageSize,
          'Language': 'fake-language',
          'OrderByName': '',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'isGimmick': false,
          'SearchKey': '',
          'fromAddBonus': true,
          'isMarketPlace': true,
          'isTender': true,
          'isCovid': false,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getProductList(
        isGimmickMaterial: false,
        isFavourite: false,
        type: '',
        isProductOffer: false,
        isCovidSelected: false,
        orderByName: '',
        orderByPrice: '',
        manufactureList: <String>[],
        countryListCode: <String>[],
        principalCode: '',
        language: 'fake-language',
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        searchKey: '',
        salesDeal: [],
        isComboOffers: false,
        showSampleItem: true,
        market: fakeMarket,
        isMarketPlace: true,
        isTender: true,
        isPoisonMaterial: false,
        isSampleMaterial: false,
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
      expect(
        result,
        MaterialResponseDto.fromJson(finalData).toDomain(),
      );
    });
    test('exclude frommAddBonus and IsMarketPlace when they are false',
        () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake-customer-code',
          'First': pageSize,
          'Language': 'fake-language',
          'OrderByName': '',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'isGimmick': false,
          'SearchKey': '',
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getProductList(
        isGimmickMaterial: false,
        isFavourite: false,
        type: 'material',
        isProductOffer: false,
        isCovidSelected: false,
        orderByName: '',
        orderByPrice: '',
        manufactureList: <String>[],
        countryListCode: <String>[],
        principalCode: '',
        language: 'fake-language',
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        searchKey: '',
        salesDeal: [],
        isComboOffers: false,
        showSampleItem: false,
        market: fakeMarket,
        isMarketPlace: false,
        isTender: false,
        isPoisonMaterial: false,
        isSampleMaterial: false,
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
      expect(
        result,
        MaterialResponseDto.fromJson(finalData).toDomain(),
      );
    });
    test('all entity is present', () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake-customer-code',
          'First': pageSize,
          'Language': 'fake-language',
          'OrderByName': 'fake_order_by_name',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'isGimmick': false,
          'SearchKey': '',
          'IsFavourite': true,
          'Type': 'material',
          'isOffer': true,
          'orderByPrice': 'fake_order_by_price',
          'Manufactured': ['fake_manufacture'],
          'principalCode': 'fake_principal_code',
          'CountryCode': ['fake_country_list_code'],
          'salesDeal': true,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getProductList(
        isGimmickMaterial: false,
        isFavourite: true,
        type: 'material',
        isProductOffer: true,
        isCovidSelected: false,
        orderByName: 'fake_order_by_name',
        orderByPrice: 'fake_order_by_price',
        manufactureList: <String>['fake_manufacture'],
        countryListCode: <String>['fake_country_list_code'],
        principalCode: 'fake_principal_code',
        language: 'fake-language',
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        searchKey: '',
        salesDeal: [],
        isComboOffers: true,
        showSampleItem: false,
        market: fakeMarket,
        isMarketPlace: false,
        isTender: false,
        isPoisonMaterial: false,
        isSampleMaterial: false,
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
      expect(
        result,
        MaterialResponseDto.fromJson(finalData).toDomain(),
      );
    });
    test('statuscode not equal to 200', () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake-customer-code',
          'First': pageSize,
          'Language': 'fake-language',
          'OrderByName': '',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'isGimmick': false,
          'SearchKey': '',
          'fromAddBonus': true,
          'isMarketPlace': true,
          'isTender': true,
          'isCovid': false,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );
      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          201,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getProductList(
        isGimmickMaterial: false,
        isFavourite: true,
        type: 'material',
        isProductOffer: true,
        isCovidSelected: false,
        orderByName: 'fake_order_by_name',
        orderByPrice: 'fake_order_by_price',
        manufactureList: <String>['fake_manufacture'],
        countryListCode: <String>['fake_country_list_code'],
        principalCode: 'fake_principal_code',
        language: 'fake-language',
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        searchKey: '',
        salesDeal: [],
        isComboOffers: true,
        showSampleItem: false,
        market: fakeMarket,
        isMarketPlace: false,
        isTender: false,
        isPoisonMaterial: false,
        isSampleMaterial: false,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialResponseDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetAllProducts']),
            ),
          ).toDomain(),
        );
      });
    });
    test('with error', () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake-customer-code',
          'First': pageSize,
          'Language': 'fake-language',
          'OrderByName': '',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'isGimmick': false,
          'SearchKey': '',
          'fromAddBonus': true,
          'isMarketPlace': true,
          'isTender': true,
          'isCovid': false,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getProductList(
        isGimmickMaterial: false,
        isFavourite: true,
        type: 'material',
        isProductOffer: true,
        isCovidSelected: false,
        orderByName: 'fake_order_by_name',
        orderByPrice: 'fake_order_by_price',
        manufactureList: <String>['fake_manufacture'],
        countryListCode: <String>['fake_country_list_code'],
        principalCode: 'fake_principal_code',
        language: 'fake-language',
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        searchKey: '',
        salesDeal: [],
        isComboOffers: true,
        showSampleItem: false,
        market: fakeMarket,
        isMarketPlace: false,
        isTender: false,
        isPoisonMaterial: false,
        isSampleMaterial: false,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialResponseDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetAllProducts']),
            ),
          ).toDomain(),
        );
      });
    });
  });

  group('Get Product Details-', () {
    test('Success', () async {
      final variables = {
        'request': {
          'Code': 'fake_code',
          'Customer': 'fake-customer-code',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'Type': 'bundle',
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_product_details/getProductDetailsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getProductDetails(
        customerCode: 'fake-customer-code',
        salesOrg: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        type: 'bundle',
        code: 'fake_code',
        language: 'en',
        market: fakeMarket,
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetProductDetails']));
      expect(
        result,
        MaterialDto.fromJson(finalData).toDomain(),
      );
    });
    test('status code != 200', () async {
      final variables = {
        'request': {
          'Code': 'fake_code',
          'Customer': 'fake-customer-code',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'Type': 'bundle',
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_product_details/getProductDetailsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          201,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductDetailsQuery(fakeConfigValue),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getProductDetails(
        customerCode: 'fake-customer-code',
        salesOrg: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        type: 'bundle',
        code: 'fake_code',
        language: 'en',
        market: fakeMarket,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetProductDetails']),
            ),
          ).toDomain(),
        );
      });
    });
    test('with error', () async {
      final variables = {
        'request': {
          'Code': 'fake_code',
          'Customer': 'fake-customer-code',
          'SalesOrg': 'fake-sales-org',
          'ShipTo': 'fake-shipto-code',
          'Type': 'bundle',
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_product_details/getProductDetailsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductDetailsQuery(fakeConfigValue),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getProductDetails(
        customerCode: 'fake-customer-code',
        salesOrg: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        type: 'bundle',
        code: 'fake_code',
        language: 'en',
        market: fakeMarket,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetProductDetails']),
            ),
          ).toDomain(),
        );
      });
    });
  });

  group('Combo deal material list with principal-', () {
    test('get successfully', () async {
      final variables = {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': pageSize,
        'Language': 'fake-language',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'principalCodeList': ['fake-principal-code'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_combo_deal_for_principalK5/getComboDealDetailForPrincipalK5Response.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getComboDealMaterialsPrincipalCode(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        principalCodeList: ['fake-principal-code'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        language: 'fake-language',
        market: fakeMarket,
      );
      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));

      expect(
        result,
        MaterialResponseDto.fromJson(finalData).toDomain(),
      );
    });
    test('statuscode not equal to 200', () async {
      final variables = {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': pageSize,
        'Language': 'fake-language',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'principalCodeList': ['fake-principal-code'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_combo_deal_for_principalK5/getComboDealDetailForPrincipalK5Response.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          201,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));

      await remoteDataSource
          .getComboDealMaterialsPrincipalCode(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        principalCodeList: ['fake-principal-code'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        language: 'fake-language',
        market: fakeMarket,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(MaterialResponseDto.fromJson(finalData).toDomain());
      });
    });
    test('get failure', () async {
      final variables = {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': pageSize,
        'Language': 'fake-language',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'principalCodeList': ['fake-principal-code'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_combo_deal_for_principalK5/getComboDealDetailForPrincipalK5Response.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));

      await remoteDataSource
          .getComboDealMaterialsPrincipalCode(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: pageSize,
        principalCodeList: ['fake-principal-code'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        language: 'fake-language',
        market: fakeMarket,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(MaterialResponseDto.fromJson(finalData).toDomain());
      });
    });
  });

  group('Get Searched Material List-', () {
    test('success state', () async {
      final variables = {
        'request': {
          'After': 0,
          'Customer': 'fake_customer_code',
          'First': pageSize,
          'Language': 'EN',
          'OrderByName': 'asc',
          'SalesOrg': 'fake_sales_orgCode',
          'ShipTo': 'fake_ship-to_code',
          'isGimmick': false,
          'SearchKey': 'fake_search_key',
          'isFOCMaterial': false,
          'ean': 'fake_ean_number',
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );
      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getSearchedMaterialList(
        customerCode: 'fake_customer_code',
        shipToCode: 'fake_ship_to_code',
        salesOrgCode: 'fake_sales_org',
        pageSize: pageSize,
        offset: 0,
        gimmickMaterial: false,
        language: 'EN',
        searchKey: 'fake_search_key',
        eanNumber: 'fake_ean_number',
        isCovidSelected: null,
        market: 'MY',
      );

      return expect(
        result,
        MaterialResponseDto.fromJson(
          makeResponseCamelCase(
            jsonEncode(res['data']['GetAllProducts']),
          ),
        ).toDomain(),
      );
    });
    test('statuscode not equal to 200', () async {
      final variables = {
        'request': {
          'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
          'customerSoldToCode': 'fake_customer_code',
          'customerShipToCode': 'fake_ship_to_code',
          'salesOrganisation': 'fake_sales_org',
          'cached': false,
          'invalidateCache': false,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          201,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getSearchedMaterialList(
        customerCode: 'fake_customer_code',
        shipToCode: 'fake_ship_to_code',
        salesOrgCode: 'fake_sales_org',
        pageSize: pageSize,
        offset: 0,
        gimmickMaterial: false,
        language: 'EN',
        searchKey: 'fake_search_key',
        eanNumber: 'fake_ean_number',
        isCovidSelected: null,
        market: 'MY',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialResponseDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetAllProducts']),
            ),
          ).toDomain(),
        );
      });
    });
    test('with error', () async {
      final variables = {
        'request': {
          'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
          'customerSoldToCode': 'fake_customer_code',
          'customerShipToCode': 'fake_ship_to_code',
          'salesOrganisation': 'fake_sales_org',
          'cached': false,
          'invalidateCache': false,
        },
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_all_products/getAllProductsResponse.json',
        ),
      );
      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue, fakeEnableProductTypeFilter),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getSearchedMaterialList(
        customerCode: 'fake_customer_code',
        shipToCode: 'fake_ship_to_code',
        salesOrgCode: 'fake_sales_org',
        pageSize: pageSize,
        offset: 0,
        gimmickMaterial: false,
        language: 'EN',
        searchKey: 'fake_search_key',
        eanNumber: 'fake_ean_number',
        isCovidSelected: null,
        market: 'MY',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(
          MaterialResponseDto.fromJson(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetAllProducts']),
            ),
          ).toDomain(),
        );
      });
    });
  });
}
