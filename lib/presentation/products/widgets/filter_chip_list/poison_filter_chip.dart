part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _PoisonFilterChip extends StatelessWidget {
  const _PoisonFilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.poisonMaterialEnabled != current.poisonMaterialEnabled,
      builder: (context, eligibilityState) =>
          eligibilityState.poisonMaterialEnabled
              ? Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: _MaterialTypeFilterChip(
                    label: 'Poison',
                    isSelected: currentFilter.isPoison,
                    isFetching: state.isFetching,
                    onTap: () {
                      context.read<MaterialFilterBloc>().add(
                            MaterialFilterEvent.updateSelectedMaterialFilter(
                              MaterialFilterType.isPoison,
                              !currentFilter.isPoison,
                            ),
                          );
                      context.read<MaterialListBloc>().add(
                            MaterialListEvent.fetch(
                              selectedMaterialFilter:
                                  state.selectedMaterialFilter.copyWith(
                                isPoison: !currentFilter.isPoison,
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
