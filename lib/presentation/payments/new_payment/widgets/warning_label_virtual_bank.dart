part of 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';

class _WarningLabelVirtualBank extends StatelessWidget {
  final int currentStep;
  const _WarningLabelVirtualBank({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final isID = context.read<EligibilityBloc>().state.salesOrg.isID;

    if (currentStep == 2 && isID) {
      return BlocBuilder<NewPaymentBloc, NewPaymentState>(
        buildWhen: (previous, current) =>
            previous.selectedPaymentMethod.options !=
            current.selectedPaymentMethod.options,
        builder: (context, state) {
          return state.virtualBankPayable
              ? const SizedBox.shrink()
              : InfoLabel(
                  textValue: context
                      .tr('Please select your virtual bank account to proceed'),
                  mainColor: ZPColors.errorSnackBarColor,
                  margin: const EdgeInsets.only(top: 16),
                );
        },
      );
    }

    return const SizedBox.shrink();
  }
}
