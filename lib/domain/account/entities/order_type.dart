import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type.freezed.dart';

@freezed
class OrderType with _$OrderType {
  const OrderType._();

  const factory OrderType({
    required DocumentType categoryId,
    required StringValue orderType,
    required int orderReason,
    required StringValue description,
    required bool enabled,
  }) = _OrderType;

  factory OrderType.empty() => OrderType(
        categoryId: DocumentType(''),
        orderType: StringValue(''),
        description: StringValue(''),
        orderReason: 0,
        enabled: false,
      );

  String get displayText {
    final suffix = [
      if (orderReason != 0) orderReason.toString(),
      if (description.getOrDefaultValue('').isNotEmpty)
        description.displayNAIfEmpty,
    ].join(' - ');

    // <Order Type> | <Reason code> - <Description>
    // <Reason code> - <Description> maybe be optional
    return orderType.displayNAIfEmpty + (suffix.isNotEmpty ? ' | $suffix' : '');
  }
}
