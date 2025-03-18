import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelService {
  late Mixpanel mixpanel;
  late Config config;

  EZReachBanner banner = EZReachBanner.empty();

  MixpanelService({
    required this.config,
  });

  Future<void> init() async {
    mixpanel = await Mixpanel.init(
      config.mixpanelKey,
      trackAutomaticEvents: true,
      superProperties: {TrackingProps.platform: 'app'},
    );
  }

  void trackEvent({
    required String eventName,
    required Map<String, dynamic>? properties,
  }) {
    mixpanel.track(
      eventName,
      properties: properties,
    );
  }

  void registerSuperProps({
    required String username,
    required String salesOrg,
    required String customerCode,
    required String shipToAddress,
    required String userRole,
    required String market,
    required String currency,
  }) {
    mixpanel.registerSuperProperties({
      TrackingProps.username: username,
      TrackingProps.salesOrg: salesOrg,
      TrackingProps.customerCode: customerCode,
      TrackingProps.shipToAddress: shipToAddress,
      TrackingProps.userRole: userRole,
      TrackingProps.market: market,
      TrackingProps.currency: currency,
      TrackingProps.platform: 'app',
    });
  }

  void onLogout() {
    mixpanel.clearSuperProperties();
    mixpanel.registerSuperProperties({TrackingProps.platform: 'app'});
  }

  void setUser({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String role,
  }) {
    mixpanel.identify(username);
    mixpanel.getPeople().set(
          TrackingProps.username,
          username,
        );
    mixpanel.getPeople().set(
          TrackingProps.firstName,
          firstName,
        );
    mixpanel.getPeople().set(
          TrackingProps.lastName,
          lastName,
        );
    mixpanel.getPeople().set(
          TrackingProps.email,
          email,
        );
    mixpanel.getPeople().set(
          TrackingProps.userRole,
          role,
        );
  }

  void setBannerOrderFlow(EZReachBanner banner) {
    this.banner = banner;
  }

  void resetBannerOrderFlow() {
    banner = EZReachBanner.empty();
  }
}
