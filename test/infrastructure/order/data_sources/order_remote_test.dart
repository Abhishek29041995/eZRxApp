import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_customer_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late OrderRemoteDataSource remoteDataSource;

  late Encryption encryption;

  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.my-ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = OrderRemoteDataSource(
        httpService: service,
        queryMutation: OrderQueryMutation(),
        exceptionHandler: DataSourceExceptionHandler(),
      );

      encryption = Encryption();
    },
  );

  group(
    'Order Remote',
    () {
      ///Todo: revisit
      test(
        'Submit Order',
        () async {
          const submitOrder = SubmitOrderDto(
            userName: '',
            companyName: '',
            customer: SubmitOrderCustomerDto(
              customerNumber: '',
              customerNumberShipTo: '',
              division: '',
              salesOrganisation: '',
            ),
            poReference: '',
            materials: [],
            poDate: '',
            totalTax: 0,
            requestedDeliveryDate: '',
            specialInstructions: '',
            telephone: '',
            referenceNotes: '',
            paymentTerms: '',
            collectiveNumber: '',
            blockOrder: false,
            poDocuments: [],
            orderValue: 0,
            language: '',
            paymentMethod: '',
            purchaseOrderType: '',
            orderReason: '',
          );
          final encryptedData = encryption.encryptionData(
            data: submitOrder.toJson(),
            secretKey: locator<Config>().orderEncryptionSecret,
          );
          final variables = {
            'NewOrderInput': {
              'data': encryptedData.data,
              'hash': encryptedData.hash,
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/submit_order/submitOrderResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/order',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.submitOrder(true),
              'variables': variables,
            }),
          );
          final result = await remoteDataSource.submitOrder(
            orderEncryption: encryptedData,
            enableMarketPlace: true,
          );

          expect(
            result,
            SubmitOrderResponseDto.fromJson(res['data']['submitOrder'])
                .toDomain(),
          );
        },
      );
      test(
        'Submit Order when sales Document and Sales Documents both are empty',
        () async {
          const submitOrder = SubmitOrderDto(
            userName: '',
            companyName: '',
            customer: SubmitOrderCustomerDto(
              customerNumber: '',
              customerNumberShipTo: '',
              division: '',
              salesOrganisation: '',
            ),
            poReference: '',
            materials: [],
            poDate: '',
            totalTax: 0,
            requestedDeliveryDate: '',
            specialInstructions: '',
            telephone: '',
            referenceNotes: '',
            paymentTerms: '',
            collectiveNumber: '',
            blockOrder: false,
            poDocuments: [],
            orderValue: 0,
            language: '',
            paymentMethod: '',
            purchaseOrderType: '',
            orderReason: '',
          );
          final encryptedData = encryption.encryptionData(
            data: submitOrder.toJson(),
            secretKey: locator<Config>().orderEncryptionSecret,
          );
          final variables = {
            'NewOrderInput': {
              'data': encryptedData.data,
              'hash': encryptedData.hash,
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/submit_order/submitOrderResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/order',
            (server) => server.reply(
              200,
              {
                'data': {
                  'submitOrder': {
                    'SalesDocument': '',
                    'SalesDocuments': [],
                    'Messages': [
                      {
                        'Type': 'S',
                        'Message': 'EZRX-b628ca8',
                      }
                    ],
                  },
                },
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.submitOrder(true),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .submitOrder(
            orderEncryption: encryptedData,
            enableMarketPlace: true,
          )
              .onError((e, _) async {
            expect(e, isA<OtherException>());
            return SubmitOrderResponseDto.fromJson(res['data']['submitOrder'])
                .toDomain();
          });
        },
      );

      test(
        'Submit Order status != 200',
        () async {
          const submitOrder = SubmitOrderDto(
            userName: '',
            companyName: '',
            customer: SubmitOrderCustomerDto(
              customerNumber: '',
              customerNumberShipTo: '',
              division: '',
              salesOrganisation: '',
            ),
            poReference: '',
            materials: [],
            poDate: '',
            totalTax: 0,
            requestedDeliveryDate: '',
            specialInstructions: '',
            telephone: '',
            referenceNotes: '',
            paymentTerms: '',
            collectiveNumber: '',
            blockOrder: false,
            poDocuments: [],
            orderValue: 0,
            language: '',
            paymentMethod: '',
            purchaseOrderType: '',
            orderReason: '',
          );
          final encryptedData = encryption.encryptionData(
            data: submitOrder.toJson(),
            secretKey: locator<Config>().orderEncryptionSecret,
          );
          final variables = {
            'NewOrderInput': {
              'data': encryptedData.data,
              'hash': encryptedData.hash,
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/submit_order/submitOrderResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/order',
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
              'query': remoteDataSource.queryMutation.submitOrder(true),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .submitOrder(
            orderEncryption: encryptedData,
            enableMarketPlace: true,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              SubmitOrderResponseDto.fromJson(res['data']['submitOrder'])
                  .toDomain(),
            );
          });
        },
      );
      test(
        'Submit Order with error',
        () async {
          const submitOrder = SubmitOrderDto(
            userName: '',
            companyName: '',
            customer: SubmitOrderCustomerDto(
              customerNumber: '',
              customerNumberShipTo: '',
              division: '',
              salesOrganisation: '',
            ),
            poReference: '',
            materials: [],
            poDate: '',
            totalTax: 0,
            requestedDeliveryDate: '',
            specialInstructions: '',
            telephone: '',
            referenceNotes: '',
            paymentTerms: '',
            collectiveNumber: '',
            blockOrder: false,
            poDocuments: [],
            orderValue: 0,
            language: '',
            paymentMethod: '',
            purchaseOrderType: '',
            orderReason: '',
          );
          final encryptedData = encryption.encryptionData(
            data: submitOrder.toJson(),
            secretKey: locator<Config>().orderEncryptionSecret,
          );
          final variables = {
            'NewOrderInput': {
              'data': encryptedData.data,
              'hash': encryptedData.hash,
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/submit_order/submitOrderResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/order',
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
              'query': remoteDataSource.queryMutation.submitOrder(true),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .submitOrder(
            orderEncryption: encryptedData,
            enableMarketPlace: true,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              SubmitOrderResponseDto.fromJson(res['data']['submitOrder'])
                  .toDomain(),
            );
          });
        },
      );
    },
  );
}
