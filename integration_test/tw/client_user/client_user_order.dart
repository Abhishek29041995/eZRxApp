import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/announcement_article/announcement/announcement_detail_robot.dart';
import '../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../robots/auth/forgot_password_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/notification/notification_robot.dart';
import '../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../robots/orders/checkout/checkout_robot.dart';
import '../../robots/orders/checkout/order_price_summary_robot.dart';
import '../../robots/orders/checkout/order_success_robot.dart';
import '../../robots/orders/orders_root_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_filter_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../robots/payments/payment_summary/payment_detail_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late ForgotPasswordRobot forgotPasswordRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;
  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late PaymentSummaryDetailRobot paymentDetailRobot;
  late AnnouncementArticleRootRobot announcementArticleRootRobot;
  late AnnouncementDetailRobot announcementDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    forgotPasswordRobot = ForgotPasswordRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);
    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    cartRobot = CartRobot(tester);
    oosPreOrderRobot = OOSPreOrderRobot(tester);
    cartDeliveryAddressDetailRobot = CartDeliveryAddressRobot(tester);
    orderPriceSummaryRobot = OrderPriceSummaryRobot(tester);
    checkoutRobot = CheckoutRobot(tester);
    orderSuccessRobot = OrderSuccessRobot(tester);

    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    announcementDetailRobot = AnnouncementDetailRobot(tester);
  }

  const marketMalaysia = 'Taiwan';
  const username = 'twclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0000100891';
  const customerPhoneNumber = '033281200';
  const shipToCode = '0070117663';
  const shipToAddress = '台灣明尼蘇達礦業製造（股）公';
  const otherCustomerCode = '0030038504';
  const otherShipToCode = '0070100010';
  const shipToCodeWithZmgDiscount = '0071077998';
  // const customerCodeWithZmgDiscount = '0030183551'; It is there for the future use if we need the customer code to select the correct ship to
  const otherShipToAddress = '長庚紀念醫院林口分院';
  const currency = 'TWD';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const materialNumber = '23156808';
  const bonusMaterialNumber = '23156808';
  const bonusGovermentMaterialCode = 'NCS030510NBD';
  const govermentMaterialCode = 'NCS030510NBD';
  const materialName = '０．３ｃｃ塑膠胰島素空針３１號針頭　　';
  const materialEnglishName = '0.3cc 31G Syr. 10Bag  8mm 100/Bx';
  const materialPrincipalName = '新加坡商必帝(股)公司台灣分公司';
  const materialCountryOfOrigin = '美國';
  const materialUnitMeasurement = 'EA';
  const materialUnitPrice = 700;
  const govtMaterialListPrice = 300;

  const govermentMaterialCodePriceNA = 'NCS030510NBD';
  const multiImageMaterialNumber = '23156808';
  const otherInfoMaterialNumber = '23156808';
  const materialNumberHavingPriceNA = '23156808';
  const materialNameHavingPriceNA = '0.3cc 31G Syr. 10Bag  8mm 100/Bx';
  const materialPrincipalNameHavingPriceNA = '新加坡商必帝(股)公司台灣分公司';
  // const suspendedMaterialNumber = '21034245';
  const paymentTerm = 'T019 - 發票日起15天內付款';
  const bonusMaterialNumberTierQty = 10;
  const bonusMaterialName = '０．３ｃｃ塑膠胰島素空針３１號針頭　　';
  const bonusMaterialEnglishName = '0.3cc 31G Syr. 10Bag  8mm 100/Bx';
  const materialWithZmgGroupDiscount1 = '21084847';
  const materialWithZmgGroupDiscount2 = '21084848';
  const materialWithZmgIndividualDiscount =
      '23154900'; //This material has no available offer section I will request the BE to add the data
  const bonusMaterialNumberUnitPrice = 700;
