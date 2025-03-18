import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_response_message_dto.freezed.dart';
part 'submit_order_response_message_dto.g.dart';

@freezed
class SubmitOrderResponseMessageDto with _$SubmitOrderResponseMessageDto {
  const SubmitOrderResponseMessageDto._();

  const factory SubmitOrderResponseMessageDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Message', defaultValue: '') required String message,
  }) = _SubmitOrderResponseMessageDto;

  SubmitOrderResponseMessage toDomain() {
    return SubmitOrderResponseMessage(
      type: type,
      message: message,
    );
  }

  factory SubmitOrderResponseMessageDto.fromDomain(
    SubmitOrderResponseMessage submitOrderResponse,
  ) {
    return SubmitOrderResponseMessageDto(
      type: submitOrderResponse.type,
      message: submitOrderResponse.message,
    );
  }

  factory SubmitOrderResponseMessageDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderResponseMessageDtoFromJson(json);
}
