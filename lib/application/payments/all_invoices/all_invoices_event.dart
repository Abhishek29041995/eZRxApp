part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesEvent with _$AllInvoicesEvent {
  const factory AllInvoicesEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _initialized;
  const factory AllInvoicesEvent.fetch({
    required AllInvoicesFilter appliedFilter,
  }) = _Fetch;
  const factory AllInvoicesEvent.loadMore() = _LoadMore;
}
