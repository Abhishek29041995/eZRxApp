import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleMaterialDescription extends StatelessWidget {
  const BundleMaterialDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final materialInfo = context
        .read<ProductDetailBloc>()
        .state
        .productDetailAggregate
        .materialInfo;

    return SafeArea(
      child: Padding(
        key: WidgetKeys.bundleMaterialDescriptionBottomSheet,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('Material information'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 24),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 4,
              keyText: context.tr('Bundle Code'),
              valueText: materialInfo.materialNumber.displayMatNo,
            ),
            const SizedBox(height: 8),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 4,
              keyText: context
                  .tr(materialInfo.isMarketPlace ? 'Sold by' : 'Manufacturer'),
              valueText: materialInfo.getManufactured,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.router.maybePop(),
                child: Text(context.tr('Close')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
