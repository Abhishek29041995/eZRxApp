import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_payment_term_dto.freezed.dart';
part 'order_history_details_payment_term_dto.g.dart';

@freezed
class OrderHistoryDetailsPaymentTermDto
    with _$OrderHistoryDetailsPaymentTermDto {
  const OrderHistoryDetailsPaymentTermDto._();
  const factory OrderHistoryDetailsPaymentTermDto({
    @JsonKey(name: 'paymentTermCode', defaultValue: '')
        required String paymentTermCode,
    @JsonKey(name: 'paymentTermDescription', defaultValue: '')
        required String paymentTermDescription,
  }) = _OrderHistoryDetailsPaymentTermDto;
  factory OrderHistoryDetailsPaymentTermDto.fromDomain(
    OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
  ) {
    return OrderHistoryDetailsPaymentTermDto(
      paymentTermCode:
          orderHistoryDetailsPaymentTerm.paymentTermCode.displayPaymentTermCode,
      paymentTermDescription: orderHistoryDetailsPaymentTerm
          .paymentTermDescription.displayPaymentTermDescription,
    );
  }

  OrderHistoryDetailsPaymentTerm toDomain() {
    return OrderHistoryDetailsPaymentTerm(
      paymentTermCode: PaymentTermCode(paymentTermCode),
      paymentTermDescription: PaymentTermDescription(paymentTermDescription),
    );
  }

  factory OrderHistoryDetailsPaymentTermDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderHistoryDetailsPaymentTermDtoFromJson(json);
}
