import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_customer.freezed.dart';

@freezed
class SubmitOrderCustomer with _$SubmitOrderCustomer {
  const SubmitOrderCustomer._();
  const factory SubmitOrderCustomer({
    required String customerNumber,
    required String customerNumberShipTo,
    required String salesOrganisation,
    required String division,
  }) = _SubmitOrderCustomer;

  factory SubmitOrderCustomer.empty() => const SubmitOrderCustomer(
        customerNumber: '',
        customerNumberShipTo: '',
        salesOrganisation: '',
        division: '',
      );
}
