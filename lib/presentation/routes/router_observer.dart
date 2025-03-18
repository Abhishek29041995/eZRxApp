import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/routes/overlay_router.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  final FirebaseAnalyticsService firebaseAnalyticsService;
  final ClevertapService clevertapService;
  final MixpanelService mixpanelService;
  RouterObserver({
    required this.firebaseAnalyticsService,
    required this.mixpanelService,
    required this.clevertapService,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route is OverlayRouter || route is PopupRoute) return;
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'Route',
      screenName: route.settings.name,
    );
    _trackEvent(route.navigator?.context.router.currentPath ?? '');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route is OverlayRouter || route is PopupRoute) return;
    final routeSetting = previousRoute?.settings;
    if (routeSetting is AutoRoutePage) {
      _trackEvent(routeSetting.routeData.path);
    }
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
    _trackEvent(route.path);
  }

  void _trackEvent(String rawRoute) {
    if (rawRoute.isNotEmpty) {
      final pageName = RouterUtils.buildRouteTrackingName(rawRoute);

      mixpanelService.trackEvent(
        eventName: TrackingEvents.pageViewVisited,
        properties: {TrackingProps.pageView: _getPageName(pageName)},
      );

      clevertapService.trackEvent(
        eventName: TrackingEvents.pageViewVisited,
        properties: {TrackingProps.pageView: _getPageName(pageName)},
      );
    }
  }

  String _getPageName(String pageName) {
    switch (pageName) {
      case 'Main Page':
        return 'Home Page';
      default:
        return pageName;
    }
  }
}
