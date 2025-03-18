import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_bonus_item_quantity_section.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

class CartProductTileBonus extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;

  const CartProductTileBonus({
    super.key,
    required this.bonusItem,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemBonus(
        cartProduct.materialInfo.materialNumber.displayMatNo,
        bonusItem.materialNumber.displayMatNo,
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        extentRatio: 0.24,
        endActionPaneActions: [
          if (context.read<EligibilityBloc>().state.isBonusSampleItemVisible &&
              cartProduct.bonusPriceOverrideEligible)
            CustomSlidableAction(
              key: WidgetKeys.cartItemSwipeDeleteButtonForBonus,
              label: '',
              icon: Icons.delete_outline,
              onPressed: (v) => context.read<CartBloc>().add(
                    CartEvent.addBonusToCartItem(
                      bonusMaterial: MaterialInfo.empty().copyWith(
                        materialNumber: bonusItem.materialNumber,
                        parentID: cartProduct.materialInfo.materialNumber
                            .getOrDefaultValue(''),
                        quantity: MaterialQty(0),
                        type: bonusItem.type,
                      ),
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                      bonusItemId: bonusItem.itemId,
                    ),
                  ),
            ),
        ],
        borderRadius: 8,
        child: Column(
          children: [
            _MaterialDetailsSection(
              bonusItem: bonusItem,
              cartProduct: cartProduct,
            ),
            const _ItemSubTotalSection(),
          ],
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetailsSection({
    required this.bonusItem,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(
            bonusItem: bonusItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  const _ItemSubTotalSection();

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: eligibilityState.salesOrg.isID
            ? PriceComponent(
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: '0',
              )
            : Text(
                'FREE'.tr(),
                key: WidgetKeys.cartItemBonusFreeLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.textButtonColor,
                    ),
              ),
      ),
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetails({
    required this.bonusItem,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4,
            children: [
              Text(
                bonusItem.combinationCode(
                  showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(width: 4),
              if (eligibilityState.salesOrg.showBonus) ...[
                const BonusTag(),
                const SizedBox(width: 4),
              ],
              PreOrderLabel(
                stockInfo: bonusItem.stockInfo,
              ),
            ],
          ),
          Text(
            bonusItem.materialDescription,
            key: WidgetKeys.cartItemBonusMaterialDescription,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          StockInfoWidget(
            materialInfo: cartProduct.materialInfo,
            stockInfo: bonusItem.stockInfo,
          ),
          CartBonusItemQuantitySection(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _MaterialImageSection({required this.bonusItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomCard(
              showShadow: false,
              showBorder: true,
              child: CustomImage(
                imageUrl: state.additionInfo[bonusItem.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
              ),
            );
          },
        ),
      ],
    );
  }
}
