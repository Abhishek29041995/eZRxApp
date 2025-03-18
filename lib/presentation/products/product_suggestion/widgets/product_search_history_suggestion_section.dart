part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSearchHistorySuggestionSection extends StatelessWidget {
  const _ProductSearchHistorySuggestionSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.productSuggestionHistory != current.productSuggestionHistory,
      builder: (context, state) {
        final searchKeyList = state.productSuggestionHistory.searchKeyList;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('Search History'),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                  ),
                  IconButton(
                    key: WidgetKeys.deleteProductHistory,
                    icon: Icon(
                      Icons.delete_outlined,
                      color: searchKeyList.isNotEmpty
                          ? ZPColors.extraLightGrey4
                          : ZPColors.extraLightGrey2,
                    ),
                    onPressed: searchKeyList.isNotEmpty
                        ? () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              builder: (_) =>
                                  const ClearProductSearchSuggestionHistory(),
                            )
                        : null,
                  ),
                ],
              ),
            ),
            searchKeyList.isNotEmpty
                ? Column(
                    children: searchKeyList.reversed
                        .map(
                          (e) => _HistoryTile(
                            searchKey: e,
                          ),
                        )
                        .toList(),
                  )
                : Text(
                    context.tr('No search history available'),
                    key: WidgetKeys.noProductHistory,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
          ],
        );
      },
    );
  }
}
