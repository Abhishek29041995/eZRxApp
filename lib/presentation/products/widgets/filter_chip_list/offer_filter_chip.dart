part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _OfferFilterChip extends StatelessWidget {
  const _OfferFilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.salesOrgConfigs.disablePromotion !=
          current.salesOrgConfigs.disablePromotion,
      builder: (context, eligibilityState) =>
          !eligibilityState.salesOrgConfigs.disablePromotion
              ? Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: _MaterialTypeFilterChip(
                    label: 'Offers',
                    isSelected: currentFilter.isProductOffer,
                    isFetching: state.isFetching,
                    onTap: () {
                      context.read<MaterialFilterBloc>().add(
                            MaterialFilterEvent.updateSelectedMaterialFilter(
                              MaterialFilterType.productOffers,
                              !currentFilter.isProductOffer,
                            ),
                          );
                      context.read<MaterialListBloc>().add(
                            MaterialListEvent.fetch(
                              selectedMaterialFilter:
                                  state.selectedMaterialFilter.copyWith(
                                isProductOffer: !currentFilter.isProductOffer,
                              ),
                            ),
                          );
                    },
                  ),
                )
              : const SizedBox(),
    );
  }
}
