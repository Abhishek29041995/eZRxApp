part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnItemsSearchBar extends StatelessWidget {
  const _ReturnItemsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnItemsBloc, ReturnItemsState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: true,
          onSearchChanged: (value) => _search(
            context: context,
            searchKey: value,
          ),
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => _search(
            context: context,
            searchKey: '',
          ),
        );
      },
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) =>
      context.read<ReturnItemsBloc>().add(
            ReturnItemsEvent.fetch(
              appliedFilter:
                  context.read<ReturnItemsBloc>().state.appliedFilter,
              searchKey: SearchKey.search(searchKey),
            ),
          );
}
