import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_response_message.freezed.dart';

@freezed
class SubmitOrderResponseMessage with _$SubmitOrderResponseMessage {
  const SubmitOrderResponseMessage._();
  const factory SubmitOrderResponseMessage({
    required String type,
    required String message,
  }) = _SubmitOrderResponseMessage;

  factory SubmitOrderResponseMessage.empty() =>
      const SubmitOrderResponseMessage(
        type: '',
        message: '',
      );
}
