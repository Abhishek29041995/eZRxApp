part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummarySearchBar extends StatelessWidget {
  const _PaymentSummarySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      bloc: context.paymentSummaryBloc(context.isMPPayment),
      buildWhen: (previous, current) =>
          previous.appliedFilter.searchKey != current.appliedFilter.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          hintText: context.isMPPayment
              ? 'Search by MP payment advice / voucher no.'
              : 'Search by payment advice / voucher no.',
          enabled: true,
          initialValue: state.appliedFilter.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => _fetchPaymentSummary(
            searchValue: value,
            context: context,
          ),
          onSearchSubmitted: (value) => _fetchPaymentSummary(
            searchValue: value,
            context: context,
          ),
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => _fetchPaymentSummary(
            searchValue: '',
            context: context,
          ),
        );
      },
    );
  }

  void _fetchPaymentSummary({
    required String searchValue,
    required BuildContext context,
  }) =>
      context.paymentSummaryBloc(context.isMPPayment).add(
            PaymentSummaryEvent.fetch(
              appliedFilter: searchValue.isEmpty
                  ? PaymentSummaryFilter.defaultFilter()
                  : PaymentSummaryFilter.empty().copyWith(
                      searchKey: SearchKey.search(searchValue),
                    ),
            ),
          );
}
