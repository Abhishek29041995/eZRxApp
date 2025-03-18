part of 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';

class _StockQuantity extends StatelessWidget {
  final ProductDetailState state;
  const _StockQuantity({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        LoadingShimmer.withChild(
          enabled: state.isDetailAndStockFetching &&
              state.productDetailAggregate.stockInfo.stockQuantity == 0,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '${state.productDetailAggregate.stockInfo.stockQuantity} ${'Items Available'.tr()}',
              key: WidgetKeys.commonTileItemSubTitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.skyBlueColor,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
