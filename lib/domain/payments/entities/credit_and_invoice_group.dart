import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_group.freezed.dart';

@freezed
class CreditAndInvoiceGroup with _$CreditAndInvoiceGroup {
  factory CreditAndInvoiceGroup({
    required DateTimeStringValue dueDate,
    required List<CreditAndInvoiceItem> items,
  }) = _CreditAndInvoiceGroup;

  factory CreditAndInvoiceGroup.empty() => CreditAndInvoiceGroup(
        dueDate: DateTimeStringValue(''),
        items: <CreditAndInvoiceItem>[],
      );
}
