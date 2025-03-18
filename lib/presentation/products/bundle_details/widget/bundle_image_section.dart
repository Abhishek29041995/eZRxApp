part of 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart';

class _BundleImageSection extends StatelessWidget {
  const _BundleImageSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate != current.productDetailAggregate ||
          previous.selectedImageIndex != current.selectedImageIndex,
      builder: (context, state) {
        final materialInfo = state.productDetailAggregate.materialInfo;
        final bundleMaterials = materialInfo.bundle.materials;

        final selectedMaterial = bundleMaterials.isNotEmpty
            ? bundleMaterials.elementAt(state.selectedImageIndex)
            : MaterialInfo.empty();

        return Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  key: WidgetKeys.bundleImage,
                  fit: BoxFit.fill,
                  materialNumber: selectedMaterial.materialNumber,
                  height: MediaQuery.of(context).size.width * 414 / 494,
                  width: double.infinity,
                ),
                bundleMaterials.isNotEmpty
                    ? Positioned(
                        bottom: 10,
                        right: 10,
                        child: ImageCounter(
                          total: bundleMaterials.length,
                          selected: state.selectedImageIndex + 1,
                        ),
                      )
                    : const SizedBox.shrink(),
                bundleMaterials.isNotEmpty
                    ? Positioned(
                        bottom: 10,
                        left: 10,
                        right: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (materialInfo.isMarketPlace) ...[
                              const MarketPlaceRectangleLogo(),
                              const SizedBox(height: 4),
                            ],
                            _OutlineText(
                              selectedMaterial.materialNumber.displayMatNo,
                              key: WidgetKeys.bundleMaterialItem(
                                selectedMaterial.materialNumber.displayMatNo,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: ZPColors.darkGray),
                            ),
                            _OutlineText(
                              selectedMaterial.defaultMaterialDescription,
                              style: Theme.of(context).textTheme.labelSmall,
                              key: WidgetKeys.bundleMaterialItemDescription(
                                selectedMaterial.defaultMaterialDescription,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            _BundleImages(
              materialInfo: state.productDetailAggregate.materialInfo,
              selected: state.selectedImageIndex,
            ),
          ],
        );
      },
    );
  }
}

class _BundleImages extends StatelessWidget {
  final MaterialInfo materialInfo;
  final int selected;
  const _BundleImages({
    required this.materialInfo,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final bundleMaterials = materialInfo.bundle.materials;

    if (bundleMaterials.isEmpty) return const SizedBox.shrink();

    return Container(
      key: WidgetKeys.bundleDetailsCarousel,
      margin: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bundleMaterials.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.read<ProductDetailBloc>().add(
                  ProductDetailEvent.changeImage(index),
                ),
            child: Container(
              key: WidgetKeys.genericKey(
                key:
                    'selected${bundleMaterials.elementAt(index).materialNumber.displayMatNo}${selected == index}',
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
              child: ProductImage(
                materialNumber: bundleMaterials.elementAt(index).materialNumber,
                height: MediaQuery.of(context).size.height * 0.05,
                width: Responsive.isLargerThan(context, Breakpoint.desktop)
                    ? MediaQuery.of(context).size.width * 0.08
                    : MediaQuery.of(context).size.width * 0.1,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
