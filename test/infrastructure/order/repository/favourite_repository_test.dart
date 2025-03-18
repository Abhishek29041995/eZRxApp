import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConfigMock extends Mock implements Config {}

class FavouriteLocalDataSourceMock extends Mock
    implements FavouriteLocalDataSource {}

class FavouriteRemoteDataSourceMock extends Mock
    implements FavouriteRemoteDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FavouriteRepository repository;
  late Config configMock;
  late FavouriteLocalDataSource localDataSourceMock;
  late FavouriteRemoteDataSource remoteDataSourceMock;
  late List<MaterialInfo> materialListMock;

  late MaterialNumber nonFavouriteMaterialMock;
  late MaterialNumber favouriteMaterialMock;

  final errorMock = Exception('fake-error');

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = FavouriteLocalDataSourceMock();
      remoteDataSourceMock = FavouriteRemoteDataSourceMock();
      final localProductList =
          (await MaterialListLocalDataSource().getProductList()).products;
      materialListMock = [
        localProductList.first,
        localProductList[1].copyWith(
          isFavourite: true,
        ),
      ];
      nonFavouriteMaterialMock = materialListMock.first.materialNumber;
      favouriteMaterialMock = materialListMock[1].materialNumber;
      repository = FavouriteRepository(
        config: configMock,
        favouriteLocalDataSource: localDataSourceMock,
        favouriteRemoteDataSource: remoteDataSourceMock,
      );
    },
  );

  group(
    'Test Favourite Repository',
    () {
      test(
        'Add to favourite success locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.notifyFavoriteStatusUpdated(
              nonFavouriteMaterialMock,
              true,
            ),
          ).thenAnswer((_) {});
          when(() => localDataSourceMock.addFavouriteMaterial()).thenAnswer(
            (_) async => AddFavourite(
              addFavouriteMaterial: FavouriteResponse(1),
            ),
          );
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          final expectResult = materialListMock.map(
            (e) => (e.materialNumber == nonFavouriteMaterialMock)
                ? e.copyWith(isFavourite: true)
                : e,
          );
          expect(result.getOrElse(() => []), expectResult);
        },
      );

      test(
        'Add to favourite not success locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.addFavouriteMaterial()).thenAnswer(
            (_) async => AddFavourite(
              addFavouriteMaterial: FavouriteResponse(0),
            ),
          );
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), materialListMock);
        },
      );

      test(
        'Add to favourite failure locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.addFavouriteMaterial()).thenThrow(
            errorMock,
          );
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Add to favourite success remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addFavouriteMaterial(
              materialNumber: nonFavouriteMaterialMock.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => AddFavourite(
              addFavouriteMaterial: FavouriteResponse(1),
            ),
          );
          when(
            () => localDataSourceMock.notifyFavoriteStatusUpdated(
              nonFavouriteMaterialMock,
              true,
            ),
          ).thenAnswer((_) {});
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          final expectResult = materialListMock.map(
            (e) => (e.materialNumber == nonFavouriteMaterialMock)
                ? e.copyWith(isFavourite: true)
                : e,
          );
          expect(result.getOrElse(() => []), expectResult);
        },
      );

      test(
        'Add to favourite not success remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addFavouriteMaterial(
              materialNumber: nonFavouriteMaterialMock.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => AddFavourite(
              addFavouriteMaterial: FavouriteResponse(0),
            ),
          );
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), materialListMock);
        },
      );

      test(
        'Add to favourite failure remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addFavouriteMaterial(
              materialNumber: nonFavouriteMaterialMock.getOrCrash(),
            ),
          ).thenThrow(
            errorMock,
          );
          final result = await repository.addToFavourites(
            materialNumber: nonFavouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Remove from favourite success locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.removeFavouriteMaterial()).thenAnswer(
            (_) async => RemoveFavourite(
              removeFavouriteMaterial: FavouriteResponse(1),
            ),
          );
          when(
            () => localDataSourceMock.notifyFavoriteStatusUpdated(
              favouriteMaterialMock,
              false,
            ),
          ).thenAnswer((_) {});
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          final expectResult = materialListMock.map(
            (e) => (e.materialNumber == favouriteMaterialMock)
                ? e.copyWith(isFavourite: false)
                : e,
          );
          expect(result.getOrElse(() => []), expectResult);
        },
      );

      test(
        'Remove from favourite not success locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.removeFavouriteMaterial()).thenAnswer(
            (_) async => RemoveFavourite(
              removeFavouriteMaterial: FavouriteResponse(0),
            ),
          );
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), materialListMock);
        },
      );

      test(
        'Remove from favourite failure locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.removeFavouriteMaterial()).thenThrow(
            errorMock,
          );
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Remove from favourite success remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.removeFavouriteMaterial(
              materialNumber: favouriteMaterialMock.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => RemoveFavourite(
              removeFavouriteMaterial: FavouriteResponse(1),
            ),
          );
          when(
            () => localDataSourceMock.notifyFavoriteStatusUpdated(
              favouriteMaterialMock,
              false,
            ),
          ).thenAnswer((_) {});
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          final expectResult = materialListMock.map(
            (e) => (e.materialNumber == favouriteMaterialMock)
                ? e.copyWith(isFavourite: false)
                : e,
          );
          expect(result.getOrElse(() => []), expectResult);
        },
      );

      test(
        'Remove from favourite not success remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.removeFavouriteMaterial(
              materialNumber: favouriteMaterialMock.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => RemoveFavourite(
              removeFavouriteMaterial: FavouriteResponse(0),
            ),
          );
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), materialListMock);
        },
      );

      test(
        'Remove from favourite failure remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.removeFavouriteMaterial(
              materialNumber: favouriteMaterialMock.getOrCrash(),
            ),
          ).thenThrow(
            errorMock,
          );
          final result = await repository.removeFromFavourites(
            materialNumber: favouriteMaterialMock,
            list: materialListMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'get watchFavoriteStatus',
        () async {
          final stream = Stream<MaterialInfo>.fromIterable([]);
          when(
            () => localDataSourceMock.favoriteStatusData,
          ).thenAnswer((_) => stream);
          final result = repository.watchFavoriteStatus();
          expect(result, stream);
        },
      );
    },
  );
}
