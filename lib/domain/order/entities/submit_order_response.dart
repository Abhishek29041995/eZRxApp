import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_response.freezed.dart';

@freezed
class SubmitOrderResponse with _$SubmitOrderResponse {
  const SubmitOrderResponse._();
  const factory SubmitOrderResponse({
    required String salesDocument,
    required List<String> salesDocuments,
    required List<SubmitOrderResponseMessage> messages,
  }) = _SubmitOrderResponse;

  factory SubmitOrderResponse.empty() => const SubmitOrderResponse(
        salesDocument: '',
        salesDocuments: <String>[],
        messages: <SubmitOrderResponseMessage>[],
      );
}
