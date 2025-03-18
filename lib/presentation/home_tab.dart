import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/widgets/announcement_bottomsheet.dart';
import 'package:ezrxmobile/presentation/widgets/upgrade_alert_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeNavigationTabbar extends StatelessWidget {
  const HomeNavigationTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnouncementBloc, AnnouncementState>(
      listenWhen: (pre, cur) =>
          pre.isLoading != cur.isLoading && !cur.isLoading,
      listener: (context, state) {
        final eliState = context.read<EligibilityBloc>().state;
        if (eliState.haveShipTo &&
            state.canShowSheetHome &&
            context.topRoute.name == HomeTabRoute.name) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            enableDrag: false,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            builder: (_) => AnnouncementBottomSheet(
              maintenanceItem: state.maintenanceItem,
              storageType: StorageType.order,
            ),
          );
        }
      },
      child: BlocConsumer<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            previous.isLoadingCustomerCode != current.isLoadingCustomerCode &&
            !current.isLoadingCustomerCode,
        listener: (context, state) {
          context.read<DeepLinkingBloc>().add(
                const DeepLinkingEvent.initialize(),
              );
        },
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          return UpgradeAlertWrapper(
            child: PopScope(
              canPop: false,
              child: _CustomTabBar(
                routes: _getTabs(state),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  final List<RouteItem> routes;

  const _CustomTabBar({
    required this.routes,
  });

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(
    length: widget.routes.length,
    vsync: this,
  );
  late List<PageRouteInfo> _currentRoutes = widget.routes.routeList;
  late PageRouteInfo _currentPage = _currentRoutes.first;

  @override
  void didUpdateWidget(covariant _CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.routes.routeList, widget.routes.routeList)) {
      tabController.dispose();
      tabController = TabController(
        length: widget.routes.length,
        vsync: this,
      );
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _updatePageViewStack(TabsRouter tabsRouter) {
    if (listEquals(_currentRoutes, widget.routes.routeList)) return;
    _currentRoutes = widget.routes.routeList;
    var newIndex = _currentRoutes.indexWhere((e) => e == _currentPage);
    if (newIndex == -1) {
      newIndex = 0;
    }
    _currentPage = _currentRoutes[newIndex];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tabsRouter.navigate(_currentPage);
      tabController.animateTo(newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: AutoTabsRouter.pageView(
        key: ValueKey(widget.routes.length),
        routes: widget.routes.routeList,
        builder: (context, child, _) {
          final tabsRouter = AutoTabsRouter.of(context);
          tabController.animateTo(tabsRouter.activeIndex);
          _updatePageViewStack(tabsRouter);

          return Column(
            children: [
              Expanded(child: child),
              SafeArea(
                bottom: true,
                top: false,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: ZPColors.extraLightGrey5,
                        offset: Offset(0, -5),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: tabController,
                    key: WidgetKeys.homeTabBar,
                    indicator: _TopIndicator(),
                    dividerColor: Colors.transparent,
                    onTap: (index) {
                      _currentPage = widget.routes.routeList[index];
                      tabsRouter.setActiveIndex(index);
                      trackMixpanelEvent(
                        TrackingEvents.bottomNavBarClicked,
                        props: {
                          TrackingProps.navTab: widget.routes[index].label,
                        },
                      );
                    },
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    padding: const EdgeInsets.only(top: 8.0),
                    labelPadding: EdgeInsets.zero,
                    tabs: widget.routes
                        .map(
                          (item) => Tab(
                            icon: item.icon,
                            text: item.label.tr(),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final paint = Paint()
      ..color = ZPColors.primary
      ..isAntiAlias = true;

    final xPos = offset.dx + cfg.size!.width / 2;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(
          xPos - cfg.size!.width / 2,
          -6,
          xPos + cfg.size!.width / 2,
          2,
        ),
        bottomLeft: const Radius.circular(8.0),
        bottomRight: const Radius.circular(8.0),
      ),
      paint,
    );

    canvas.drawLine(
      Offset(offset.dx + 3, offset.dy),
      Offset(cfg.size!.width + offset.dx - 3, 0),
      paint,
    );
  }
}

List<RouteItem> _getTabs(EligibilityState state) {
  return [
    homeTabRouteItem,
    if (state.user.userCanAccessProducts) productTabRouteItem,
    if (state.user.userCanAccessOrderHistory) ordersTabRouteItem,
    notificationTabRouteItem,
    moreTabRouteItem,
  ];
}

RouteItem homeTabRouteItem = const RouteItem(
  route: HomeTabRoute(),
  icon: Icon(
    Icons.home_outlined,
    key: WidgetKeys.homeTab,
  ),
  label: 'Home',
);

RouteItem productTabRouteItem = const RouteItem(
  route: ProductsTabRoute(),
  icon: Icon(
    Icons.storefront_outlined,
    key: WidgetKeys.productsTab,
  ),
  label: 'Products',
);

RouteItem ordersTabRouteItem = const RouteItem(
  route: OrdersTabRoute(),
  icon: Icon(
    Icons.receipt_long_outlined,
    key: WidgetKeys.ordersTab,
  ),
  label: 'Orders',
);

RouteItem notificationTabRouteItem = RouteItem(
  route: const NotificationTabRoute(),
  icon: BlocBuilder<NotificationBloc, NotificationState>(
    buildWhen: (previous, current) =>
        previous.notificationList.hasUnreadNotification !=
        current.notificationList.hasUnreadNotification,
    builder: (context, state) {
      return Stack(
        children: [
          const Icon(
            Icons.notifications_none_outlined,
            key: WidgetKeys.notificationTab,
          ),
          if (state.notificationList.hasUnreadNotification)
            Positioned(
              right: 3,
              top: 3,
              key: WidgetKeys.notificationBadge,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: ZPColors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      );
    },
  ),
  label: 'Notifications',
);

RouteItem moreTabRouteItem = const RouteItem(
  route: MoreTabRoute(),
  icon: Icon(
    Icons.menu_outlined,
    key: WidgetKeys.moreTab,
  ),
  label: 'More',
);

class RouteItem {
  final PageRouteInfo<dynamic> route;
  final Widget icon;
  final String label;

  const RouteItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}

extension RouteItemListExtension on List<RouteItem> {
  List<PageRouteInfo> get routeList => map((e) => e.route).toList();
}
