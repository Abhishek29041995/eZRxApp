import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_payment_filter.freezed.dart';

@freezed
class CustomerPaymentFilter with _$CustomerPaymentFilter {
  const CustomerPaymentFilter._();
  factory CustomerPaymentFilter({
    required DateTimeStringValue today,
    required DateTimeStringValue yesterday,
    required String paymentBatchAdditionalInfo,
  }) = _CustomerPaymentFilter;

  factory CustomerPaymentFilter.empty() => CustomerPaymentFilter(
        today: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now(),
          ),
        ),
        yesterday: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 1)),
          ),
        ),
        paymentBatchAdditionalInfo: '',
      );
}
