import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebViewPlatform extends InAppWebViewPlatform
    with MockPlatformInterfaceMixin {
  @override
  PlatformInAppWebViewWidget createPlatformInAppWebViewWidget(
    PlatformInAppWebViewWidgetCreationParams params,
  ) {
    return MockWebViewWidget.implementation(params);
  }

  @override
  PlatformCookieManager createPlatformCookieManager(
    PlatformCookieManagerCreationParams params,
  ) {
    return MockPlatformCookieManager();
  }

  @override
  PlatformPullToRefreshController createPlatformPullToRefreshController(
    PlatformPullToRefreshControllerCreationParams params,
  ) {
    return MockPullToRefreshController(params);
  }
}

class MockPlatformCookieManager extends Fake implements PlatformCookieManager {
  @override
  Future<bool> deleteAllCookies() async {
    return true;
  }

  @override
  Future<bool> setCookie({
    required WebUri url,
    required String name,
    required String value,
    String path = '/',
    String? domain,
    int? expiresDate,
    int? maxAge,
    bool? isSecure,
    bool? isHttpOnly,
    HTTPCookieSameSitePolicy? sameSite,
    PlatformInAppWebViewController? iosBelow11WebViewController,
    PlatformInAppWebViewController? webViewController,
  }) async {
    return true;
  }
}

class MockWebViewWidget extends PlatformInAppWebViewWidget {
  MockWebViewWidget.implementation(super.params) : super.implementation();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  T controllerFromPlatform<T>(PlatformInAppWebViewController controller) {
    // TODO: implement controllerFromPlatform
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement params
  PlatformInAppWebViewWidgetCreationParams get params =>
      throw UnimplementedError();
}

class MockWebViewDependencies {
  Future<void> init() async {
    // Mock webview platform
    final InAppWebViewPlatform mockPlatform = MockWebViewPlatform();

    // Use mock
    InAppWebViewPlatform.instance = mockPlatform;
  }
}

class MockPullToRefreshController extends PlatformPullToRefreshController {
  MockPullToRefreshController(
    super.params,
  ) : super.implementation();
}
