import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_message_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_response_dto.freezed.dart';
part 'submit_order_response_dto.g.dart';

@freezed
class SubmitOrderResponseDto with _$SubmitOrderResponseDto {
  const SubmitOrderResponseDto._();

  const factory SubmitOrderResponseDto({
    @JsonKey(name: 'SalesDocument', defaultValue: '')
        required String salesDocument,
    @JsonKey(name: 'SalesDocuments', defaultValue: <String>[])
        required List<String> salesDocuments,
    @JsonKey(name: 'Messages', defaultValue: <SubmitOrderResponseMessageDto>[])
        required List<SubmitOrderResponseMessageDto> messages,
  }) = _SubmitOrderResponseDto;

  SubmitOrderResponse toDomain() {
    return SubmitOrderResponse(
      salesDocument: salesDocument,
      messages: messages.map((e) => e.toDomain()).toList(),
      salesDocuments: salesDocuments,
    );
  }

  factory SubmitOrderResponseDto.fromDomain(
    SubmitOrderResponse submitOrderResponse,
  ) {
    return SubmitOrderResponseDto(
      salesDocument: submitOrderResponse.salesDocument,
      salesDocuments: submitOrderResponse.salesDocuments,
      messages: submitOrderResponse.messages
          .map((e) => SubmitOrderResponseMessageDto.fromDomain(e))
          .toList(),
    );
  }

  factory SubmitOrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderResponseDtoFromJson(json);
}
