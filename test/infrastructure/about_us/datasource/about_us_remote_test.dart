// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_remote.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ez_point_token_response_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AboutUsMock extends Mock implements AboutUs {}

void main() {
  late AboutUsRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  const country = 'SG';
  const fakeItemId = 'fake-item-id';
  const fakeLang = 'fake-lang';
  const fakeUrl = 'fake-url';
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AboutUsRemoteDataSource(
        httpService: service,
        queryMutation: AboutUsQueryMutation(),
        exceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'AboutUsRemoteDataSource',
    () {
      test('Get About Us Static Info Success', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/market_static_content/about_us/aboutUs${country}marketStaticContent.json',
          ),
        );
        final variables = {
          'itemId': fakeItemId,
          'lang': fakeLang,
        };

        dioAdapter.onPost(
          fakeUrl,
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getAboutUsQuery(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getAboutUsInfo(
          aboutUsUrlPath: fakeUrl,
          itemId: fakeItemId,
          lang: fakeLang,
        );

        final finalData =
            res['data']?['item']?['components'] as Map<String, dynamic>?;

        expect(
          result,
          AboutUsDto.fromJson(finalData ?? {}).toDomain(),
        );
      });

      test('Get About Us Static Info Failed', () async {
        final variables = {
          'itemId': fakeItemId,
          'lang': fakeLang,
        };

        dioAdapter.onPost(
          fakeUrl,
          (server) => server.reply(
            200,
            {'data': {}},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getAboutUsQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getAboutUsInfo(
          aboutUsUrlPath: fakeUrl,
          itemId: fakeItemId,
          lang: fakeLang,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(AboutUsMock());
        });
      });
    },
  );
}
