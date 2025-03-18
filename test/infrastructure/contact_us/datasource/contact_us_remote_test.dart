import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/contact_us/dtos/contact_us_details_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ContactUsDetailsMock extends Mock implements ContactUsDetails {}

void main() {
  late ContactUsDetailsRemoteDataSource remoteDataSource;
  late Config config;
  final fakeUser = User.empty();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  config = Config()..appFlavor = Flavor.uat;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = ContactUsDetailsRemoteDataSource(
      queryMutation: ContactUsQuery(),
      httpService: service,
      exceptionHandler: DataSourceExceptionHandler(),
    );
  });

  group('Contact Us Details Remote DataSource test', () {
    final variables = {
      'itemId': 'fake-id',
      'lang': fakeUser.preferredLanguage.locale.languageCode,
    };
    test('Get Contact Us Details ', () async {
      final infoRes = json.decode(
        await rootBundle
            .loadString('assets/json/contact_us/contactUsDetailsResponse.json'),
      );

      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          200,
          infoRes,
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json charset=utf-8',
          'X-GQL-Token': 'fake-token',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getContactUsQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        contactUsId: 'fake-id',
        token: 'fake-token',
      );

      expect(
        result,
        ContactUsDetailsDto.fromJson(infoRes['data']['item']).toDomain,
      );
    });
    test('statuscode not equal to 200', () async {
      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          205,
          {'data': []},
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-GQL-Token': 'fake-token',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getContactUsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        contactUsId: 'fake-id',
        token: 'fake-token',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(ContactUsDetailsMock());
      });
    });

    test('response with error', () async {
      dioAdapter.onPost(
        '/api/announcement',
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
        headers: {
          'Content-Type': 'application/json charset=utf-8',
          'X-GQL-Token': 'fake-token',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getContactUsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        contactUsId: 'fake-id',
        token: 'fake-token',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(ContactUsDetailsMock());
      });
    });
    test('response with others error', () async {
      dioAdapter.onPost(
        '/api/announcement',
        (other) => other.reply(
          200,
          {
            'data': {'search': null},
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json charset=utf-8',
          'X-GQL-Token': 'fake-token',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getContactUsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        contactUsId: 'fake-id',
        token: 'fake-token',
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value(ContactUsDetailsMock());
      });
    });
  });
}
