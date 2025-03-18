import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_objects;
import 'package:ezrxmobile/infrastructure/order/dtos/payment_term_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_basic_info_dto.freezed.dart';
part 'order_history_basic_info_dto.g.dart';

@freezed
class OrderHistoryBasicInfoDto with _$OrderHistoryBasicInfoDto {
  const OrderHistoryBasicInfoDto._();
  const factory OrderHistoryBasicInfoDto({
    @JsonKey(name: 'soldTo') required String soldTo,
    @JsonKey(name: 'shipTo') required String shipTo,
    @JsonKey(name: 'companyName') required String companyName,
    @JsonKey(name: 'paymentTerm') required PaymentTermDto paymentTerm,
  }) = _OrderHistoryBasicInfoDto;
  factory OrderHistoryBasicInfoDto.fromDomain(
    OrderHistoryBasicInfo orderHistoryBasicInfo,
  ) {
    return OrderHistoryBasicInfoDto(
      companyName: orderHistoryBasicInfo.companyName.getOrCrash(),
      shipTo: orderHistoryBasicInfo.shipTo,
      soldTo: orderHistoryBasicInfo.soldTo,
      paymentTerm: PaymentTermDto.fromDomain(orderHistoryBasicInfo.paymentTerm),
    );
  }
  OrderHistoryBasicInfo toDomain() {
    return OrderHistoryBasicInfo(
      companyName: value_objects.CompanyName(companyName),
      shipTo: shipTo,
      soldTo: soldTo,
      paymentTerm: paymentTerm.toDomain(),
    );
  }

  factory OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryBasicInfoDtoFromJson(json);
}