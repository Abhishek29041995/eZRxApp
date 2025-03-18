import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_by_order_request.freezed.dart';

@freezed
class InvoiceByOrderRequest with _$InvoiceByOrderRequest {
  const InvoiceByOrderRequest._();

  factory InvoiceByOrderRequest({
    required String customerCodeSoldTo,
    required String language,
    required int pageSize,
    required int offSet,
    required String orderNumber,
  }) = _InvoiceByOrderRequest;

  factory InvoiceByOrderRequest.empty() => InvoiceByOrderRequest(
        customerCodeSoldTo: '',
        language: '',
        pageSize: 0,
        offSet: 0,
        orderNumber: '',
      );
}
