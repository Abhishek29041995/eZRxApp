part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _GimmickFilterChip extends StatelessWidget {
  const _GimmickFilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.gimmickMaterialEnabled != current.gimmickMaterialEnabled,
      builder: (context, eligibilityState) =>
          eligibilityState.gimmickMaterialEnabled
              ? Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: _MaterialTypeFilterChip(
                    label: 'Gimmick',
                    isSelected: currentFilter.isGimmick,
                    isFetching: state.isFetching,
                    onTap: () {
                      context.read<MaterialFilterBloc>().add(
                            MaterialFilterEvent.updateSelectedMaterialFilter(
                              MaterialFilterType.isGimmick,
                              !currentFilter.isGimmick,
                            ),
                          );
                      context.read<MaterialListBloc>().add(
                            MaterialListEvent.fetch(
                              selectedMaterialFilter:
                                  state.selectedMaterialFilter.copyWith(
                                isGimmick: !currentFilter.isGimmick,
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
