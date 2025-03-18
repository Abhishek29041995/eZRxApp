import 'package:ezrxmobile/domain/order/entities/favourite_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_status_dto.freezed.dart';
part 'favourite_status_dto.g.dart';

@freezed
class FavouriteStatusDto with _$FavouriteStatusDto {
  const FavouriteStatusDto._();

  factory FavouriteStatusDto({
    @JsonKey(name: 'isFavourite', defaultValue: false)
        required bool isFavourite,
  }) = _FavouriteStatusDto;

  factory FavouriteStatusDto.fromJson(Map<String, dynamic> json) =>
      _$FavouriteStatusDtoFromJson(json);

  FavouriteStatus toDomain() => FavouriteStatus(isFavourite: isFavourite);
}
