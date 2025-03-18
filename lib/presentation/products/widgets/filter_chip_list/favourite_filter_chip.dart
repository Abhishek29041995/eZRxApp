part of 'package:ezrxmobile/presentation/products/widgets/filter_chip_list/filter_value_list.dart';

class _FavouriteFilterChip extends StatelessWidget {
  const _FavouriteFilterChip({
    required this.currentFilter,
    required this.state,
  });

  final MaterialFilter currentFilter;
  final MaterialListState state;

  @override
  Widget build(BuildContext context) {
    return _MaterialTypeFilterChip(
      label: 'Favourites',
      isSelected: currentFilter.isFavourite,
      isFetching: state.isFetching,
      onTap: () {
        context.read<MaterialFilterBloc>().add(
              MaterialFilterEvent.updateSelectedMaterialFilter(
                MaterialFilterType.isFavourite,
                !currentFilter.isFavourite,
              ),
            );
        context.read<MaterialListBloc>().add(
              MaterialListEvent.fetch(
                selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                  isFavourite: !currentFilter.isFavourite,
                ),
              ),
            );
      },
    );
  }
}
