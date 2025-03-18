part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  final bool isFixed;

  const _MaterialDetailsSection({
    required this.comboItem,
    required this.comboDealMaterial,
    this.isFixed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            key: WidgetKeys.comboItemImageDetail(
              comboItem.getMaterialNumber.displayMatNo,
            ),
            onTap: () => context.router.push(
              ProductDetailsPageRoute(materialInfo: comboItem.materialInfo),
            ),
            child: _MaterialImageSection(
              comboItem: comboItem,
              isFixed: isFixed,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            comboItem: comboItem,
            comboDealMaterial: comboDealMaterial,
            onTapName: () => context.router.push(
              ProductDetailsPageRoute(materialInfo: comboItem.materialInfo),
            ),
            key: WidgetKeys.comboItemMaterialDetail(
              comboItem.getMaterialNumber.displayMatNo,
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final bool isFixed;

  const _MaterialImageSection({
    required this.comboItem,
    this.isFixed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ProductImageBloc, ProductImageState>(
          buildWhen: (previous, current) =>
              previous.productImageMap != current.productImageMap,
          builder: (context, productImageState) {
            final productImage = productImageState.getMaterialImage(
              comboItem.materialInfo.materialNumber,
            );

            return CustomCard(
              showShadow: false,
              showBorder: true,
              child: CustomImage(
                imageUrl: productImage.image.firstOrNull ?? '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.08,
              ),
            );
          },
        ),
        if (isFixed)
          Container(
            key: WidgetKeys.comboDetailFixedTag,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: ZPColors.warning,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ).copyWith(
                bottomLeft: const Radius.circular(0),
              ),
            ),
            child: Text(
              context.tr('Fixed'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.fixedLabel,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
      ],
    );
  }
}
