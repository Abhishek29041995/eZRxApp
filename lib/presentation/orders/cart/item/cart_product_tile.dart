import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/tender_tag_for_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/cart_product_tender_contract_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/orders/cart/bonus/bonus_items_sheet.dart';

part 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/invalid_material_message.dart';

part 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/cart_material_item_quantity_section.dart';

class CartProductTile extends StatelessWidget {
  final PriceAggregate cartItem;

  const CartProductTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final isOOSNotAllowed =
        !cartItem.inStock && !orderEligibilityState.isOOSAllowedIfPresentInCart;
    final isMWPNotAllowed = cartItem.price.finalPrice.isEmpty &&
        orderEligibilityState.isMWPNotAllowedAndPresentInCart;
    final isSuspended = cartItem.isSuspendedMaterial ||
        cartItem.materialInfo.isPrincipalSuspended;
    final isInvalidCartItem = isSuspended || isOOSNotAllowed || isMWPNotAllowed;

    return CustomCard(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialInfo.materialNumber.displayMatNo,
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        extentRatio: 0.24,
        endActionPaneActions: [
          CustomSlidableAction(
            key: WidgetKeys.cartItemSwipeDeleteButton,
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) {
              context.read<CartBloc>().add(
                    CartEvent.upsertCart(
                      priceAggregate: cartItem.copyWith(quantity: 0),
                    ),
                  );
            },
          ),
        ],
        child: Column(
          children: [
            _MaterialDetailsSection(
              cartItem: cartItem,
              isInvalidCartItem: isInvalidCartItem,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.accentColor,
            ),
            _ItemSubTotalSection(
              cartProduct: cartItem,
            ),
            CartProductTenderContractSection(
              cartItem: cartItem,
            ),
            if (!isInvalidCartItem && cartItem.bonusPriceOverrideEligible) ...[
              const Divider(
                indent: 0,
                endIndent: 0,
                color: ZPColors.accentColor,
              ),
              _BonusPriceCounterSection(
                cartItem: cartItem,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const _MaterialDetailsSection({
    required this.cartItem,
    required this.isInvalidCartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(cartProduct: cartItem),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            cartItem: cartItem,
            isInvalidCartItem: isInvalidCartItem,
          ),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _ItemSubTotalSection({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: ZPColors.darkGray,
        );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  context.tr('Item subtotal:'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
              _LoadingShimmerWithChild(
                child: PriceComponent(
                  key: WidgetKeys.cartItemProductTotalPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartProduct.finalPriceTotalForAllMaterial,
                ),
              ),
            ],
          ),
        ),
        if (cartProduct.showTaxBreakDown)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  context.tr('Total with tax:'),
                  style: txtStyle,
                ),
                _LoadingShimmerWithChild(
                  child: ItemTax(
                    finalPriceTotalWithTax: cartProduct.finalPriceTotalWithTax,
                    itemTax: cartProduct.itemTax,
                    itemTaxPercent: cartProduct.itemTaxPercentPadded,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _LoadingShimmerWithChild extends StatelessWidget {
  const _LoadingShimmerWithChild({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer.withChild(
      enabled: context.read<CartBloc>().state.isMappingPrice ||
          context.read<CartBloc>().state.isUpserting ||
          context.read<CartBloc>().state.isUpdatingStock ||
          context.read<MaterialPriceBloc>().state.isFetching,
      child: child,
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const _MaterialDetails({
    required this.cartItem,
    required this.isInvalidCartItem,
  });

  @override
  Widget build(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: padding6,
            spacing: padding6,
            children: [
              Text(
                cartItem.materialInfo.combinationCode(
                  showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                  showIRNPart: eligibilityState.salesOrgConfigs.enableIRN,
                ),
                key: WidgetKeys.cartItemProductMaterialNumber,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              if (cartItem.materialInfo.isPoison) ProductTag.poison(),
              if (cartItem.materialInfo.isSampleMaterial) ProductTag.sample(),
              if (cartItem.materialInfo.isGimmick) ProductTag.gimmickTag(),
              PreOrderLabel(stockInfo: cartItem.productStockInfo),
            ],
          ),

          Text(
            cartItem.materialInfo.displayDescription,
            key: WidgetKeys.cartItemProductMaterialDescription,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          StockInfoWidget(
            stockInfo: cartItem.stockInfoValid,
            materialInfo: cartItem.materialInfo,
          ),
          Row(
            children: [
              if (cartItem.displayCutOffListPrice) ...[
                PriceComponent(
                  key: WidgetKeys.cartItemCutOffListPrice,
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: cartItem.display(PriceType.listPrice),
                  type: PriceStyle.counterOfferPrice,
                ),
                const SizedBox(width: 4),
              ],
              LoadingShimmer.withChild(
                enabled: cartState.priceUnderLoadingShimmer ||
                    context.read<MaterialPriceBloc>().state.isFetching,
                child: PriceComponent(
                  key: WidgetKeys.cartItemProductUnitPrice,
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: cartItem.display(PriceType.finalPrice),
                  type: PriceStyle.cartMaterialUnitPrice,
                ),
              ),
            ],
          ),
          //todo add promotional info
          if (cartItem.displayPromotionalDiscountForID)
            Text(
              '${cartItem.promotionValue.map(
                    (e) => context.tr(
                      e.message,
                      namedArgs: e.arguments,
                    ),
                  ).join(',')} ${context.tr('offer applied')}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.extraLightGrey4,
                    fontStyle: FontStyle.italic,
                  ),
              key: WidgetKeys.cartPromotions(
                cartItem.getMaterialNumber.getValue(),
              ),
            ),
          if (cartItem.price.isCounterOfferRequested)
            Text(
              context.tr('Requested counter offer'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          GovtListPriceComponent(
            price: cartItem.display(PriceType.listPrice),
          ),
          CartMaterialItemQuantitySection(
            cartItem: cartItem,
            isInvalidCartItem: isInvalidCartItem,
          ),
          if (cartItem.showErrorMessageForID)
            ErrorTextWithIcon(
              textPadding: const EdgeInsets.symmetric(vertical: 2),
              valueText: cartItem.isMaxQtyExceedsForId
                  ? '${context.tr('Maximum order qty')}: ${cartItem.maximumQty}'
                  : '${context.tr('Remaining stock')}: ${cartItem.stockQuantity}',
            ),
          if (cartItem.isMaxQtyExceedsForTender)
            ErrorTextWithIcon(
              valueText: context.tr(
                'Maximum tender qty: {maxQty}',
                namedArgs: {
                  'maxQty': cartItem.tenderContract.remainingTenderQuantity
                      .toString(),
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _BonusPriceCounterSection extends StatelessWidget {
  final PriceAggregate cartItem;

  const _BonusPriceCounterSection({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final isMYPnGSalesRepEligible = eligibilityState.isMYExternalSalesRepUser &&
        cartItem.materialInfo.isPnGPrinciple &&
        cartItem.isEligibleForAdditionalBonus;

    final isBonusOverrideEnable = eligibilityState.isBonusSampleItemVisible &&
        (cartItem.isBonusEligibleForNonMYPnGSalesRep ||
            isMYPnGSalesRepEligible);

    return Padding(
      key: WidgetKeys.bonusPriceOverrideSection,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isBonusOverrideEnable)
            Flexible(
              child: FittedBox(
                child: TextButton.icon(
                  key: WidgetKeys.bonusSampleItemButtonKey,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      constraints: BoxConstraints.loose(
                        Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.80,
                        ),
                      ),
                      builder: (_) {
                        return BonusItemsSheet(cartProduct: cartItem);
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Bonus/sample item'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
              ),
            ),
          if (eligibilityState.isCounterOfferVisible)
            Flexible(
              child: FittedBox(
                child: TextButton.icon(
                  key: WidgetKeys.counterOfferPriceButtonKey,
                  onPressed: () {
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return RequestCounterOfferBottomSheet(
                          cartItem: cartItem,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.swap_horiz_sharp,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Counter offer'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _MaterialImageSection({required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomCard(
              showShadow: false,
              showBorder: true,
              child: CustomImage(
                imageUrl: state
                        .additionInfo[cartProduct.materialInfo.materialNumber]
                        ?.productImages
                        .first
                        .thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            );
          },
        ),
        OfferLabel(
          materialInfo: cartProduct.materialInfo,
          iconOnly: true,
        ),
        if (cartProduct.materialInfo.isFOCMaterial)
          const Positioned(
            bottom: 20,
            child: CovidTag(),
          ),
        if (cartProduct.tenderContract.isNotEmpty)
          Positioned(
            bottom: context.read<MaterialPriceBloc>().state.displayOfferTag(
                      cartProduct.materialInfo,
                      eligibilityState.user,
                    )
                ? 13
                : null,
            child: const TenderTagForProductTile(),
          ),
      ],
    );
  }
}
