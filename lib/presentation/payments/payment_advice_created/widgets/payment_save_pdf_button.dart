part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class PaymentSavePdfButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const PaymentSavePdfButton({
    super.key,
    this.text = 'Download payment advice',
    this.textStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isSavingInvoicePdf != current.isSavingInvoicePdf,
      listener: (context, state) {
        if (!state.isSavingInvoicePdf) {
          state.failureOrSuccessOption.fold(
            () => CustomSnackBar(
              messageText: context.tr('Download Successful'),
            ).show(context),
            (option) => option.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (r) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isSavingInvoicePdf != current.isSavingInvoicePdf ||
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        return OutlinedButton(
          key: WidgetKeys.paymentSavePdfButton,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: ZPColors.primary,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            backgroundColor: backgroundColor ?? ZPColors.white,
          ),
          onPressed: state.isSavingInvoicePdf
              ? null
              : () async {
                  final eligibilityState =
                      context.read<EligibilityBloc>().state;
                  context.read<NewPaymentBloc>().add(
                        NewPaymentEvent.saveInvoicePdf(
                          dataInvoicePdf:
                              await CreatePaymentInvoicePdf().createInvoicePdf(
                            paymentInvoiceInfoPdf: state.paymentInvoiceInfoPdf,
                            createdDate: state.paymentInfo.createdDate,
                            adviceExpiry:
                                state.paymentInfo.adviceExpiry,
                            shipToInfo: eligibilityState.shipToInfo,
                            salesOrganisation:
                                eligibilityState.salesOrganisation,
                          ),
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSavingInvoicePdf,
            child: Text(
              context.tr(text),
              style: textStyle ??
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.primary,
                      ),
            ),
          ),
        );
      },
    );
  }
}
