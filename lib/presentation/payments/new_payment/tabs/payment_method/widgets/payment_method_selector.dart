part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _PaymentMethodSelector extends StatelessWidget {
  const _PaymentMethodSelector();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      key: WidgetKeys.paymentMethodSelector,
      listenWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod &&
          !current.isFetchingPaymentMethod,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod ||
          previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        final isID = context.read<EligibilityBloc>().state.salesOrg.isID;

        if (state.isFetchingPaymentMethod) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: LoadingShimmer.circular(),
          );
        }

        if (state.paymentMethods.isEmpty) {
          return Container(
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              context.tr('No available payment method'),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          );
        }

        return Wrap(
          children: [
            isID
                ? _APLPaymentSelectorWidget(
                    paymentMethods: state.paymentMethods,
                    selectedPaymentMethod: state.selectedPaymentMethod,
                  )
                : Row(
                    children: state.paymentMethods
                        .map(
                          (paymentMethod) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              key: WidgetKeys.paymentMethodTile,
                              onTap: () {
                                context.read<NewPaymentBloc>().add(
                                      NewPaymentEvent
                                          .updatePaymentMethodSelected(
                                        paymentMethodSelected: paymentMethod,
                                      ),
                                    );
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    key: WidgetKeys.paymentMethodRadio,
                                    value: paymentMethod.paymentMethod,
                                    groupValue: state
                                        .selectedPaymentMethod.paymentMethod,
                                    onChanged: null,
                                  ),
                                  Text(
                                    paymentMethod.paymentMethod.getValue(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        );
      },
    );
  }
}
