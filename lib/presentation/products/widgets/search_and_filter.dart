import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<MaterialListBloc, MaterialListState>(
              buildWhen: (previous, current) =>
                  previous.searchKey != current.searchKey,
              builder: (context, state) {
                return ProductSearchEntry(
                  initValue: state.searchKey.searchValueOrEmpty,
                  onClear: () {
                    context.read<MaterialListBloc>()
                      ..add(
                        const MaterialListEvent.updateSearchKey(
                          searchKey: '',
                        ),
                      )
                      ..add(
                        MaterialListEvent.fetch(
                          selectedMaterialFilter: context
                              .read<MaterialListBloc>()
                              .state
                              .selectedMaterialFilter,
                        ),
                      );
                  },
                );
              },
            ),
          ),
          BlocBuilder<MaterialListBloc, MaterialListState>(
            buildWhen: (previous, current) =>
                previous.selectedMaterialFilter !=
                current.selectedMaterialFilter,
            builder: (context, state) {
              return IconButton(
                key: WidgetKeys.filterProductIcon,
                onPressed: () => _showFilterPage(context),
                icon: state.selectedMaterialFilter == MaterialFilter.empty()
                    ? const Icon(
                        Icons.tune_outlined,
                        color: ZPColors.primary,
                      )
                    : Stack(
                        children: [
                          const Icon(
                            Icons.tune_outlined,
                            color: ZPColors.primary,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: ZPColors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showFilterPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      builder: (_) => const ProductFilterPage(),
    ).then((value) {
      if (value is MaterialFilter) {
        if (_haveDifferenceFilter(context, value)) {
          context.read<MaterialListBloc>().add(
                MaterialListEvent.fetch(
                  selectedMaterialFilter: value,
                ),
              );
        }
      }
    });
  }

  bool _haveDifferenceFilter(BuildContext context, MaterialFilter newFilter) {
    final currentFilter =
        context.read<MaterialListBloc>().state.selectedMaterialFilter;

    // Can not use currentFilter != newFilter here because:
    // 1. newFilter coming from MaterialFilterBloc has data in manufactureMapOptions, countryMapOptions and brandList fields
    // 2. currentFilter coming from MaterialListBloc doesn't has data in those above fields
    // ==> Using currentFilter != newFilter will always return true here

    return currentFilter.isFavourite != newFilter.isFavourite ||
        currentFilter.bundleOffers != newFilter.bundleOffers ||
        currentFilter.manufactureListSelected !=
            newFilter.manufactureListSelected ||
        currentFilter.countryListSelected != newFilter.countryListSelected ||
        currentFilter.isProductOffer != newFilter.isProductOffer ||
        currentFilter.sortBy != newFilter.sortBy ||
        currentFilter.comboOffers != newFilter.comboOffers ||
        currentFilter.isCovidSelected != newFilter.isCovidSelected ||
        currentFilter.isMarketPlace != newFilter.isMarketPlace ||
        currentFilter.isTender != newFilter.isTender ||
        currentFilter.isGimmick != newFilter.isGimmick ||
        currentFilter.isPoison != newFilter.isPoison ||
        currentFilter.isSample != newFilter.isSample;
  }
}
