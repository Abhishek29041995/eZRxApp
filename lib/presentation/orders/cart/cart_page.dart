import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/home/widgets/order_type_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/stock_info_banner.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bundle.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/price_not_available_message.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_app_bar.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list_item.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_checkout_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_info_label.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_invalid_items_banner.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_price_not_available_message.dart';
part 'package:ezrxmobile/presentation/orders/cart/delivery_options/cart_page_delivery_options.dart';
part 'package:ezrxmobile/presentation/orders/cart/delivery_options/widget/delivery_option_card.dart';
part 'package:ezrxmobile/presentation/orders/cart/delivery_options/widget/request_delivery_date_picker.dart';
part 'package:ezrxmobile/presentation/orders/cart/delivery_options/widget/urgent_delivery_time_picker.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  final bool isReOrder;
  final DeliveryInfoData? deliveryInfo;

  const CartPage({
    super.key,
    this.isReOrder = false,
    this.deliveryInfo,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var errorMessage = '';

  @override
  void initState() {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.read<OrderEligibilityBloc>().add(
          OrderEligibilityEvent.initialized(
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            salesOrg: eligibilityState.salesOrganisation,
            shipInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );

    final cartProducts = context.read<CartBloc>().state.cartProducts;
    if (cartProducts.isNotEmpty) {
      context.read<CartBloc>().add(
            CartEvent.getDetailsProductsAddedToCart(
              cartProducts: cartProducts,
            ),
          );

      for (final cartProduct in cartProducts) {
        if (cartProduct.materialInfo.type.typeCombo) {
          final priceComboDeal =
              cartProduct.comboMaterials.firstOrNull?.comboDeals ??
                  PriceComboDeal.empty();

          if (priceComboDeal.category.type.isMaterialNumber) {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchMaterialDeal(
                    salesOrganisation: eligibilityState.salesOrganisation,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          } else {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchPrincipleGroupDeal(
                    salesOrganisation: eligibilityState.salesOrganisation,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          }
        }
      }
    }

    if (widget.isReOrder) {
      context.read<PoAttachmentBloc>().add(
            const PoAttachmentEvent.initialized(),
          );

      context.read<AdditionalDetailsBloc>().add(
            AdditionalDetailsEvent.initiateFromHistory(
              config: eligibilityState.salesOrgConfigs,
              data: widget.deliveryInfo ?? DeliveryInfoData.empty(),
            ),
          );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        CustomSnackBar(
          key: WidgetKeys.materialDetailsAddToCartSnackBar,
          messageText: context.tr('Available item(s) added to cart'),
        ).show(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) => current.isRefreshed(previous),
          listener: (context, state) {
            context.read<OrderEligibilityBloc>().add(
                  OrderEligibilityEvent.initialized(
                    configs: state.salesOrgConfigs,
                    customerCodeInfo: state.customerCodeInfo,
                    salesOrg: state.salesOrganisation,
                    shipInfo: state.shipToInfo,
                    user: state.user,
                  ),
                );
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isUpdateProductDetermination !=
                      current.isUpdateProductDetermination &&
                  !current.isUpdateProductDetermination ||
              //updated stock info is needed to determine isProductDeterminationFailed
              previous.isUpdatingStock != current.isUpdatingStock &&
                  !current.isUpdatingStock,
          listener: (context, state) {
            //this will handle the api failure for product determination
            state.updateFailureOrSuccessOption.fold(() {}, (either) {
              either.fold(
                (failure) {
                  context.router.popUntilRouteWithName(CartPageRoute.name);
                  ErrorUtils.handleStockInfoApiFailure(context, failure);
                },
                (_) {},
              );
            });
            //updated stock is needed for determining isProductDeterminationFailed
            //if product determination is failed user will be poped from checkout page to cart page
            if (state.isProductDeterminationFailed &&
                context.router.current.name == CheckoutPageRoute.name) {
              context.router.maybePop();
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching &&
                  !current.isFetching ||
              previous.isUpserting != current.isUpserting &&
                  !current.isUpserting ||
              previous.isBuyAgain != current.isBuyAgain &&
                  !current.isBuyAgain ||
              previous.isFetchingCartProductDetail !=
                      current.isFetchingCartProductDetail &&
                  !current.isFetchingCartProductDetail,
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;
            if (eligibilityState.salesOrgConfigs.enableTenderOrders &&
                state.cartProducts.hasTenderContract) {
              context.read<TenderContractListBloc>().add(
                    TenderContractListEvent.fetch(
                      salesOrganisation: eligibilityState.salesOrganisation,
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                      shipToInfo: eligibilityState.shipToInfo,
                      materialNumbers: state.cartProducts
                          .where(
                            (element) =>
                                element.materialInfo.hasValidTenderContract,
                          )
                          .map((e) => e.materialInfo.materialNumber)
                          .toList(),
                    ),
                  );
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isUpdatingStock != current.isUpdatingStock &&
              !current.isUpdatingStock,
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;
            context.read<MaterialPriceBloc>().add(
                  MaterialPriceEvent.fetchPriceCartProduct(
                    comboDealEligible: eligibilityState.comboDealEligible,
                    products: state.cartProducts
                        .where(
                          (element) => element.materialInfo.type.typeMaterial,
                        )
                        .map((e) => e.materialInfo)
                        .toList(),
                  ),
                );

            final zdp5MaterialList = state.cartProducts
                .where((element) => element.hasZdp5Validation);
            for (final e in zdp5MaterialList) {
              context.read<MaterialPriceBloc>().add(
                    MaterialPriceEvent.fetchPriceForZDP5Materials(
                      materialInfo: e.materialInfo,
                    ),
                  );
            }
          },
        ),
        BlocListener<MaterialPriceBloc, MaterialPriceState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          listener: (context, state) {
            if (!state.isFetching) {
              context.read<CartBloc>().add(
                    CartEvent.updatePriceProduct(
                      priceProducts: state.materialPrice,
                    ),
                  );
              context.read<CartBloc>().add(
                    const CartEvent.fetchGrandTotalPriceForIdMarket(),
                  );
            }
          },
        ),
        BlocListener<TenderContractListBloc, TenderContractListState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            context.read<CartBloc>().add(
                  CartEvent.updateTenderContract(
                    tenderContractList: state.tenderContracts,
                  ),
                );
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.subTotalHidePriceMaterial !=
                      current.subTotalHidePriceMaterial &&
                  !current.isFetchingCartProductDetail ||
              previous.isMappingPrice != current.isMappingPrice &&
                  !current.isMappingPrice ||
              previous.isTenderContractLoading !=
                      current.isTenderContractLoading &&
                  !current.isTenderContractLoading ||
              (previous.isUpserting != current.isUpserting ||
                  previous.isClearing != current.isClearing ||
                  previous.isUpdatingStock != current.isUpdatingStock),
          listener: (context, state) {
            context.read<OrderEligibilityBloc>().add(
                  OrderEligibilityEvent.update(
                    cartItems: state.cartProducts,
                    grandTotal: state.grandTotal,
                    zpSubtotal: state.zpSubtotal,
                    mpSubtotal: state.mpSubtotal,
                    subTotal: state.subTotal,
                  ),
                );

            context.read<OrderEligibilityBloc>().add(
                  const OrderEligibilityEvent.validateOrderEligibility(),
                );
          },
        ),
      ],
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) {
          final upsertCompleted = previous.isUpserting != current.isUpserting &&
              !current.isUpserting;
          final clearCompleted =
              previous.isClearing != current.isClearing && !current.isClearing;
          if (upsertCompleted || clearCompleted) {
            errorMessage = current.deleteSuccessMessage(previous);

            return true;
          }

          return false;
        },
        listener: (context, state) {
          if (state.cartProducts.isEmpty) {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.initialized(
                    config:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                  ),
                );
            context.read<PoAttachmentBloc>().add(
                  const PoAttachmentEvent.initialized(),
                );
          }

          if (context.routeData.isActive && errorMessage.isNotEmpty) {
            CustomSnackBar(
              messageText: context.tr(errorMessage),
            ).show(context);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final eligiblityState = context.read<EligibilityBloc>().state;

          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              key: WidgetKeys.cartPage,
              appBar: _CartPageAppBar(
                context: context,
                state: state,
                enableOrderType: eligiblityState.isShowOrderType,
                isCustomerBlocked: eligiblityState.customerBlockOrSuspended,
              ),
              body: Column(
                children: [
                  const LicenseExpiredBanner(),
                  const EdiUserBanner(),
                  const StockInfoBanner(),
                  AnnouncementWidget(
                    currentPath: context.router.currentPath,
                  ),
                  if (!state.priceUnderLoadingShimmer)
                    const _CartPageInvalidItemsBanner(),
                  const Expanded(child: _CartPageCartScrollList()),
                  if (state.cartProducts.isNotEmpty)
                    const _CartPageCheckoutSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
