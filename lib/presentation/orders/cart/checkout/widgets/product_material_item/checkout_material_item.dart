import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/tender_tag_for_product_tile.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/cart_product_tender_contract_section.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const CheckoutMaterialItem({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialInfo.materialNumber.displayMatNo,
      ),
      showBorder: true,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          _ProductDetailsSection(
            cartItem: cartItem,
          ),
          _QuantityAndPrice(cartItem: cartItem),
          CartProductTenderContractSection(
            cartItem: cartItem,
            isEditButtonRequired: false,
          ),
        ],
      ),
    );
  }
}

class _ProductDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _ProductDetailsSection({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImageSection(
            cartProduct: cartItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _ProductDetails(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _ProductImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ProductImageSection({required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Stack(
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          child: CustomImage(
            imageUrl: context
                    .read<CartBloc>()
                    .state
                    .additionInfo[cartProduct.materialInfo.materialNumber]
                    ?.productImages
                    .first
                    .thumbNail ??
                '',
            fit: BoxFit.fitHeight,
          ),
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

class _ProductDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _ProductDetails({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final aplPromotions = context.read<CartBloc>().state.aplPromotionLabel(
          cartItem.getMaterialNumber,
        );

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
                key: WidgetKeys.cartItemProductMaterialNumber,
                style: Theme.of(context).textTheme.bodySmall,
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
            style: Theme.of(context).textTheme.labelMedium,
          ),
          StockInfoWidget(
            stockInfo: cartItem.stockInfoValid,
            materialInfo: cartItem.materialInfo,
          ),
          Row(
            key: WidgetKeys.cartItemProductUnitPrice,
            children: [
              if (cartItem.displayCutOffListPrice)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: PriceComponent(
                    key: WidgetKeys.materialListPriceStrikeThrough,
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: cartItem.display(PriceType.listPrice),
                    type: PriceStyle.counterOfferPrice,
                  ),
                ),
              _DisplayMaterialDetails(
                child: PriceComponent(
                  key: WidgetKeys.checkoutItemProductUnitPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.itemUnitPriceForCheckout,
                  type: PriceStyle.cartMaterialUnitPrice,
                ),
              ),
            ],
          ),
          //Promotional Information for ID market from aplSimulatedOrder
          if (aplPromotions.isNotEmpty)
            Text(
              '${aplPromotions.map(
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
              key: WidgetKeys.promotionLabel(
                cartItem.getMaterialNumber.getValue(),
              ),
            ),
          if (cartItem.price.isCounterOfferRequested)
            Text(
              context.tr('Requested counter offer'),
              key: WidgetKeys.cartItemProductCounterOfferLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          GovtListPriceComponent(
            price: cartItem.display(PriceType.listPrice),
          ),
        ],
      ),
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  final PriceAggregate cartItem;
  const _QuantityAndPrice({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous.aplSimulatorOrder != current.aplSimulatorOrder,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DisplayMaterialDetails(
                child: Text(
                  '${context.tr('Qty')}: ${cartItem.quantity}',
                  key: WidgetKeys.cartItemProductQty,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _DisplayMaterialDetails(
                    key: WidgetKeys.cartItemProductTotalPrice,
                    child: PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: cartItem.finalCheckoutTotalForAllMaterial,
                    ),
                  ),
                  if (cartItem.showTaxBreakDown)
                    ItemTax(
                      finalPriceTotalWithTax:
                          cartItem.finalPriceTotalWithTaxForCheckout,
                      itemTax: cartItem.itemTaxForCheckout,
                      itemTaxPercent: cartItem.itemTaxPercentPadded,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DisplayMaterialDetails extends StatelessWidget {
  const _DisplayMaterialDetails({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isCartDetailsFetching != current.isCartDetailsFetching,
      builder: (context, state) {
        if (state.isCartDetailsFetching) {
          return SizedBox(
            width: Responsive.isLargerThan(
              context,
              Breakpoint.desktop,
            )
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width * 0.3,
            child: LoadingShimmer.tile(),
          );
        }

        return child;
      },
    );
  }
}
