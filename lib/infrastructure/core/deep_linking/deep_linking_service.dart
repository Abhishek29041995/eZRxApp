import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class DeepLinkingService {
  final _appLinks = AppLinks();
  bool _initialLinkHandled = false;
  final _deepLinkStreamController = StreamController<EzrxLink>.broadcast();

  DeepLinkingService();

  Future<StreamSubscription> init() async {
    if (!_initialLinkHandled) {
      // Because init() will be called whenever shipTo changed, this check is to prevent handle
      // the link that open the app more than 1 time
      final initialUri = await _appLinks.getInitialLink();
      handleDeepLink(initialUri);
      _initialLinkHandled = true;
    }

    return _appLinks.uriLinkStream.listen(handleDeepLink);
  }

  Stream<EzrxLink> get getStream => _deepLinkStreamController.stream;

  void handleDeepLink(Uri? deepLink) {
    if (deepLink != null) {
      _deepLinkStreamController.add(EzrxLink(deepLink.toString()));
    }
  }
}
