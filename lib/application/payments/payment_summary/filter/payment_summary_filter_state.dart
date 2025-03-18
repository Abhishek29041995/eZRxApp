part of 'payment_summary_filter_bloc.dart';

@freezed
class PaymentSummaryFilterState with _$PaymentSummaryFilterState {
  const PaymentSummaryFilterState._();

  const factory PaymentSummaryFilterState({
    required SalesOrg salesOrg,
    required PaymentSummaryFilter filter,
    required bool showErrorMessages,
  }) = _PaymentSummaryFilterState;

  factory PaymentSummaryFilterState.initial() => PaymentSummaryFilterState(
        salesOrg: SalesOrg(''),
        filter: PaymentSummaryFilter.defaultFilter(),
        showErrorMessages: false,
      );

  List<FilterStatus> get statuses {
    if (salesOrg.isSg) {
      return <FilterStatus>[
        FilterStatus('Pending'),
        FilterStatus('Processed'),
      ];
    }
    if (salesOrg.isPH) {
      return <FilterStatus>[
        FilterStatus('In Progress'),
        FilterStatus('Failed'),
        FilterStatus('Processed'),
        FilterStatus('Successful'),
        FilterStatus('Pending'),
      ];
    }
    if (salesOrg.isID) {
      return <FilterStatus>[
        FilterStatus('In Progress'),
        FilterStatus('Expired'),
        FilterStatus('Successful'),
        FilterStatus('Cancelled'),
      ];
    }
    if (salesOrg.isTH) {
      return <FilterStatus>[
        FilterStatus('In Progress'),
        FilterStatus('Failed'),
        FilterStatus('Successful'),
        FilterStatus('Processed'),
        FilterStatus('Payment Received'),
      ];
    }

    return <FilterStatus>[
      FilterStatus('In Progress'),
      FilterStatus('Failed'),
      FilterStatus('Processed'),
      FilterStatus('Successful'),
    ];
  }
}
