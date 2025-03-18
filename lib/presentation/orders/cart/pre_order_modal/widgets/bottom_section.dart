part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ZPColors.lightGray2,
          indent: 0,
          endIndent: 0,
          height: 15,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: _horizontalPadding,
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  key: WidgetKeys.preOrderModalCancelButton,
                  onPressed: () => context.router.maybePop(),
                  child: Text(
                    context.tr('Cancel'),
                    style: const TextStyle(color: ZPColors.primary),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  key: WidgetKeys.preOrderModalContinueButton,
                  onPressed: () => context.router.maybePop(true),
                  child: Text(
                    context.tr('Continue'),
                    style: const TextStyle(color: ZPColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
