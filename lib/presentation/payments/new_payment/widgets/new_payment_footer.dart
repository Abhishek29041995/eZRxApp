part of 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';

class _NewPaymentFooter extends StatelessWidget {
  final int currentStep;
  final TabController tabController;

  const _NewPaymentFooter({
    required this.currentStep,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final isID = context.read<EligibilityBloc>().state.salesOrg.isID;
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ZPColors.lightGray2,
            ),
          ),
        ),
        child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
          buildWhen: (previous, current) =>
              previous.selectedInvoices != current.selectedInvoices ||
              previous.selectedCredits != current.selectedCredits,
          builder: (context, state) {
            return Column(
              children: [
                if (currentStep == 1)
                  _CheckAllInvoicesWidget(
                    selectedInvoices: state.selectedInvoices,
                  ),
                if (currentStep == 2 && !isID)
                  _CheckAllCreditsWidget(
                    selectedCredits: state.selectedCredits,
                  ),
                if (!isID)
                  Row(
                    children: [
                      PriceText(
                        data: StringUtils.displayNumber(
                          state.selectedInvoices.amountTotal,
                        ),
                        title: context.tr('Amount payable'),
                        salesOrgConfig: configs,
                      ),
                      PriceText(
                        data: '(${StringUtils.displayNumber(
                          state.selectedCredits.amountTotal.abs(),
                        )})',
                        title: context.tr('Credit applied'),
                        salesOrgConfig: configs,
                        isNegativeColorDisplay: state.negativeAmount,
                      ),
                    ],
                  ),
                if (state.negativeAmount)
                  InfoLabel(
                    key: WidgetKeys.creditGreaterThanInvoiceWarning,
                    margin: EdgeInsets.zero,
                    mainColor: ZPColors.errorSnackBarColor,
                    textValue: context.tr(
                      'Total credit amount cannot exceed invoice amount.',
                    ),
                  ),
                _WarningLabelVirtualBank(
                  currentStep: currentStep,
                ),
                _TotalAmountSection(
                  currentStep: currentStep,
                  tabController: tabController,
                ),
                if (currentStep == 3 && !isID)
                  BlocBuilder<NewPaymentBloc, NewPaymentState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                          key: WidgetKeys.generatePaymentAdvice,
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  _trackProceedToNextStep(
                                    context,
                                    currentStep,
                                  );
                                  context.read<NewPaymentBloc>().add(
                                        const NewPaymentEvent.pay(),
                                      );
                                  context.router.pushAndPopUntil(
                                    PaymentAdviceCreatedPageRoute(
                                      isMarketPlace: context.isMPPayment,
                                    ),
                                    predicate: (Route route) =>
                                        route.settings.name ==
                                        PaymentPageRoute.name,
                                  );
                                },
                          child: LoadingShimmer.withChild(
                            enabled: state.isLoading,
                            child: Text(
                              context.tr(
                                context.isMPPayment
                                    ? 'Generate MP payment advice'
                                    : 'Generate payment advice',
                              ),
                              style: const TextStyle(
                                color: ZPColors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                const SizedBox(
                  height: 8,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
