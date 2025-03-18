import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/locator.dart';

void trackClevertapEvent(String eventName, {Map<String, dynamic>? props}) {
  locator<ClevertapService>().trackEvent(
    eventName: eventName,
    properties: props ?? {},
  );
}
