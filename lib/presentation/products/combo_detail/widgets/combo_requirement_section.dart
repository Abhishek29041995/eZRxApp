part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboRequirementSection extends StatelessWidget {
  const _ComboRequirementSection();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.comboDetailRequirement,
      showBorder: true,
      showShadow: false,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      backgroundColor: ZPColors.comboOffersBg,
      borderColor: ZPColors.comboRequirementBorder,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Requirement'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.comboRequirementSubTitle,
                ),
          ),
          BlocBuilder<ComboDealMaterialDetailBloc,
              ComboDealMaterialDetailState>(
            buildWhen: (previous, current) =>
                previous.isFetchingComboInfo != current.isFetchingComboInfo,
            builder: (context, state) {
              if (state.isFetchingComboInfo) {
                return SizedBox(
                  key: WidgetKeys.comboRequirementTitleLoading,
                  width: 100,
                  height: 20,
                  child: LoadingShimmer.tile(),
                );
              }

              return Text(
                state.currentDeal.scheme.getRequirementMessage(
                  context,
                  minQty: state.currentDeal.schemeMinimumQtyRequirement,
                  minAmountK5: (state.currentDeal.sortedMinTotalAmountTiers
                              .firstOrNull?.minTotalAmount ??
                          0)
                      .toString(),
                ),
                maxLines: 3,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.comboRequirementTitle,
                    ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            context.tr('Discount on'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.comboRequirementSubTitle,
                ),
          ),
          BlocBuilder<ComboDealMaterialDetailBloc,
              ComboDealMaterialDetailState>(
            buildWhen: (previous, current) =>
                previous.isFetchingComboInfo != current.isFetchingComboInfo,
            builder: (context, state) {
              if (state.isFetchingComboInfo) {
                return SizedBox(
                  key: WidgetKeys.comboRequirementSubTitleLoading,
                  width: 100,
                  height: 20,
                  child: LoadingShimmer.tile(),
                );
              }

              return Text(
                state.currentDeal.scheme.getDiscountOnMessage(context),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.comboRequirementTitle,
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
