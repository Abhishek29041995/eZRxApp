import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusItemsSheetFooter extends StatelessWidget {
  const BonusItemsSheetFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 7),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ZPColors.extraLightGrey2,
              width: 1,
            ),
          ),
        ),
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) =>
              previous.isUpserting != current.isUpserting,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  key: WidgetKeys.bonusSampleSheetCloseButton,
                  onPressed: () => context.router.maybePop(),
                  child: Text(
                    context.tr('Close'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
