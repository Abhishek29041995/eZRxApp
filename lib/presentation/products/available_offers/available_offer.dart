import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableOffer extends StatelessWidget {
  final MaterialNumber materialNumber;

  const AvailableOffer({super.key, required this.materialNumber});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.materialPrice != current.materialPrice,
      builder: (context, state) {
        final price = state.getPriceForMaterial(materialNumber);

        final bonusMaterialList = price.displayBonusTierAscOrder;
        final productDetailsState = context.read<ProductDetailBloc>().state;

        final eligibilityState = context.read<EligibilityBloc>().state;

        final isMYExternalSalesRepUser =
            eligibilityState.isMYExternalSalesRepUser;

        final displayOffers = productDetailsState.displayOffers(
          isMYExternalSalesRepUser: isMYExternalSalesRepUser,
          bonusMaterialList: bonusMaterialList,
        );

        final showTierPrice = productDetailsState.showTierPrice(
          isMYExternalSalesRepUser: isMYExternalSalesRepUser,
        );

        final isId =
            context.read<EligibilityBloc>().state.salesOrgConfigs.salesOrg.isID;

        if ((!price.isBonusDealEligible && !price.isTireDiscountEligible) ||
            !displayOffers) {
          return const SizedBox.shrink();
        }

        return Column(
          key: WidgetKeys.availableOfferColumnKey,
          children: [
            _AvailableOfferLabel(
              bonusMaterialList: bonusMaterialList,
              priceTiersList: price.tiers.reversed.toList(),
            ),
            if (isId)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 6, bottom: 8),
                child: Text(
                  context.tr(
                    "The offers you get will based on eligibility. You'll know which promo you received after you do check out.",
                  ),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ZPColors.extraLightGrey4,
                      ),
                ),
              ),
            _AvailableOfferScrollList(
              bonusMaterialList: bonusMaterialList,
              priceTiersList: price.tiers.reversed.toList(),
              showTierPrice: showTierPrice,
            ),
          ],
        );
      },
    );
  }
}

class _PriceTierItem extends StatelessWidget {
  const _PriceTierItem({
    required this.priceTierItem,
    required this.left,
    required this.right,
  });

  final PriceTierItem priceTierItem;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: AvailableOfferItem(
        height: MediaQuery.of(context).size.height * 0.15,
        bonusMaterial: BonusMaterial.empty(),
        priceTier: priceTierItem,
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
    );
  }
}

class _BonusLevelItem extends StatelessWidget {
  const _BonusLevelItem({
    required this.bonusMaterial,
    required this.left,
    required this.right,
  });

  final BonusMaterial bonusMaterial;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: AvailableOfferItem(
        height: MediaQuery.of(context).size.height * 0.15,
        bonusMaterial: bonusMaterial,
        priceTier: PriceTierItem.empty(),
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
    );
  }
}

class _AvailableOfferScrollList extends StatelessWidget {
  const _AvailableOfferScrollList({
    required this.bonusMaterialList,
    required this.priceTiersList,
    required this.showTierPrice,
  });
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;
  final bool showTierPrice;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        key: WidgetKeys.availableOfferList,
        children: [
          if (showTierPrice)
            ...priceTiersList.asMap().entries.map((e) {
              final left = e.key == 0 ? 16.0 : 4.0;
              final right = bonusMaterialList.isEmpty &&
                      e.key == priceTiersList.length - 1
                  ? 16.0
                  : 4.0;

              return _PriceTierItem(
                priceTierItem: e.value,
                left: left,
                right: right,
              );
            }),
          ...bonusMaterialList.asMap().entries.map((e) {
            final left = priceTiersList.isEmpty && e.key == 0 ? 16.0 : 4.0;
            final right = e.key == bonusMaterialList.length ? 16.0 : 4.0;

            return _BonusLevelItem(
              bonusMaterial: e.value,
              left: left,
              right: right,
            );
          }),
        ],
      ),
    );
  }
}

class _AvailableOfferLabel extends StatelessWidget {
  const _AvailableOfferLabel({
    required this.bonusMaterialList,
    required this.priceTiersList,
  });

  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      title: Text(
        context.tr('Available offers'),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () => _showOfferDialog(context),
      key: WidgetKeys.availableOffersTile,
    );
  }

  void _showOfferDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (_) => ShowOfferDialogWidget(
        bonusMaterialList: bonusMaterialList,
        priceTiersList: priceTiersList,
        materialInfo: context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .materialInfo,
      ),
    );
  }
}
