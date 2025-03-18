import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_customer_dto.freezed.dart';
part 'submit_order_customer_dto.g.dart';

@freezed
class SubmitOrderCustomerDto with _$SubmitOrderCustomerDto {
  const SubmitOrderCustomerDto._();

  const factory SubmitOrderCustomerDto({
    @JsonKey(name: 'customerNumber', defaultValue: '')
        required String customerNumber,
    @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
        required String customerNumberShipTo,
    @JsonKey(name: 'salesOrganisation', defaultValue: '')
        required String salesOrganisation,
    @JsonKey(name: 'division', defaultValue: '') required String division,
  }) = _SubmitOrderCustomerDto;

  SubmitOrderCustomer toDomain() {
    return SubmitOrderCustomer(
      customerNumber: customerNumber,
      customerNumberShipTo: customerNumberShipTo,
      salesOrganisation: salesOrganisation,
      division: division,
    );
  }

  factory SubmitOrderCustomerDto.fromDomain(
    SubmitOrderCustomer submitOrderCustomer,
  ) {
    return SubmitOrderCustomerDto(
      customerNumber: submitOrderCustomer.customerNumber,
      customerNumberShipTo: submitOrderCustomer.customerNumberShipTo,
      salesOrganisation: submitOrderCustomer.salesOrganisation,
      division: submitOrderCustomer.division,
    );
  }

  factory SubmitOrderCustomerDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderCustomerDtoFromJson(json);
}
