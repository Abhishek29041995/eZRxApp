import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/widgets/bonus_items_sheet_footer.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/scroll_list.dart';

import 'package:ezrxmobile/presentation/core/no_record.dart';

import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/orders/cart/bonus/widgets/bonus_material_tile.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'package:ezrxmobile/presentation/orders/cart/bonus/widgets/bonus_item_search_bar.dart';

class BonusItemsSheet extends StatelessWidget {
  final PriceAggregate cartProduct;
  const BonusItemsSheet({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BonusMaterialBloc>(
      create: (context) => locator<BonusMaterialBloc>(),
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) =>
            previous.isUpserting != current.isUpserting,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {
              if (!state.isUpserting) {
                context.read<BonusMaterialBloc>().add(
                      BonusMaterialEvent.updateAddedBonusItems(
                        addedBonusItemList:
                            state.getNewlyAddedBonusItems(cartProduct),
                      ),
                    );

                CustomSnackBar(
                  messageText: context.tr('Bonus/sample added to cart'),
                ).show(context);
                context.read<CartBloc>().add(
                      CartEvent.getDetailsProductsAddedToCart(
                        cartProducts:
                            context.read<CartBloc>().state.cartProducts,
                      ),
                    );
              }
            },
            (either) => {},
          );
        },
        buildWhen: (previous, current) =>
            previous.isUpserting != current.isUpserting && !current.isUpserting,
        builder: (context, state) => Padding(
          key: WidgetKeys.bonusSampleSheet,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Add bonus/sample item'.tr(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: ZPColors.primary,
                      ),
                ),
              ),
              _BonusItemSearchBar(cartItem: cartProduct),
              const _BonusQuantityEmptyWarning(),
              _BodyContent(cartProduct: state.findItemById(cartProduct.id)),
              const BonusItemsSheetFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _BodyContent({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BonusMaterialBloc, BonusMaterialState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) => {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              context.read<ProductImageBloc>().add(
                    ProductImageEvent.fetch(
                      list: state.bonusItemList,
                    ),
                  );
            },
          ),
        ),
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.bonusItemList != current.bonusItemList,
      builder: (context, state) {
        return Expanded(
          child: state.isFetching && state.bonusItemList.isEmpty
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : ScrollList<MaterialInfo>(
                  noRecordFoundWidget: const NoRecordFound(
                    title: 'Looks like you don’t have any bonus/sample items',
                    subTitle:
                        'Try adjusting the search or another product from cart',
                    svgImage: SvgImage.emptyBox,
                  ),
                  dismissOnDrag: true,
                  controller: ScrollController(),
                  onRefresh: () => context.read<BonusMaterialBloc>().add(
                        BonusMaterialEvent.fetch(
                          salesOrganisation: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrganisation,
                          configs: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          customerCodeInfo: context
                              .read<EligibilityBloc>()
                              .state
                              .customerCodeInfo,
                          shipToInfo:
                              context.read<EligibilityBloc>().state.shipToInfo,
                          principalData: cartProduct.materialInfo.principalData,
                          user: context.read<EligibilityBloc>().state.user,
                          isGimmickMaterialEnabled: context
                              .read<EligibilityBloc>()
                              .state
                              .gimmickMaterialEnabled,
                          searchKey: SearchKey.empty(),
                        ),
                      ),
                  onLoadingMore: () => context.read<BonusMaterialBloc>().add(
                        BonusMaterialEvent.loadMoreBonusItem(
                          salesOrganisation: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrganisation,
                          configs: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          customerCodeInfo: context
                              .read<EligibilityBloc>()
                              .state
                              .customerCodeInfo,
                          shipToInfo:
                              context.read<EligibilityBloc>().state.shipToInfo,
                          principalData: cartProduct.materialInfo.principalData,
                          user: context.read<EligibilityBloc>().state.user,
                          isGimmickMaterialEnabled: context
                              .read<EligibilityBloc>()
                              .state
                              .gimmickMaterialEnabled,
                        ),
                      ),
                  isLoading: state.isFetching,
                  itemBuilder: (context, index, item) => BonusMaterialTile(
                    bonusMaterial: item,
                    cartProduct: cartProduct,
                  ),
                  items: state.bonusItemList,
                ),
        );
      },
    );
  }
}

class _BonusQuantityEmptyWarning extends StatelessWidget {
  const _BonusQuantityEmptyWarning();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
      buildWhen: (previous, current) =>
          previous.isBonusQtyValidated != current.isBonusQtyValidated,
      builder: (context, state) {
        return !state.isBonusQtyValidated
            ? Container(
                key: WidgetKeys.bonusSampleSheetEmptyQtyWarning,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: ZPColors.lightRedStatusColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  context.tr('Please enter quantity to add bonus/sample.'),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
