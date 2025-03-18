part of '../payment_page.dart';

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentInProgressBloc, PaymentInProgressState>(
      bloc: context.paymentInProgressBloc(context.isMPPayment),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: context.isMPPayment
                  ? 'MP Payment summary'
                  : 'Payment summary',
              onTapIconButton: () => context.router.push(
                PaymentSummaryPageRoute(isMarketPlace: context.isMPPayment),
              ),
            ),
            _ItemCard(
              key: WidgetKeys.paymentHomeInProgressCard,
              keyVal: [
                _KeyValuePair(
                  key: 'In progress',
                  value: state.amount.displayNAIfEmpty,
                  widgetKey: WidgetKeys.inProgressAmount,
                ),
              ],
              isFetching: state.isFetching,
            ),
          ],
        );
      },
    );
  }
}
