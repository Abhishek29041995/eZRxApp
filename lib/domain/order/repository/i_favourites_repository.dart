import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IFavouriteRepository {
  Future<Either<ApiFailure, List>> addToFavourites({
    required MaterialNumber materialNumber,
    required List list,
  });

  Future<Either<ApiFailure, List>> removeFromFavourites({
    required MaterialNumber materialNumber,
    required List list,
  });

  Stream<MaterialInfo> watchFavoriteStatus();
}
