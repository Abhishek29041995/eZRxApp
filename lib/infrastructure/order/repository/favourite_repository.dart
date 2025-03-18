import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_remote.dart';

class FavouriteRepository implements IFavouriteRepository {
  final Config config;
  final FavouriteLocalDataSource favouriteLocalDataSource;
  final FavouriteRemoteDataSource favouriteRemoteDataSource;

  FavouriteRepository({
    required this.config,
    required this.favouriteLocalDataSource,
    required this.favouriteRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List>> addToFavourites({
    required MaterialNumber materialNumber,
    required List list,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await favouriteLocalDataSource.addFavouriteMaterial();

        if (!response.addFavouriteMaterial.isSuccessful) return Right(list);

        final updatedList = List.from(list)
            .map(
              (element) => element.materialNumber == materialNumber
                  ? element.copyWith(isFavourite: true)
                  : element,
            )
            .toList();

        favouriteLocalDataSource.notifyFavoriteStatusUpdated(
          materialNumber,
          true,
        );

        return Right(updatedList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    } else {
      try {
        final response = await favouriteRemoteDataSource.addFavouriteMaterial(
          materialNumber: materialNumber.getOrCrash(),
        );

        if (!response.addFavouriteMaterial.isSuccessful) return Right(list);

        final updatedList = List.from(list)
            .map(
              (element) => element.materialNumber == materialNumber
                  ? element.copyWith(isFavourite: true)
                  : element,
            )
            .toList();

        favouriteLocalDataSource.notifyFavoriteStatusUpdated(
          materialNumber,
          true,
        );

        return Right(updatedList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
  }

  @override
  Future<Either<ApiFailure, List>> removeFromFavourites({
    required MaterialNumber materialNumber,
    required List list,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response =
            await favouriteLocalDataSource.removeFavouriteMaterial();

        if (!response.removeFavouriteMaterial.isSuccessful) return Right(list);

        final updatedList = List.from(list)
            .map(
              (element) => element.materialNumber == materialNumber
                  ? element.copyWith(isFavourite: false)
                  : element,
            )
            .toList();

        favouriteLocalDataSource.notifyFavoriteStatusUpdated(
          materialNumber,
          false,
        );

        return Right(updatedList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    } else {
      try {
        final response =
            await favouriteRemoteDataSource.removeFavouriteMaterial(
          materialNumber: materialNumber.getOrCrash(),
        );

        if (!response.removeFavouriteMaterial.isSuccessful) return Right(list);

        final updatedList = List.from(list)
            .map(
              (element) => element.materialNumber == materialNumber
                  ? element.copyWith(isFavourite: false)
                  : element,
            )
            .toList();

        favouriteLocalDataSource.notifyFavoriteStatusUpdated(
          materialNumber,
          false,
        );

        return Right(updatedList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
  }

  @override
  Stream<MaterialInfo> watchFavoriteStatus() =>
      favouriteLocalDataSource.favoriteStatusData;
}
