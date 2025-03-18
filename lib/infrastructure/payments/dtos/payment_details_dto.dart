import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_details.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details_dto.freezed.dart';
part 'payment_details_dto.g.dart';

@freezed
class PaymentDetailsDto with _$PaymentDetailsDto {
  const PaymentDetailsDto._();

  const factory PaymentDetailsDto({
    @JsonKey(name: 'vaNumber', defaultValue: '') required String vaNumber,
    @JsonKey(name: 'vaName', defaultValue: '') required String vaName,
    @JsonKey(
      name: 'expiresAt',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate,
    )
    required String expiresAt,
  }) = _PaymentDetailsDto;

  PaymentDetails toDomain() {
    return PaymentDetails(
      expiresAt: DateTimeStringValue(expiresAt),
      vaName: StringValue(vaName),
      vaNumber: StringValue(vaNumber),
    );
  }

  factory PaymentDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsDtoFromJson(json);
}
