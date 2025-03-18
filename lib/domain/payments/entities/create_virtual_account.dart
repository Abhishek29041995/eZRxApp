import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_virtual_account.freezed.dart';

@freezed
class CreateVirtualAccount with _$CreateVirtualAccount {
  const CreateVirtualAccount._();

  const factory CreateVirtualAccount({
    required String id,
    required List<PaymentItem> invoices,
    required double amountPayable,
    required String status,
    required PaymentDetails paymentDetails,
    required StringValue paymentMethodDisplay,
    required DateTimeStringValue createdOn,
    required DateTimeStringValue paidOn,
  }) = _CreateVirtualAccount;

  factory CreateVirtualAccount.empty() =>  CreateVirtualAccount(
        amountPayable: 0.0,
        id: '',
        status: '',
        paymentMethodDisplay: StringValue(''),
        createdOn: DateTimeStringValue(''),
        invoices: <PaymentItem>[],
        paidOn: DateTimeStringValue(''),
        paymentDetails: PaymentDetails.empty(),

      );
}
