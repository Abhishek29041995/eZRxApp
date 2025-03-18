part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessRefreshWarning extends StatelessWidget {
  final String description;

  const _OrderSuccessRefreshWarning({required this.description});

  @override
  Widget build(BuildContext context) {
    final text = context.tr(description).split('{actionName}');

    return Container(
      key: WidgetKeys.orderSuccessRefreshWarning,
      width: double.infinity,
      padding: const EdgeInsets.all(padding6),
      decoration: BoxDecoration(
        color: ZPColors.warningBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
          children: [
            TextSpan(text: text.first),
            TextSpan(
              text: context.tr('refresh the screen'),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  final bloc = context.read<OrderSummaryBloc>();
                  bloc.add(
                    OrderSummaryEvent.orderConfirmationDetail(
                      priceAggregate: bloc.state.cartItems,
                    ),
                  );
                },
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ZPColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: text[1]),
          ],
        ),
      ),
    );
  }
}
