part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterByTypeOptions extends StatelessWidget {
  const _ProductFilterByTypeOptions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter != current.materialFilter,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('Show product'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 8.0),
            _ListTileThemeWidget(
              value: state.materialFilter.isFavourite,
              onChanged: (value) => context.read<MaterialFilterBloc>().add(
                    MaterialFilterEvent.updateSelectedMaterialFilter(
                      MaterialFilterType.isFavourite,
                      !state.materialFilter.isFavourite,
                    ),
                  ),
              title: 'Favourites',
            ),
            if (eligibilityState.salesOrgConfigs.enableTenderOrders)
              _ListTileThemeWidget(
                value: state.materialFilter.isTender,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.isTender,
                        !state.materialFilter.isTender,
                      ),
                    ),
                title: 'Tender Contract',
              ),
            if (eligibilityState.marketPlaceEligible)
              _ListTileThemeWidget(
                value: state.materialFilter.isMarketPlace,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.isMarketPlace,
                        !state.materialFilter.isMarketPlace,
                      ),
                    ),
                title: 'Marketplace items',
              ),
            if (!eligibilityState.salesOrgConfigs.disablePromotion)
              _ListTileThemeWidget(
                value: state.materialFilter.isProductOffer,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.productOffers,
                        !state.materialFilter.isProductOffer,
                      ),
                    ),
                title: 'Items with offers',
              ),
            if (!eligibilityState.salesOrgConfigs.disableBundles &&
                !eligibilityState.salesOrgConfigs.disablePromotion)
              _ListTileThemeWidget(
                value: state.materialFilter.bundleOffers,
                onChanged: (value) => context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.bundleOffers,
                        !state.materialFilter.bundleOffers,
                      ),
                    ),
                title: 'Bundle offers',
              ),
            if (eligibilityState.salesOrgConfigs.enableComboDeals)
              _ListTileThemeWidget(
                value: state.materialFilter.comboOffers,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.comboOffers,
                          !state.materialFilter.comboOffers,
                        ),
                      );
                },
                title: 'Combo offers',
              ),
            if (eligibilityState.canOrderCovidMaterial)
              _ListTileThemeWidget(
                value: state.materialFilter.isCovidSelected,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isCovidSelected,
                          !state.materialFilter.isCovidSelected,
                        ),
                      );
                },
                title: 'Covid-19',
              ),
            if (eligibilityState.gimmickMaterialEnabled)
              _ListTileThemeWidget(
                value: state.materialFilter.isGimmick,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isGimmick,
                          !state.materialFilter.isGimmick,
                        ),
                      );
                },
                title: 'Gimmick items',
              ),
            if (eligibilityState.sampleMaterialEnabled)
              _ListTileThemeWidget(
                value: state.materialFilter.isSample,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isSample,
                          !state.materialFilter.isSample,
                        ),
                      );
                },
                title: 'Sample items',
              ),
            if (eligibilityState.poisonMaterialEnabled)
              _ListTileThemeWidget(
                value: state.materialFilter.isPoison,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isPoison,
                          !state.materialFilter.isPoison,
                        ),
                      );
                },
                title: 'Poison',
              ),
          ],
        );
      },
    );
  }
}
