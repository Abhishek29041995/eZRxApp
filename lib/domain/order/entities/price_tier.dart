import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_tier.freezed.dart';

@freezed
class PriceTier with _$PriceTier {
  const PriceTier._();

  const factory PriceTier({
    required List<PriceTierItem> items,
  }) = _PriceTier;

  factory PriceTier.empty() => const PriceTier(
        items: [],
      );
}

@freezed
class PriceTierItem with _$PriceTierItem {
  const PriceTierItem._();

  const factory PriceTierItem({
    required String type,
    required bool applyBonus,
    required int sequence,
    required int quantity,
    required double rate,
    required double percentage,
    required double minAmount,
    required ScaleBasis scaleBasis,
    required double promotionAmount, 
  }) = _PriceTierItem;

  factory PriceTierItem.empty() => PriceTierItem(
        type: '',
        applyBonus: false,
        sequence: 0,
        quantity: 0,
        rate: 0,
        percentage: 0,
        minAmount: 0,
        scaleBasis: ScaleBasis(''),
        promotionAmount:0,
      );
}
