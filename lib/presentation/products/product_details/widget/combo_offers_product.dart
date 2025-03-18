import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboOffersProduct extends StatelessWidget {
  final MaterialNumber materialNumber;

  const ComboOffersProduct({
    required this.materialNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialPriceBloc, MaterialPriceState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching &&
          !current.isFetching &&
          context.router.current.path == '/orders/material_details',
      listener: (context, priceState) {
        final eligibilityBloc = context.read<EligibilityBloc>().state;

        final priceComboDeal =
            priceState.materialPrice[materialNumber]?.comboDeal;

        if (eligibilityBloc.salesOrgConfigs.enableComboDeals &&
            priceComboDeal != null) {
          if (priceComboDeal.category.type.isMaterialNumber) {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchMaterialDeal(
                    salesOrganisation: eligibilityBloc.salesOrganisation,
                    customerCodeInfo: eligibilityBloc.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          } else {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchPrincipleGroupDeal(
                    salesOrganisation: eligibilityBloc.salesOrganisation,
                    customerCodeInfo: eligibilityBloc.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          }
        }
      },
      child: BlocBuilder<ComboDealListBloc, ComboDealListState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          final eligibilityState = context.read<EligibilityBloc>().state;
          final materialPriceState = context.read<MaterialPriceBloc>().state;

          final enableComboDeals = eligibilityState.comboDealEligible;

          final priceComboDeal =
              materialPriceState.materialPrice[materialNumber]?.comboDeal;

          final comboDeal = state.getComboDeal(
            comboDealId: priceComboDeal?.id ?? '',
          );

          if (state.isFetching ||
              !enableComboDeals ||
              comboDeal == ComboDeal.empty()) {
            return const SizedBox.shrink();
          }

          return Container(
            key: WidgetKeys.comboOfferSection,
            padding: const EdgeInsets.all(16),
            margin:
                const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ZPColors.comboOffersBorder),
              color: ZPColors.comboOffersBg,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.discount_outlined,
                  color: ZPColors.comboOffersTagColor,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('Combo offers'),
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      context.tr(
                        'Discount up to {percent}% on selected materials',
                        namedArgs: {
                          'percent': comboDeal.displayCombosMaximumDiscount,
                        },
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      key: WidgetKeys.getComboDealButton,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        backgroundColor: ZPColors.comboOffersBg,
                      ),
                      onPressed: () {
                        final overrideQuantity = context
                            .read<CartBloc>()
                            .state
                            .getCurrentComboItemByComboDealId(
                              priceComboDeal?.id ?? '',
                            )
                            .comboMaterialsCurrentQuantity;

                        context.read<ComboDealMaterialDetailBloc>().add(
                              ComboDealMaterialDetailEvent
                                  .cartContainsCurrentCombo(
                                contain: overrideQuantity.isNotEmpty,
                              ),
                            );
                        if (priceComboDeal?.category.type.isMaterialNumber ??
                            false) {
                          context.read<ComboDealMaterialDetailBloc>().add(
                                ComboDealMaterialDetailEvent
                                    .fetchComboDealDetail(
                                  comboDeal: comboDeal,
                                  parentMaterialNumber: materialNumber,
                                  comboMaterialsCurrentQuantity:
                                      overrideQuantity,
                                ),
                              );
                        } else {
                          final productDetailAggregate = context
                              .read<ProductDetailBloc>()
                              .state
                              .productDetailAggregate;
                          final principalCode = productDetailAggregate
                              .materialInfo.principalData.principalCode
                              .getOrDefaultValue('');
                          context.read<ComboDealMaterialDetailBloc>().add(
                                ComboDealMaterialDetailEvent
                                    .fetchComboDealPrincipal(
                                  comboDeal: comboDeal,
                                  parentMaterialNumber: productDetailAggregate
                                      .materialInfo.materialNumber,
                                  principles: [principalCode],
                                  comboMaterialsCurrentQuantity:
                                      overrideQuantity,
                                ),
                              );
                        }

                        context.navigateTo(
                          const ComboDetailPageRoute(),
                        );
                      },
                      child: Text(
                        context.tr('Get combo deal'),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ZPColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
