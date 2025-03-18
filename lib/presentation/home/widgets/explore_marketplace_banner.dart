import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class ExploreMarketPlaceBanner extends StatelessWidget {
  const ExploreMarketPlaceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: padding12,
        vertical: padding24,
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ZPColors.marketplaceBg,
      ),
      child: Column(
        children: [
          Text(
            context.tr('What\'s new!'),
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 8),
          const MarketPlaceRectangleLogo(),
          const SizedBox(height: 8),
          Text(
            context.tr('Check out the new eZRx+ Marketplace!'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            key: WidgetKeys.exploreMarketPlaceButton,
            onPressed: () {
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.fetch(
                      selectedMaterialFilter: MaterialFilter.empty().copyWith(
                        isMarketPlace: true,
                      ),
                    ),
                  );
              context.navigateTo(const ProductsTabRoute());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                context.tr('Explore Marketplace'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
