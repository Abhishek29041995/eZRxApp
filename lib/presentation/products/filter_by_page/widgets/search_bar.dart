part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: true,
          onClear: () => context.read<MaterialFilterBloc>().add(
                const MaterialFilterEvent.updateSearchKey(''),
              ),
          onSearchSubmitted: (value) => context.read<MaterialFilterBloc>().add(
                MaterialFilterEvent.updateSearchKey(value),
              ),
          onSearchChanged: (value) => context.read<MaterialFilterBloc>().add(
                MaterialFilterEvent.updateSearchKey(value),
              ),
          customValidator: (value) => SearchKey.search(value).isValid(),
        );
      },
    );
  }
}
