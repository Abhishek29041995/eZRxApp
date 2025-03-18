part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryResetButton extends StatelessWidget {
  const _PaymentSummaryResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          final bloc = context.paymentSummaryBloc(context.isMPPayment);
          if (bloc.state.appliedFilter.excludeSearch !=
              PaymentSummaryFilter.defaultFilter()) {
            bloc.add(
              PaymentSummaryEvent.fetch(
                appliedFilter: PaymentSummaryFilter.defaultFilter().copyWith(
                  searchKey: bloc.state.appliedFilter.searchKey,
                ),
              ),
            );
          }
          context.router.popForced();
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}
