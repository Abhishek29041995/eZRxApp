import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_invoice_dto.freezed.dart';
part 'transaction_invoice_dto.g.dart';

@freezed
class TransactionInvoiceDto with _$TransactionInvoiceDto {
  const TransactionInvoiceDto._();

  const factory TransactionInvoiceDto({
    @JsonKey(name: 'documentDate', defaultValue: '')
        required String documentDate,
    @JsonKey(name: 'documentNo', defaultValue: '') required String documentNo,
    @JsonKey(name: 'documentType', defaultValue: '')
        required String documentType,
    @JsonKey(name: 'amount', defaultValue: 0.0) required double amount,
  }) = _TransactionInvoiceDto;

  PaymentItem toDomain() {
    return PaymentItem.empty().copyWith(
      postingKeyName: 'Invoice',
      searchKey: documentNo,
      documentDate: DateTimeStringValue(documentDate),
      paymentAmountInDisplayCrcy: amount,
    );
  }

  factory TransactionInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionInvoiceDtoFromJson(json);
}
