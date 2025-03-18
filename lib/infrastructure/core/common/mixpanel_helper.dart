import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';

void trackMixpanelEvent(String eventName, {Map<String, dynamic>? props}) {
  locator<MixpanelService>().trackEvent(
    eventName: eventName,
    properties: props,
  );
}
