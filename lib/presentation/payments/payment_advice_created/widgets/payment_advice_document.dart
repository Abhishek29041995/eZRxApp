part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceDocument extends StatelessWidget {
  const _PaymentAdviceDocument();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: state.selectedPaymentMethod.paymentMethod.isPaymentGateway
              ? custom.ExpansionTile(
                  key: WidgetKeys.paymentAdviceDocumentHeader,
                  headerBackgroundColor: ZPColors.lightSilver,
                  radius: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  threeLineTitle: true,
                  title: Text(
                    context.tr('Payment Advice Document'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  children: [
                    state.isFetchingInvoiceInfoPdf
                        ? Container(
                            height: 400,
                            color: ZPColors.accentColor,
                            child: LoadingShimmer.logo(
                              key: WidgetKeys.paymentAdviceScreenLoader,
                            ),
                          )
                        : const _PDFAdviceSection(),
                  ],
                )
              : state.paymentInvoiceInfoPdf != PaymentInvoiceInfoPdf.empty()
                  ? const _PDFAdviceSection()
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}

class _PDFAdviceSection extends StatelessWidget {
  const _PDFAdviceSection();

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final newPaymentState = context.read<NewPaymentBloc>().state;

    return Column(
      children: [
        PdfPreviewCustom(
          maxPageWidth: double.infinity,
          key: WidgetKeys.pdfView,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          loadingWidget: Container(
            height: 400,
            color: ZPColors.accentColor,
            child: LoadingShimmer.logo(
              key: WidgetKeys.paymentAdviceScreenLoader,
            ),
          ),
          previewPageMargin: EdgeInsets.zero,
          shrinkWrap: true,
          pdfPreviewPageDecoration: const BoxDecoration(color: ZPColors.white),
          scrollViewDecoration: const BoxDecoration(color: ZPColors.white),
          onError: (_, error) {
            if (eligibilityState.salesOrganisation.salesOrg.isSg) {
              trackMixpanelEvent(
                TrackingEvents.paymentFailure,
                props: {
                  TrackingProps.errorMessage: 'Generating QR failed',
                  TrackingProps.paymentMethod: newPaymentState
                      .selectedPaymentMethod.paymentMethod
                      .getOrDefaultValue(''),
                  TrackingProps.paymentDocumentCount:
                      newPaymentState.allSelectedItems.length,
                  TrackingProps.paymentAdviceId:
                      newPaymentState.paymentInvoiceInfoPdf.zzAdvice,
                },
              );
            }

            return Text(error.toString());
          },
          build: (_) async {
            final pdf = await CreatePaymentInvoicePdf().createInvoicePdf(
              shipToInfo: eligibilityState.shipToInfo,
              paymentInvoiceInfoPdf: newPaymentState.paymentInvoiceInfoPdf,
              salesOrganisation: eligibilityState.salesOrganisation,
              createdDate: newPaymentState.paymentInfo.createdDate,
              adviceExpiry: newPaymentState.paymentInfo.adviceExpiry,
            );

            if (eligibilityState.salesOrganisation.salesOrg.isSg) {
              trackMixpanelEvent(
                TrackingEvents.successfulPayment,
                props: {
                  TrackingProps.paymentAmount: newPaymentState.amountTotal,
                  TrackingProps.paymentMethod: newPaymentState
                      .selectedPaymentMethod.paymentMethod
                      .getOrDefaultValue(''),
                  TrackingProps.paymentDocumentCount:
                      newPaymentState.allSelectedItems.length,
                  TrackingProps.paymentAdviceId:
                      newPaymentState.paymentInvoiceInfoPdf.zzAdvice,
                },
              );

              trackClevertapEvent(
                TrackingEvents.successfulPayment,
                props: {
                  TrackingProps.paymentMethod: newPaymentState
                      .selectedPaymentMethod.paymentMethod
                      .getOrDefaultValue(''),
                },
              );
            }

            return pdf;
          },
        ),
        if (!newPaymentState.isFetchingInvoiceInfoPdf &&
            newPaymentState
                .selectedPaymentMethod.paymentMethod.isPaymentGateway)
          const Padding(
            key: WidgetKeys.paymentSavePdfButtonSection,
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: PaymentSavePdfButton(),
          ),
      ],
    );
  }
}
