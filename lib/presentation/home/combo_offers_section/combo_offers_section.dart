import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

class ComboOffersSection extends StatelessWidget {
  const ComboOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.combodealsBody,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ZPColors.comboOffersBorder),
        color: ZPColors.comboOffersBg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.discount_outlined,
            color: ZPColors.comboOffersTagColor,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('Combo offers'),
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                context.tr(
                  'Discount up to {percent}% on selected materials',
                  namedArgs: {
                    'percent': '50',
                  },
                ),
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                key: WidgetKeys.exploreComboDealsButtton,
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  backgroundColor: ZPColors.comboOffersBg,
                ),
                onPressed: () {
                  final materialFilterBloc = context.read<MaterialFilterBloc>();

                  final selectedMaterialFilter = materialFilterBloc
                      .state.materialFilter
                      .copyWith(comboOffers: true);

                  materialFilterBloc.add(
                    MaterialFilterEvent.initSelectedMaterialFilter(
                      selectedMaterialFilter,
                    ),
                  );

                  context.read<MaterialListBloc>().add(
                        MaterialListEvent.fetch(
                          selectedMaterialFilter: selectedMaterialFilter,
                        ),
                      );

                  context.navigateTo(const ProductsTabRoute());
                },
                child: Text(
                  context.tr('Explore combo deals'),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ZPColors.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
