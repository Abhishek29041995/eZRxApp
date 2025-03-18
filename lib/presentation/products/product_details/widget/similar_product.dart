import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_card.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
              current.productDetailAggregate.similarProduct ||
          previous.isRelatedProductsFetching !=
              current.isRelatedProductsFetching,
      builder: (context, state) {
        if (!state.showRelatedItemsSection) {
          return const SizedBox.shrink();
        }

        return Column(
          key: WidgetKeys.materialDetailsSimilarProductsSection,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Text(
                context.tr('Related products'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(
              height: 300,
              child: state.showRelatedItemsLoading
                  ? const ProductLoadingShimmer()
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.productDetailAggregate.similarProduct
                          .map(
                            (e) => ProductCard(
                              material: e,
                              widgetKey:
                                  WidgetKeys.materialDetailsSimilarProductItem,
                              section: 'Related products',
                              isSimilarProduct: true,
                              onFavouriteTap: () => context
                                  .read<ProductDetailBloc>()
                                  .add(
                                    e.isFavourite
                                        ? ProductDetailEvent.deleteFavourite(
                                            materialNumber: e.materialNumber,
                                            isForSimilarProduct: true,
                                          )
                                        : ProductDetailEvent.addFavourite(
                                            materialNumber: e.materialNumber,
                                            isForSimilarProduct: true,
                                          ),
                                  ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        );
      },
    );
  }
}
