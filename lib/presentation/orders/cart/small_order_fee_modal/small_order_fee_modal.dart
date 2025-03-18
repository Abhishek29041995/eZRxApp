import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SmallOrderFeePage extends StatelessWidget {
  const SmallOrderFeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          key: WidgetKeys.smallOrderFeeModal,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                context.tr('Agree to small order fee?'),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ZPColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Text(
              context.tr('Please agree to small order fee to proceed.'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            Text(
              context.tr(
                'Alternatively, you may choose to add more in-stock items to your order.',
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: PriceSummarySection(
                cartState: context.read<CartBloc>().state,
                titleStyle: Theme.of(context).textTheme.labelMedium,
                titleSpacing: 10,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: WidgetKeys.cancelButton,
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
                    key: WidgetKeys.confirmButton,
                    onPressed: () => context.router.maybePop(true),
                    child: Text(
                      context.tr('Agree'),
                      style: const TextStyle(color: ZPColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
