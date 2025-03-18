part of 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';

class _NewPaymentBody extends StatelessWidget {
  final int currentStep;
  final int totalTabs;
  final Widget child;
  const _NewPaymentBody({
    required this.currentStep,
    required this.totalTabs,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              12.0,
              12.0,
              12.0,
              0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Text(
                    '${context.tr('Step')} $currentStep ${context.tr('of')} $totalTabs: ${_stepTitle(context, currentStep)}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                LinearProgressIndicator(
                  value: currentStep / totalTabs,
                  backgroundColor: ZPColors.accentColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
