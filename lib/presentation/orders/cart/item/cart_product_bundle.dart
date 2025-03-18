import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_bundle_item_quantity_section.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBundle extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductBundle({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        key: WidgetKeys.cartItemBundleTile(cartItem.bundle.bundleCode),
        extentRatio: 0.24,
        endActionPaneActions: [
          CustomSlidableAction(
            key: WidgetKeys.cartItemSwipeDeleteButton,
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) {
              context.read<CartBloc>().add(
                    CartEvent.upsertCart(
                      priceAggregate: cartItem.copyWith(
                        quantity: 0,
                      ),
                    ),
                  );
            },
          ),
        ],
        borderRadius: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTag.bundleOffer(),
            _BundleDetailsSection(
              cartItem: cartItem,
            ),
            _AllMaterialItem(
              cartItem: cartItem,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.extraLightGrey3,
            ),
            _BundleSubTotalSection(cartProduct: cartItem),
          ],
        ),
      ),
    );
  }
}

class _BundleDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _BundleDetailsSection({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final currentBundle = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(cartItem.bundle.bundleCode))
        .bundle;
    final currentBundleOffer = currentBundle.currentBundleInfo;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(
                cartItem.bundle.bundleCode,
                key: WidgetKeys.cartItemBundleNumber,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              Text(
                '${context.tr('Total quantity')}: ${currentBundle.totalQty}',
                key: WidgetKeys.cartItemBundleQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
            ],
          ),
          if (!cartItem.isBundleMinimumQuantitySatisfies)
            ErrorTextWithIcon(
              textPadding: const EdgeInsets.symmetric(vertical: 2),
              valueText: context.tr(
                'Minimum total purchase qty: ${cartItem.bundle.minimumQuantityBundleMaterial.quantity}',
              ),
            ),
          RichText(
            key: WidgetKeys.cartItemBundleName,
            text: TextSpan(
              children: [
                if (cartItem.materialInfo.isMarketPlace) ...[
                  WidgetSpan(
                    child: MarketPlaceLogo.small(),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  const WidgetSpan(child: SizedBox(width: 8)),
                ],
                TextSpan(
                  text: cartItem.bundle.bundleName.name,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (currentBundle.showStrikeThroughPrice)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: currentBundle.minimumQuantityBundleMaterial.rate
                        .toString(),
                    trailingText: context.tr('per item'),
                    type: PriceStyle.bundleListPriceStrikeThrough,
                  ),
                ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: currentBundleOffer.rate.toString(),
                type: PriceStyle.bundleCartPrice,
                trailingText: context.tr('per item'),
                key: WidgetKeys.addBundleRate,
              ),
            ],
          ),
          if (cartItem.isBundleMinimumQuantitySatisfies)
            Text(
              '${context.tr('Purchase')} ${currentBundleOffer.quantity} ${context.tr('or more for')} ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
              key: WidgetKeys.cartItemBundleRate,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.neutralsGrey1,
                    fontStyle: FontStyle.italic,
                  ),
            ),
        ],
      ),
    );
  }
}

class _AllMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const _AllMaterialItem({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItem.bundle.materials
          .map(
            (e) => _MaterialDetailsSection(
              cartItem: e,
              bundle: cartItem.bundle,
            ),
          )
          .toList(),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const _MaterialDetailsSection({
    required this.cartItem,
    required this.bundle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialNumber.displayMatNo,
      ),
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
            bundle: bundle,
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _MaterialImageSection({required this.cartProduct});

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
                imageUrl: state.additionInfo[cartProduct.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const _MaterialDetails({
    required this.cartItem,
    required this.bundle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                cartItem.combinationCode(
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(width: 4),
              PreOrderLabel(stockInfo: cartItem.productStockInfo),
            ],
          ),
          Text(
            cartItem.defaultMaterialDescription,
            key: WidgetKeys.cartItemProductMaterialDescription,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
          StockInfoWidget(
            stockInfo: cartItem.bundleStockInfoValid,
            materialInfo: cartItem,
          ),
          Text(
            cartItem.getManufactured,
            key: WidgetKeys.cartItemProductPrincipalName,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.neutralsGrey1,
            ),
          ),
          CartBundleItemQuantitySection(
            cartItem: cartItem,
            bundle: bundle,
          ),
        ],
      ),
    );
  }
}

class _BundleSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _BundleSubTotalSection({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Bundle subtotal:'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.cartItemBundleTotalPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: context
                .read<CartBloc>()
                .state
                .findItemById(MaterialNumber(cartProduct.bundle.bundleCode))
                .bundle
                .totalPrice
                .toString(),
          ),
        ],
      ),
    );
  }
}
