import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo_item.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_next_deal_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

part 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/delete_combo_deals_bottom_sheet.dart';

class CartProductCombo extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool canEditable;
  const CartProductCombo({
    super.key,
    required this.cartItem,
    this.canEditable = false,
  });

  ComboDealScheme get _comboScheme =>
      cartItem.comboMaterials.firstOrNull?.getScheme(cartItem.comboMaterials) ??
      ComboDealScheme.k1;

  PriceComboDeal get _priceComboDeal =>
      cartItem.comboMaterials.firstOrNull?.comboDeals ?? PriceComboDeal.empty();

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig = context.read<EligibilityBloc>().state;

    return CustomCard(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        extentRatio: 0.24,
        key: WidgetKeys.cartItemComboTile(_priceComboDeal.id),
        endActionPaneActions: canEditable
            ? [
                CustomSlidableAction(
                  key: WidgetKeys.cartItemSwipeDeleteButton,
                  label: '',
                  icon: Icons.delete_outline,
                  onPressed: (v) => _showDeleteComboBottomSheet(
                    context,
                    cartItem: cartItem,
                  ),
                ),
              ]
            : [],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                ProductTag.comboOffer(),
                const Spacer(),
                if (canEditable) ...[
                  if (salesOrgConfig.comboDealEligible)
                    TextButton.icon(
                      key: WidgetKeys.cartItemEditCombo(_priceComboDeal.id),
                      onPressed: () {
                        final comboDeal = context
                            .read<ComboDealListBloc>()
                            .state
                            .getComboDeal(comboDealId: _priceComboDeal.id);
                        final comboDealDetailBloc =
                            context.read<ComboDealMaterialDetailBloc>();

                        comboDealDetailBloc.add(
                          ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                            contain: cartItem
                                .comboMaterialsCurrentQuantity.isNotEmpty,
                          ),
                        );

                        if (_priceComboDeal.category.type.isMaterialNumber) {
                          comboDealDetailBloc.add(
                            ComboDealMaterialDetailEvent.fetchComboDealDetail(
                              comboDeal: comboDeal,
                              parentMaterialNumber: MaterialNumber(
                                cartItem.comboMaterials.firstOrNull?.parentId ??
                                    '',
                              ),
                              comboMaterialsCurrentQuantity:
                                  cartItem.comboMaterialsCurrentQuantity,
                            ),
                          );
                        } else {
                          final principalCode = cartItem.comboMaterials
                                  .firstOrNull?.principalData.principalCode
                                  .getOrDefaultValue('') ??
                              '';

                          comboDealDetailBloc.add(
                            ComboDealMaterialDetailEvent
                                .fetchComboDealPrincipal(
                              comboDeal: comboDeal,
                              principles: [principalCode],
                              parentMaterialNumber:
                                  cartItem.materialInfo.materialNumber,
                              comboMaterialsCurrentQuantity:
                                  cartItem.comboMaterialsCurrentQuantity,
                            ),
                          );
                        }

                        context.navigateTo(
                          const ComboDetailPageRoute(),
                        );
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: ZPColors.extraDarkGreen,
                      ),
                      label: Text(
                        context.tr('Edit'),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: ZPColors.extraDarkGreen),
                      ),
                    ),
                  const SizedBox(width: 10),
                  TextButton.icon(
                    key: WidgetKeys.cartItemDeleteCombo(_priceComboDeal.id),
                    onPressed: () => _showDeleteComboBottomSheet(
                      context,
                      cartItem: cartItem,
                    ),
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: ZPColors.extraDarkGreen,
                    ),
                    label: Text(
                      context.tr('Delete'),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: ZPColors.extraDarkGreen),
                    ),
                  ),
                ],
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(
                      _comboScheme.comboDealTitleAppbar,
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    _comboScheme.getRequirementMessage(
                      context,
                      minAmountK5: _getMinAmountComboDealK5(context),
                      minQty: _getMinQtyComboDeal(context),
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                        ),
                  ),
                  if (!salesOrgConfig.comboDealEligible)
                    ErrorTextWithIcon(
                      valueText: context.tr('Combo suspended'),
                    ),
                  const SizedBox(height: 8),
                  ...cartItem.comboMaterials.map(
                    (e) => CartProductComboItem(
                      key: WidgetKeys.cartItemProductTile(
                        e.materialInfo.materialNumber.displayMatNo,
                      ),
                      comboMaterialItem: e,
                      comboScheme: _comboScheme,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.accentColor,
            ),
            _ComboSubTotalSection(
              cartProduct: cartItem,
              comboScheme: _comboScheme,
              priceComboDeal: _priceComboDeal,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _getMinAmountComboDealK5(BuildContext context) {
    return (context
                .read<ComboDealListBloc>()
                .state
                .getComboDeal(
                  comboDealId: _priceComboDeal.id,
                )
                .sortedMinTotalAmountTiers
                .firstOrNull
                ?.minTotalAmount ??
            0)
        .toString();
  }

  String _getMinQtyComboDeal(BuildContext context) {
    return context
        .read<ComboDealListBloc>()
        .state
        .getComboDeal(comboDealId: _priceComboDeal.id)
        .schemeMinimumQtyRequirement;
  }

  void _showDeleteComboBottomSheet(
    BuildContext context, {
    required PriceAggregate cartItem,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => DeleteComboDealBottomSheet(
        cartItem: cartItem,
      ),
    );
  }
}

class _ComboSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  final ComboDealScheme comboScheme;
  final PriceComboDeal priceComboDeal;

  const _ComboSubTotalSection({
    required this.cartProduct,
    required this.comboScheme,
    required this.priceComboDeal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (comboScheme.displayOriginalPrice)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(
                    '{percent}% Discount',
                    namedArgs: {
                      'percent': cartProduct
                              .comboMaterials.firstOrNull?.comboRateDisplay ??
                          '',
                    },
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ZPColors.discountedTotalTitle,
                      ),
                ),
                PriceComponent(
                  key: WidgetKeys.grandTotalKey,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartProduct.comboOriginalSubTotal.toString(),
                  type: PriceStyle.comboOfferPrice,
                  priceLabelStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.darkerGrey,
                          ),
                ),
              ],
            ),
          if (comboScheme.displayNextTierDiscount)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(
                    'Total {qty} items',
                    namedArgs: {
                      'qty': cartProduct.comboMaterials
                          .fold<int>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.quantity,
                          )
                          .toString(),
                    },
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ZPColors.changePasswordRecommendationColor,
                      ),
                ),
                PriceComponent(
                  key: WidgetKeys.grandTotalKey,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartProduct.comboOriginalSubTotal.toString(),
                  type: PriceStyle.comboOfferPrice,
                  priceLabelStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.darkerGrey,
                          ),
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('Combo subtotal (excl. tax):'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ZPColors.darkGray,
                    ),
              ),
              PriceComponent(
                key: WidgetKeys.cartItemComboTotalPrice,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: cartProduct.comboSubTotalExclTax.toString(),
                type: PriceStyle.comboSubTotalExclTax,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: BlocBuilder<ComboDealListBloc, ComboDealListState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                return ComboDetailNextDealInfo(
                  totalQty: cartProduct.totalComboQuantity,
                  comboDeal: state.getComboDeal(
                    comboDealId: priceComboDeal.id,
                  ),
                  totalAmount: cartProduct.comboOriginalSubTotal,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
