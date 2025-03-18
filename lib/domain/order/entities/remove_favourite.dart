import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_favourite.freezed.dart';

@freezed
class RemoveFavourite with _$RemoveFavourite {
  const RemoveFavourite._();

  const factory RemoveFavourite({
    required FavouriteResponse removeFavouriteMaterial,
  }) = _RemoveFavourite;
}