// We will remove all the hardcoded price in a other PR as the logic is done in another PR
  const firstMaterialUnitPriceBeforeZmgGroupDiscount = 564.98;
  const secondMaterialUnitPriceBeforeZmgGroupDiscount = 587.94;

  const firstMaterialUnitPriceAfterZmgGroupDiscount = 533.98;
  const secondMaterialUnitPriceAfterZmgGroupDiscount = 555.67;

  const firstMaterialListPriceWithZmgGroupDiscount = 689.00;
  const secondMaterialListPriceWithZmgGroupDiscount = 717.00;

  const materialUnitPriceForZmgIndividualDiscount = 5300.00;
  const adjustedUnitPriceAfterQtyIncreaseForZmgIndividual = 4800.00;
  const materialListPriceWithZmgIndividualDiscount = 6500.00;
  const contactPerson = 'contact-person';
  const contactNumber = '1234567890';

  var loginRequired = true;

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
    }
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> checkoutWithMaterial(
    String materialNumber,
    int qty, {
    bool isPreOrder = false,
  }) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productRobot.tapSearchMaterial(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.changeMaterialQty(materialNumber, qty);
    await cartRobot.tapCheckoutButton();
    if (isPreOrder) {
      await oosPreOrderRobot.tapContinueButton();
    }
  }

  Future<void> placeOrderWithMaterial(
    String materialNumber,
    int qty, {
    bool isPreOrder = false,
  }) async {
    await checkoutWithMaterial(materialNumber, qty, isPreOrder: isPreOrder);
    await checkoutRobot.verifyPaymentTermField(isVisible: true);
    await checkoutRobot.enterPaymentTerm(paymentTerm);
    await checkoutRobot.verifyContactPersonField(isVisible: true);
    await checkoutRobot.enterContactPerson(contactPerson);
    await checkoutRobot.verifyMobileNumberField(isVisible: true);
    await checkoutRobot.enterContactNumber(contactNumber);
    await checkoutRobot.tapPlaceOrderButton();
  }

  group('Authentication -', () {
    const usernameInCorrect = 'myclientuser001';
    const passwordInCorrect = 'St@ysafe001';

    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
      await loginRobot.tapToCloseAnnouncementBanner();
      //TODO: remove this line, once snackbar issue resolved
      await commonRobot.dismissSnackbar(dismissAll: true);
    }

    testWidgets('EZRX-T6 | Verify GUI of Login screen', (tester) async {
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      await loginRobot.tapToCloseAnnouncementBanner();

      //verify
      await loginRobot.findUsernameField();
      await loginRobot.findPasswordField();
      await loginRobot.findPasswordField();
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.findForgotPasswordLink();
      await loginRobot.verifySelectedMarket(marketMalaysia);
      await loginRobot.findSignUpLink();
      await loginRobot.findLoginWithSSOButton();
    });

    testWidgets('EZRX-T7 | Verify Default value fields', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //default value
      await loginRobot.verifyRememberMeCheckboxUnchecked();
      await loginRobot.verifyDefaultUsernameField();
      await loginRobot.verifyDefaultPasswordField();
    });

    testWidgets('EZRX-T8 | Verify mandatory fields', (tester) async {
      const emptyString = '';
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      //login without username and password
      await loginRobot.login(emptyString, emptyString);

      loginRobot.verifyErrorMessageWithoutUsername();
      loginRobot.verifyErrorMessageWithoutPassword();

      //login without username
      await loginRobot.login(emptyString, password);
      loginRobot.verifyErrorMessageWithoutUsername();

      //login without password
      await loginRobot.login(username, emptyString);
      loginRobot.verifyErrorMessageWithoutPassword();
    });

    testWidgets('EZRX-T9 | Verify login unsuccessfully with incorrect Username',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, password);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets(
        'EZRX-T10 | Verify login unsuccessfully with incorrect Password',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      //login with incorrect password
      await loginRobot.login(username, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets(
        'EZRX-T11 | Verify login unsuccessfully with incorrect Username/Password',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets('EZRX-T14 | Verify Forgot password screen', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //forgot password
      await loginRobot.findForgotPasswordLink();
      await loginRobot.tapToForgotPassword();

      //back to login
      forgotPasswordRobot.verifyBackToLoginButton();
      await forgotPasswordRobot.tapToBackToLogin();
      await loginRobot.tapToForgotPassword();

      //verify error message
      forgotPasswordRobot.verifyNextButton();
      await forgotPasswordRobot.tapToNextButton();
      loginRobot.verifyErrorMessageWithoutUsername();

      //enter invalid user
      forgotPasswordRobot.verifyForgotUsernameField();
      await forgotPasswordRobot.enterTextToUsernameField(usernameInCorrect);
      await forgotPasswordRobot.tapToNextButton();

      //verify error message
      forgotPasswordRobot.verifyErrorMessageWithInvalidUsername();
    });

    testWidgets('EZRX-T15 | Verify Forgot password function', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //forgot password
      await loginRobot.findForgotPasswordLink();
      await loginRobot.tapToForgotPassword();

      //verify send email
      await forgotPasswordRobot.enterTextToUsernameField(username);
      // await forgotPasswordRobot.tapToNextButton();
      // forgotPasswordRobot.verifyMessageSentEmail();
    });

    testWidgets('EZRX-T12 | Verify login successfully with check :Remember me',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      //login with
      await loginRobot.login(username, password);

      //intro page
      loginRobot.findIntroGetStartedButton();
      await loginRobot.skipIntroIfHas();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //customer search
      customerSearchRobot.verifyPage();

      // verify customer search show successfully
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(shipToCode);
      customerSearchRobot.findCustomerCode(shipToCode);
    });
    testWidgets(
        'EZRX-T12 | Verify login successfully with customer page still saved',
        (tester) async {
      await pumpAppInitialState(tester);

      //customer search
      customerSearchRobot.verifyPage();

      // change address
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.closeAnnouncementAlertDialog();

      //home page
      homeRobot.verify();

      //logout
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.findLogout();
      await moreRobot.tapLogout();
    });

    testWidgets(
        'EZRX-T13 | Verify login successfully with uncheck :Remember me',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      await loginRobot.verifySelectedMarket(marketMalaysia);
      //login with
      await loginRobot.login(username, password);

      //customer search
      customerSearchRobot.verifyPage();

      // change address
      await customerSearchRobot.selectCustomerSearch(shipToCode);

      //home page
      homeRobot.verify();

      loginRequired = false;
    });
  });

  group('Notification Tab -', () {
    const orderNotificationKeyword = 'Order';
    const returnNotificationKeyword = 'Return';
    const paymentNotificationKeyword = 'Payment';

    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      notificationRobot.verifyPage();
      notificationRobot.verifyScrollList();
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();
        return;
      }
      notificationRobot.verifyDeleteButton();
    });

    testWidgets(
        'EZRX-T96 | Verify at least one notification item if list not empty',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();

        return;
      }
      await notificationRobot.scrollAlertNotification();
      notificationRobot.verifyNotificationItems();
      final itemTitle = notificationRobot.getFirstBasicNotificationTitle();
      await notificationRobot.tapFirstBasicNotificationItem(itemTitle);
      if (itemTitle.startsWith(orderNotificationKeyword.tr())) {
        viewByOrdersDetailRobot.verifyPage();
      } else if (itemTitle.startsWith(returnNotificationKeyword.tr())) {
        returnsByItemsDetailRobot.verifyPage();
      } else if (itemTitle.startsWith(paymentNotificationKeyword.tr())) {
        paymentDetailRobot.verifyPage();
      } else {
        notificationRobot.verifyRedirectNotAvailableMessage();
      }
    });

    testWidgets('EZRX-T128 | Pull to Refresh Feature - verify item visible',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();

        return;
      }
      notificationRobot.verifyNotificationItems();
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
    });
  });

  group('Home Tab -', () {
    testWidgets(
        'EZRX-T17 | Access Homepage after logging in and having existing ShipTo',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      homeRobot.findMiniCartIcon();
      homeRobot.findQuickAccessMenu();
      homeRobot.findQuickAccessOrders();
      homeRobot.findQuickAccessChatSupport();
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.findAnnouncementsIcon();
    });

    testWidgets(
        'EZRX-T18 | Verify select ShipTo in Homepage incase existing items in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //home page
      homeRobot.verify();

      // add to cart
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();
      await commonRobot.navigateToScreen(NavigationTab.home);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(otherShipToCode);

      // change address
      customerSearchRobot.findCustomerCode(otherShipToCode);
      await customerSearchRobot.tapOnCustomerCode(otherShipToCode);
      // cancel change address
      customerSearchRobot.findCancelChangeAddressButton();
      await customerSearchRobot.tapOnCancelChangeAddressButton();
      // confirm change address
      customerSearchRobot.findCustomerCode(otherShipToCode);
      await customerSearchRobot.tapOnCustomerCode(otherShipToCode);
      customerSearchRobot.findConfirmChangeAddressButton();
      await customerSearchRobot.tapOnConfirmChangeAddressButton();
      customerSearchRobot.verifyCustomerCodeIsSelected(otherShipToCode);

      // verify cart empty
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T20 | Verify Search ShipTo with keyword contains Customer name/ShipTo name in Homepage',
        (tester) async {
      // initialize variables
      final subCustomerCode = customerCode.substring(0, 8);
      final subShipToCode = shipToCode.substring(0, 8);
      final subShipToName = shipToAddress.substring(0, 10);

      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // contain customer code
      await customerSearchRobot.search(subCustomerCode);
      customerSearchRobot.verifySearchResults(subCustomerCode);

      // contain ship to code
      await customerSearchRobot.search(subShipToCode);
      customerSearchRobot.verifySearchResults(subShipToCode);

      // contain ship to name
      await customerSearchRobot.search(subShipToName);
      customerSearchRobot.verifySearchResults(subShipToName);

      //invalid code
      await customerSearchRobot.search(invalidNumberSearchKey);
      customerSearchRobot.verifySearchNotFound();

      //invalid name
      await customerSearchRobot.search(invalidSearchKey);
      customerSearchRobot.verifySearchNotFound();
    });

    testWidgets(
        'EZRX-T28 | Verify Search by inputting valid keyword contains Product name',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      // search for valid products
      homeRobot.findSearchProductField();
      await homeRobot.tapSearchProductField();
      await commonRobot.searchWithKeyboardAction(materialName);

      productSuggestionRobot.verifySearchResults(materialName);
    });

    testWidgets('EZRX-T26 | Verify Tap & slide Banner in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      if (homeRobot.isBannerEmpty) {
        homeRobot.verifyHomeBanner(isVisible: false);
        return;
      }

      homeRobot.verifyHomeBanner();
      homeRobot.verifyFirstBannerIsDisplay();
      //tap on next banner
      homeRobot.findNextBanner();
      await homeRobot.tapNextBanner();

      //slide to right
      await homeRobot.slidePreviousBanner();

      //slide banner to left
      await homeRobot.slideNextBanner();

      //tap on previous banner
      homeRobot.findPreviousBanner();
      await homeRobot.tapPreviousBanner();
    });

    testWidgets('EZRX-T43 | Verify display Product detail in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //Product information
      homeRobot.findProductImage();
      homeRobot.findProductDescription();
      homeRobot.findProductManufactured();
      homeRobot.findProductPrice();
      homeRobot.findGovtMaterialListPrice();
      homeRobot.findProductFavouriteIcon();
      homeRobot.verifyProductNumber();
    });

    testWidgets(
        'EZRX-T22 | Verify click on Orders action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();
      ordersRootRobot.verifyPage();
    });

    // // Reopen when the api filter product by offer fixed
    // testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //tap on products on offer
    //   homeRobot.findProductsOnOffer();
    //   await homeRobot.tapProductsOnOfferIcon();

    //   //navigate to material page
    //   productRobot.verifyPageVisible();
    // });

    testWidgets('EZRX-T46 | Verify display recently ordered and navigate',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      //Swipe recently ordered
      await homeRobot.slideToNextRecentlyOrdered();
      await homeRobot.slideToPreviousRecentlyOrdered();

      //Navigate to view by item detail
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapOnFirstRecentlyOrdered();
      viewByItemsDetailRobot.verifyPage();
      await viewByItemsDetailRobot.tapToBackScreen();

      //Navigate to order tab
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapRecentlyOrderIcon();
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T47 | Verify display browse products and navigate in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.findBrowseProductsIcon();

      //Swipe browse product
      final productInfo = homeRobot.getFirstBrowseProductInfo();
      await homeRobot.slideToNextBrowseProducts();
      homeRobot.verifyNotFoundWidgetByText(productInfo);
      await homeRobot.slideToPreviousBrowseProducts();
      homeRobot.verifyFoundWidgetByText(productInfo);

      //Navigate to product tab
      await homeRobot.tapBrowseProductsIcon();
      productRobot.verifyPageVisible();
      await commonRobot.navigateToScreen(NavigationTab.home);

      //Navigate to material page
      await homeRobot.tapOnFirstBrowseProduct();
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on browse products
      await homeRobot.findAnnouncementsIcon();
      await homeRobot.tapAnnouncementsIcon();

      //verify go to announcements page
      announcementArticleRootRobot.verifyAnnouncementPage();
    });

    testWidgets('EZRX-T59 | Verify click on Announcement in Announcements',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to Announcements
      await homeRobot.findAnnouncementsIcon();

      //tap on first product
      await homeRobot.tapOnFirstAnnouncement();

      //verify announcement detail page
      announcementDetailRobot.verifyPage();
    });
  });

  group('Product Tab -', () {
    const sortByZToA = 'Z-A';

    testWidgets('EZRX-T30 | Verify product tab with default components',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyMaterial();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyFilterFavoritesChip();
      productRobot.verifyCustomerCodeSelector();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();
      productRobot.verifyGovtMaterialListPrice();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifySheet();
      filterSortProductRobot.verifyDefaultFilterProduct();
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifySheet(isVisible: false);

      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.tapCloseButton();

      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifyPage();
      await productSuggestionRobot.tapToBackScreen();

      await productRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
    });
    // // Reopen when the api filter product by offer fixed
    // testWidgets('EZRX-38 | Verify Filter by product on offer', (tester) async {
    //   const offerCheckbox = 'Items with offers';

    //   await pumpAppWithHomeScreen(tester);
    //   await productRobot.navigateToScreen(NavigationTab.products);
    //   await productRobot.openFilterProductScreen();

    //   await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
    //   await filterSortProductRobot.tapFilterApplyButton();
    //   productRobot.verifyOnOfferLabel();
    //   await productRobot.tapFirstMaterial();
    //   productDetailRobot.verifyPage();
    //   productDetailRobot.verifyOnOfferLabel();
    //   await productDetailRobot.tapBackButton();

    //   await productRobot.openFilterProductScreen();
    //   filterSortProductRobot.verifyCheckboxCheckedShowProduct(
    //     offerCheckbox,
    //     true,
    //   );
    //   await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
    //   filterSortProductRobot.verifyCheckboxCheckedShowProduct(
    //     offerCheckbox,
    //     false,
    //   );
    // });

    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterCountryOfOriginScreen();
      final country = filterSortProductRobot.getFirstSuggestedCountry();
      await filterSortProductRobot.searchWithKeyboardAction(country);
      filterSortProductRobot.verifyListCountryOfOriginMatched(country);
      await filterSortProductRobot.tapFirstSuggestedCountry();
      await commonRobot.tapToBackIcon();
      await Future.delayed(const Duration(seconds: 3));
      filterSortProductRobot.verifyCountryListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      await productRobot.tapFirstMaterial();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyCountryOfOriginDisplayed(country);
    });

    testWidgets('EZRX-T38 | Verify Filter by Manufacturer', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      filterSortProductRobot
          .verifyListManufacturerMatched(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifyManufactureListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
    });

    testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
    });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await commonRobot.tapToBackIcon();
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyMaterial();
      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
      productRobot.verifyProductSortChanged(firstProduct);
    });

    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterResetButton();
      productRobot.verifyFirstNameProduct(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
    });

    testWidgets('EZRX-T34 | Verify filter by favorite', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: true);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });

    testWidgets('EZRX-T61 | Verify favorite and unfavorite material',
        (tester) async {
      const index = 0;
      await pumpAppWithHomeScreen(tester);
      await productRobot.navigateToScreen(NavigationTab.products);

      await productRobot.setProductFavoriteStatus(index, true);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(true);
      await productDetailRobot.tapBackButton();
      await productRobot.setProductFavoriteStatus(index, false);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(false);
    });
  });

  group('Product search -', () {
    testWidgets(
        'EZRX-T31 | Verify search by material number/material description (happy/unhappy case)',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productRobot.verifyPageVisible();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(
        materialName,
      );

      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(invalidSearchKey);
      productRobot.verifyNoProduct();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(
        materialName,
      );
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);
    });

    testWidgets('EZRX-T32 | Verify search and navigate to material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T34 | Verify Save search history + clear search history',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapSearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapDeleteSearchHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet();
      await productSuggestionRobot.tapConfirmClearHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet(isVisible: false);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      productSuggestionRobot.verifyNoSearchHistory();
    });
  });

  group('Material detail -', () {
    testWidgets('EZRX-T62 | Verify material detail with basic information',
        (tester) async {
      await pumpAppWithHomeScreen(
        tester,
        shipToCode: otherShipToCode,
      );

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyGovtMaterialListPriceDisplayed();

      productDetailRobot
          .verifyCurrentProductPrice(materialUnitPrice.priceDisplay(currency));
      productDetailRobot.verifyGovtMaterialListPrice(
        govtMaterialListPrice.priceDisplay(currency),
      );

      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();

      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(materialNumber);
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(materialUnitMeasurement);
      productDetailRobot
          .verifyCountryOfOriginLabelDisplayed(materialCountryOfOrigin);
      productDetailRobot.verifyGovermentMaterialCode(govermentMaterialCode);
      productDetailRobot.verifyBatchDisplayed(isVisible: false);
    });

    testWidgets('EZRX-T64 | Verify display image when having multiple images',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
      await productRobot.tapSearchMaterial(multiImageMaterialNumber);
      final havingMultipleImage =
          await productDetailRobot.verifyMultipleImages();
      if (havingMultipleImage) {
        productDetailRobot.verifyImageMaterialSelected(0, true);
        productDetailRobot.verifyImageMaterialSelected(1, false);
        await productDetailRobot.tapToImageMaterial(1, false);
        productDetailRobot.verifyImageMaterialSelected(1, true);
      }
    });

    testWidgets('EZRX-T65| Verify available offers in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(bonusMaterialNumber);
      productDetailRobot.verifyQuantityProductDisplayed();
      productDetailRobot.verifyOfferBottomSheetCloseButton();
    });

    testWidgets('EZRX-T66 | Verify Related products in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.verifyRelateProductDisplayed();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      await productDetailRobot.tapBackButton();
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T67 | Verify other information in material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productRobot.tapSearchMaterial(otherInfoMaterialNumber);
      await productDetailRobot.tapToSeeMore();
      productDetailRobot.verifyMaterialDosageDisplayed();
      productDetailRobot.verifyMaterialHowToUseDisplayed();
      productDetailRobot.verifyMaterialDeliveryInstructionsDisplayed();
      productDetailRobot.verifyMaterialCompositionDisplayed();
    });

    //TODO: Logic add maximum got error on mobile fail
    // testWidgets('EZRX-T68 | Verify add and navigate to cart in material detail',
    //     (tester) async {
    //   const maximumQty = 99999;
    //   await pumpAppWithHomeScreen(tester);

    //   await browseProductFromEmptyCart();
    //   await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    //   await productRobot.tapSearchMaterial(materialNumber);
    //   await productDetailRobot.tapAddToCart();
    //   productDetailRobot.verifyCartButtonQty(1);
    //   productDetailRobot.verifyAddToCartSuccessMessage();
    //   await productDetailRobot.dismissSnackbar();
    //   await productDetailRobot.tapCartButton();
    //   cartRobot.verifyPage();
    //   await cartRobot.tapCloseButton();
    //   await productDetailRobot.changeQty(maximumQty);
    //   await productDetailRobot.tapAddToCart();
    //   productDetailRobot.verifyAddToCartFailureMessage();
    // });

    // // Open it when the bug EZRX-18859 fixed
    // testWidgets('EZRX-T68 | Verify suspended banner ', (tester) async {
    //   await pumpAppWithHomeScreen(tester);

    //   await browseProductFromEmptyCart();
    //   await productSuggestionRobot
    //       .searchWithKeyboardAction(suspendedMaterialNumber);
    //   await productRobot.tapSearchMaterial(suspendedMaterialNumber);
    //   productDetailRobot.verifySuspendedBanner();
    //   await productDetailRobot.tapAddToCart();
    //   productDetailRobot.verifyAddToCartSuccessMessage(isVisible: false);
    //   productDetailRobot.verifyCartButtonQty(0);
    //   await productDetailRobot.tapCartButton();
    //   cartRobot.verifyPage();
    //   cartRobot.verifyNoRecordFound();
    // });

    testWidgets('EZRX-T215 | Verify favorite in material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.tapFirstMaterial();
      var materialName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(true);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(materialName, matched: true);

      await productRobot.filterFavoritesInProductsScreen();
      await productRobot.tapFirstMaterial();
      materialName = productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(false);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(materialName, matched: false);
    });

    testWidgets(
        'EZRX-T1532| Verify available offers for zmg material in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(
        tester,
        shipToCode: shipToCodeWithZmgDiscount,
      );

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot
          .searchWithKeyboardAction(materialWithZmgGroupDiscount1);
      await productRobot.tapSearchMaterial(materialWithZmgGroupDiscount1);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(materialWithZmgGroupDiscount1);
    });
  });

  group('Cart -', () {
    testWidgets(
        'EZRX-T1033 | Verify material with price not available can be able to add to cart',
        (tester) async {
      const qty = 1000;
      const cartTotalPrice = 0.0;
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(materialNumberHavingPriceNA);
      await productRobot.tapSearchMaterial(materialNumberHavingPriceNA);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(materialNumberHavingPriceNA);
      cartRobot.verifyManufacturerName(materialPrincipalNameHavingPriceNA);
      cartRobot.verifyMaterialNumber(
        materialNumberHavingPriceNA,
        govermentMaterialCode: govermentMaterialCodePriceNA,
      );
      cartRobot.verifyMaterialImage(materialNumberHavingPriceNA);
      await cartRobot.changeMaterialQty(materialNumberHavingPriceNA, qty);
      cartRobot.verifyMaterialQty(materialNumberHavingPriceNA, qty);
      cartRobot.verifyMaterialDescription(
        materialNumberHavingPriceNA,
        materialNameHavingPriceNA,
      );
      cartRobot.verifyMaterialUnitPrice(
        materialNumberHavingPriceNA,
        'Price Not Available'.tr(),
      );
      cartRobot.verifyGovtMaterialListPrice(
        materialNumberHavingPriceNA,
        'Price Not Available'.tr(),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumberHavingPriceNA,
        'Price Not Available'.tr(),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot.verifyCartTotalPrice(
        cartTotalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCheckoutButton();
    });

    testWidgets('EZRX-T98 | Verify material in cart + change material qty',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyManufacturerName(materialPrincipalName);
      cartRobot.verifyMaterialNumber(
        materialNumber,
        govermentMaterialCode: govermentMaterialCode,
      );
      cartRobot.verifyMaterialImage(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialDescription(materialNumber, materialEnglishName);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyGovtMaterialListPrice(
        materialNumber,
        govtMaterialListPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(otherShipToAddress);
      cartRobot.verifyCartTotalPrice(materialUnitPrice.priceDisplay(currency));

      cartRobot.verifyCheckoutButton();

      var totalPrice = materialUnitPrice;
      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));
    });

    testWidgets('EZRX-T101 | Verify material on offer with bonus in cart',
        (tester) async {
      const bonusMaterialNumberNextTierQty = 20;
      const firstBonusQty = 1;
      const nextBonusQty = 3;
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(bonusMaterialNumber);
      cartRobot.verifyMaterialQty(bonusMaterialNumber, 1);
      cartRobot.verifyMaterialOfferTag(bonusMaterialNumber);
      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberTierQty,
      );
      await cartRobot.verifyBonusMaterial(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        firstBonusQty,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      cartRobot.verifyBonusMaterialTag(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      cartRobot.verifyBonusMaterialDescription(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusMaterialEnglishName,
      );
      cartRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );

      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberNextTierQty,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        nextBonusQty,
      );
      await cartRobot.decreaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        nextBonusQty,
      );
      await cartRobot.increaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        nextBonusQty,
      );
    });
    testWidgets('EZRX-T108 | Verify remove item in cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      await cartRobot.swipeMaterialToDelete(materialNumber);
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T113 | Verify clear cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyCartQty(1);
      await cartRobot.tapClearCartButton();
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T102 | Verify add bonus/sample item in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();

      //verify display
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialBonusSampleButton(
        materialNumber,
        isVisible: false,
      );
    });

    testWidgets('EZRX-T105 | Verify counter offer price with remark',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialCounterOfferButton(
        materialNumber,
        isVisible: false,
      );
    });

    testWidgets('EZRX-T114 | Verify address information in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyCartQty(1);
      await cartRobot.tapShowShipToAddressDetail();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: true);
      cartDeliveryAddressDetailRobot.verifyCustomerCode(otherCustomerCode);
      cartDeliveryAddressDetailRobot.verifyShipToCode(otherShipToCode);
      await cartDeliveryAddressDetailRobot.tapCloseButton();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T97 | Verify price summary in cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyCartTotalPrice(materialUnitPrice.priceDisplay(currency));
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(materialUnitPrice.priceDisplay(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T1575 | Verify zmg individual discount in cart page',
        (tester) async {
      void testCartMaterialPrice({
        required double firstMaterialPrice,
        required double secondMaterialPrice,
        double firstMaterialListPrice =
            firstMaterialListPriceWithZmgGroupDiscount,
        double secondMaterialListPrice =
            materialListPriceWithZmgIndividualDiscount,
        required double firstMaterialQty,
        required double secondMaterialQty,
      }) {
        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialPrice.priceDisplay(currency),
        );
        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgIndividualDiscount,
          secondMaterialPrice.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialListPriceWithZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgIndividualDiscount,
          secondMaterialListPrice.priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgGroupDiscount1,
          (firstMaterialPrice * firstMaterialQty).priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgIndividualDiscount,
          (secondMaterialPrice * secondMaterialQty).priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          ((firstMaterialPrice * firstMaterialQty) +
                  (secondMaterialPrice * secondMaterialQty))
              .priceDisplay(currency),
        );
      }

      await pumpAppWithHomeScreen(
        tester,
        shipToCode: shipToCodeWithZmgDiscount,
      );

      //ADD materials with zmg discount and different group to cart
      await browseProductFromEmptyCart();
      await productRobot
          .searchWithKeyboardAction(materialWithZmgGroupDiscount1);
      await productRobot.tapSearchMaterial(materialWithZmgGroupDiscount1);
      await productDetailRobot.tapAddToCart();

      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();
      await productRobot.openSearchProductScreen();
      await productRobot
          .searchWithKeyboardAction(materialWithZmgIndividualDiscount);
      await productRobot.tapSearchMaterial(materialWithZmgIndividualDiscount);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();

      await cartRobot.verifyMaterial(materialWithZmgGroupDiscount1);
      await cartRobot.verifyMaterial(materialWithZmgIndividualDiscount);
      await cartRobot.changeMaterialQty(materialWithZmgIndividualDiscount, 2);
      cartRobot.verifyMaterialQty(materialWithZmgIndividualDiscount, 2);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 1);
      testCartMaterialPrice(
        firstMaterialPrice: firstMaterialUnitPriceBeforeZmgGroupDiscount,
        secondMaterialPrice: materialUnitPriceForZmgIndividualDiscount,
        firstMaterialQty: 1,
        secondMaterialQty: 2,
      );
      await cartRobot.changeMaterialQty(materialWithZmgIndividualDiscount, 3);
      //Verify material details in cart
      cartRobot.verifyMaterialQty(materialWithZmgIndividualDiscount, 3);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 1);
      testCartMaterialPrice(
        firstMaterialPrice: firstMaterialUnitPriceBeforeZmgGroupDiscount,
        secondMaterialPrice: adjustedUnitPriceAfterQtyIncreaseForZmgIndividual,
        firstMaterialQty: 1,
        secondMaterialQty: 3,
      );
      await cartRobot.changeMaterialQty(materialWithZmgGroupDiscount1, 3);
      await cartRobot.changeMaterialQty(materialWithZmgIndividualDiscount, 1);
      cartRobot.verifyMaterialQty(materialWithZmgIndividualDiscount, 1);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 3);
      testCartMaterialPrice(
        firstMaterialPrice: firstMaterialUnitPriceBeforeZmgGroupDiscount,
        secondMaterialPrice: materialUnitPriceForZmgIndividualDiscount,
        firstMaterialQty: 3,
        secondMaterialQty: 1,
      );
    });

    testWidgets('EZRX-T1574 | Verify zmg group discount in cart page',
        (tester) async {
      void verifyCartDetailsWhenZmgGroupDiscountNotValidWithSecondMaterial() {
        cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount2, 48);
        cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 1);

        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialUnitPriceBeforeZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgGroupDiscount2,
          secondMaterialUnitPriceBeforeZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialListPriceWithZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgGroupDiscount2,
          secondMaterialListPriceWithZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgGroupDiscount1,
          (firstMaterialUnitPriceBeforeZmgGroupDiscount * 1)
              .priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgGroupDiscount2,
          (secondMaterialUnitPriceBeforeZmgGroupDiscount * 48)
              .priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          ((firstMaterialUnitPriceBeforeZmgGroupDiscount * 1) +
                  (secondMaterialUnitPriceBeforeZmgGroupDiscount * 48))
              .priceDisplay(currency),
        );
      }

      void verifyCartDetailsWhenZmgGroupDiscountNotValidWithFirstMaterial() {
        cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 48);
        cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount2, 1);

        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialUnitPriceBeforeZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyMaterialUnitPrice(
          materialWithZmgGroupDiscount2,
          secondMaterialUnitPriceBeforeZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgGroupDiscount1,
          firstMaterialListPriceWithZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyGovtMaterialListPrice(
          materialWithZmgGroupDiscount2,
          secondMaterialListPriceWithZmgGroupDiscount.priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgGroupDiscount1,
          (firstMaterialUnitPriceBeforeZmgGroupDiscount * 48)
              .priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          materialWithZmgGroupDiscount2,
          (secondMaterialUnitPriceBeforeZmgGroupDiscount * 1)
              .priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          ((firstMaterialUnitPriceBeforeZmgGroupDiscount * 48) +
                  (secondMaterialUnitPriceBeforeZmgGroupDiscount * 1))
              .priceDisplay(currency),
        );
      }

      await pumpAppWithHomeScreen(
        tester,
        shipToCode: shipToCodeWithZmgDiscount,
      );

      //ADD materials with zmg discount and same group to cart
      await browseProductFromEmptyCart();
      await productRobot
          .searchWithKeyboardAction(materialWithZmgGroupDiscount1);
      await productRobot.tapSearchMaterial(materialWithZmgGroupDiscount1);
      await productDetailRobot.tapAddToCart();

      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();
      await productRobot.openSearchProductScreen();
      await productRobot
          .searchWithKeyboardAction(materialWithZmgGroupDiscount2);
      await productRobot.tapSearchMaterial(materialWithZmgGroupDiscount2);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();

      await cartRobot.verifyMaterial(materialWithZmgGroupDiscount1);
      await cartRobot.verifyMaterial(materialWithZmgGroupDiscount2);
      await cartRobot.changeMaterialQty(materialWithZmgGroupDiscount2, 48);
      verifyCartDetailsWhenZmgGroupDiscountNotValidWithSecondMaterial();

      //Increase quantity of one of the material with same group to apply zmg group discount
      await cartRobot.increaseMaterialQty(materialWithZmgGroupDiscount2);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount2, 49);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 1);
      cartRobot.verifyMaterialUnitPrice(
        materialWithZmgGroupDiscount1,
        firstMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );
      cartRobot.verifyMaterialUnitPrice(
        materialWithZmgGroupDiscount2,
        secondMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );

      cartRobot.verifyMaterialTotalPrice(
        materialWithZmgGroupDiscount2,
        (secondMaterialUnitPriceAfterZmgGroupDiscount * 49)
            .priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialWithZmgGroupDiscount1,
        firstMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );

      cartRobot.verifyCartTotalPrice(
        (firstMaterialUnitPriceAfterZmgGroupDiscount +
                (secondMaterialUnitPriceAfterZmgGroupDiscount * 49))
            .priceDisplay(currency),
      );

      //Decrease quantity by 1 to reset the price to original as total quantity does not satisfy zmg discount criteria
      await cartRobot.decreaseMaterialQty(materialWithZmgGroupDiscount2);
      verifyCartDetailsWhenZmgGroupDiscountNotValidWithSecondMaterial();

      //Increase quantity for the first material with same group to apply zmg group discount
      await cartRobot.changeMaterialQty(materialWithZmgGroupDiscount1, 48);
      await cartRobot.changeMaterialQty(materialWithZmgGroupDiscount2, 1);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount2, 1);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 48);
      verifyCartDetailsWhenZmgGroupDiscountNotValidWithFirstMaterial();

      //Increase quantity for the first material with same group to apply zmg group discount
      await cartRobot.increaseMaterialQty(materialWithZmgGroupDiscount1);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount2, 1);
      cartRobot.verifyMaterialQty(materialWithZmgGroupDiscount1, 49);

      cartRobot.verifyMaterialUnitPrice(
        materialWithZmgGroupDiscount1,
        firstMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );
      cartRobot.verifyMaterialUnitPrice(
        materialWithZmgGroupDiscount2,
        secondMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );

      cartRobot.verifyMaterialTotalPrice(
        materialWithZmgGroupDiscount2,
        secondMaterialUnitPriceAfterZmgGroupDiscount.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialWithZmgGroupDiscount1,
        (firstMaterialUnitPriceAfterZmgGroupDiscount * 49)
            .priceDisplay(currency),
      );

      cartRobot.verifyCartTotalPrice(
        ((firstMaterialUnitPriceAfterZmgGroupDiscount * 49) +
                secondMaterialUnitPriceAfterZmgGroupDiscount)
            .priceDisplay(currency),
      );

      //Decrease quantity by 1 to reset the price to original as total quantity does not satisfy zmg discount criteria
      await cartRobot.decreaseMaterialQty(materialWithZmgGroupDiscount1);
      verifyCartDetailsWhenZmgGroupDiscountNotValidWithFirstMaterial();
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1;
      const totalPrice = materialUnitPrice * qty;
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(otherCustomerCode);
      checkoutRobot.verifyDeliveryTo(otherShipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryDateField(isVisible: false);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyPaymentTermField(isVisible: true);
      await checkoutRobot.verifyContactPersonField(isVisible: true);
      await checkoutRobot.verifyMobileNumberField(isVisible: true);
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(totalPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(totalPrice.priceDisplay(currency));
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(totalPrice.priceDisplay(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      const emptyPoReference = 'NA';
      const emptyDeliveryInstruction = 'NA';

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(materialNumber, 1000);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: false);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyPaymentTermField(isVisible: true);
      checkoutRobot.verifyContactNumberFieldHasText(customerPhoneNumber);
      await checkoutRobot.enterPaymentTerm(paymentTerm);
      await checkoutRobot.enterContactNumber('');
      await checkoutRobot.tapPlaceOrderButton();
      checkoutRobot.verifyEmptyContactNumberErrorMessage(isVisible: true);
      checkoutRobot.verifyEmptyContactPersonErrorMessage(isVisible: true);
      await checkoutRobot.verifyContactPersonField(isVisible: true);
      await checkoutRobot.enterContactPerson(contactPerson);
      await checkoutRobot.verifyMobileNumberField(isVisible: true);
      await checkoutRobot.enterContactNumber(contactNumber);
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(emptyPoReference);
      orderSuccessRobot.verifyDeliveryInstruction(emptyDeliveryInstruction);
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialQty(materialNumber, qty);
      checkoutRobot.verifyMaterialDescription(
        materialNumber,
        materialEnglishName,
      );
      checkoutRobot.verifyMaterialImage(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyGovtMaterialListPrice(
        materialNumber,
        govtMaterialListPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        (materialUnitPrice * qty).priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: false,
      );
    });

    testWidgets(
        'EZRX-T119 | Verify display material on offer with bonus in checkout',
        (tester) async {
      const qty = 10;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(bonusMaterialNumber, qty);

      //verify
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMaterial(bonusMaterialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyGovtMaterialListPrice(
        materialNumber,
        govtMaterialListPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(bonusMaterialNumber, totalPrice);
      checkoutRobot.verifyMaterialQty(bonusMaterialNumber, qty);
      await checkoutRobot.verifyBonusMaterial(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialDescription(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusMaterialEnglishName,
      );
      checkoutRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusQty,
      );
      checkoutRobot.verifyBonusMaterialTag(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialFreeLabel(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      checkoutRobot.verifyStickyGrandTotal(totalPrice);
      checkoutRobot.verifyStickyTotalQty(2);
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await placeOrderWithMaterial(materialNumber, 1000);

      //verify
      orderSuccessRobot.verifyPage();
      await orderSuccessRobot.verifyOrderSubmittedMessage();
      await orderSuccessRobot.dismissSnackbar();
      orderSuccessRobot.verifyOrderId();
      orderSuccessRobot.verifyOrderDate();
      await orderSuccessRobot.verifyOrderSummarySection();

      await orderSuccessRobot.tapCloseButton();
      productRobot.verifyPageVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T125 | Verify display material in order submitted',
        (tester) async {
      const qty = 1;
      const totalPrice = materialUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await placeOrderWithMaterial(materialNumber, qty);
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot.verifyGrandTotal(
        totalPrice.priceDisplay(currency),
      );

      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(
        materialNumber,
        govermentMaterialCode: govermentMaterialCode,
      );
      orderSuccessRobot.verifyMateriaDescription(materialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(materialUnitPrice.priceDisplay(currency));
      orderSuccessRobot.verifyGovtMaterialListPrice(
        govtMaterialListPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyMaterialTotalPrice(
        totalPrice.priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T125 | Verify display material on offer with bonus in order submitted',
        (tester) async {
      const qty = 10;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await placeOrderWithMaterial(bonusMaterialNumber, qty);

      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(
        bonusMaterialNumber,
        govermentMaterialCode: bonusGovermentMaterialCode,
      );
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyGovtMaterialListPrice(
        govtMaterialListPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyMaterialTotalPrice(totalPrice);
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(
        bonusMaterialNumber,
        govermentMaterialCode: bonusGovermentMaterialCode,
      );
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(bonusQty);
      orderSuccessRobot.verifyMaterialBonusTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
      orderSuccessRobot.verifyMaterialTotalPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
    });
  });

  group('Order Tab -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 150));
    final toDate = DateTime.now().subtract(const Duration(days: 2));

    group('View by items -', () {
      testWidgets('EZRX-T69 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyTabBar();
        ordersRootRobot.verifyViewByItemsPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByOrders();
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByItems();
        ordersRootRobot.verifyViewByItemsPage();

        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyApplyButton();
        viewByItemsFilterRobot.verifyResetButton();
        viewByItemsFilterRobot.verifyDefaultFilterApplied();
        await viewByItemsFilterRobot.tapCloseIcon();
        viewByItemsRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOrders();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T75 | Verify search by material number/material description/order number',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        // Re open when list can search by product name
        // final productName = viewByItemsRobot.getFirstProductName();
        // await commonRobot.searchWithKeyboardAction(productName);
        // viewByItemsRobot.verifyOrdersWithProductName(productName);
        // await commonRobot.pullToRefresh();
        // commonRobot.verifySearchBarText('');

        final materialNumber =
            viewByItemsRobot.getFirstProductId(enableGMC: true);
        await commonRobot.searchWithSearchIcon(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
        await commonRobot.pullToRefresh();

        final orderCode = viewByItemsRobot.getFirstOrderId();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        await commonRobot.autoSearch('');
        await commonRobot.autoSearch(orderCode);
        viewByItemsRobot.verifyOrdersWithOrderCode(orderCode);
        await commonRobot.pullToRefresh();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
        commonRobot.verifySearchBarText('');
        viewByItemsRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T81 | Verify Filter by date when having result found in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: 'yyyy/MM/dd',
        );
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyDateRangeFilterApplied(
          fromDate.displayDate,
          toDate.displayDate,
        );
        await viewByItemsFilterRobot.tapCloseIcon();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });

      testWidgets(
          'EZRX-T85 | Verify Filter by status when selecting 1 checkbox and existing data available',
          (tester) async {
        final statusFilter = 'Order created'.tr();

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: 'yyyy/MM/dd',
        );
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(2);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        viewByItemsRobot.verifyOrderGroups();
        viewByItemsRobot.verifyOrderItems();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });
    });

    group('View by item detail -', () {
      testWidgets(
          'EZRX-T87 | Verify view by item detail with default components',
          (tester) async {
        const orderId = '0200330666';

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(orderId);
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();

        await viewByItemsDetailRobot.tapOrderNumber();
        viewByOrdersDetailRobot.verifyPage();
        viewByOrdersDetailRobot.verifyOrderId(orderId);
        await commonRobot.tapToBackScreen();

        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot.verifyItemComponent();
      });

      testWidgets('EZRX-T91 | Verify material in view by item detail',
          (tester) async {
        const qty = 1;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await placeOrderWithMaterial(materialNumber, qty);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        //Need to tap offer tag because this is offer material
        await viewByItemsRobot.tapFirstOfferTag();
        viewByItemsDetailRobot.verifyHeader();
        final contactNumberFromOrder =
            viewByItemsDetailRobot.getOrderContactNumber();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );
        viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
        await cartRobot.tapCheckoutButton();
        checkoutRobot.verifyPage();
        checkoutRobot.verifyContactNumberFieldHasText(contactNumberFromOrder);
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await placeOrderWithMaterial(bonusMaterialNumber, qty);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOfferTag();
        await viewByItemsRobot.tapFirstOfferTag();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyOfferTag();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemBonusLabel();
        viewByItemsDetailRobot.verifyOtherItemFreePrice();
        viewByItemsDetailRobot.verifyOtherItemQty(bonusQty);
        await viewByItemsDetailRobot.tapToBackScreen();

        viewByItemsRobot.verifyBonusLabel();
        await viewByItemsRobot.tapFirstBonusLabel();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyBonusLabel();
        viewByItemsDetailRobot.verifyFreePrice();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemOfferTag();
        viewByItemsDetailRobot.verifyOtherItemQty(qty);
        viewByItemsDetailRobot.verifyExpandButton(isVisible: true);
        await viewByItemsDetailRobot.tapExpandButton();
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );

        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMaterialNumber, qty);
      });
    });

    group('View by orders -', () {
      testWidgets('EZRX-T71 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyApplyButtonVisible();
        viewByOrdersFilterRobot.verifyResetButtonVisible();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
        await viewByOrdersFilterRobot.tapCloseIcon();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrders();
      });

      testWidgets('EZRX-T78 | Verify search by order number', (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();
        var orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();

        orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      });

      testWidgets('EZRX-T83 | Verify filter by date', (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: 'yyyy/MM/dd',
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByOrdersRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
      });

      testWidgets('EZRX-T217 | Verify click on reset button in filter',
          (tester) async {
        const index = 0;
        final fromDate = DateTime.now().subtract(const Duration(days: 100));
        final toDate = DateTime.now().subtract(const Duration(days: 99));

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrders();
        final orderId = viewByOrdersRobot.getOrderIdText(index: index);
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: 'yyyy/MM/dd',
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: false,
        );
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapResetButton();
        viewByOrdersRobot.verifyOrders();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: true,
        );
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
      });

      testWidgets('EZRX-T72 | Verify click on Buy again', (tester) async {
        const qty = 1000;
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await placeOrderWithMaterial(materialNumber, qty);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
        await cartRobot.tapCheckoutButton();
        checkoutRobot.verifyPage();
        checkoutRobot.verifyContactNumberFieldHasText(contactNumber);
      });
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1;
        final price = (materialUnitPrice * qty).priceDisplay(currency);

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await placeOrderWithMaterial(materialNumber, qty);

        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot.verifyOrderDate();
        viewByOrdersDetailRobot.verifyOrderAddress(otherShipToAddress);
        viewByOrdersDetailRobot.verifyCustomerCode(otherCustomerCode);
        viewByOrdersDetailRobot.verifyDeliveryTo(otherShipToCode);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot.verifySubTotal(price);
        viewByOrdersDetailRobot.verifyGrandTotal(price);
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(price);
        viewByOrdersDetailRobot.verifyBuyAgainButton();
      });

      testWidgets(
          'EZRX-T90 | Verify click on Buy again in when having existing items in Cart',
          (tester) async {
        const orderQty = 1000;
        const cartQty = 10;
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //setup data
        await placeOrderWithMaterial(materialNumber, orderQty);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.products);
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productRobot.tapSearchMaterial(materialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar();
        await productDetailRobot.tapCartButton();
        await cartRobot.changeMaterialQty(materialNumber, cartQty);
        await cartRobot.tapCloseButton();
        await productDetailRobot.tapBackButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        final contactNumberFromOrder =
            viewByOrdersDetailRobot.getOrderContactNumber();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
        await cartRobot.tapCheckoutButton();
        checkoutRobot.verifyPage();
        checkoutRobot.verifyContactNumberFieldHasText(contactNumberFromOrder);
      });

      testWidgets(
          'EZRX-T90 | Verify material with offer + navigate to item detail + buy again',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //setup data
        await placeOrderWithMaterial(bonusMaterialNumber, qty);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(bonusMaterialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyOfferTag();
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyMaterial(
          bonusMaterialNumber,
          isBonus: true,
        );
        viewByOrdersDetailRobot.verifyQty(bonusQty);
        viewByOrdersDetailRobot.verifyBonusTag();
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(
          0.priceDisplay(currency),
          isFree: true,
        );
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty);
        viewByItemsDetailRobot.verifyBonusLabel();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMaterialNumber, qty);
        await cartRobot.verifyBonusMaterial(
          bonusMaterialNumber,
          bonusMaterialNumber,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMaterialNumber,
          bonusMaterialNumber,
          bonusQty,
        );
      });
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
