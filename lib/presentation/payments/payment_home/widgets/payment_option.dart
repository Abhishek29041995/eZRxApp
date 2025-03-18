part of '../payment_page.dart';

class _PaymentOptionMenu extends StatelessWidget {
  const _PaymentOptionMenu();

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final size = MediaQuery.of(context).size;

    return Wrap(
      key: WidgetKeys.paymentHomeOptionMenu,
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.spaceBetween
          : WrapAlignment.start,
      runSpacing: size.height * 0.02,
      spacing: Responsive.isMobile(context) ? 0 : 10,
      children: _getPaymentOptionItems(context)
          .map(
            (paymentOptionData) => _PaymentOption(
              paymentOptionData: paymentOptionData,
              height: context.isMPPayment ? 83 : 62,
              width: eligibilityState.paymentHomeItemWidthRatio * size.width,
            ),
          )
          .toList(),
    );
  }

  List<_PaymentOptionData> _getPaymentOptionItems(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final suffix = context.isMPPayment ? 'MP\n' : '';

    return [
      _PaymentOptionData(
        key: WidgetKeys.accountSummaryMenu,
        icon: 'account_summary.svg',
        label: suffix + context.tr('Account summary'),
        onTap: () => context.router.push(
          AccountSummaryRoute(isMarketPlace: context.isMPPayment),
        ),
      ),
      _PaymentOptionData(
        key: WidgetKeys.paymentSummaryMenu,
        icon: 'payment_summary.svg',
        label: suffix + context.tr('Payment summary'),
        onTap: () => context.router
            .push(PaymentSummaryPageRoute(isMarketPlace: context.isMPPayment)),
      ),
      if (eligibilityState.salesOrgConfigs.statementOfAccountEnabled)
        _PaymentOptionData(
          key: WidgetKeys.statementOfAccountsMenu,
          icon: 'statement_accounts.svg',
          label: suffix + context.tr('Statement of accounts'),
          onTap: () {
            context
                .read<SoaFilterBloc>()
                .add(const SoaFilterEvent.initialized());
            context.router.push(
              StatementAccountsPageRoute(isMarketPlace: context.isMPPayment),
            );
          },
        ),
      if (eligibilityState.salesOrg.isPaymentClaimEnabled)
        _PaymentOptionData(
          key: WidgetKeys.claimsMenu,
          icon: 'claims.svg',
          label: 'Claims',
          onTap: () {
            context.read<ClaimManagementBloc>().add(
                  ClaimManagementEvent.initialized(
                    salesOrganisation: eligibilityState.salesOrganisation,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    user: eligibilityState.user,
                  ),
                );

            context.router.push(
              const ClaimManagementPageRoute(),
            );
          },
        ),
    ];
  }
}

class _PaymentOption extends StatelessWidget {
  final _PaymentOptionData paymentOptionData;
  final double width;
  final double height;

  const _PaymentOption({
    required this.paymentOptionData,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    const iconSize = 40.0;

    return SizedBox(
      width: width,
      child: GestureDetector(
        key: paymentOptionData.key,
        onTap: () {
          trackMixpanelEvent(
            TrackingEvents.paymentQuickAccessClicked,
            props: {
              TrackingProps.quickAccess: paymentOptionData.label,
            },
          );
          paymentOptionData.onTap.call();
        },
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CustomCard(
              width: double.infinity,
              margin: const EdgeInsets.only(top: iconSize - 7),
              padding: const EdgeInsets.all(10),
              height: height,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  paymentOptionData.label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/svg/${paymentOptionData.icon}',
              height: iconSize,
              width: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentOptionData {
  final Key key;
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _PaymentOptionData({
    required this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
