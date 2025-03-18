import 'package:ezrxmobile/domain/order/entities/invoice_by_order_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_by_order_request_dto.freezed.dart';
part 'invoice_by_order_request_dto.g.dart';

@freezed
class InvoiceByOrderRequestDto with _$InvoiceByOrderRequestDto {
  const InvoiceByOrderRequestDto._();

  const factory InvoiceByOrderRequestDto({
    @JsonKey(name: 'soldTo', defaultValue: '') required String soldTo,
    @JsonKey(name: 'first', defaultValue: 0) required int pageSize,
    @JsonKey(name: 'after', defaultValue: 0) required int offset,
    @JsonKey(name: 'language', defaultValue: '') required String language,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
  }) = _InvoiceByOrderRequestDto;

  factory InvoiceByOrderRequestDto.fromDomain(
    InvoiceByOrderRequest invoiceByOrderRequest,
  ) =>
      InvoiceByOrderRequestDto(
        soldTo: invoiceByOrderRequest.customerCodeSoldTo,
        pageSize: invoiceByOrderRequest.pageSize,
        offset: invoiceByOrderRequest.offSet,
        language: invoiceByOrderRequest.language,
        orderNumber: invoiceByOrderRequest.orderNumber,
      );

  factory InvoiceByOrderRequestDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceByOrderRequestDtoFromJson(json);

  Map<String, dynamic> toMapJson() => toJson()
    ..removeWhere(
      (key, value) => ((value is String && value.isEmpty) ||
          (value is List<String> && value.isEmpty)),
    );
}
