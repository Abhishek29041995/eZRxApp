import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_favourite_dto.freezed.dart';
part 'remove_favourite_dto.g.dart';

@freezed
class RemoveFavouriteDto with _$RemoveFavouriteDto {
  const RemoveFavouriteDto._();
  const factory RemoveFavouriteDto({
    @JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
        required int removeFavouriteMaterial,
  }) = _RemoveFavouriteDto;

  RemoveFavourite toDomain() {
    return RemoveFavourite(
      removeFavouriteMaterial: FavouriteResponse(removeFavouriteMaterial),
    );
  }

  factory RemoveFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$RemoveFavouriteDtoFromJson(json);
}
