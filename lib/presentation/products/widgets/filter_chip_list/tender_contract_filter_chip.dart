part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _TenderContractFilterChip extends StatelessWidget {
  const _TenderContractFilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.salesOrgConfigs.enableTenderOrders !=
          current.salesOrgConfigs.enableTenderOrders,
      builder: (context, eligibilityState) =>
          eligibilityState.salesOrgConfigs.enableTenderOrders
              ? Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: _MaterialTypeFilterChip(
                    label: 'Tender contract',
                    isSelected: currentFilter.isTender,
                    isFetching: state.isFetching,
                    onTap: () {
                      context.read<MaterialFilterBloc>().add(
                            MaterialFilterEvent.updateSelectedMaterialFilter(
                              MaterialFilterType.isTender,
                              !currentFilter.isTender,
                            ),
                          );
                      context.read<MaterialListBloc>().add(
                            MaterialListEvent.fetch(
                              selectedMaterialFilter:
                                  state.selectedMaterialFilter.copyWith(
                                isTender: !currentFilter.isTender,
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
