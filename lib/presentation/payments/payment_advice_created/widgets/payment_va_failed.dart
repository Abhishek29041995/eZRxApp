part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentVirtualAccountFailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.paymentAdviceFailed,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgImage.alert,
            ),
            const SizedBox(height: 16),
            Text(
              context.tr('Payment Failed!'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr(
                'Sorry your payment creation is failed, please do try again later',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.router.pushAndPopUntil(
                  PaymentSummaryPageRoute(
                    isMarketPlace: context.isMPPayment,
                  ),
                  predicate: (Route route) =>
                      route.settings.name == PaymentPageRoute.name,
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: const WidgetStatePropertyAll(
                      ZPColors.white,
                    ),
                    shape: const WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(color: ZPColors.primary),
                      ),
                    ),
                  ),
              child: Text(
                context.tr('Payment summary'),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
