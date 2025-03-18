part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailSearchBar extends StatelessWidget {
  const _ComboDetailSearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<ComboDealMaterialDetailBloc,
          ComboDealMaterialDetailState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return CustomSearchBar(
            initialValue: state.searchKey.searchValueOrEmpty,
            hintText: context.tr('Search product or code'),
            enabled: true,
            onSearchChanged: (value) =>
                context.read<ComboDealMaterialDetailBloc>().add(
                      ComboDealMaterialDetailEvent.search(
                        searchKey: SearchKey.search(value),
                      ),
                    ),
            onSearchSubmitted: (value) =>
                context.read<ComboDealMaterialDetailBloc>().add(
                      ComboDealMaterialDetailEvent.search(
                        searchKey: SearchKey.search(value),
                      ),
                    ),
            customValidator: (value) => SearchKey.search(value).isValid(),
            onClear: () => context.read<ComboDealMaterialDetailBloc>().add(
                  const ComboDealMaterialDetailEvent.clearSearch(),
                ),
          );
        },
      ),
    );
  }
}
