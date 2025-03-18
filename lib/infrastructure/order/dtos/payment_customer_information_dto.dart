import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bill_to_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ship_to_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_customer_information_dto.freezed.dart';
part 'payment_customer_information_dto.g.dart';

@freezed
class PaymentCustomerInformationDto with _$PaymentCustomerInformationDto {
  const PaymentCustomerInformationDto._();
  const factory PaymentCustomerInformationDto({
    @JsonKey(name: 'paymentTerm') required String paymentTerm,
    @JsonKey(name: 'shipTo') required List<ShipToDto> shipToDtoList,
    @JsonKey(name: 'billTo') required List<BillToDto> billToDto,
  }) = _PaymentCustomerInformationDto;

  factory PaymentCustomerInformationDto.fromDomain(
    PaymentCustomerInformation paymentCustomerInformation,
  ) {
    return PaymentCustomerInformationDto(
      paymentTerm: paymentCustomerInformation.paymentTerm,
      shipToDtoList: paymentCustomerInformation.shipToInfoList
          .map((e) => ShipToDto.fromDomain(e))
          .toList(),
      billToDto: paymentCustomerInformation.billToInfo
          .map((e) => BillToDto.fromDomain(e))
          .toList(),
    );
  }

  PaymentCustomerInformation toDomain() {
    return PaymentCustomerInformation(
      paymentTerm: paymentTerm,
      shipToInfoList: shipToDtoList.map((e) => e.toDomain()).toList(),
      billToInfo: billToDto.map((e) => e.toDomain()).toList(),
    );
  }

  factory PaymentCustomerInformationDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentCustomerInformationDtoFromJson(json);
}
