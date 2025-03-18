part of 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';

class _ProductImageSection extends StatelessWidget {
  final ProductImages productImage;
  const _ProductImageSection({required this.productImage});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate != current.productDetailAggregate ||
          previous.selectedImage != current.selectedImage,
      builder: (context, productDetailState) {
        final materialInfo =
            productDetailState.productDetailAggregate.materialInfo;

        return Column(
          key: WidgetKeys.imageSectionProductDetail,
          children: [
            Stack(
              children: [
                CustomImage(
                  key: WidgetKeys.productImage,
                  imageUrl: productImage.image.isNotEmpty
                      ? productImage.image
                          .elementAt(productDetailState.selectedImageIndex)
                      : '',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width * 414 / 494,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (materialInfo.isMarketPlace)
                        const MarketPlaceRectangleLogo(),
                      const Spacer(),
                      if (productImage.image.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ImageCounter(
                            total: productImage.image.length,
                            selected: productDetailState.selectedImageIndex + 1,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: kToolbarHeight,
                  left: 0,
                  child: SafeArea(
                    child: Column(
                      children: [
                        if (materialInfo.hasValidTenderContract)
                          const TenderTag(),
                        CovidLabel(
                          materialInfo: materialInfo,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: _ProductImages(
                productImage: productImage,
                selected: productDetailState.selectedImageIndex,
                state: productDetailState,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProductImages extends StatelessWidget {
  final ProductImages productImage;
  final int selected;
  final ProductDetailState state;
  const _ProductImages({
    required this.productImage,
    required this.selected,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return !productImage.hasMultipleImage
        ? const SizedBox.shrink()
        : Container(
            key: WidgetKeys.materialDetailsCarousel,
            margin: const EdgeInsets.all(10),
            child: productImage.image.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productImage.image.length,
                    itemBuilder: (context, index) {
                      return _ProductThumbnail(
                        index: index,
                        productImage: productImage,
                        selected: selected,
                      );
                    },
                  )
                : const SizedBox.shrink(),
          );
  }
}

class _ProductThumbnail extends StatelessWidget {
  const _ProductThumbnail({
    required this.productImage,
    required this.selected,
    required this.index,
  });
  final ProductImages productImage;
  final int selected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<ProductDetailBloc>().add(
            ProductDetailEvent.changeImage(index),
          ),
      child: Container(
        key: WidgetKeys.genericKey(
          key: 'selected$index${selected == index}',
        ),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected == index
                ? ZPColors.secondaryMustard
                : ZPColors.extraLightGrey3,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: CustomImage(
          key: WidgetKeys.materialDetailsCarouselImage,
          imageUrl: productImage.image.elementAt(index),
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.05,
          width: Responsive.isLargerThan(
            context,
            Breakpoint.desktop,
          )
              ? MediaQuery.of(context).size.width * 0.08
              : MediaQuery.of(context).size.width * 0.1,
        ),
      ),
    );
  }
}
