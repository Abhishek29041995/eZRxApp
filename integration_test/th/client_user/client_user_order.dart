import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../robots/announcement_article/articles/articles_details_robot.dart';
import '../../robots/announcement_article/articles/articles_robot.dart';
// import '../../robots/auth/forgot_password_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/contact_us_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/more/profile_robot.dart';
import '../../robots/more/security_robot.dart';
import '../../robots/notification/notification_robot.dart';
import '../../robots/orders/cart/bonus_sample_robot.dart';
import '../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../robots/orders/cart/request_counter_offer_robot.dart';
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
import '../../robots/payments/payment_home_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  // late ForgotPasswordRobot forgotPasswordRobot;
  late HomeRobot homeRobot;
  late ReturnsRootRobot returnsRootRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ContactUsRobot contactUsRobot;
  late ProfileRobot profileRobot;
  late SecurityRobot securityRobot;
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;

  late AnnouncementArticleRootRobot announcementArticleRootRobot;
  late ArticleRobot articleRobot;
  late ArticleDetailsRobot articleDetailsRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late RequestCounterOfferRobot requestCounterOfferRobot;
  late BonusSampleRobot bonusSampleRobot;
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

  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryDetailRobot paymentDetailRobot;
  // late AccountInvoiceDetailRobot accountInvoiceDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    // forgotPasswordRobot = ForgotPasswordRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    contactUsRobot = ContactUsRobot(tester);
    profileRobot = ProfileRobot(tester);
    securityRobot = SecurityRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);
    returnsRootRobot = ReturnsRootRobot(tester);

    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    articleRobot = ArticleRobot(tester);
    articleDetailsRobot = ArticleDetailsRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    cartRobot = CartRobot(tester);
    oosPreOrderRobot = OOSPreOrderRobot(tester);
    cartDeliveryAddressDetailRobot = CartDeliveryAddressRobot(tester);
    requestCounterOfferRobot = RequestCounterOfferRobot(tester);
    bonusSampleRobot = BonusSampleRobot(tester);
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

    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
    // accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);
  }

  const market = 'Thailand';
  const username = 'thclientuser';
  const userFirstName = 'THClientUser';
  const userLastName = 'User31';
  const password = 'St@ysafe01';
  const customerCode = '0030224907';
  const shipToCode = '0071115077';
  const shipToAddress = 'รพ.เจริญกรุงประชารักษ์';
  const otherShipToCode = '0000002910';
  const currency = 'THB';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const minOrderAmount = 1500.0;
  const taxForMaterial = 7;

  //material
  const materialNumber = '23342995';
  const materialName = '014 HT WINN 200T 300CM';
  const materialPrincipalName = 'ABBOTT LABORATORIES LTD.';
  const materialCountryOfOrigin = 'USA';
  const countryOfOrigin = 'Thailand';
  const materialUnitMeasurement = 'EA';
  // const multiImageMaterialNumber = materialNumber;
  const otherInfoMaterialNumber = '23247734';
  const suspendedMaterialNumber = '21118837';
  const lowPriceMaterialNumber = materialNumber;
  const bonusMaterialNumber = '23243139';
  const bonusMaterialNumberTierQty = 6;
  const bonusMaterialName = '10 mm Blunt Tip Trocar';
  const oosPreOrderMaterialNumber = '23247734';
  const poReference = 'Auto-test-po-reference';
  const poReferenceNote = 'po-reference_note';

  const orderId = '200311598';
  const orderItemPrincipleName = 'POP MEDIC & TRADING CO.,LTD.';

  //Price not available material
  const materialNumberHavingPriceNA = '23346266';
  const materialNameHavingPriceNA = '0.006 WASHER DOOR CAM';
  const materialPrincipalNameHavingPriceNA = 'Fresenius Kabi (Thailand) Ltd.';
  final materialUnitPriceHavingNA = 'Price Not Available'.tr();

  var loginRequired = true;

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, market);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;

      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await loginRobot.skipIntroIfHas();

      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await commonRobot.closeAnnouncementAlertDialog();
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
    if (oosPreOrderRobot.isSheetVisible) {
      await oosPreOrderRobot.tapContinueButton();
    }
  }

  group('Authentication -', () {
    const usernameInCorrect = 'myclientuser001';
    const passwordInCorrect = 'St@ysafe001';

    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
      await loginRobot.tapToCloseAnnouncementBanner();
    }

    testWidgets('EZRX-T6 | Verify GUI of Login screen', (tester) async {
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(market);
      await loginRobot.tapToCloseAnnouncementBanner();

      //verify
      await loginRobot.findUsernameField();
      await loginRobot.findPasswordField();
      await loginRobot.findPasswordField();
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.findForgotPasswordLink();
      await loginRobot.verifySelectedMarket(market);
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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    // testWidgets('EZRX-T14 | Verify Forgot password screen', (tester) async {
    //   //init app
    //   await pumpAppInitialState(tester);

    //   //forgot password
    //   await loginRobot.findForgotPasswordLink();
    //   await loginRobot.tapToForgotPassword();

    //   //back to login
    //   forgotPasswordRobot.verifyBackToLoginButton();
    //   await forgotPasswordRobot.tapToBackToLogin();
    //   await loginRobot.tapToForgotPassword();

    //   //verify error message
    //   forgotPasswordRobot.verifyNextButton();
    //   await forgotPasswordRobot.tapToNextButton();
    //   loginRobot.verifyErrorMessageWithoutUsername();

    //   //enter invalid user
    //   forgotPasswordRobot.verifyForgotUsernameField();
    //   await forgotPasswordRobot.enterTextToUsernameField(usernameInCorrect);
    //   await forgotPasswordRobot.tapToNextButton();

    //   //verify error message
    //   forgotPasswordRobot.verifyErrorMessageWithInvalidUsername();
    // });

    // testWidgets('EZRX-T15 | Verify Forgot password function', (tester) async {
    //   //init app
    //   await pumpAppInitialState(tester);

    //   //forgot password
    //   await loginRobot.findForgotPasswordLink();
    //   await loginRobot.tapToForgotPassword();

    //   //verify send email
    //   await forgotPasswordRobot.enterTextToUsernameField(username);
    //   // await forgotPasswordRobot.tapToNextButton();
    //   // forgotPasswordRobot.verifyMessageSentEmail();
    // });

    testWidgets('EZRX-T12 | Verify login successfully with check :Remember me',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(market);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      //login with
      await loginRobot.login(username, password);

      //intro page
      loginRobot.findSkipIntroButton();
      await loginRobot.tapSkipIntroButton();
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
      //TODO: remove this line, once snackbar issue resolved
      await commonRobot.dismissSnackbar(dismissAll: true);

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
      await loginRobot.selectMarket(market);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      await loginRobot.verifySelectedMarket(market);
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
    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      notificationRobot.verifyPage();
      notificationRobot.verifyScrollList();
      notificationRobot.verifyDeleteButton();
    });

    testWidgets(
        'EZRX-T96 | Verify at least one notification item if list not empty',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
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
      if (viewByOrdersDetailRobot.isOrderDetailPage) {
        viewByOrdersDetailRobot.verifyPage();
      } else if (returnsByItemsDetailRobot.isReturnDetailPage) {
        returnsByItemsDetailRobot.verifyPage();
      } else if (paymentDetailRobot.isPaymentDetailPage) {
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
      final itemDescription = notificationRobot.getNotificationDescription(0);
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
      notificationRobot.verifyNotificationWithDescription(
        0,
        itemDescription,
      );
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
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.findBrowseProductsIcon();
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

      // verify cart empty
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T19 | Verify select other ShipTo in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      await commonRobot.changeDeliveryAddress(otherShipToCode);
      customerSearchRobot.verifyCustomerCodeIsSelected(otherShipToCode);
    });

    testWidgets(
        'EZRX-T20 | Verify Search ShipTo with keyword contains Customer name/ShipTo name in Homepage',
        (tester) async {
      // initialize variables
      const subCustomerCode = '007014';
      const subCustomerName = 'RSD';
      const subShipToCode = '475';
      const subShipToName = 'petaling';

      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // contain customer code
      await customerSearchRobot.search(subCustomerCode);
      customerSearchRobot.verifySearchResults(subCustomerCode);

      // contain customer name
      await customerSearchRobot.search(subCustomerName);
      customerSearchRobot.verifySearchResults(subCustomerName);

      // contain ship to code
      await customerSearchRobot.search(subShipToCode);
      customerSearchRobot.verifySearchResults(subShipToCode);

      // contain ship to name
      await customerSearchRobot.search(subShipToName);
      customerSearchRobot.verifySearchResults(subShipToName);
    });

    testWidgets(
        'EZRX-T21 | Verify Search ShipTo with invalid keyword in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // verify search results: invalid code
      await customerSearchRobot.search(invalidNumberSearchKey);
      customerSearchRobot.verifySearchNotFound();

      // verify search results: invalid name
      await customerSearchRobot.search(invalidSearchKey);
      customerSearchRobot.verifySearchNotFound();
    });

    testWidgets(
        'EZRX-T28 | Verify Search by inputting valid keyword contains Product name',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

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
      homeRobot.findProductFavouriteIcon();
      homeRobot.verifyProductNumber();
    });

    testWidgets(
        'EZRX-T49 | Verify Search ShipTo with keyword contains Customer code/ShipTo code in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //change address
      await commonRobot.changeDeliveryAddress(shipToCode);
      customerSearchRobot.verifyCustomerCodeIsSelected(shipToCode);
    });

    testWidgets(
        'EZRX-T22 | Verify click on Orders action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T24 | Verify click on Payments action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access payments
      homeRobot.findQuickAccessPayments();
      await homeRobot.tapPaymentQuickAccess();

      //verify go to payments page
      paymentHomeRobot.verifyPage();
    });

    testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on products on offer
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T47 | Verify display Browse products in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on browse products
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapBrowseProductsIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
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

    testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      //tap on recently ordered
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapRecentlyOrderIcon();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T50 | Verify display Product detail in Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to products on offer
      homeRobot.findProductsOnOffer();
      homeRobot.verifyDisplayProductsWithOfferTag();

      //swipe products to right
      await homeRobot.slideToNextProductsOnOffer();

      //swipe products to left
      await homeRobot.slideToPreviousProductsOnOffer();
    });

    testWidgets('EZRX-T51 | Verify click on Product in Product on offer',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      homeRobot.findProductsOnOffer();

      //tap on first product
      await homeRobot.tapOnFirstProductOnOffer();

      //verify navigation to Material Detail Page
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T54 | Verify slide Item in Recently Ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to recently ordered
      await homeRobot.findRecentlyOrderIcon();

      //Swipe recently ordered to right
      await homeRobot.slideToNextRecentlyOrdered();

      //Swipe recently ordered to left
      await homeRobot.slideToPreviousRecentlyOrdered();
    });

    testWidgets('EZRX-T55 | Verify click on Item in Recently Ordered',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to recently ordered
      await homeRobot.findRecentlyOrderIcon();

      //tap on first product
      await homeRobot.tapOnFirstRecentlyOrdered();

      //verify navigate to material detail
      viewByItemsDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T56 | Verify slide Product in Browse Product in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //Swipe browse product to right
      final productInfo = homeRobot.getFirstBrowseProductInfo();
      await homeRobot.slideToNextBrowseProducts();
      homeRobot.verifyNotFoundWidgetByText(productInfo);

      //Swipe browse product to left
      await homeRobot.slideToPreviousBrowseProducts();
      homeRobot.verifyFoundWidgetByText(productInfo);
    });

    testWidgets('EZRX-T57 | Verify click on Product in Browse Product',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //tap on first product
      await homeRobot.tapOnFirstBrowseProduct();

      //verify navigate to material page
      productDetailRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T23 | Verify click on Returns action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();

      //verify go to returns page
      returnsRootRobot.verifyRootPageVisible();

      await commonRobot.tapToBackScreen();
      await commonRobot.navigateToScreen(NavigationTab.more);
      moreRobot.findReturnsTile();
    });

    // TODO: enable this when we have the ship to code with disable return is true for TH
    // testWidgets(
    //     'EZRX-T2255 | Verify quick access return buttons are not visible if ship to code disable return',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester, shipToCode: shipToWithDisableReturn);

    //   //verify on home quick access return
    //   homeRobot.findQuickAccessReturns(isVisible: false);

    //   await commonRobot.navigateToScreen(NavigationTab.notifications);

    //   await commonRobot.navigateToScreen(NavigationTab.more);
    //   moreRobot.findReturnsTile(isVisible: false);
    // });

