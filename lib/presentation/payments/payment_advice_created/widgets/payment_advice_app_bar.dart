part of 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';

class _PaymentAdviceAppBar extends StatelessWidget {
  final NewPaymentState state;

  const _PaymentAdviceAppBar({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (state.canDisplayCrossButton) ...[
          SizedBox(
            height: 32,
            width: 32,
            child: IconButton(
              key: WidgetKeys.closeButton,
              iconSize: 24,
              padding: EdgeInsets.zero,
              onPressed: () => context.maybePop(),
              icon: const Icon(Icons.close, color: ZPColors.neutralsBlack),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  if (context.isMPPayment) ...[
                    const WidgetSpan(
                      child: MarketPlaceIcon(height: 24, width: 24),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    const WidgetSpan(child: SizedBox(width: 8)),
                  ],
                  TextSpan(
                    text: context.tr(state.paymentAdviceGenerateTitle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
