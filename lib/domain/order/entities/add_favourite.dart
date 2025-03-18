import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_favourite.freezed.dart';

@freezed
class AddFavourite with _$AddFavourite {
  const AddFavourite._();

  const factory AddFavourite({
    required FavouriteResponse addFavouriteMaterial,
  }) = _AddFavourite;
}
