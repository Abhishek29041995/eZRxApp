part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  final VoidCallback onTapName;
  const _MaterialDetails({
    super.key,
    required this.comboItem,
    required this.comboDealMaterial,
    required this.onTapName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      buildWhen: (previous, current) =>
          previous.totalQuantityUnit != current.totalQuantityUnit,
      builder: (context, state) {
        final materialComboRateDisplay =
            comboItem.comboDeal.materialComboRateDisplay(
          materialNumber: comboItem.getMaterialNumber,
          totalQuantityUnit: state.totalQuantityUnit,
          currentTotalAmount: state.originalPriceSelectedItems,
        );

        final materialNextSuffixDiscountRate =
            comboItem.comboDeal.materialNextSuffixDiscountRate(
          materialNumber: comboItem.getMaterialNumber,
          totalQty: state.totalQuantityUnit,
        );

        final canDisplayDiscountTag =
            (comboItem.comboDeal.scheme.displayDiscountedPrice ||
                    comboItem.comboDeal.scheme.displayNextTierDiscount) &&
                materialComboRateDisplay.isNotEmpty;

        final canDisplayNextTierDiscount =
            comboItem.comboDeal.scheme.displayNextTierDiscount &&
                materialNextSuffixDiscountRate.isNotEmpty;

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comboItem.materialInfo.combinationCode(
                  showGMCPart: context
                      .read<EligibilityBloc>()
                      .state
                      .salesOrgConfigs
                      .enableGMC,
                  showIRNPart: context
                      .read<EligibilityBloc>()
                      .state
                      .salesOrgConfigs
                      .enableIRN,
                ),
                maxLines: 2,
                key: WidgetKeys.materialDetailsMaterialNumber,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              if (canDisplayDiscountTag)
                Row(
                  children: [
                    DiscountTagWidget(rateDisplay: materialComboRateDisplay),
                    const SizedBox(
                      width: 4,
                    ),
                    if (canDisplayNextTierDiscount)
                      Expanded(
                        child: Text(
                          key: WidgetKeys.comboDealMaterialItemNextTierDiscount,
                          context.tr(
                            'Next tier {discountRate}% discount',
                            namedArgs: {
                              'discountRate': materialNextSuffixDiscountRate,
                            },
                          ),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: 4),
              InkWell(
                onTap: onTapName,
                child: Text(
                  comboItem.materialInfo.displayDescription,
                  key: WidgetKeys.materialDetailsMaterialDescription,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Text(
                comboItem.materialInfo.getManufactured,
                key: WidgetKeys.manufacturerMaterials,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
              ),
              if (context
                  .read<EligibilityBloc>()
                  .state
                  .salesOrgConfigs
                  .expiryDateDisplay)
                Text(
                  '${context.tr('Expires')}: ${comboItem.stockInfo.expiryDate.dateOrNaString}',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
                ),
              _MaterialPriceSection(
                comboItem: comboItem,
                totalQuantityUnit: state.totalQuantityUnit,
              ),
              _ComboMaterialQuantitySection(
                comboItem: comboItem,
                comboDealMaterial: comboDealMaterial,
              ),
              PreOrderLabel(
                padding: const EdgeInsets.only(top: 8),
                stockInfo: comboItem.stockInfo,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MaterialPriceSection extends StatelessWidget {
  final PriceAggregate comboItem;
  final int totalQuantityUnit;
  const _MaterialPriceSection({
    required this.comboItem,
    required this.totalQuantityUnit,
  });

  @override
  Widget build(BuildContext context) {
    final materialComboRate = comboItem.comboDeal.getMaterialComboRate(
      materialNumber: comboItem.getMaterialNumber,
      totalQuantityUnit: totalQuantityUnit,
    );

    return (comboItem.comboDeal.scheme.displayDiscountedPrice ||
            comboItem.comboDeal.scheme.displayNextTierDiscount)
        ? Row(
            children: [
              if (materialComboRate > 0)
                PriceComponent(
                  key: WidgetKeys.comboMaterialOriginalPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: comboItem.display(PriceType.listPrice),
                  type: PriceStyle.comboOfferPrice,
                ),
              const SizedBox(width: 4),
              PriceComponent(
                key: WidgetKeys.comboMaterialDiscountedPrice,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: comboItem
                    .getComboOfferPriceWithDiscount(
                      comboDealRate: materialComboRate,
                    )
                    .toString(),
                type: PriceStyle.comboOfferPriceDiscounted,
              ),
            ],
          )
        : PriceComponent(
            key: WidgetKeys.comboMaterialDiscountedPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: comboItem.display(PriceType.listPrice),
            type: PriceStyle.comboOfferPriceDiscounted,
          );
  }
}