// TODO there have SVG error
    // testWidgets('EZRX-T59 | Verify click on Announcement in Announcements',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //move to Announcements
    //   await homeRobot.findAnnouncementsIcon();

    //   //tap on first product
    //   await homeRobot.tapOnFirstAnnouncement();

    //   //verify announcement detail page
    //   // announcementDetailRobot.verifyPage();
    // });
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

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifySheet();
      filterSortProductRobot.verifyDefaultFilterProduct(
        verifyBundleOffer: false,
      );
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

    testWidgets('EZRX-38 | Verify Filter by product on offer', (tester) async {
      const offerCheckbox = 'Items with offers';

      await pumpAppWithHomeScreen(tester);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openFilterProductScreen();

      await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyOnOfferLabel();
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.tapBackButton();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        offerCheckbox,
        true,
      );
      await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        offerCheckbox,
        false,
      );
    });

    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterCountryOfOriginScreen();
      await filterSortProductRobot.searchWithKeyboardAction(countryOfOrigin);
      filterSortProductRobot.verifyListCountryOfOriginMatched(countryOfOrigin);
      await filterSortProductRobot.tapFirstSuggestedCountry();
      await commonRobot.tapToBackIcon();
      await Future.delayed(const Duration(seconds: 3));
      filterSortProductRobot.verifyCountryListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      await productRobot.tapFirstMaterial();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyCountryOfOriginDisplayed(countryOfOrigin);
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
// Will uncomment this when the filter issue is resolved
    // testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
    //   await pumpAppWithHomeScreen(tester);

    //   await productRobot.navigateToScreen(NavigationTab.products);
    //   productRobot.verifyMaterial();
    //   final firstProduct = productRobot.getFistMaterialName();
    //   await productRobot.openFilterProductScreen();
    //   await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
    //   filterSortProductRobot.verifyRadioSort(
    //     sortByZToA,
    //     true,
    //   );
    //   await filterSortProductRobot.tapFilterApplyButton();
    //   productRobot.verifyProductSortChanged(firstProduct);
    //   await productRobot.openFilterProductScreen();
    //   filterSortProductRobot.verifyRadioSort(
    //     sortByZToA,
    //     true,
    //   );
    // });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
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
    });

    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct(
        verifyBundleOffer: false,
      );
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
      filterSortProductRobot.verifyDefaultFilterProduct(
        verifyBundleOffer: false,
      );
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
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      productRobot.verifyPageVisible();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(invalidSearchKey);
      productRobot.verifyNoProduct();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
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
  });

  group('Material detail -', () {
    testWidgets('EZRX-T62 | Verify material detail with basic information',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyProductPriceDisplayed();
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
    });
// TODO we do not have multiimage material for now
    // testWidgets('EZRX-T64 | Verify display image when having multiple images',
    //     (tester) async {
    //   await pumpAppWithHomeScreen(tester);

    //   await commonRobot.navigateToScreen(NavigationTab.products);
    //   await productRobot.openSearchProductScreen();
    //   await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
    //   await productRobot.tapSearchMaterial(multiImageMaterialNumber);
    //   // final havingMultipleImage =
    //   //     await productDetailRobot.verifyMultipleImages();
    //   // if (havingMultipleImage) {
    //   productDetailRobot.verifyImageMaterialSelected(0, true);
    //   productDetailRobot.verifyImageMaterialSelected(1, false);
    //   await productDetailRobot.tapToImageMaterial(1, false);
    //   productDetailRobot.verifyImageMaterialSelected(1, true);
    //   // }
    // });

    testWidgets('EZRX-T65| Verify available offers in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

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
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot.verifyCloseButtonMaterialInformationDialog();
      await productDetailRobot.tapCloseButtonMaterialInformationDialog();
      await productDetailRobot.verifyRelateProductDisplayed();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      await productDetailRobot.tapBackButton();
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

    //TODO: Fail still allow add more maximum to cart
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

    testWidgets('EZRX-T68 | Verify suspended banner ', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(suspendedMaterialNumber);
      await productRobot.tapSearchMaterial(suspendedMaterialNumber);
      productDetailRobot.verifySuspendedBanner();
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartSuccessMessage(isVisible: false);
      productDetailRobot.verifyCartButtonQty(0);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

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
  });

  group('Cart -', () {
    testWidgets(
        'EZRX-T1033 | Verify material with price not available can be able to add to cart',
        (tester) async {
      const qty = 1000;
      final totalMaterialPriceHavingNA = materialUnitPriceHavingNA;
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
      cartRobot.verifyMaterialNumber(materialNumberHavingPriceNA);
      cartRobot.verifyMaterialImage(materialNumberHavingPriceNA);
      await cartRobot.changeMaterialQty(materialNumberHavingPriceNA, qty);
      cartRobot.verifyMaterialQty(materialNumberHavingPriceNA, qty);
      cartRobot.verifyMaterialDescription(
        materialNumberHavingPriceNA,
        materialNameHavingPriceNA,
      );
      cartRobot.verifyMaterialUnitPrice(
        materialNumberHavingPriceNA,
        materialUnitPriceHavingNA,
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumberHavingPriceNA,
        totalMaterialPriceHavingNA,
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
      await pumpAppWithHomeScreen(tester);
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
      cartRobot.verifyMaterialNumber(materialNumber);
      cartRobot.verifyMaterialImage(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialDescription(materialNumber, materialName);
      final materialUnitPrice = cartRobot.getMaterialUnitPrice(materialNumber);
      cartRobot.verifyMaterialDescription(materialNumber, materialName);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot.verifyCartTotalPrice(
        materialUnitPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      cartRobot.verifyCheckoutButton();

      var totalPrice = materialUnitPrice;
      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T101 | Verify material on offer with bonus in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
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
        1,
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
        bonusMaterialName,
      );
      cartRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      var newBonusQty = 2;
      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberTierQty * newBonusQty,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
      await cartRobot.decreaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      newBonusQty--;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
      await cartRobot.increaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      newBonusQty++;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
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
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productRobot.tapSearchMaterial(otherInfoMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyCartQty(2);
      await cartRobot.tapClearCartButton();
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T102 | Verify add bonus/sample item in cart',
        (tester) async {
      const maxQty = 99999;
      const validQty = 10;
      const materialIndex = 0;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify display
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialBonusSampleButton(materialNumber);
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      bonusSampleRobot.verifySheet(isVisible: true);
      bonusSampleRobot.verifySearchBar();
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      bonusSampleRobot.verifyBonusSampleItems();
      bonusSampleRobot.verifyCloseButton();
      await bonusSampleRobot.tapCloseButton();
      bonusSampleRobot.verifySheet(isVisible: false);
      //Happy case when adding
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      final bonusSampleMaterialNumber =
          bonusSampleRobot.getBonusSampleMaterialNumber(materialIndex);
      final bonusSampleMaterialDescription =
          bonusSampleRobot.getBonusSampleMaterialDescription(materialIndex);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: true);
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, validQty);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: false);
      //Unhappy case when adding
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, maxQty);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyInvalidQtyMessage();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await tester.pumpAndSettle();
      await bonusSampleRobot.tapCloseButton();
      bonusSampleRobot.verifySheet(isVisible: false);
      await cartRobot.verifyBonusMaterial(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        materialNumber,
        bonusSampleMaterialNumber,
        validQty,
      );
      cartRobot.verifyBonusMaterialDescription(
        materialNumber,
        bonusSampleMaterialNumber,
        bonusSampleMaterialDescription,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      cartRobot.verifyBonusMaterialTag(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      cartRobot.verifyBonusMaterialImage(
        materialNumber,
        bonusSampleMaterialNumber,
      );
    });

    //TODO: Fail API
    // testWidgets('EZRX-T105 | Verify counter offer price with remark',
    //     (tester) async {
    //   const newUnitPrice = materialUnitPrice + 100;
    //   const remark = 'AUTO-TEST';

    //   //init app
    //   await pumpAppWithHomeScreen(tester);
    //   await browseProductFromEmptyCart();

    //   //verify
    //   await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    //   await productRobot.tapSearchMaterial(materialNumber);
    //   await productDetailRobot.tapAddToCart();
    //   await productDetailRobot.tapCartButton();
    //   await cartRobot.verifyMaterial(materialNumber);
    //   cartRobot.verifyMaterialUnitPrice(
    //     materialNumber,
    //     materialUnitPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyMaterialCounterOfferButton(materialNumber);
    //   await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    //   requestCounterOfferRobot.verifySheet(isVisible: true);
    //   requestCounterOfferRobot.verifyListPrice(
    //     materialUnitPrice.priceDisplay(currency),
    //     isVisible: false,
    //   );
    //   requestCounterOfferRobot.verifyOfferPrice(
    //     materialUnitPrice.priceDisplay(currency),
    //   );
    //   requestCounterOfferRobot.verifyPriceTextField();
    //   requestCounterOfferRobot.verifyPriceText('');
    //   requestCounterOfferRobot.verifyRemarkTextField();
    //   requestCounterOfferRobot.verifyRemarkText('');
    //   requestCounterOfferRobot.verifyRemarkMaximumLengthMessage();
    //   requestCounterOfferRobot.verifyConfirmButton();
    //   requestCounterOfferRobot.verifyCancelButton();
    //   await requestCounterOfferRobot.tapCancelButton();
    //   requestCounterOfferRobot.verifySheet(isVisible: false);
    //   cartRobot.verifyMaterialUnitPrice(
    //     materialNumber,
    //     materialUnitPrice.priceDisplay(currency),
    //   );

    //   await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    //   await requestCounterOfferRobot.tapConfirmButton();
    //   requestCounterOfferRobot.verifyPriceTextEmptyMessage();
    //   await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
    //   await requestCounterOfferRobot.enterRemark(remark);
    //   await requestCounterOfferRobot.tapConfirmButton();
    //   requestCounterOfferRobot.verifySheet(isVisible: false);
    //   cartRobot.verifyMaterialUnitPrice(
    //     materialNumber,
    //     newUnitPrice.priceDisplay(currency),
    //   );
    //   await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    //   requestCounterOfferRobot
    //       .verifyOfferPrice(newUnitPrice.priceDisplay(currency));
    //   requestCounterOfferRobot.verifyPriceText(newUnitPrice.toStringAsFixed(1));
    //   requestCounterOfferRobot.verifyRemarkText(remark);
    // });

    testWidgets('EZRX-T114 | Verify address information in cart',
        (tester) async {
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
      cartRobot.verifyCartQty(1);
      await cartRobot.tapShowShipToAddressDetail();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: true);
      cartDeliveryAddressDetailRobot.verifyCustomerCode(customerCode);
      cartDeliveryAddressDetailRobot.verifyShipToCode(shipToCode);
      await cartDeliveryAddressDetailRobot.tapCloseButton();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T97 | Verify price summary in cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();
      final materialUnitPrice = cartRobot.getMaterialUnitPrice(materialNumber);
      //verify
      cartRobot.verifyCartTotalPrice(
        materialUnitPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        materialUnitPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T110 | Verify cart under minimum order value',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productRobot.tapSearchMaterial(lowPriceMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      final lowPriceMaterialUnitPrice =
          cartRobot.getMaterialUnitPrice(materialNumber);
      final validQty = (minOrderAmount / lowPriceMaterialUnitPrice).ceil();
      final validTotalPrice = lowPriceMaterialUnitPrice * validQty;
      await cartRobot.verifyMaterial(lowPriceMaterialNumber);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 1);
      cartRobot.verifyMaterialUnitPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        lowPriceMaterialUnitPrice
            .includeTax(taxForMaterial)
            .priceDisplay(currency),
      );
      await cartRobot.tapCheckoutButton();
      cartRobot.verifyMOVWarningMessage(
        minOrderAmount.priceDisplay(currency),
        isVisible: true,
      );
      await cartRobot.changeMaterialQty(lowPriceMaterialNumber, validQty);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, validQty);
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        validTotalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        validTotalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      cartRobot.verifyMOVWarningMessage(
        minOrderAmount.priceDisplay(currency),
        isVisible: false,
      );
    });

    testWidgets('EZRX-T115 | Verify checkout cart when having pre-order items',
        (tester) async {
      const qty = 100;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(oosPreOrderMaterialNumber);
      await productRobot.tapSearchMaterial(oosPreOrderMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(oosPreOrderMaterialNumber);
      cartRobot.verifyMaterialOOSPreOrderStatus(oosPreOrderMaterialNumber);
      await cartRobot.changeMaterialQty(oosPreOrderMaterialNumber, qty);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifySheet(isVisible: true);
      oosPreOrderRobot.verifyCancelButton();
      oosPreOrderRobot.verifyContinueButton();
      oosPreOrderRobot.verifyWarningMessage();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      await oosPreOrderRobot.tapCancelButton();
      cartRobot.verifyPage();
      oosPreOrderRobot.verifySheet(isVisible: false);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      await oosPreOrderRobot.tapContinueButton();
      checkoutRobot.verifyPage();
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1000;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.verifyPaymentTermField(isVisible: false);
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      final materialUnitPrice =
          checkoutRobot.getMaterialUnitPrice(materialNumber);
      final totalPrice = materialUnitPrice * qty;
      await checkoutRobot.verifySubTotalLabel(
        totalPrice.priceDisplay(currency),
      );
      await checkoutRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1000);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.verifyPaymentTermField(isVisible: false);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.enterReferenceNote(poReferenceNote);

      await checkoutRobot.tapPlaceOrderButton();

      orderSuccessRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1000;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.enterReferenceNote(poReferenceNote);
      (poReference);
      //verify
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      final materialUnitPrice =
          checkoutRobot.getMaterialUnitPrice(materialNumber);
      final newUnitPrice = materialUnitPrice + 100;
      final newTotalPrice = (newUnitPrice * qty);
      checkoutRobot.verifyMaterialQty(materialNumber, qty);
      checkoutRobot.verifyMaterialDescription(materialNumber, materialName);
      checkoutRobot.verifyMaterialImage(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        (materialUnitPrice * qty).priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: false,
      );
      await checkoutRobot.tapCloseButton();
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      await cartRobot.tapCheckoutButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      (poReference);
      //verify
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        newTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: true,
      );
      await checkoutRobot
          .verifySubTotalLabel(newTotalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        newTotalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        newTotalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
    });

    // TODO We do not have offer material for now
    testWidgets(
        'EZRX-T119 | Verify display material on offer with bonus in checkout',
        (tester) async {
      const qty = 1000;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      const poReference = 'po-reference';

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(
        bonusMaterialNumber,
        qty,
      );

      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.enterReferenceNote(poReferenceNote);

      //verify
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMaterial(bonusMaterialNumber);
      final bonusMaterialNumberUnitPrice =
          checkoutRobot.getMaterialUnitPrice(bonusMaterialNumber);
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);
      final grandTotalPrice = (bonusMaterialNumberUnitPrice * qty)
          .includeTax(taxForMaterial)
          .priceDisplay(currency);
      checkoutRobot.verifyMaterialUnitPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
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
        bonusMaterialName,
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
      await checkoutRobot.verifyGrandTotalLabel(grandTotalPrice);
      checkoutRobot.verifyStickyGrandTotal(grandTotalPrice);
      checkoutRobot.verifyStickyTotalQty(2);
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1000);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.enterReferenceNote(poReferenceNote);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
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
      const qty = 1000;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.enterReferenceNote(poReferenceNote);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(materialNumber);
      orderSuccessRobot.verifyMateriaDescription(materialName);
      final materialUnitPrice = orderSuccessRobot.getMaterialUnitPrice();
      final totalPrice = materialUnitPrice * qty;
      await orderSuccessRobot
          .verifySubTotal((materialUnitPrice * qty).priceDisplay(currency));
      await orderSuccessRobot.verifyGrandTotal(
        totalPrice.includeTax(taxForMaterial).priceDisplay(currency),
      );
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(materialUnitPrice.priceDisplay(currency));
      orderSuccessRobot.verifyMaterialTotalPrice(
        (materialUnitPrice * qty).priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T125 | Verify display material on offer with bonus in order submitted',
        (tester) async {
      const qty = 1000;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(
        bonusMaterialNumber,
        qty,
      );
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: true);
      await checkoutRobot.enterReferenceNote(poReferenceNote);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      final bonusMaterialNumberUnitPrice =
          orderSuccessRobot.getMaterialUnitPrice();
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);
      final grandTotalPrice = (bonusMaterialNumberUnitPrice * qty)
          .includeTax(taxForMaterial)
          .priceDisplay(currency);
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(grandTotalPrice);
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyMaterialTotalPrice(totalPrice);
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(bonusQty);
      orderSuccessRobot.verifyMaterialBonusTag();
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
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        final productName = viewByItemsRobot.getFirstProductName();
        await commonRobot.searchWithKeyboardAction(productName);
        viewByItemsRobot.verifyOrdersWithProductName(productName);
        await commonRobot.pullToRefresh();
        await commonRobot.tapClearSearch();
        commonRobot.verifySearchBarText('');

        final materialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithKeyboardAction(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
        await commonRobot.pullToRefresh();

        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        await commonRobot.autoSearch(orderId);
        viewByItemsRobot.verifyOrdersWithOrderCode(orderId);
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
        const statusFilter = 'Order created';

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
        //init app
        await pumpAppWithHomeScreen(tester);
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
        await viewByItemsDetailRobot
            .verifyManufacturerName(orderItemPrincipleName);
        await viewByItemsDetailRobot.verifyItemComponent();
      });

      testWidgets('EZRX-T91 | Verify material in view by item detail',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        //Need to tap offer tag because this is offer material
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot
            .verifyManufacturerName(materialPrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        // Uncomment this when test data is material without offer
        // await viewByItemsDetailRobot.verifyOtherItemsComponent(
        //   isVisible: false,
        // );
        // viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 1000;
        const bonusPrincipleNameForOrder = 'COVIDIEN (Thailand) LIMITED.';
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(
          bonusMaterialNumber,
          qty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOfferTag();
        await viewByItemsRobot.tapFirstOfferTag();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusPrincipleNameForOrder);
        await viewByItemsDetailRobot.verifyItemComponentWithBonus();
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(0);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(qty);
        viewByItemsDetailRobot.verifySelectedItemOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(1);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(bonusQty);
        viewByItemsDetailRobot.verifySelectedItemBonusLabel();
        viewByItemsDetailRobot.verifySelectedItemFreePrice();
        await viewByItemsDetailRobot.tapToBackScreen();

        viewByItemsRobot.verifyBonusLabel();
        await viewByItemsRobot.tapFirstBonusLabel();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusPrincipleNameForOrder);
        await viewByItemsDetailRobot.verifyItemComponentWithBonus();
        viewByItemsDetailRobot.verifyBonusLabel();
        viewByItemsDetailRobot.verifyFreePrice();
        await viewByItemsDetailRobot.startVerifyItem(0);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(qty);
        viewByItemsDetailRobot.verifySelectedItemOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(1);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(bonusQty);
        viewByItemsDetailRobot.verifySelectedItemBonusLabel();
        viewByItemsDetailRobot.verifySelectedItemFreePrice();
        viewByItemsDetailRobot.verifyBuyAgainButton(
          isVisible: true,
        );
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

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
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
        await pumpAppWithHomeScreen(
          tester,
        );

        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
      });
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.verifyOrderSummarySection();

        await orderSuccessRobot.verifyOrderItemTotalQty(1);
        await orderSuccessRobot.startVerifyMaterial(index: 0);
        orderSuccessRobot.verifyMaterialNumber(
          materialNumber,
        );
        orderSuccessRobot.verifyMateriaDescription(materialName);
        final materialUnitPrice = orderSuccessRobot.getMaterialUnitPrice();
        final price = (materialUnitPrice * qty).priceDisplay(currency);
        final grandTotal = (materialUnitPrice * qty)
            .includeTax(taxForMaterial)
            .priceDisplay(currency);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await commonRobot.pullToRefresh();
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot.verifyOrderId(orderId);
        viewByOrdersDetailRobot.verifyOrderDate();
        viewByOrdersDetailRobot.verifyPoReference(poReference);
        viewByOrdersDetailRobot.verifyOrderAddress(shipToAddress);
        viewByOrdersDetailRobot.verifyCustomerCode(customerCode);
        viewByOrdersDetailRobot.verifyDeliveryTo(shipToCode);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot.verifySubTotal(price);
        viewByOrdersDetailRobot.verifyGrandTotal(grandTotal);
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
        await pumpAppWithHomeScreen(tester);

        //setup data
        await checkoutWithMaterial(
          materialNumber,
          orderQty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
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
        await ordersRootRobot.switchToViewByOrders();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
        // TODO: Revist when popup 'Reoder for this delivery address? is added to add new test step
      });

      testWidgets(
          'EZRX-T90 | Verify material with offer + navigate to item detail + buy again',
          (tester) async {
        const bonusPrincipleNameForOrder = 'COVIDIEN (Thailand) LIMITED.';
        const qty = 1000;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;
        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await checkoutWithMaterial(
          bonusMaterialNumber,
          qty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: true);
        await checkoutRobot.enterReferenceNote(poReferenceNote);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot.verifyOrderDate();
        viewByOrdersDetailRobot.verifyPoReference(poReference);
        viewByOrdersDetailRobot.verifyOrderAddress(shipToAddress);
        viewByOrdersDetailRobot.verifyCustomerCode(customerCode);
        viewByOrdersDetailRobot.verifyDeliveryTo(shipToCode);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(bonusMaterialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyOfferTag();
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusPrincipleNameForOrder);
        await viewByItemsDetailRobot.verifyItemComponentWithBonus();
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(0);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(qty);
        viewByItemsDetailRobot.verifySelectedItemOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(1);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(bonusQty);
        viewByItemsDetailRobot.verifySelectedItemBonusLabel();
        viewByItemsDetailRobot.verifySelectedItemFreePrice();
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
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusPrincipleNameForOrder);
        await viewByItemsDetailRobot.verifyItemComponentWithBonus();
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(0);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(qty);
        viewByItemsDetailRobot.verifySelectedItemOfferTag();
        await viewByItemsDetailRobot.startVerifyItem(1);
        viewByItemsDetailRobot.verifySelectedItemMaterialNo(
          bonusMaterialNumber,
        );
        viewByItemsDetailRobot.verifySelectedItemQty(bonusQty);
        viewByItemsDetailRobot.verifySelectedItemBonusLabel();
        viewByItemsDetailRobot.verifySelectedItemFreePrice();
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

  group('Contact us -', () {
    const phoneNumber = '82366498';

    const userNameInitValue = '$userFirstName $userLastName';
    const emailInitValue = 'jhchoo@zuelligpharma.com';

    Future<void> goToContactUs() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapContactUsTile();
    }

    testWidgets('EZRX-T201 | Verify page contact us is displayed',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      contactUsRobot.verifyContactDetailHtml();
      contactUsRobot.verifyAllFieldVisible();
      contactUsRobot.verifyInitValueField(
        userName: userNameInitValue,
        email: emailInitValue,
      );
    });

    testWidgets('EZRX-T202 | Verify send message successful', (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterPhoneNumberField(phoneNumber);
      await contactUsRobot.enterMessageField(phoneNumber);
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyContactUsSuccessMessage();
    });

    testWidgets('EZRX-T203 | Verify send message without Your Name',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterUserNameField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyUserNameRequireErrorMsg();
    });

    testWidgets('EZRX-T204 | Verify send message without Contact Number',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyPhoneNumberInValidErrorMsg();
    });

    testWidgets('EZRX-T205 | Verify send message without E-mail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterEmailField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyEmailRequireErrorMsg();
    });

    testWidgets('EZRX-T206 | Verify send message without Message',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterMessageField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyMessageFieldRequireErrorMsg();
    });

    testWidgets('EZRX-T207 | Verify send message with email invalid',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterEmailField('integrationTest@mail');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyEmailInValidErrorMsg();
    });
  });

  group('Security -', () {
    Future<void> goToSecurityPage() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapSecurityTile();
    }

    testWidgets(
        'EZRX-T240 | Verify Security(Change Password) page - all initial fields',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

      securityRobot.verifyAllItemVisible();
      securityRobot.verifyAllFieldEmpty();
      securityRobot.verifyObscureTextCurrentPassword(true);
      securityRobot.verifyObscureTextNewPassword(true);
      securityRobot.verifyObscureTextConfirmPassword(true);

      await securityRobot.tapToBackToMoreScreen();
      moreRobot.verifyMoreScreenVisible();
    });

    testWidgets(
        'EZRX-T241 | Verify Security(Change Password) page - current password validation',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

      await securityRobot.tapToSaveButton();
      securityRobot.verifyRequireErrorMsgCurrentPassword(true);
      securityRobot.verifyErrorMessageAllFieldRequire();

      await securityRobot.fillToCurrentPasswordField(password);
      securityRobot.verifyObscureTextCurrentPassword(true);
      securityRobot.verifyRequireErrorMsgCurrentPassword(false);

      await securityRobot.tapToObscureIconInCurrentPasswordField(false);
      securityRobot.verifyObscureTextCurrentPassword(false);
      securityRobot.verifyValueCurrentPasswordField(password);

      await securityRobot.tapToObscureIconInCurrentPasswordField(true);
      securityRobot.verifyObscureTextCurrentPassword(true);
    });

    testWidgets(
        'EZRX-T242 | Verify Security(Change Password) page - new password validation',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

      await securityRobot.tapToObscureIconInNewPasswordField(false);
      securityRobot.verifyObscureTextNewPassword(false);

      await securityRobot.tapToSaveButton();
      securityRobot.verifyRequireErrorMsgNewPassword(true);
      securityRobot.verifyErrorMessageAllFieldRequire();

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(false);
      securityRobot.verifyConditionValidationPasswordContainLowercase(false);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        false,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        false,
      );

      await securityRobot.fillToNewPasswordField('S');
      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(false);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        false,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        true,
      );

      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St');
      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(true);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        false,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        true,
      );

      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@');

      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(true);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        true,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        true,
      );

      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@use');
      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(true);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        true,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        false,
      );

      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@ysafe0');
      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(true);
      securityRobot.verifyConditionValidationPasswordContainNumeric(true);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        true,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        true,
      );

      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@ysafe01');
      securityRobot.verifyRequireErrorMsgNewPassword(false);

      securityRobot.verifyConditionValidationPasswordMinimumLength(true);
      securityRobot.verifyConditionValidationPasswordContainUppercase(true);
      securityRobot.verifyConditionValidationPasswordContainLowercase(true);
      securityRobot.verifyConditionValidationPasswordContainNumeric(true);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        true,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        true,
      );

      await securityRobot.tapToObscureIconInNewPasswordField(true);
      securityRobot.verifyObscureTextNewPassword(true);
    });
    testWidgets(
        'EZRX-T243 | Verify Security(Change Password) page - new password again validation',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

      await securityRobot.tapToSaveButton();
      securityRobot.verifyRequireErrorMsgConfirmPassword(true);
      securityRobot.verifyErrorMessageAllFieldRequire();

      await securityRobot.fillToConfirmPasswordField(password);
      securityRobot.verifyObscureTextConfirmPassword(true);
      securityRobot.verifyPasswordMismatchErrorMsg();

      await securityRobot.tapToObscureIconInConfirmPasswordField(false);
      securityRobot.verifyObscureTextConfirmPassword(false);
      securityRobot.verifyValueConfirmPasswordField(password);

      await securityRobot.tapToObscureIconInConfirmPasswordField(true);
      securityRobot.verifyObscureTextConfirmPassword(true);
    });

    testWidgets(
        'EZRX-T244 | Verify Security(Change Password) page - current, new password & new password again validation',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

      await securityRobot.tapToObscureIconInCurrentPasswordField(false);
      await securityRobot.tapToObscureIconInNewPasswordField(false);
      await securityRobot.tapToObscureIconInConfirmPasswordField(false);
      securityRobot.verifyObscureTextCurrentPassword(false);
      securityRobot.verifyObscureTextNewPassword(false);
      securityRobot.verifyObscureTextConfirmPassword(false);

      await securityRobot.tapToSaveButton();
      securityRobot.verifyRequireErrorMsgCurrentPassword(true);
      securityRobot.verifyRequireErrorMsgNewPassword(true);
      securityRobot.verifyRequireErrorMsgConfirmPassword(true);
      securityRobot.verifyErrorMessageAllFieldRequire();

      securityRobot.verifyConditionValidationPasswordMinimumLength(false);
      securityRobot.verifyConditionValidationPasswordContainUppercase(false);
      securityRobot.verifyConditionValidationPasswordContainLowercase(false);
      securityRobot.verifyConditionValidationPasswordContainNumeric(false);
      securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
        false,
      );
      securityRobot
          .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
        false,
      );

      await securityRobot.fillToCurrentPasswordField(password);
      await securityRobot.fillToNewPasswordField(password);
      securityRobot.verifyRequireErrorMsgCurrentPassword(false);
      securityRobot.verifyRequireErrorMsgNewPassword(false);
      securityRobot.verifySameOldPasswordErrorMsg(true);

      await securityRobot.fillToCurrentPasswordField(password);
      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@ysafe012');
      securityRobot.verifyRequireErrorMsgCurrentPassword(false);
      securityRobot.verifySameOldPasswordErrorMsg(false);

      await securityRobot.fillToCurrentPasswordField(password);
      await securityRobot.tapToConfirmPasswordField();
      await securityRobot.fillToNewPasswordField('St@ysafe012');
      await securityRobot.fillToConfirmPasswordField('St@ysafe011');
      securityRobot.verifyPasswordMismatchErrorMsg();

      await securityRobot.tapToClearChangeButton();
      securityRobot.verifyAllFieldEmpty();
    });
  });

  group('Announcement & Article -', () {
    Future<void> goToAnnouncementArticlePage() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapAnnouncementArticleTile();
    }

    group('Article -', () {
      Future<void> goToArticlePage() async {
        announcementArticleRootRobot.verifyAnnouncementPage();
        await announcementArticleRootRobot.switchToArticleTab();
      }

      testWidgets('EZRX-T160 | Verify articles page', (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();

        announcementArticleRootRobot.verifyAnnouncementPage();
        announcementArticleRootRobot.verifyTabBar();
        await goToArticlePage();
        articleRobot.verifySearchBar();
        articleRobot.verifyFilterIcon();
        articleRobot.verifyArticleItemsVisible();
      });

      testWidgets('EZRX-T163 | Verify detail articles', (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        articleRobot.verifySearchBar();
        await commonRobot
            .searchWithKeyboardAction(articleRobot.getFirstTitle());
        await articleRobot.tapArticleItem();
        articleDetailsRobot.verifyArticleDetailsPage();
        await articleDetailsRobot.tapArticleDetailsBackButton();
        announcementArticleRootRobot.verifyArticlesPage();
      });

      testWidgets('EZRX-T165 | Verify search articles invalid data',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        articleRobot.verifyNotFoundData();

        await commonRobot.tapClearSearch();
        articleRobot.verifyArticleItemsVisible();
      });

      testWidgets(
          'EZRX-T166 | Verify search Article valid data - on done keyboard button',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        final validSearchKey = articleRobot.getFirstTitle();
        await commonRobot.searchWithKeyboardAction(validSearchKey);
        articleRobot.verifyArticleItemsVisible();
        articleRobot.verifyArticleItemWithSearchKey(searchKey: validSearchKey);
      });

      testWidgets(
          'EZRX-T252 | Verify search Article valid data - on search icon button',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        final validSearchKey = articleRobot.getFirstTitle();
        articleRobot.verifyArticleItemsVisible();
        await commonRobot.searchWithKeyboardAction(validSearchKey);
        articleRobot.verifyArticleItemsVisible();
        articleRobot.verifyArticleItemWithSearchKey(searchKey: validSearchKey);
      });

      testWidgets(
          'EZRX-T171 | Verify search any one item & Tap & Verify Detail page in details',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        articleRobot.verifyArticleItemsVisible();
        await commonRobot
            .searchWithKeyboardAction(articleRobot.getFirstTitle());
        articleRobot.verifyArticleItemsVisible();
        await articleRobot.tapArticleItem();
        articleDetailsRobot.verifyArticleDetailsPage();
      });
    });
  });

  group('Profile -', () {
    void verifyAllComponentsVisible() {
      profileRobot.verifyAccountAndBusinessDetailsVisible(
        firstName: userFirstName,
        lastName: userLastName,
        email: 'jhchoo@zuelligpharma.com',
        username: username,
        mobilePhone: 'NA',
        language: 'English',
      );
      profileRobot.verifyLicenseListVisible();
      profileRobot.verifyButtonsDisabled();
    }

    testWidgets('EZRX-T176 | Verify Profile Page', (tester) async {
      //navigate to page
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
    });

    testWidgets('EZRX-T177 | Verify Refresh Profile Page', (tester) async {
      //navigate to page
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
      await commonRobot.pullToRefresh();
      verifyAllComponentsVisible();
    });

    testWidgets('EZRX-T179 | Verify change language suscess', (tester) async {
      //Cannot change Language because PH market has only English language.
      //Skip this test cases
    });

    testWidgets('EZRX-T180 | Verify update profile after clear changes',
        (tester) async {
      //Cannot change Language because PH market has only English language,
      //So that cannot verify update profile after clear changes,
      //Skip this test cases
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
