part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _Covid19FilterChip extends StatelessWidget {
  const _Covid19FilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.canOrderCovidMaterial != current.canOrderCovidMaterial,
      builder: (context, eligibilityState) =>
          eligibilityState.canOrderCovidMaterial
              ? Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: _MaterialTypeFilterChip(
                    label: 'Covid-19',
                    isSelected: currentFilter.isCovidSelected,
                    isFetching: state.isFetching,
                    onTap: () {
                      context.read<MaterialFilterBloc>().add(
                            MaterialFilterEvent.updateSelectedMaterialFilter(
                              MaterialFilterType.isCovidSelected,
                              !currentFilter.isCovidSelected,
                            ),
                          );
                      context.read<MaterialListBloc>().add(
                            MaterialListEvent.fetch(
                              selectedMaterialFilter:
                                  state.selectedMaterialFilter.copyWith(
                                hasAccessToCovidMaterial: true,
                                isCovidSelected: !currentFilter.isCovidSelected,
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
