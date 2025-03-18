import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/setting_tc_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class UserMock extends Mock implements User {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late UserRemoteDataSource remoteDataSource;
  late String userId;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  final remoteConfigService = RemoteConfigServiceMock();

  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = UserRemoteDataSource(
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        userQueryMutation: UserQueryMutation(),
        config: locator.get<Config>(),
        remoteConfigService: remoteConfigService,
      );
      userId = '3860';
    },
  );

  group('User remote', () {
    test(
      'Get user',
      () async {
        when(() => remoteConfigService.passUserId).thenReturn(true);

        final res = json.decode(
          await rootBundle.loadString('assets/json/user/userResponse.json'),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation
                .getUserQuery(fakeConfigValue, true),
            'variables': {'id': userId},
          }),
        );
        final result = await remoteDataSource.getUser(
          userId: userId,
          market: fakeMarket,
        );
        final resTest = UserDto.fromJson(res['data']['user']).toDomain();
        expect(result.fullName, resTest.fullName);
        expect(result.privacyControl, resTest.privacyControl);
      },
    );
    test(
      'Get user server exception',
      () async {
        when(() => remoteConfigService.passUserId).thenReturn(false);

        dioAdapter.onPost(
          '/api/strapiEngine',
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
            'query': remoteDataSource.userQueryMutation
                .getUserQuery(fakeConfigValue, false),
          }),
        );
        await remoteDataSource
            .getUser(
          userId: userId,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(User.empty());
        });
      },
    );
    test(
      'Status code != 200',
      () async {
        when(() => remoteConfigService.passUserId).thenReturn(true);

        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            201,
            {
              'data': null,
              'errors': null,
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation
                .getUserQuery(fakeConfigValue, true),
            'variables': {'id': userId},
          }),
        );
        await remoteDataSource
            .getUser(
          userId: userId,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(User.empty());
        });
      },
    );
    // test(
    //   'Status code = 404',
    //   () async {
    //     dioAdapter.onPost(
    //       '/api/strapiEngine',
    //       (server) => server.reply(
    //         404,
    //         {
    //           'data': null,
    //           'errors': null,
    //         },
    //         delay: const Duration(seconds: 1),
    //       ),
    //       headers: {'Content-Type': 'application/json; charset=utf-8'},
    //       data: jsonEncode({
    //         'query': remoteDataSource.userQueryMutation.getUserQuery(),
    //         'variables': {'id': userId},
    //       }),
    //     );
    //     await remoteDataSource
    //         .getUser(userId: userId)
    //         .onError((error, _) async {
    //       expect(error, isA<UserException>userNotFound() );
    //       return Future.value(User.empty());
    //     });
    //   },
    // );

    test(
      'update TC',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/tnc_date/tncdateUpdateResponse.json'),
        );
        final data = {
          'isAcceptTC': true,
        };

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updatePrivacyPolicy(),
            'variables': data,
          }),
        );
        final result = await remoteDataSource.updateUserTC();
        final resTest = SettingTcDto.fromJson(res['data']).toDomain();
        expect(result.acceptTC, resTest.acceptTC);
      },
    );
    test(
      'get announcement',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/tnc_date/tncdateUpdateResponse.json'),
        );

        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.getAnnouncementsQuery(),
          }),
        );
      },
    );
  });

  group('Update User MarketPlace TnC -', () {
    const value = 10;

    test(
      'success',
      () async {
        final response = json.decode(
          await rootBundle
              .loadString('assets/json/tnc_date/tncdateUpdateResponse.json'),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            200,
            response,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation
                .updateMarketPlaceTnCAcceptance(),
            'variables': {'isAcceptMPTC': value},
          }),
        );
        final result = await remoteDataSource.updateUserMarketPlaceTC(value);
        final resTest = SettingTcDto.fromJson(response['data']).toDomain();
        expect(result, resTest);
      },
    );

    test(
      'server exception',
      () async {
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
            'query': remoteDataSource.userQueryMutation
                .updateMarketPlaceTnCAcceptance(),
            'variables': {'isAcceptMPTC': value},
          }),
        );
        await remoteDataSource
            .updateUserMarketPlaceTC(value)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(SettingTc.empty());
        });
      },
    );

    test(
      'Status code != 200',
      () async {
        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            201,
            {
              'data': null,
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation
                .updateMarketPlaceTnCAcceptance(),
            'variables': {'isAcceptMPTC': value},
          }),
        );
        await remoteDataSource
            .updateUserMarketPlaceTC(value)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(SettingTc.empty());
        });
      },
    );
  });

  group('Update user selected order type -', () {
    test(
      'success',
      () async {
        final response = json.decode(
          await rootBundle.loadString(
            'assets/json/update_selected_order_type/updateSelectedOrderTypeResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(200, response),
          data: jsonEncode({
            'query':
                remoteDataSource.userQueryMutation.updateSelectedOrderType(),
            'variables': {'orderType': 'zpor'},
          }),
        );
        final result =
            await remoteDataSource.updateSelectedOrderType(value: 'zpor');
        final resTest =
            DocumentType(response['data']['updateSelectedOrderType'] as String);
        expect(result, resTest);
      },
    );

    test(
      'server exception',
      () async {
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
          ),
          data: jsonEncode({
            'query':
                remoteDataSource.userQueryMutation.updateSelectedOrderType(),
            'variables': {'orderType': 'zpor'},
          }),
        );
        await remoteDataSource
            .updateSelectedOrderType(value: 'zpor')
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(DocumentType(''));
        });
      },
    );

    test(
      'Status code != 200',
      () async {
        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(201, {'data': null}),
          data: jsonEncode({
            'query':
                remoteDataSource.userQueryMutation.updateSelectedOrderType(),
            'variables': {'orderType': 'zpor'},
          }),
        );
        await remoteDataSource
            .updateSelectedOrderType(value: 'zpor')
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(DocumentType(''));
        });
      },
    );
  });

  group('Update privacy control -', () {
    test(
      'success',
      () async {
        final response = json.decode(
          await rootBundle.loadString(
            'assets/json/common/updatePrivacyControlResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(200, response),
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updatePrivacyControl(),
            'variables': {
              'input': {
                'privacyControls': {
                  'automatedPersonalisation': true,
                  'viaEmails': true,
                  'viaPushNotification': true,
                  'viaSMS': true,
                },
              },
            },
          }),
        );
        final result = await remoteDataSource.updatePrivacyControl(
          automatedPersonalisation: true,
          viaEmails: true,
          viaPushNotification: true,
          viaSMS: true,
        );
        expect(result, true);
      },
    );

    test(
      'server exception',
      () async {
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
          ),
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updatePrivacyControl(),
            'variables': {
              'input': {
                'privacyControls': {
                  'automatedPersonalisation': true,
                  'viaEmails': true,
                  'viaPushNotification': true,
                  'viaSMS': true,
                },
              },
            },
          }),
        );
        await remoteDataSource
            .updatePrivacyControl(
          automatedPersonalisation: true,
          viaEmails: true,
          viaPushNotification: true,
          viaSMS: true,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(true);
        });
      },
    );

    test(
      'Status code != 200',
      () async {
        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(201, {'data': null}),
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updatePrivacyControl(),
            'variables': {
              'input': {
                'privacyControls': {
                  'automatedPersonalisation': true,
                  'viaEmails': true,
                  'viaPushNotification': true,
                  'viaSMS': true,
                },
              },
            },
          }),
        );
        await remoteDataSource
            .updatePrivacyControl(
          automatedPersonalisation: true,
          viaEmails: true,
          viaPushNotification: true,
          viaSMS: true,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(true);
        });
      },
    );
  });
}
