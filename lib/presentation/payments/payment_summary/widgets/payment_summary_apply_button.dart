part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryApplyButton extends StatelessWidget {
  const _PaymentSummaryApplyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: ElevatedButton(
          key: WidgetKeys.filterApplyButton,
          onPressed: () {
            context.read<PaymentSummaryFilterBloc>().add(
                  const PaymentSummaryFilterEvent.validateFilters(),
                );
            final paymentSummaryBloc =
                context.paymentSummaryBloc(context.isMPPayment);
            if (state.filter.isValid) {
              if (state.filter != paymentSummaryBloc.state.appliedFilter) {
                paymentSummaryBloc.add(
                  PaymentSummaryEvent.fetch(
                    appliedFilter: state.filter,
                  ),
                );
              }
              context.router.popForced();
            }
          },
          child: Text(
            context.tr('Apply'),
            style: const TextStyle(color: ZPColors.white),
          ),
        ),
      ),
    );
  }
}
