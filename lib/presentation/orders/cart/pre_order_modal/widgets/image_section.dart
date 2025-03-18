part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _ImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ImageSection({required this.cartProduct});
  @override
  Widget build(BuildContext context) {
    final defaultHeight = MediaQuery.of(context).size.height * 0.08;
    final defaultWidth = MediaQuery.of(context).size.height * 0.08;

    return Stack(
      children: [
        CustomCard(
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: ProductImage(
            materialNumber: cartProduct.getMaterialNumber,
            height: defaultHeight,
            width: defaultWidth,
          ),
        ),
        if (!cartProduct.materialInfo.type.typeDealOrOverrideBonus)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.011,
            child: OfferLabel(
              materialInfo: cartProduct.materialInfo,
              iconOnly: true,
            ),
          ),
        if (cartProduct.materialInfo.isFOCMaterial)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: const CovidTag(),
          ),
      ],
    );
  }
}
