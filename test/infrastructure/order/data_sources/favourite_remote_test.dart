import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/add_favourite_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/favourite_status_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/remove_favourite_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late FavouriteRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = FavouriteRemoteDataSource(
        httpService: service,
        config: Config(),
        favouriteMutation: FavouriteMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Favourite Remote DataSource',
    () {
      group('Add Favourite Material-', () {
        test('success state', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/add_favourite_material/addFavouriteMaterialResponse.json',
            ),
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
              'query':
                  remoteDataSource.favouriteMutation.addFavouriteMutation(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.addFavouriteMaterial(
            materialNumber: 'fake_material_number',
          );
          final finalData = res['data'];

          expect(result, AddFavouriteDto.fromJson(finalData).toDomain());
        });

        test('statuscode not equal to 200', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/add_favourite_material/addFavouriteMaterialResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.addFavouriteMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .addFavouriteMaterial(
            materialNumber: 'fake_material_number',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              AddFavouriteDto.fromJson(res['data']).toDomain(),
            );
          });
        });

        test('with error', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/add_favourite_material/addFavouriteMaterialResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.addFavouriteMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .addFavouriteMaterial(
            materialNumber: 'fake_material_number',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              AddFavouriteDto.fromJson(res['data']).toDomain(),
            );
          });
        });
      });
      group('Remove Favourite Material-', () {
        test('success state', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/remove_favourite_material/removeFavouriteMaterialResponse.json',
            ),
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
              'query':
                  remoteDataSource.favouriteMutation.removeFavouriteMutation(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.removeFavouriteMaterial(
            materialNumber: 'fake_material_number',
          );
          final finalData = res['data'];

          expect(result, RemoveFavouriteDto.fromJson(finalData).toDomain());
        });

        test('statuscode not equal to 200', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/remove_favourite_material/removeFavouriteMaterialResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.removeFavouriteMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .removeFavouriteMaterial(
            materialNumber: 'fake_material_number',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              RemoveFavouriteDto.fromJson(res['data']).toDomain(),
            );
          });
        });

        test('with error', () async {
          final variables = {'materialNumber': 'fake_material_number'};
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/remove_favourite_material/removeFavouriteMaterialResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.removeFavouriteMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .removeFavouriteMaterial(
            materialNumber: 'fake_material_number',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              RemoveFavouriteDto.fromJson(res['data']).toDomain(),
            );
          });
        });
      });
      group('Get Favourite Status-', () {
        test('success state', () async {
          final variables = {
            'materialNumber': 'fake_material_number',
            'language': 'EN',
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/fetchProductsFavouriteStatusResponse.json',
            ),
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
              'query':
                  remoteDataSource.favouriteMutation.favouriteStatusQuery(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getFavouriteStatus(
            materialNumber: 'fake_material_number',
            language: 'EN',
          );
          final finalData = res['data']['materialDetails'];

          expect(result, FavouriteStatusDto.fromJson(finalData).toDomain());
        });

        test('statuscode not equal to 200', () async {
          final variables = {
            'materialNumber': 'fake_material_number',
            'language': 'EN',
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/fetchProductsFavouriteStatusResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.favouriteStatusQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getFavouriteStatus(
            materialNumber: 'fake_material_number',
            language: 'EN',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              FavouriteStatusDto.fromJson(res['data']['materialDetails'])
                  .toDomain(),
            );
          });
        });

        test('with error', () async {
          final variables = {
            'materialNumber': 'fake_material_number',
            'language': 'EN',
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/fetchProductsFavouriteStatusResponse.json',
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
              'query':
                  remoteDataSource.favouriteMutation.favouriteStatusQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getFavouriteStatus(
            materialNumber: 'fake_material_number',
            language: 'EN',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              FavouriteStatusDto.fromJson(res['data']['materialDetails'])
                  .toDomain(),
            );
          });
        });
      });
    },
  );
}
