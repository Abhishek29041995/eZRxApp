import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../integration_test/core/test_locator.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class ReturnItemMock extends Mock implements ReturnItem {}

void main() {
  late ReturnListRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio();
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: const UrlRequestMatcher(),
  );
  final service = HttpService.mockDio(dio);
  late RemoteConfigServiceMock remoteConfigServiceMock;
  late DataSourceExceptionHandler dataSourceExceptionHandler;
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  final fakeRequestParam = {
    'fake-request-param': 'fake-request-param',
  };
  const fakeUrl = 'https://fake-url.com/file';

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      remoteConfigServiceMock = RemoteConfigServiceMock();
      locator.registerLazySingleton(() => remoteConfigServiceMock);

      dataSourceExceptionHandler = DataSourceExceptionHandler();
      when(() => remoteConfigServiceMock.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = ReturnListRemoteDataSource(
        httpService: service,
        queryMutation: ReturnQuery(),
        dataSourceExceptionHandler: dataSourceExceptionHandler,
        config: Config(),
        remoteConfigService: remoteConfigServiceMock,
      );
    },
  );

  group('Return List Remote Test', () {
    test(
      'fetchReturnByItems success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_return_by_item/getReturnByItemsResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByItems(
              fakeConfigValue,
            ),
            'variables': {
              'request': fakeRequestParam,
            },
          }),
        );

        final result = await remoteDataSource.fetchReturnByItems(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          List<Map<String, dynamic>>.from(
            res['data']['requestsByItems']['returnRequestsByItems'],
          )
              .map(
                (returnRequestsByItem) => List<Map<String, dynamic>>.from(
                  returnRequestsByItem['requestByItems'],
                )
                    .map(
                      (requestByItem) =>
                          ReturnItemDto.fromJson(requestByItem).toDomain(),
                    )
                    .toList(),
              )
              .toList()
              .expand((element) => element)
              .toList(),
        );
      },
    );

    test(
      'fetchReturnByItems failure',
      () async {
        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByItems(
              fakeConfigValue,
            ),
            'variables': {
              'request': fakeRequestParam,
            },
          }),
        );

        await remoteDataSource
            .fetchReturnByItems(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([]);
        });
      },
    );

    test(
      'fetchReturnByRequest success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_return_by_request/getReturnByRequestResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByRequest(
              fakeConfigValue,
            ),
            'variables': {
              'requestsByUserRequest': fakeRequestParam,
            },
          }),
        );

        final result = await remoteDataSource.fetchReturnByRequest(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          List<Map<String, dynamic>>.from(
            res['data']['requestsByUserV3']['returnRequests'],
          ).map((e) => ReturnItemDto.fromJson(e).toDomain()).toList(),
        );
      },
    );

    test(
      'fetchReturnByRequest failure',
      () async {
        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByRequest(
              fakeConfigValue,
            ),
            'variables': {
              'requestsByUserRequest': fakeRequestParam,
            },
          }),
        );
        await remoteDataSource
            .fetchReturnByRequest(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([]);
        });
      },
    );

    test(
      'getFileUrl success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/request_by_items_excel/requestsByItemsExcelResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByItemsExcel(),
            'variables': {
              'input': fakeRequestParam,
            },
          }),
        );

        final result = await remoteDataSource.getFileUrl(
          salesOrg: fakeSalesOrg.getOrCrash(),
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          res['data']['requestsByItemsExcel']['url'],
        );
      },
    );

    test(
      'getFileUrl failure',
      () async {
        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getRequestsByItemsExcel(),
            'variables': {
              'input': fakeRequestParam,
            },
          }),
        );

        await remoteDataSource
            .getFileUrl(
          salesOrg: fakeSalesOrg.getOrCrash(),
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value('');
        });
      },
    );

    test(
      'downloadFile success',
      () async {
        final bytes = await rootBundle.load(
          'assets/svg/pdf_icon.svg',
        );
        final res = bytes.buffer.asUint8List();

        dioAdapter.onGet(
          fakeUrl,
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
        );

        final result = await remoteDataSource.downloadFile(url: fakeUrl);

        expect(
          result,
          AttachmentFileBuffer(
            name: Uri.parse(fakeUrl).pathSegments.last,
            buffer: res,
          ),
        );
      },
    );

    test(
      'downloadFile failure',
      () async {
        final bytes = await rootBundle.load(
          'assets/svg/pdf_icon.svg',
        );
        final res = bytes.buffer.asUint8List();

        dioAdapter.onGet(
          fakeUrl,
          (server) => server.reply(
            204,
            res,
            delay: const Duration(seconds: 1),
          ),
        );

        await remoteDataSource
            .downloadFile(url: fakeUrl)
            .onError((error, _) async {
          expect(error, isA<DioException>());
          return Future.value(AttachmentFileBuffer.empty());
        });
      },
    );
  });
}
