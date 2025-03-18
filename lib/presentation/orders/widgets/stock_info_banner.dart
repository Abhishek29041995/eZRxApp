import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockInfoBanner extends StatelessWidget {
  const StockInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isStockInfoNotAvailable != current.isStockInfoNotAvailable,
      builder: (context, state) {
        return state.isStockInfoNotAvailable
            ? Container(
                key: WidgetKeys.stockInfoBanner,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: const BoxDecoration(
                  color: ZPColors.customerBlockedBannerColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('Stock status not available:'),
                      key: WidgetKeys.stockInfoBannerTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.tr(
                        'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
                      ),
                      key: WidgetKeys.stockInfoBannerContent,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
