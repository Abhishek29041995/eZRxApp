import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'invoice_data_dto.freezed.dart';
part 'invoice_data_dto.g.dart';

@freezed
class InvoiceDataDto with _$InvoiceDataDto {
  const InvoiceDataDto._();
  const factory InvoiceDataDto({
    @JsonKey(name: 'orderId', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'invoice', defaultValue: '') required String invoiceNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
  }) = _InvoiceDataDto;

  factory InvoiceDataDto.fromDomain(InvoiceData invoiceData) {
    return InvoiceDataDto(
      orderNumber: invoiceData.orderNumber.getOrDefaultValue(''),
      invoiceNumber: invoiceData.invoiceNumber.getOrDefaultValue(''),
      lineNumber: invoiceData.lineNumber.getOrDefaultValue(''),
    );
  }

  InvoiceData toDomain() {
    return InvoiceData(
      orderNumber: OrderNumber(orderNumber),
      invoiceNumber: StringValue(invoiceNumber),
      lineNumber: StringValue(lineNumber),
    );
  }

  factory InvoiceDataDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataDtoFromJson(json);
}
