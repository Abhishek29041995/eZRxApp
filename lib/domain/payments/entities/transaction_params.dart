import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_params.freezed.dart';

@freezed
class TransactionParams with _$TransactionParams {
  const TransactionParams._();
  const factory TransactionParams({
    required String customerCode,
    required int first,
    required int after,
    required PaymentSummaryFilter filter,
  }) = _TransactionParams;

  factory TransactionParams.empty() => TransactionParams(
        customerCode: '',
        first: 0,
        after: 0,
        filter: PaymentSummaryFilter.defaultFilter(),
      );
}
