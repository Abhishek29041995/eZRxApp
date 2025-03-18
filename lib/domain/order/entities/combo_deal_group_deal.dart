import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_group_deal.freezed.dart';

@freezed
class ComboDealGroupDeal with _$ComboDealGroupDeal {
  const ComboDealGroupDeal._();

  const factory ComboDealGroupDeal({
    required double minTotalAmount,
    required double maxTotalAmount,
    required int minTotalQuantity,
    required double rate,
    required DiscountType type,
    required String conditionNumber,
  }) = _ComboDealGroupDeal;

  factory ComboDealGroupDeal.empty() => ComboDealGroupDeal(
        minTotalAmount: 0,
        maxTotalAmount: 0,
        minTotalQuantity: 0,
        rate: 0,
        type: DiscountType(''),
        conditionNumber: '',
      );

  DiscountInfo get discountInfo => DiscountInfo(
        type: type,
        rate: rate,
        minQty: minTotalQuantity,
      );
}
