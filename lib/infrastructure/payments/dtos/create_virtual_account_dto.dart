import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_invoice_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_virtual_account_dto.freezed.dart';
part 'create_virtual_account_dto.g.dart';

@freezed
class CreateVirtualAccountDto with _$CreateVirtualAccountDto {
  const CreateVirtualAccountDto._();

  const factory CreateVirtualAccountDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'invoices', defaultValue: [])
    required List<TransactionInvoiceDto> invoices,
    @JsonKey(name: 'amountPayable', defaultValue: 0.0)
    required double amountPayable,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'paymentDetails') required PaymentDetailsDto paymentDetails,
    @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
    required String paymentMethodDisplay,
    @JsonKey(
      name: 'createdOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate,
    )
    required String createdOn,
    @JsonKey(
      name: 'paidOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate,
    )
    required String paidOn,
  }) = _CreateVirtualAccountDto;

  CreateVirtualAccount toDomain() => CreateVirtualAccount(
        id: id,
        amountPayable: amountPayable,
        createdOn: DateTimeStringValue(createdOn),
        paidOn: DateTimeStringValue(paidOn),
        status: status,
        paymentMethodDisplay: StringValue(paymentMethodDisplay),
        invoices: invoices.map((e) => e.toDomain()).toList(),
        paymentDetails: paymentDetails.toDomain(),
      );

  factory CreateVirtualAccountDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualAccountDtoFromJson(json);
}
