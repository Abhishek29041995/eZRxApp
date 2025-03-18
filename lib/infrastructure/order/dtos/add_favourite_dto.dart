import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_favourite_dto.freezed.dart';
part 'add_favourite_dto.g.dart';

@freezed
class AddFavouriteDto with _$AddFavouriteDto {
  const AddFavouriteDto._();
  const factory AddFavouriteDto({
    @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
        required int addFavouriteMaterial,
  }) = _AddFavouriteDto;

  AddFavourite toDomain() {
    return AddFavourite(
      addFavouriteMaterial: FavouriteResponse(addFavouriteMaterial),
    );
  }

  factory AddFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$AddFavouriteDtoFromJson(json);
}
