import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_objects;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_basic_info.freezed.dart';

@freezed
class OrderHistoryBasicInfo with _$OrderHistoryBasicInfo {
  const OrderHistoryBasicInfo._();
  factory OrderHistoryBasicInfo({
    required String soldTo,
    required String shipTo,
    required value_objects.CompanyName companyName,
    required PaymentTerm paymentTerm,
  }) = _OrderHistoryBasicInfo;

  factory OrderHistoryBasicInfo.empty() => OrderHistoryBasicInfo(
        soldTo: '',
        shipTo: '',
        companyName: value_objects.CompanyName(''),
        paymentTerm: PaymentTerm.empty(),
      );
}
