part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _SuggestedProductTile extends StatelessWidget {
  final MaterialInfo product;
  final String parentRoute;
  const _SuggestedProductTile({
    required this.product,
    required this.parentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: WidgetKeys.searchedProduct(product.materialNumber.displayMatNo),
          onTap: () {
            trackMixpanelEvent(
              TrackingEvents.productSearch,
              props: {
                TrackingProps.searchKeyword: context
                    .read<ProductSearchBloc>()
                    .state
                    .searchKey
                    .getOrDefaultValue(''),
                TrackingProps.searchFrom:
                    RouterUtils.buildRouteTrackingName(parentRoute),
                TrackingProps.searchMethod: 'drop down list',
              },
            );

            final state = context.read<ProductSearchBloc>().state;
            trackClevertapEvent(
              TrackingEvents.productSearch,
              props: {
                TrackingProps.searchKeyword:
                    state.searchKey.getOrDefaultValue(''),
                TrackingProps.searchFrom:
                    RouterUtils.buildRouteTrackingName(parentRoute),
                TrackingProps.searchMethod: 'user typed',
                TrackingProps.searchResults: state.suggestedProductList
                    .take(5)
                    .map((e) => e.name)
                    .toList(),
                TrackingProps.market: state.salesOrganization.salesOrg.country,
              },
            );

            product.type.typeMaterial
                ? context.router
                    .push(ProductDetailsPageRoute(materialInfo: product))
                : context.router
                    .push(BundleDetailPageRoute(materialInfo: product));
          },
          horizontalTitleGap: 8,
          leading: const Icon(
            Icons.search,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.titleSmall,
            key: WidgetKeys.suggestedProductsTile,
          ),
          trailing: product.isMarketPlace ? const MarketPlaceLogo() : null,
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
