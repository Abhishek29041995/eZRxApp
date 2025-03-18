import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/radio_with_label.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/order_type_banner.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bundle_item/checkout_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_material_item/checkout_material_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/orders/widgets/price_not_available_message.dart';
import 'package:ezrxmobile/presentation/orders/widgets/stock_info_banner.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/checkout_page_app_bar.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/delivery_info.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/request_delivery_date.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bonus_item.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_scroll_list.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/total_items.dart';
part 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/checkout_footer_section.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Map<DeliveryInfoLabel, FocusNode> _focusNodes = {
    DeliveryInfoLabel.poReference: FocusNode(),
    DeliveryInfoLabel.contactPerson: FocusNode(),
    DeliveryInfoLabel.referenceNote: FocusNode(),
    DeliveryInfoLabel.deliveryInstruction: FocusNode(),
    DeliveryInfoLabel.mobileNumber: FocusNode(),
    DeliveryInfoLabel.paymentTerm: FocusNode(),
  };

  @override
  void dispose() {
    for (final element in _focusNodes.entries) {
      element.value.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isCartDetailsFetching != current.isCartDetailsFetching,
      builder: (context, cartState) {
        return Scaffold(
          key: WidgetKeys.checkoutPage,
          appBar: _CheckoutPageAppbar(
            context: context,
            enableOrderType:
                context.read<EligibilityBloc>().state.isShowOrderType,
          ),
          body: Column(
            children: [
              const LicenseExpiredBanner(),
              const StockInfoBanner(),
              Expanded(
                child: CustomScrollView(
                  key: WidgetKeys.scrollList,
                  slivers: [
                    SliverToBoxAdapter(
                      child: AddressInfoSection.greenBackground(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(left: 12, right: 22),
                      sliver: SliverToBoxAdapter(
                        child: PayerInformation(expanded: false),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _DeliveryInfo(focusNodes: _focusNodes),
                    ),
                    if (cartState.cartProducts.containMPMaterial)
                      SliverToBoxAdapter(
                        child: MarketPlaceDeliveryExpansionTile(
                          sellers: cartState
                              .cartProducts.mpMaterialOnly.manufacturers,
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
                    const SliverToBoxAdapter(child: _TotalItems()),
                    const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
                    _ProductScrollList(
                      listItems: cartState.cartProducts.zpMaterialOnly,
                    ),
                    if (cartState.cartProducts.mpMaterialOnly.isNotEmpty)
                      SliverToBoxAdapter(
                        child: _DividerAndMarketPlaceTitle(
                          showDivider:
                              cartState.cartProducts.zpMaterialOnly.isNotEmpty,
                        ),
                      ),
                    _ProductScrollList(
                      listItems: cartState.cartProducts.mpMaterialOnly,
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                    const SliverToBoxAdapter(
                      child: Divider(
                        indent: 0,
                        thickness: 1,
                        endIndent: 0,
                        height: 1,
                        color: ZPColors.extraLightGrey2,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: PriceSummarySection(
                          cartState: cartState,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
                  ],
                ),
              ),
              _CheckoutFooterSection(
                cartState: cartState,
                focusNode: _focusNodes,
              ),
            ],
          ),
        );
      },
    );
  }
}
