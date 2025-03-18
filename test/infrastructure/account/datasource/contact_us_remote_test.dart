import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ContactUsRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ContactUsRemoteDataSource(
        httpService: service,
        config: Config(),
        mutation: ContactUsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Contact Us Remote DataSource',
    () {
      test('submit success', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/submit_contact_us/submitContactUsResponse.json',
          ),
        );
        final variables = {
          'request': {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
            'sendToEmail': 'myezrx@zuelligpharma.com',
            'country': 'MY',
            'type': 'general',
          },
        };

        dioAdapter.onPost(
          '/api/sendEmail',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.mutation.submitQuery(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.submit(
          contactUsMap: {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
          },
          sendToEmail: 'myezrx@zuelligpharma.com',
          country: 'MY',
        );

        expect(
          result,
          isEqualsIgnoreCase(res, 'Message sent successfully.'),
        );
      });

      test('submit fail return null', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/submit_contact_us/submitContactUsResponse.json',
          ),
        );
        final variables = {
          'request': {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
            'sendToEmail': 'myezrx@zuelligpharma.com',
            'country': 'MY',
            'type': 'general',
          },
        };

        dioAdapter.onPost(
          '/api/sendEmail',
          (server) => server.reply(
            200,
            null,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.mutation.submitQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource.submit(
          contactUsMap: {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
          },
          sendToEmail: 'myezrx@zuelligpharma.com',
          country: 'MY',
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(
            isEqualsIgnoreCase(res, 'Message sent successfully.'),
          );
        });
      });

      test('submit fail return empty', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/submit_contact_us/submitContactUsResponse.json',
          ),
        );
        final variables = {
          'request': {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
            'sendToEmail': 'myezrx@zuelligpharma.com',
            'country': 'MY',
            'type': 'general',
          },
        };

        dioAdapter.onPost(
          '/api/sendEmail',
          (server) => server.reply(
            200,
            '',
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.mutation.submitQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource.submit(
          contactUsMap: {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
          },
          sendToEmail: 'myezrx@zuelligpharma.com',
          country: 'MY',
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(
            isEqualsIgnoreCase(res, 'Message sent successfully.'),
          );
        });
      });

      test('submit fail return status code != 200', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/submit_contact_us/submitContactUsResponse.json',
          ),
        );
        final variables = {
          'request': {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
            'sendToEmail': 'myezrx@zuelligpharma.com',
            'country': 'MY',
            'type': 'general',
          },
        };

        dioAdapter.onPost(
          '/api/sendEmail',
          (server) => server.reply(
            201,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.mutation.submitQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource.submit(
          contactUsMap: {
            'name': 'fake_user',
            'contactNumber': 'fake_contactNumber',
            'email': 'fake_email',
            'message': 'fake_message',
          },
          sendToEmail: 'myezrx@zuelligpharma.com',
          country: 'MY',
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(
            isEqualsIgnoreCase(res, 'Message sent successfully.'),
          );
        });
      });
    },
  );
}
