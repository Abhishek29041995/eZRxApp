import 'dart:async';
import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/domain/order/entities/favourite_status.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/favourite_status_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/remove_favourite_dto.dart';
import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/add_favourite_dto.dart';
import 'package:flutter/services.dart';

class FavouriteLocalDataSource {
  final _favoriteStatusDataController =
      StreamController<MaterialInfo>.broadcast();

  FavouriteLocalDataSource();

  Future<AddFavourite> addFavouriteMaterial() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/add_favourite_material/addFavouriteMaterialResponse.json',
      ),
    );
    final finalData = data['data'];

    return AddFavouriteDto.fromJson(finalData).toDomain();
  }

  Future<RemoveFavourite> removeFavouriteMaterial() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/remove_favourite_material/removeFavouriteMaterialResponse.json',
      ),
    );
    final finalData = data['data'];

    return RemoveFavouriteDto.fromJson(finalData).toDomain();
  }

  Future<FavouriteStatus> getFavouriteStatus() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/fetchProductsFavouriteStatusResponse.json',
      ),
    );
    final finalData = data['data']['materialDetails'];

    return FavouriteStatusDto.fromJson(finalData).toDomain();
  }

  void notifyFavoriteStatusUpdated(
    MaterialNumber materialNumber,
    bool isFavorite,
  ) =>
      _favoriteStatusDataController.add(
        MaterialInfo.empty().copyWith(
          materialNumber: materialNumber,
          isFavourite: isFavorite,
        ),
      );

  Stream<MaterialInfo> get favoriteStatusData =>
      _favoriteStatusDataController.stream;
}
