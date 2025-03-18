import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bundle.freezed.dart';

@freezed
class PriceBundle with _$PriceBundle {
  const PriceBundle._();
  const factory PriceBundle({
    required String name,
    required String code,
    required String conditions,
    required bool bonusEligible,
    required List<PriceBundleItem> information,
  }) = _PriceBundle;
}

@freezed
class PriceBundleItem with _$PriceBundleItem {
  const PriceBundleItem._();
  const factory PriceBundleItem({
    required String type,
    required int sequence,
    required int quantity,
    required double rate,
  }) = _PriceBundleItem;
}
