import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_customer_information.freezed.dart';

@freezed
class PaymentCustomerInformation with _$PaymentCustomerInformation {
  const PaymentCustomerInformation._();

  const factory PaymentCustomerInformation({
    required String paymentTerm,
    required List<ShipToInfo> shipToInfoList,
    required List<BillToInfo> billToInfo,
  }) = _PaymentCustomerInformation;

  factory PaymentCustomerInformation.empty() =>
       const PaymentCustomerInformation(
        paymentTerm: '',
        billToInfo: <BillToInfo>[],
        shipToInfoList: <ShipToInfo>[],
      );
}
