import 'package:ezrxmobile/domain/payments/entities/customer_payment_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_payment_filter_dto.freezed.dart';
part 'customer_payment_filter_dto.g.dart';

@freezed
class CustomerPaymentFilterDto with _$CustomerPaymentFilterDto {
  const CustomerPaymentFilterDto._();
  const factory CustomerPaymentFilterDto({
    @JsonKey(
      name: 'paymentBatchAdditionalInfo',
      defaultValue: '',
    )
        required String paymentBatchAdditionalInfo,
    @JsonKey(
      name: 'createdDateToday',
      defaultValue: '',
    )
        required String createdDateToday,
    @JsonKey(
      name: 'createdDateYesterday',
      defaultValue: '',
    )
        required String createdDateYesterday,
  }) = _CustomerPaymentFilterDto;

  factory CustomerPaymentFilterDto.fromDomain(
    CustomerPaymentFilter filter,
  ) {
    return CustomerPaymentFilterDto(
      paymentBatchAdditionalInfo: filter.paymentBatchAdditionalInfo,
      createdDateToday: filter.today.apiDateWithDashString,
      createdDateYesterday: filter.yesterday.apiDateWithDashString,
    );
  }

  factory CustomerPaymentFilterDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerPaymentFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList => <Map<String, String>>[
        if (paymentBatchAdditionalInfo.isNotEmpty)
          {
            'field': 'paymentBatchAdditionalInfo',
            'value': paymentBatchAdditionalInfo,
          },
        if (createdDateYesterday.isNotEmpty && createdDateYesterday != '-')
          {
            'field': 'createdDate',
            'value': createdDateYesterday,
            'type': 'ge',
          },
        if (createdDateToday.isNotEmpty && createdDateToday != '-')
          {
            'field': 'createdDate',
            'value': createdDateToday,
            'type': 'le',
          },
      ];
}
