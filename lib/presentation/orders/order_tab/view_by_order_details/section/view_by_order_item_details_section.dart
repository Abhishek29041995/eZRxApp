import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_common_tile.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_history_stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    super.key,
    required this.viewByOrderHistoryGroupList,
    this.isMarketPlace = false,
  });
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;
  final bool isMarketPlace;

  @override
  Widget build(BuildContext context) {
    if (viewByOrderHistoryGroupList.isEmpty) return const SizedBox.shrink();

    return Padding(
      key: WidgetKeys.viewByOrderDetailItemsSection,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: viewByOrderHistoryGroupList
            .map(
              (e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  if (!isMarketPlace) ...[
                    Text(
                      e.principalName.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                  ...e.viewByOrderItem.map(
                    (item) => _OrderItemTile(
                      orderItem: item,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _OrderItemTile extends StatelessWidget {
  final OrderHistoryDetailsOrderItem orderItem;

  const _OrderItemTile({
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final salesOrgConfig = eligibilityState.salesOrgConfigs;
    final isIDMarket = eligibilityState.salesOrganisation.salesOrg.isID;
    final orderHistoryDetails =
        context.read<ViewByOrderDetailsBloc>().state.orderHistoryDetails;

    return OrderItemCommonTile(
      onTap: () => _goToViewByItemDetail(
        context,
        orderHistoryDetails.orderNumber,
        orderItem.lineNumber,
      ),
      key: WidgetKeys.viewByOrderDetailItem(
        orderItem.materialNumber.displayMatNo,
        orderItem.isBonus,
      ),
      batchExpiryDate: OrderHistoryStockInfo.viewByOrder(
        eligibilityState: eligibilityState,
        item: orderItem,
      ),
      label: orderItem.combinationCode(
        showGMCPart: salesOrgConfig.enableGMC,
        showIRNPart: salesOrgConfig.enableIRN,
      ),
      tenderContractSection:
          orderItem.orderItemTenderContract.tenderOrderReason.isEmpty
              ? const SizedBox.shrink()
              : TenderContractSection(
                  tenderContract: orderItem.orderItemTenderContract,
                ),
      materialDescription: orderItem.defaultMaterialDescription,
      priceComponentSubtitle: orderItem.isBonus
          ? const SizedBox.shrink()
          : Wrap(
              children: [
                if (salesOrgConfig.enableListPrice &&
                    orderItem.showMaterialListPrice)
                  PriceComponent(
                    key: WidgetKeys.materialListPriceStrikeThrough,
                    salesOrgConfig: salesOrgConfig,
                    price: orderItem.getListPrice.toString(),
                    type: PriceStyle.materialListPriceStrikeThrough,
                  ),
                OrderItemPrice(
                  unitPrice: orderItem.itemUnitPrice(
                    isIDMarket,
                  ),
                  originPrice: orderItem.originPrice.toString(),
                  showPreviousPrice: false,
                  hidePrice: orderItem.hidePrice,
                ),
              ],
            ),
      statusWidget: isIDMarket
          ? const SizedBox.shrink()
          : StatusLabel(
              status: StatusType(
                orderItem.sAPStatus.displayOrderStatus,
              ),
            ),
      quantity: '',
      materialNumber: orderItem.materialNumber,
      isCovidItem: orderItem.isCovid,
      showOfferTag: orderItem.showOfferTag,
      statusTag: isIDMarket ? StatusType('') : orderItem.orderDetailBonusTag,
      footerWidget: QuantityAndPriceWithTax.order(
        quantity: orderItem.qty,
        quantityDescription: isIDMarket
            ? '${orderItem.pickedQuantity} ${context.tr('of')} ${orderItem.qty} ${context.tr('stocks fulfilled')}'
            : '',
        netPrice: orderItem.itemNetPrice(
          isIDMarket,
        ),
        taxValue: orderItem.totalTax,
        totalPrice: orderItem.totalPrice,
        taxPercentage: orderItem.taxRate,
        isTopAlignment: true,
      ),
      showTenderTag: orderItem
          .orderItemTenderContract.contractNumber.isContractNumberNotEmpty,
    );
  }

  Future _goToViewByItemDetail(
    BuildContext context,
    OrderNumber orderNumber,
    LineNumber lineNumber,
  ) async {
    trackMixpanelEvent(
      TrackingEvents.orderDetailViewed,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderNumber,
            lineNumber: lineNumber,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
