import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_status.freezed.dart';

@freezed
class FavouriteStatus with _$FavouriteStatus {
  const FavouriteStatus._();

  const factory FavouriteStatus({
    required bool isFavourite,
  }) = _FavouriteStatus;

  factory FavouriteStatus.empty() => const FavouriteStatus(
        isFavourite: false,
      );
}
