import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../core/common.dart';
import '../robots/common/common_robot.dart';
import '../robots/common/enum.dart';
import '../robots/home/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/orders/cart/cart_robot.dart';
import '../robots/products/product_detail_robot.dart';
import '../robots/products/product_robot.dart';
import '../robots/products/product_suggestion_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CartRobot cartRobot;
  late ProductRobot productRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late ProductDetailRobot productDetailRobot;

  var loginRequired = true;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    cartRobot = CartRobot(tester);
    productRobot = ProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
  }

  const shipToCode = '0000100224';
  const market = 'Indonesia';
  const userName = 'auto_client_user';
  const password = 'Pa55word@1234';

  Future<void> pumpAppWithHomeScreen(WidgetTester tester) async {
    initializeRobot(tester);
    await runAppForTesting(
      tester,
      flavor: Flavor.prod,
    );
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(
        userName,
        password,
        market,
      );
      loginRequired = false;
    }
    await commonRobot.dismissSnackbar(dismissAll: true);
    await commonRobot.changeDeliveryAddress(shipToCode);
  }

  Future<dynamic> recordTime(
    Function function, {
    String operationName = 'operation',
  }) async {
    final startTime = DateTime.now();
    Duration duration;
    try {
      await function();
    } catch (e) {
      duration = DateTime.now().difference(startTime);
      // ignore: avoid_print
      print(
        '******* API failure execution time: ${duration.inMilliseconds} milliseconds',
      );
      rethrow;
    }
    duration = DateTime.now().difference(startTime);
    // ignore: avoid_print
    print(
      '******* API execution time for $operationName : ${duration.inMilliseconds} milliseconds',
    );
  }

  Future<void> searchAndAddProductToCart(
    List<String> materialNumberList,
  ) async {
    for (final materialNumber in materialNumberList) {
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar(dismissAll: true);
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.tapClearSearch();
    }
  }

  group('Cart Page - Production', () {
    //variable
    final materialNumberList = <String>[
      'GX3TCTN',
      'GX3TC1N',
      'DAAHOA10',
      'DABIL100',
      'DABIFS30',
      'AIAB53',
      'AIABG5',
      'AIABG3',
      'AIABG6',
      'AIABX5',
      'OEAT55',
      'OEAD10',
      'OEAD15',
      'OEAM400',
      'OEAT60',
      'OEAT10',
      'OEAT15',
      'LBABX10',
      'LBABX20',
      'DC24195',
      'DC13001',
      'DC55032',
      'DC12032',
      'DC10001',
      'DC64001',
      'DC54001',
      'DC10020',
      'DC36020',
      'DC95001',
      'DC74020',
      'DC82020',
      'DC11020',
      'DC93001',
    ];

    testWidgets('Verify cart page and pull to refresh - ', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await homeRobot.tapMiniCartIcon();
      cartRobot.verifyPage();
      await cartRobot.clearCart();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();

      await productRobot.openSearchProductScreen();
      await searchAndAddProductToCart(materialNumberList);
      await productSuggestionRobot.tapToBackScreen();
      await commonRobot.navigateToScreen(NavigationTab.home);

      await recordTime(
        () async {
          await homeRobot.tapMiniCartIcon();
        },
        operationName: 'Go To Cart Page',
      );
      await recordTime(
        () async {
          await commonRobot.pullToRefresh();
        },
        operationName: 'Pull To Refresh',
      );
      cartRobot.verifyCheckoutButton();
    });
  });
}
