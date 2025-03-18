import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/add_favourite_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/favourite_status_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/remove_favourite_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = FavouriteLocalDataSource();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
  group(
    'Favourite Local DataSource',
    () {
      test(
        'Add Favourite Material',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/add_favourite_material/addFavouriteMaterialResponse.json',
            ),
          );

          final result = await localDataSource.addFavouriteMaterial();

          expect(
            result,
            AddFavouriteDto.fromJson(res['data']).toDomain(),
          );
        },
      );

      test(
        'Remove Favourite Material',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/remove_favourite_material/removeFavouriteMaterialResponse.json',
            ),
          );

          final result = await localDataSource.removeFavouriteMaterial();

          expect(
            result,
            RemoveFavouriteDto.fromJson(res['data']).toDomain(),
          );
        },
      );
      test(
        'Get Favourite Status',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/fetchProductsFavouriteStatusResponse.json',
            ),
          );

          final result = await localDataSource.getFavouriteStatus();

          expect(
            result,
            FavouriteStatusDto.fromJson(res['data']['materialDetails'])
                .toDomain(),
          );
        },
      );

      test(
        'Get Favourite Status',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/common/fetchProductsFavouriteStatusResponse.json',
            ),
          );

          final result = await localDataSource.getFavouriteStatus();

          expect(
            result,
            FavouriteStatusDto.fromJson(res['data']['materialDetails'])
                .toDomain(),
          );
        },
      );

      test('notifyFavoriteStatusUpdated', () async {
        // Listen to the stream before the action
        final materialInfoList = <MaterialInfo>[];
        final subscription = localDataSource.favoriteStatusData.listen(
          (materialInfo) {
            materialInfoList.add(materialInfo);
          },
        );

        // Trigger the API status update
        localDataSource.notifyFavoriteStatusUpdated(
          MaterialNumber('fake_material_number'),
          true,
        );

        // Allow some time for the stream to emit
        await Future.delayed(const Duration(milliseconds: 100));

        // Assert that the stream emitted the correct value
        expect(materialInfoList, [
          MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake_material_number'),
            isFavourite: true,
          ),
        ]);

        // Cancel the subscription to prevent memory leaks
        await subscription.cancel();
      });
    },
  );
}
