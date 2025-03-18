import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_data.freezed.dart';

@freezed
class InvoiceData with _$InvoiceData {
  const InvoiceData._();

  const factory InvoiceData({
    required OrderNumber orderNumber,
    required StringValue invoiceNumber,
    required StringValue lineNumber,
  }) = _InvoiceData;

  factory InvoiceData.empty() => InvoiceData(
        orderNumber: OrderNumber(''),
        invoiceNumber: StringValue(''),
        lineNumber: StringValue(''),
      );

  bool get invoiceNumberIsEmpty => !invoiceNumber.isValid();

  StringValue get hashId => StringValue(
        '${orderNumber.value.getOrElse(() => '')}${lineNumber.value.getOrElse(() => '')}',
      );
}
