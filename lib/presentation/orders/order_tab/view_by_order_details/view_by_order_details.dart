import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_status_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/view_by_details_page.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_status_tracker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_bundle_item_details_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/order_history_item_tab.dart';

@RoutePage()
class ViewByOrderDetailsPage extends StatelessWidget {
  const ViewByOrderDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.isFetchingInvoices != current.isFetchingInvoices,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar.commonAppBar(
            title: Text(context.tr('Order Details')),
            customerBlockedOrSuspended:
                eligibilityState.customerBlockOrSuspended,
          ),
          body: state.isLoading
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : ViewByDetailPage(
                  header: _OrderInformation(
                    state: state,
                  ),
                  invoiceDetailResponse: state.invoiceDetail,
                  isInvoiceLoading: state.isFetchingInvoices,
                  onLoadMoreInvoices: () => context
                      .read<ViewByOrderDetailsBloc>()
                      .add(const ViewByOrderDetailsEvent.loadMoreInvoices()),
                  orderItemHistoryTab: const _OrderHistoryItemTab(),
                  totalOrderItemsDisplay: state
                      .orderHistoryDetails.orderHistoryDetailsOrderItem.length,
                ),
          bottomNavigationBar: state.displayBuyAgainButton && !state.isLoading
              ? BlocProvider(
                  create: (context) => locator<ReOrderPermissionBloc>()
                    ..add(
                      ReOrderPermissionEvent.initialized(
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        shipToInfo: eligibilityState.shipToInfo,
                        salesOrganisation: eligibilityState.salesOrganisation,
                        salesOrganisationConfigs:
                            eligibilityState.salesOrgConfigs,
                        user: eligibilityState.user,
                      ),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BuyAgainButton(
                      viewByOrderHistoryItem: state.orderHistoryDetails,
                      key: WidgetKeys.viewByOrderBuyAgainButtonKey,
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}

class _OrderInformation extends StatelessWidget {
  final ViewByOrderDetailsState state;
  const _OrderInformation({required this.state});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Column(
      children: [
        const LicenseExpiredBanner(),
        const EdiUserBanner(),
        const OrderHeaderSection(),
        if (eligibilityState.salesOrg.isID)
          _ViewByOrderStatusTracker(
            orderHistoryDetails: state.orderHistoryDetails,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: AddressInfoSection.order(),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          thickness: 2.5,
          color: ZPColors.lightGray2,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: PayerInformation(
            expanded: false,
          ),
        ),
        const OrderSummarySection(),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          thickness: 2.5,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}
