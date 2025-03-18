part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _PaymentOptionItem extends StatelessWidget {
  final PaymentMethodOption paymentMethodOption;
  const _PaymentOptionItem({required this.paymentMethodOption});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.selectedPaymentMethod.options !=
          current.selectedPaymentMethod.options,
      builder: (context, state) {
        return Padding(
          key: WidgetKeys.paymentMethodCheckbox,
          padding: const EdgeInsets.only(bottom: 8),
          child: EdgeCheckbox(
            onChanged: (bool value) {
              context.read<NewPaymentBloc>().add(
                    NewPaymentEvent.updatePaymentMethodOptionSelected(
                      paymentMethodOptionSelected: paymentMethodOption,
                    ),
                  );
            },
            value: state.selectedPaymentMethod.firstSelectedOption ==
                paymentMethodOption,
            body: CustomCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
              backgroundColor: ZPColors.white,
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  Text(
                    paymentMethodOption.displayName.displayNAIfEmpty,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.comboRequirementTitle),
                  ),
                  const Spacer(),
                  SvgPicture.asset(paymentMethodOption.logoPath),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
