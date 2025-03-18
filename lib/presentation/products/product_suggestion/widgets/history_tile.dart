part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _HistoryTile extends StatelessWidget {
  final SearchKey searchKey;
  const _HistoryTile({required this.searchKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: WidgetKeys.searchProductHistory,
          horizontalTitleGap: 8,
          onTap: ()  => context.read<ProductSearchBloc>().add(
                ProductSearchEvent.searchProduct(
                  searchKey: SearchKey.search(
                    searchKey.searchValueOrEmpty,
                  ),
                  materialFilter:
                      context.read<MaterialFilterBloc>().state.materialFilter,
                ),
              ),
          leading: const Icon(
            Icons.history,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            searchKey.searchValueOrEmpty,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: ZPColors.accentColor,
        ),
      ],
    );
  }
}
