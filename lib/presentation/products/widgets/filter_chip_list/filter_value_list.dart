import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/favourite_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/market_place_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/bundle_offer_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/combo_offer_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/covid_19_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/gimmick_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/sample_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/offer_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/poison_filter_chip.dart';
part 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/tender_contract_filter_chip.dart';

const _chipHeight = 30.0;

class FilterValueList extends StatelessWidget {
  final MaterialListState state;

  const FilterValueList({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final currentFilter = state.selectedMaterialFilter;

    return SizedBox(
      height: _chipHeight,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding12),
        scrollDirection: Axis.horizontal,
        children: [
          _FavouriteFilterChip(currentFilter: currentFilter, state: state),
          _MarketPlaceFilterChip(currentFilter: currentFilter, state: state),
          _OfferFilterChip(currentFilter: currentFilter, state: state),
          _BundleOfferFilterChip(currentFilter: currentFilter, state: state),
          _ComboOfferFilterChip(currentFilter: currentFilter, state: state),
          _TenderContractFilterChip(currentFilter: currentFilter, state: state),
          _Covid19FilterChip(currentFilter: currentFilter, state: state),
          _GimmickFilterChip(currentFilter: currentFilter, state: state),
          _SampleFilterChip(currentFilter: currentFilter, state: state),
          _PoisonFilterChip(currentFilter: currentFilter, state: state),
        ],
      ),
    );
  }
}

class _MaterialTypeFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isFetching;
  final VoidCallback onTap;

  const _MaterialTypeFilterChip({
    required this.label,
    required this.isSelected,
    required this.isFetching,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: WidgetKeys.productTypeFilterChip(label),
      onTap: isFetching
          ? null
          : () {
              trackMixpanelEvent(
                TrackingEvents.productFilterClicked,
                props: {TrackingProps.filterClicked: label},
              );
              onTap.call();
            },
      child: Container(
        height: _chipHeight,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? ZPColors.primary : ZPColors.paleBlueGray,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          context.tr(label),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? ZPColors.white : ZPColors.neutralsBlack,
              ),
        ),
      ),
    );
  }
}
