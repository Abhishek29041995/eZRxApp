part of 'outstanding_invoice_filter_bloc.dart';

@freezed
class OutstandingInvoiceFilterState with _$OutstandingInvoiceFilterState {
  const OutstandingInvoiceFilterState._();

  const factory OutstandingInvoiceFilterState({
    required OutstandingInvoiceFilter filter,
    required List<StatusType> statusList,
    required bool showErrorMessage,
  }) = _OutstandingInvoiceFilterState;

  factory OutstandingInvoiceFilterState.initial() =>
      OutstandingInvoiceFilterState(
        filter: OutstandingInvoiceFilter.defaultFilter(),
        statusList: <StatusType>[
          StatusType('OPEN'),
          StatusType('OVERDUE'),
        ],
        showErrorMessage: false,
      );
}
