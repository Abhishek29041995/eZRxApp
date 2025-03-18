import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/widgets/orders_tab_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/widgets/orders_tab_search_bar.dart';

@RoutePage()
class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.customerBlockOrSuspended != current.customerBlockOrSuspended,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar.ordersTabAppBar(
            key: WidgetKeys.ordersTab,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: padding12),
                  child: Text(
                    context.tr('Orders'),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: ZPColors.white),
                  ),
                ),
                const CustomerCodeSelector(
                  key: WidgetKeys.customerCodeSelector,
                ),
              ],
            ),
            customerBlockedOrSuspended: state.customerBlockOrSuspended,
          ),
          body: Column(
            children: [
              const LicenseExpiredBanner(),
              const EdiUserBanner(),
              AnnouncementWidget(
                currentPath: context.router.currentPath,
              ),
              Expanded(
                child: AutoTabsRouter.tabBar(
                  routes: const [
                    ViewByItemsPageRoute(),
                    ViewByOrdersPageRoute(),
                  ],
                  builder: (context, child, tabController) => Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        tabs: ['View by items', 'View by orders']
                            .map(
                              (e) => Tab(
                                key: Key(e.toLowerCase()),
                                text: context.tr(e),
                              ),
                            )
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(padding12),
                        child: Row(
                          children: [
                            _OrdersTabSearchBar(
                              key: WidgetKeys.ordersTabSearchBarKey,
                              isFromViewByOrder:
                                  context.tabsRouter.current.name ==
                                      ViewByOrdersPageRoute.name,
                            ),
                            _OrdersTabFilter(
                              key: WidgetKeys.ordersTabFilterButtonKey,
                              viewByItem: context.tabsRouter.current.name ==
                                  ViewByItemsPageRoute.name,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: child),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
