import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/auth/forgot_password_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
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
import '../../robots/products/bundle_detail_robot.dart';
import '../../robots/products/covid_detail_robot.dart';
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
  late ForgotPasswordRobot forgotPasswordRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late CovidDetailRobot covidDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late BundleDetailRobot bundleDetailRobot;
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

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;

  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryDetailRobot paymentDetailRobot;
  // late AccountInvoiceDetailRobot accountInvoiceDetailRobot;

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
    covidDetailRobot = CovidDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
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

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);

    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
    // accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);
  }

  const market = 'Singapore';
  const username = 'sgclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030032829';
  const shipToCode = '0070043298';
  const shipToAddress = 'Order for Group Procurement Office';
  const currency = 'SGD';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const minOrderAmount = 100.0;
  const tax = 9;

  //Price not available material
  const materialNumberHavingPriceNA = '21223518';
  const materialNameHavingPriceNA = "999trate Plus 1000iu Tab 60'siu Tab 60's";
  const materialPrincipalNameHavingPriceNA = 'Pfizer PFE Private Limited test';
  final materialUnitPriceHavingNA = 'Price Not Available'.tr();

  const materialNumber = '21036865';
  const materialName = 'ACNE-AID BAR X100G';

  const materialPrincipalName = 'GSK Consumer Healthcare';
  const materialCountryOfOrigin = 'Malaysia';
  const materialUnitMeasurement = 'EA';
  const materialUnitPrice = 7.25;
  const multiImageMaterialNumber = materialNumber;
  const otherInfoMaterialNumber = materialNumber;
  const suspendedMaterialNumber = '21027135';
  const lowPriceMaterialNumber = materialNumber;
  const lowPriceMaterialUnitPrice = 7.25;
  const bonusMaterialNumber = '21035367';
  const bonusMaterialNumberTierQty = 3;
  const bonusMaterialNumberUnitPrice = 87.78;
  const bonusManufacturerName = 'GlaxoSmithKline Pte Ltd';
  const bonusMaterialName = "Augmentin Tab 625mg 1x14's";
  const oosPreOrderMaterialNumber = '23008071';
  const bundleShortNumber = '9922498';
  const bundleNumber = '0009922498';
  const bundleName = 'group 2';
  const bundlePrincipalName = 'AstraZeneca Singapore Pte Ltd';
  const bundleTier1Qty = 5;
  const bundleTier1UnitPrice = 150.0;
  const bundleTier1UnitPriceDisplay = '$currency $bundleTier1UnitPrice';
  const bundleTier2Qty = 10;
  const bundleTier2UnitPrice = 120.0;
  const bundleTier2UnitPriceDisplay = '$currency $bundleTier2UnitPrice';
  const bundleMaterialNumber1 = '23007415';
  const bundleMaterialName1 = '?Imdur Depot Tab 60mg 2x15';
  const bundleMaterialNumber2 = '23007425';
  const bundleMaterialName2 = 'IMFINZI INJ 120MG VI 1X2.4ML SG';
  const poReference = 'Auto-test-po-reference';
  const deliveryInstruction = 'Auto-test-delivery-instruction';
  const orderId = '0200365136';
  final materialStockInfo = StockInfo.empty().copyWith(
    expiryDate: DateTimeStringValue(
      '2027-03-20',
    ),
  );
  final bonusMaterialStockInfo = StockInfo.empty();
  final oosPreOrderMaterialStockInfo = StockInfo.empty();
  final materialExpiryDate = materialStockInfo.expiryDate.dateOrNaString;
  final materialBatchNumber = materialStockInfo.batch.displayNAIfEmpty;
  final bundleStockInfoList = [
    StockInfo.empty().copyWith(
      materialNumber: MaterialNumber('23007425'),
      expiryDate: DateTimeStringValue('2025-03-01'),
    ),
    StockInfo.empty().copyWith(materialNumber: MaterialNumber('23340349')),
  ];

  const otherShipToCode = '0070042061';
  const otherShipToAddress = 'Order for Mon and Mon Plastic Surgery';
  const covidMaterialNumber = '23348698';
  const covidMaterialName = "?Alcohol swabs box of 200's";
  const covidMaterialPrincipalName = 'MINISTRY OF HEALTH (HQ)/AG';
  const covidCountryOfOrigin = 'USA';
  const covidUnitMeasurement = 'EA';
  const covidExpiryDate = '03 Aug 2090';
  final covidMaterialUnitPrice = 'Price Not Available'.tr();
  final covidMaterialTotalPrice = covidMaterialUnitPrice;
  const cartTotalPriceForCovidMaterial = 0.0;
  const twentySixSeriesMaterialNumber = '26031206';
  const materialWithListPriceZero = '21026761';
  final materialPriceWithListPriceZero = 'Price Not Available'.tr();
  const shipToBatchAndExp = '0070042401';
  const orderIdMultipleBatchAndExp = '0200328990';
  const materialNumberMultipleBatchAndExp = '21017890';
  const batch1 = 'UAT3';
  const batch2 = 'GLOW-01';
  const expiry1 = '20260111';
  const expiry2 = '20991231';

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
    int qty,
  ) async {
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

  Future<void> addBundleToCart(
    Map<String, int> itemMap, {
    bool doCartEmpty = true,
  }) async {
    if (doCartEmpty) {
      await browseProductFromEmptyCart();
    }
    await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    await productRobot.tapSearchBundle(bundleShortNumber);
    await bundleDetailRobot.tapAddToCartButton();
    for (final item in itemMap.entries) {
      await bundleDetailRobot.enterMaterialQty(
        item.key,
        item.value,
      );
    }
    await bundleDetailRobot.tapSheetAddToCartButton();
    await commonRobot.dismissSnackbar();
    await bundleDetailRobot.tapCartButton();
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
      await commonRobot.closeAnnouncementAlertDialog();

      //home page
      homeRobot.verify();

      //logout
      await commonRobot.navigateToScreen(NavigationTab.more);
      moreRobot.findReturnsTile();
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
      if (notificationRobot.getFirstBasicNotificationTitle().isNotEmpty) {
        notificationRobot.verifyDeleteButton();
      }
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
      if (notificationRobot.getFirstBasicNotificationTitle().isEmpty) {
        return;
      }
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
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
    });
  });

  group('Home Tab -', () {
    testWidgets('EZRX-T17 | Verify Homepage with default components',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      customerSearchRobot.verifyCustomerCodeIsSelected(shipToCode);
      homeRobot.findMiniCartIcon();
      homeRobot.findQuickAccessMenu();
      homeRobot.findQuickAccessOrders();
      homeRobot.findQuickAccessReturns();
      homeRobot.findQuickAccessPayments();
      homeRobot.findQuickAccessChatSupport();
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findBundles();
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.findAnnouncementsIcon();
    });

    testWidgets(
        'EZRX-T893 | Verify Homepage with payment menu disable for Customer with payment term C024 or A007',
        (tester) async {
      const paymentTermShipToCode1 = '0070044302';
      const paymentTermShipToCode2 = '0070043559';
      //init app
      await pumpAppWithHomeScreen(
        tester,
        shipToCode: paymentTermShipToCode1,
      );

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      customerSearchRobot.verifyCustomerCodeIsSelected(paymentTermShipToCode1);
      homeRobot.findQuickAccessPayments(isVisible: false);
      await commonRobot.changeDeliveryAddress(paymentTermShipToCode2);
      homeRobot.findQuickAccessPayments(isVisible: false);
      await commonRobot.changeDeliveryAddress(shipToCode);
      homeRobot.findQuickAccessPayments(isVisible: true);
    });

    testWidgets('EZRX-T1310 | Verify edi customer code', (tester) async {
      const ediShipToCode = '0070042483';
      //init app
      await pumpAppWithHomeScreen(
        tester,
        shipToCode: ediShipToCode,
      );

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      customerSearchRobot.verifyCustomerCodeIsSelected(ediShipToCode);
      homeRobot.verifyEdiCustomer();
    });

    testWidgets(
        'EZRX-T18 | Verify select other ShipTo in Homepage incase existing items in cart',
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
        'EZRX-T20 | Verify Search ShipTo with keyword contains valid/invalid Customer name/ShipTo',
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

    testWidgets('EZRX-T28 | Verify navigate to search product in Homepage',
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
        'EZRX-T22 | Verify navigate with top navigation menu in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();
      ordersRootRobot.verifyPage();
      await commonRobot.navigateToScreen(NavigationTab.home);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();
      returnsRootRobot.verifyRootPageVisible();
      await commonRobot.tapToBackScreen();

      //tap on home quick access payments
      homeRobot.findQuickAccessPayments();
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T44 | Verify display product on offer and navigate in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      homeRobot.findProductsOnOffer();
      homeRobot.verifyDisplayProductsWithOfferTag();

      //Navigate to product detail page
      await homeRobot.tapOnFirstProductOnOffer();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.tapBackButton();

      //Navigate to product tab
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();
      productRobot.verifyPageVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Items with offers',
        true,
      );
    });

    testWidgets('EZRX-T45 | Verify display bundle and navigate in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on bundle
      await homeRobot.findBundles();
      homeRobot.verifyDisplayBundlesTag();
      homeRobot.verifyDisplayBundlesManufactured();
      homeRobot.verifyDisplayBundlesDescription();
      await homeRobot.verifyDisplayBundlesNumber();

      //Swipe bundle
      await homeRobot.slideBundle();
      await homeRobot.slideBundle(reversed: true);

      //Navigate to bundle detail page
      await homeRobot.tapOnFirstBundle();
      bundleDetailRobot.verifyPage();
      await bundleDetailRobot.tapBackButton();

      //Navigate to product tab
      await homeRobot.findBundles();
      await homeRobot.tapBundlesIcon();
      productRobot.verifyPageVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Bundle offers',
        true,
      );
    });

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

    // TODO: enable this when we have the ship to code with disable return is true for SG
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

    // testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //tap on browse products
    //   await homeRobot.findAnnouncementsIcon();
    //   await homeRobot.tapAnnouncementsIcon();

    //   //verify go to announcements page
    //   announcementArticleRootRobot.verifyAnnouncementPage();
    // });

    // testWidgets('EZRX-T59 | Verify click on Announcement in Announcements',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //move to Announcements
    //   await homeRobot.findAnnouncementsIcon();

    //   //tap on first product
    //   await homeRobot.tapOnFirstAnnouncement();

    //   //verify announcement detail page
    //   announcementDetailRobot.verifyPage();
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

    testWidgets('EZRX-38 | Verify Filter by bundle', (tester) async {
      const bundleCheckbox = 'Bundle offers';

      await pumpAppWithHomeScreen(tester);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openFilterProductScreen();

      await filterSortProductRobot.tapProductTypeCheckbox(bundleCheckbox);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyBundle();
      await productRobot.tapFirstBundle();
      bundleDetailRobot.verifyPage();
      await bundleDetailRobot.tapToBackScreen();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        bundleCheckbox,
        true,
      );
      await filterSortProductRobot.tapProductTypeCheckbox(bundleCheckbox);
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        bundleCheckbox,
        false,
      );
    });

    testWidgets('EZRX-38 | Verify Filter by covid', (tester) async {
      const covidCheckbox = 'Covid-19';

      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openFilterProductScreen();

      await filterSortProductRobot.tapProductTypeCheckbox(covidCheckbox);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyCovid();
      await productRobot.tapFirstCovid();
      covidDetailRobot.verifyPage();
      covidDetailRobot.verifyCovidLabel();
      covidDetailRobot.verifyCovidMaterialPrice();
      await covidDetailRobot.tapBackButton();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        covidCheckbox,
        true,
      );
      await filterSortProductRobot.tapProductTypeCheckbox(covidCheckbox);
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        covidCheckbox,
        false,
      );
    });

    testWidgets('EZRX-38 | Verify Filter by using covid chip', (tester) async {
      const covidCheckbox = 'Covid-19';
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyFilterCovidChip();

      await productRobot.tapCovidChipInProductsScreen();
      productRobot.verifyOnCovidChip();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        covidCheckbox,
        true,
      );
    });

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

    testWidgets('EZRX-T33 | Verify search and navigate to bundle detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.tapSearchBundle(bundleShortNumber);
      bundleDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T33 | Verify search and navigate to covid detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      covidDetailRobot.verifyPage();
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
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchHistoryItem(bundleShortNumber);

      await productSuggestionRobot.tapDeleteSearchHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet();
      await productSuggestionRobot.tapConfirmClearHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet(isVisible: false);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      productSuggestionRobot.verifyNoSearchHistory();
    });

    testWidgets(
        'EZRX-T1435 | Check whether Customer user able to see sample material (26 series) in Product tab or not',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(twentySixSeriesMaterialNumber);
      productRobot.verifyNoProduct();
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
      productDetailRobot.verifyExpiryDate(
        materialExpiryDate,
      );
      await productDetailRobot.tapExpiryDateInfoIcon();
      await productDetailRobot.verifyExpiryDateBottomSheetAndTapClose();
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
      productDetailRobot.verifyBatchDisplayed(
        value: materialBatchNumber,
        isVisible: false,
      );
      productDetailRobot.verifyExpiryDateLabelDisplayed(
        value: materialExpiryDate,
      );
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
      // productDetailRobot.verifyOnOfferLabel();
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

    //TODO: Fail due to add maximum not get error
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

  group('Bundle detail -', () {
    testWidgets('EZRX-T212 | Verify bundles detail page', (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.tapSearchBundle(bundleShortNumber);
      bundleDetailRobot.verifyAllInformationBundleOfferDisplayed();
      await bundleDetailRobot.tapAddToCartButton();
      bundleDetailRobot.verifyAddBundleBottomSheet();
      await bundleDetailRobot.verifyBundleMaterialExpiryDateAndBatchNo(
        stockInfoList: bundleStockInfoList,
        isBatchNumberVisible: false,
      );
    });

    testWidgets('EZRX-T212 | Verify add and navigate to cart in bundle detail',
        (tester) async {
      const qty1 = 1;
      var qty2 = bundleTier1Qty - qty1;

      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.tapSearchBundle(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      bundleDetailRobot.verifyAddBundleBottomSheet();
      bundleDetailRobot.verifyAddBundleMinimumQty(bundleTier1Qty);
      bundleDetailRobot.verifyAddBundleTotalQty(0);
      bundleDetailRobot.verifyAddBundleInvalidQtyWarning(
        bundleTier1Qty,
        isVisible: false,
      );
      bundleDetailRobot
          .verifyAddBundleRate(bundleTier1UnitPrice.priceDisplay(currency));
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        qty1,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      bundleDetailRobot.verifyAddBundleInvalidQtyWarning(
        bundleTier1Qty,
        isVisible: true,
      );
      bundleDetailRobot.verifyAddBundleBottomSheet();

      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber2,
        qty2,
      );
      bundleDetailRobot.verifyAddBundleInvalidQtyWarning(
        bundleTier1Qty,
        isVisible: false,
      );

      qty2 = bundleTier2Qty - qty1;
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber2,
        qty2,
      );
      bundleDetailRobot
          .verifyAddBundleRate(bundleTier2UnitPrice.priceDisplay(currency));
      await bundleDetailRobot.tapSheetAddToCartButton();
      bundleDetailRobot.verifyAddBundleBottomSheet(isVisible: false);
      bundleDetailRobot.verifyCartButtonQty(2);
      await bundleDetailRobot.tapCartButton();
      cartRobot.verifyPage();
    });

    testWidgets('EZRX-T213 | Verify favorite in bundle detail', (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.tapSearchBundle(bundleShortNumber);

      await bundleDetailRobot.setFavoriteStatus(true);
      await bundleDetailRobot.tapToBackScreen();
      await productRobot.tapSearchBundle(bundleShortNumber);
      bundleDetailRobot.verifyFavoriteStatus(true);

      await bundleDetailRobot.setFavoriteStatus(false);
      await bundleDetailRobot.tapToBackScreen();
      await productRobot.tapSearchBundle(bundleShortNumber);
      bundleDetailRobot.verifyFavoriteStatus(false);
    });
  });

  group('Covid material detail -', () {
    testWidgets(
        'EZRX-T62 | Verify covid material detail with basic information',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      covidDetailRobot.verifyCovidLabel();
      covidDetailRobot.verifyProductImageDisplayed();
      covidDetailRobot.verifyProductFavoriteIconDisplayed();
      covidDetailRobot.verifyProductNameDisplayed();
      covidDetailRobot.verifyCovidMaterialPrice();
      covidDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      covidDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      covidDetailRobot.verifyCartButtonDisplayed();
      covidDetailRobot.verifyAddToCartCartButtonDisplayed();

      await covidDetailRobot.openMaterialInformation();
      covidDetailRobot.verifyMateriaNumberDisplayed(covidMaterialNumber);
      covidDetailRobot.verifyManufacturerDisplayed(covidMaterialPrincipalName);
      covidDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(covidUnitMeasurement);
      covidDetailRobot
          .verifyCountryOfOriginLabelDisplayed(covidCountryOfOrigin);
      covidDetailRobot.verifyBatchDisplayed(isVisible: false);
      covidDetailRobot.verifyExpiryDateLabelDisplayed(value: covidExpiryDate);
    });

    testWidgets(
        'EZRX-T68 | Verify add and navigate to cart in covid material detail',
        (tester) async {
      const maximumQty = 99999;
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyCartButtonQty(1);
      covidDetailRobot.verifyAddToCartSuccessMessage();
      await covidDetailRobot.dismissSnackbar();
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyCovidMaterial(covidMaterialNumber);
      await cartRobot.tapCloseButton();
      await covidDetailRobot.changeQty(maximumQty);
      await covidDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartFailureMessage();
    });

    testWidgets(
        'EZRX-T68 | verify all case of covid material + normal material add to cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      //adding normal material
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();

      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(materialNumber);
      await cartRobot.tapCloseButton();
      await commonRobot.dismissSnackbar(
        dismissAll: true,
      );
      await productDetailRobot.tapBackButton();

      //then adding covid material with material
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCovidCannotBeAddedWithCommercialMaterialErrorTextInDialog();

      //Tap cancel and check verify the material should present
      await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(materialNumber);
      await cartRobot.tapCloseButton();

      //Continue proceed with covid material and verify covid material added
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyCovidMaterial(covidMaterialNumber);
      await cartRobot.tapCloseButton();

      await commonRobot.dismissSnackbar(dismissAll: true);
      await covidDetailRobot.tapBackButton();

      //adding normal material with covid
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();

      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog();

      await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();

      await productDetailRobot.tapAddToCart();
      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog();
      await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();

      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(materialNumber);
    });

    testWidgets(
        'EZRX-T68 | verify all case of covid material + bundle material add to cart',
        (tester) async {
      const materialQty1 = 3;
      const materialQty2 = bundleTier2Qty - materialQty1;
      final items = {
        bundleMaterialNumber1: materialQty1,
        bundleMaterialNumber2: materialQty2,
      };

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

      //adding bundle material
      await addBundleToCart(items);
      cartRobot.verifyPage();
      await cartRobot.verifyBundle(bundleNumber);
      await cartRobot.tapCloseButton();
      await bundleDetailRobot.tapToBackScreen();

      //then adding covid material with bundle
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCovidCannotBeAddedWithCommercialMaterialErrorTextInDialog();

      //Tap cancel and check verify the bundle should present
      await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyBundle(bundleNumber);
      await cartRobot.tapCloseButton();

      //Continue proceed with covid material and verify covid material added
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyCovidMaterial(covidMaterialNumber);
      await cartRobot.tapCloseButton();

      await commonRobot.dismissSnackbar(dismissAll: true);
      await covidDetailRobot.tapBackButton();
      await productRobot.openSearchProductScreen();
      //adding bundle material with covid
      await addBundleToCart(
        items,
        doCartEmpty: false,
      );

      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog();

      await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();
      await bundleDetailRobot.tapCancelBundleMaterialAddToCartButton();

      await bundleDetailRobot.tapAddToCartButton();
      for (final item in items.entries) {
        await bundleDetailRobot.enterMaterialQty(
          item.key,
          item.value,
        );
      }
      await bundleDetailRobot.tapSheetAddToCartButton();

      covidDetailRobot.verifyProceedNotToAddToCartDialog();
      covidDetailRobot
          .verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog();
      await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();

      await bundleDetailRobot.tapCartButton();

      cartRobot.verifyPage();
      await cartRobot.verifyBundle(bundleNumber);
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
        cartTotalPrice.includeTax(tax).priceDisplay(currency),
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
      cartRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
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
        materialUnitPrice.includeTax(tax).priceDisplay(currency),
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
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T98 | Verify covid material in cart + change material qty',
        (tester) async {
      var qty = 1;
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyCartButtonQty(qty);
      await covidDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(covidMaterialNumber);
      cartRobot.verifyManufacturerName(covidMaterialPrincipalName);
      cartRobot.verifyMaterialNumber(covidMaterialNumber);
      cartRobot.verifyMaterialImage(covidMaterialNumber);
      cartRobot.verifyMaterialQty(covidMaterialNumber, qty);
      cartRobot.verifyMaterialDescription(
        covidMaterialNumber,
        covidMaterialName,
      );
      cartRobot.verifyMaterialUnitPrice(
        covidMaterialNumber,
        covidMaterialUnitPrice,
      );
      cartRobot.verifyMaterialTotalPrice(
        covidMaterialNumber,
        covidMaterialTotalPrice,
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(otherShipToAddress);
      cartRobot.verifyCartTotalPrice(
        cartTotalPriceForCovidMaterial.priceDisplay(currency),
      );
      cartRobot.verifyPriceNotAvailableForAtLeastOneItem();
      cartRobot.verifyCheckoutButton();

      //change quantity to 10
      qty = 10;
      await cartRobot.changeMaterialQty(covidMaterialNumber, qty);
      cartRobot.verifyMaterialQty(covidMaterialNumber, qty);
      cartRobot.verifyMaterialUnitPrice(
        covidMaterialNumber,
        covidMaterialUnitPrice,
      );
      cartRobot.verifyMaterialTotalPrice(
        covidMaterialNumber,
        covidMaterialTotalPrice,
      );
      cartRobot.verifyCartTotalPrice(
        cartTotalPriceForCovidMaterial.priceDisplay(currency),
      );

      //increase +1 quantity
      await cartRobot.increaseMaterialQty(covidMaterialNumber);
      cartRobot.verifyMaterialQty(covidMaterialNumber, ++qty);
      cartRobot.verifyMaterialUnitPrice(
        covidMaterialNumber,
        covidMaterialUnitPrice,
      );
      cartRobot.verifyMaterialTotalPrice(
        covidMaterialNumber,
        covidMaterialTotalPrice,
      );
      cartRobot.verifyCartTotalPrice(
        cartTotalPriceForCovidMaterial.priceDisplay(currency),
      );

      //decrease -1 quantity
      await cartRobot.decreaseMaterialQty(covidMaterialNumber);
      cartRobot.verifyMaterialQty(covidMaterialNumber, --qty);
      cartRobot.verifyMaterialUnitPrice(
        covidMaterialNumber,
        covidMaterialUnitPrice,
      );
      cartRobot.verifyMaterialTotalPrice(
        covidMaterialNumber,
        covidMaterialTotalPrice,
      );
      cartRobot.verifyCartTotalPrice(
        cartTotalPriceForCovidMaterial.priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T99 | Verify bundle in cart + change bundle qty',
        (tester) async {
      var materialQty1 = 3;
      var materialQty2 = bundleTier2Qty - materialQty1;
      var totalQty = materialQty1 + materialQty2;
      var totalPrice = totalQty * bundleTier2UnitPrice;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await addBundleToCart({
        bundleMaterialNumber1: materialQty1,
        bundleMaterialNumber2: materialQty2,
      });

      //verify
      cartRobot.verifyPage();
      await cartRobot.verifyBundle(bundleNumber);
      cartRobot.verifyBundleNumber(bundleNumber);
      cartRobot.verifyBundleName(bundleNumber, bundleName);
      cartRobot.verifyBundleQty(bundleNumber, totalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemMaterialNumber(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemMaterialDescription(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialName1,
      );
      cartRobot.verifyBundleItemExpiryDateAndBatch(
        bundleNumber,
        bundleMaterialNumber1,
        bundleStockInfoList.elementAt(1),
        isBatchNumberVisible: false,
      );
      cartRobot.verifyBundleItemExpiryDateAndBatch(
        bundleNumber,
        bundleMaterialNumber2,
        bundleStockInfoList.elementAt(0),
        isBatchNumberVisible: false,
      );
      cartRobot.verifyBundleItemPrincipalName(
        bundleNumber,
        bundleMaterialNumber1,
        bundlePrincipalName,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        materialQty1,
      );
      cartRobot.verifyBundleItemDeleteButton(
        bundleNumber,
        bundleMaterialNumber1,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemMaterialNumber(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemMaterialDescription(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialName2,
      );
      cartRobot.verifyBundleItemExpiryDateAndBatch(
        bundleNumber,
        bundleMaterialNumber2,
        bundleStockInfoList.elementAt(0),
        isBatchNumberVisible: false,
      );
      cartRobot.verifyBundleItemPrincipalName(
        bundleNumber,
        bundleMaterialNumber2,
        bundlePrincipalName,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        materialQty2,
      );
      cartRobot.verifyBundleItemDeleteButton(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(2);
      cartRobot.verifyCartShipToAddress(otherShipToAddress);
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      cartRobot.verifyCheckoutButton();

      await cartRobot.decreaseBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
      );
      materialQty1--;
      totalQty--;
      totalPrice = totalQty * bundleTier1UnitPrice;
      cartRobot.verifyBundleQty(bundleNumber, totalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        materialQty1,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      await cartRobot.increaseBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
      );
      materialQty2++;
      totalQty++;
      totalPrice = totalQty * bundleTier2UnitPrice;
      cartRobot.verifyBundleQty(bundleNumber, totalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        materialQty2,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      materialQty1--;
      totalQty--;
      totalPrice = totalQty * bundleTier1UnitPrice;
      await cartRobot.changeBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        materialQty1,
      );
      cartRobot.verifyBundleQty(bundleNumber, totalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        materialQty1,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T100 | Verify material and bundle in cart',
        (tester) async {
      const materialQty = 1;
      const bundleMaterialQty1 = 3;
      const bundleMaterialQty2 = bundleTier2Qty - bundleMaterialQty1;
      const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
      const bundleTotalPrice = bundleTotalQty * bundleTier2UnitPrice;
      const materialUnitPriceForThisShipTo = 7.23;
      const totalPrice =
          materialQty * materialUnitPriceForThisShipTo + bundleTotalPrice;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await addBundleToCart({
        bundleMaterialNumber1: bundleMaterialQty1,
        bundleMaterialNumber2: bundleMaterialQty2,
      });

      //verify
      await cartRobot.tapCloseButton();
      await bundleDetailRobot.tapBackButton();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(3);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, materialQty);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPriceForThisShipTo.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPriceForThisShipTo.priceDisplay(currency),
      );
      await cartRobot.verifyBundle(bundleNumber);
      cartRobot.verifyBundleQty(bundleNumber, bundleTotalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        bundleTotalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(3);
      cartRobot.verifyQtyOnAppBar(3);
      cartRobot.verifyCartShipToAddress(otherShipToAddress);
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      cartRobot.verifyCheckoutButton();
    });

    testWidgets('EZRX-T101 | Verify material on offer with bonus in cart',
        (tester) async {
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
      cartRobot.verifyBonusItemExpiryDateAndBatch(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusMaterialStockInfo,
        isBatchNumberVisible: false,
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

    testWidgets('EZRX-T108 | Verify remove item in cart', (tester) async {
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
      await cartRobot.swipeMaterialToDelete(materialNumber);
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      await cartRobot.tapBrowseProductButton();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productRobot.tapSearchBundle(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        bundleTier1Qty,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      await bundleDetailRobot.dismissSnackbar();
      await bundleDetailRobot.tapCartButton();
      await cartRobot.verifyBundle(bundleNumber);
      await cartRobot.swipeBundleToDelete(bundleNumber);
      cartRobot.verifyNoRecordFound();
      await cartRobot.verifyClearCartSuccessMessage();
    });

    testWidgets('EZRX-T113 | Verify clear cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
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
      cartRobot.verifyBonusItemExpiryDateAndBatch(
        materialNumber,
        bonusSampleMaterialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
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

    testWidgets('EZRX-T105 | Verify counter offer price with remark',
        (tester) async {
      const newUnitPrice = materialUnitPrice + 100;
      const remark = 'AUTO-TEST';

      //init app
      await pumpAppWithHomeScreen(tester);
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
      cartRobot.verifyMaterialCounterOfferButton(materialNumber);
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifySheet(isVisible: true);
      requestCounterOfferRobot.verifyListPrice(
        materialUnitPrice.priceDisplay(currency),
        isVisible: false,
      );
      requestCounterOfferRobot.verifyPriceTextField();
      requestCounterOfferRobot.verifyPriceText('');
      requestCounterOfferRobot.verifyRemarkTextField();
      requestCounterOfferRobot.verifyRemarkText('');
      requestCounterOfferRobot.verifyRemarkMaximumLengthMessage('');
      requestCounterOfferRobot.verifyConfirmButton();
      requestCounterOfferRobot.verifyCancelButton();
      await requestCounterOfferRobot.tapCancelButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );

      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifyPriceTextEmptyMessage();
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.enterRemark(remark);
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        newUnitPrice.includeTax(tax).priceDisplay(currency),
      );
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifyPriceText(newUnitPrice.toString());
      requestCounterOfferRobot.verifyRemarkText(remark);
    });

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

      //verify
      cartRobot.verifyCartTotalPrice(
        materialUnitPrice.includeTax(tax).priceDisplay(currency),
      );
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      orderPriceSummaryRobot.verifyTaxLabel(
        (materialUnitPrice.includeTax(tax) - materialUnitPrice)
            .priceDisplay(currency),
        tax,
      );
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        materialUnitPrice.includeTax(tax).priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T110 | Verify cart under minimum order value',
        (tester) async {
      final validQty = (minOrderAmount / lowPriceMaterialUnitPrice).ceil();
      final validTotalPrice = lowPriceMaterialUnitPrice * validQty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productRobot.tapSearchMaterial(lowPriceMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
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
        lowPriceMaterialUnitPrice.includeTax(tax).priceDisplay(currency),
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
        validTotalPrice.includeTax(tax).priceDisplay(currency),
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
      oosPreOrderRobot.verifyExpiryDateAndBatch(
        oosPreOrderMaterialNumber,
        oosPreOrderMaterialStockInfo,
        isBatchNumberVisible: false,
      );
      await oosPreOrderRobot.tapContinueButton();
      checkoutRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T2095 | Verify cutoff List Price should be Price Not Available if material has List Price zero and counter offer applied',
        (tester) async {
      const newUnitPrice = 10;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      await productSuggestionRobot
          .searchWithKeyboardAction(materialWithListPriceZero);
      await productRobot.tapSearchMaterial(materialWithListPriceZero);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialWithListPriceZero);
      cartRobot.verifyMaterialUnitPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
      cartRobot.verifyMaterialCounterOfferButton(materialWithListPriceZero);
      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      requestCounterOfferRobot.verifySheet(isVisible: true);

      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialWithListPriceZero,
        newUnitPrice.priceDisplay(currency),
      );

      //verify cutoff List Price is Price Not Available
      cartRobot.verifyMaterialCutOffPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
    });

    testWidgets(
        'EZRX-T2097 | Verify Bonus override and counter offer not visible for covid material for customer who has attribute kattr7 = ZEV',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(covidMaterialNumber);
      await productRobot.tapSearchMaterial(covidMaterialNumber);
      await covidDetailRobot.tapAddToCart();
      covidDetailRobot.verifyCartButtonQty(1);
      covidDetailRobot.verifyAddToCartSuccessMessage();
      await covidDetailRobot.dismissSnackbar();
      await covidDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyCovidMaterial(covidMaterialNumber);
      cartRobot.verifyMaterialBonusSampleButton(
        covidMaterialNumber,
        isVisible: false,
      );
      cartRobot.verifyMaterialCounterOfferButton(
        covidMaterialNumber,
        isVisible: false,
      );
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1000;
      const totalPrice = materialUnitPrice * qty;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryDateField(isVisible: false);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyPaymentTermField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot.verifyTaxLabel(
        (totalPrice.includeTax(tax) - totalPrice).priceDisplay(currency),
        tax,
      );
      orderPriceSummaryRobot.verifySubTotalLabel(
        totalPrice.priceDisplay(currency),
      );
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
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
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1000);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: false);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapPlaceOrderButton();
      checkoutRobot.verifyEmptyPoReferenceMessage(isVisible: false);
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(emptyPoReference);
      orderSuccessRobot.verifyDeliveryInstruction(emptyDeliveryInstruction);
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1000;
      const newUnitPrice = materialUnitPrice + 100;
      const newTotalPrice = (newUnitPrice * qty);

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
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
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
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
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T120 | Verify display bundle in Checkout',
        (tester) async {
      const bundleMaterialQty1 = 1;
      const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
      const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
      const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await addBundleToCart({
        bundleMaterialNumber1: bundleMaterialQty1,
        bundleMaterialNumber2: bundleMaterialQty2,
      });
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyBundle(bundleNumber);
      checkoutRobot.verifyBundleName(bundleNumber, bundleName);
      checkoutRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
      checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber1);
      checkoutRobot.verifyBundleItemDescription(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialName1,
      );
      checkoutRobot.verifyBundleItemExpiryDateAndBatch(
        bundleNumber,
        bundleMaterialNumber1,
        bundleStockInfoList.last,
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyBundleItemPrincipal(
        bundleNumber,
        bundleMaterialNumber1,
        bundlePrincipalName,
      );
      checkoutRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
      checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber2);
      checkoutRobot.verifyBundleItemDescription(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialName2,
      );
      checkoutRobot.verifyBundleItemExpiryDateAndBatch(
        bundleNumber,
        bundleMaterialNumber2,
        bundleStockInfoList.elementAt(0),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyBundleItemPrincipal(
        bundleNumber,
        bundleMaterialNumber2,
        bundlePrincipalName,
      );
      checkoutRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      checkoutRobot.verifyBundleTotalQty(
        bundleNumber,
        bundleTotalQty,
      );
      await checkoutRobot
          .verifySubTotalLabel(bundleTotalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        bundleTotalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyBundleTotalPrice(
        bundleNumber,
        bundleTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(2);
      checkoutRobot.verifyStickyGrandTotal(
        bundleTotalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T119 | Verify display covid material in checkout',
        (tester) async {
      const qty = 1000;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(
        covidMaterialNumber,
        qty,
      );

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyMaterialPrincipal(covidMaterialPrincipalName);
      await checkoutRobot.verifyMaterial(covidMaterialNumber);
      checkoutRobot.verifyMaterialQty(covidMaterialNumber, qty);
      checkoutRobot.verifyMaterialDescription(
        covidMaterialNumber,
        covidMaterialName,
      );
      checkoutRobot.verifyMaterialImage(covidMaterialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        covidMaterialNumber,
        covidMaterialUnitPrice,
      );
      checkoutRobot.verifyMaterialTotalPrice(
        covidMaterialNumber,
        covidMaterialTotalPrice,
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        covidMaterialNumber,
        isVisible: false,
      );
      checkoutRobot.verifyPriceNotAvailableForAtLeastOneItem();
    });

    testWidgets(
        'EZRX-T119 | Verify display material on offer with bonus in checkout',
        (tester) async {
      const qty = 20;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      const totalPrice = bonusMaterialNumberUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(bonusMaterialNumber, qty);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMaterial(bonusMaterialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        bonusMaterialNumber,
        totalPrice.priceDisplay(currency),
      );
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
      checkoutRobot.verifyBonusMaterialExpiryDateAndBatch(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusMaterialStockInfo,
        isBatchNumberVisible: false,
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
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyGrandTotal(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(2);
    });

    testWidgets(
        'EZRX-T2096 | Verify cutoff List Price should be Price Not Available if material has List Price zero and counter offer applied',
        (tester) async {
      const newUnitPrice = 500;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      await productSuggestionRobot
          .searchWithKeyboardAction(materialWithListPriceZero);
      await productRobot.tapSearchMaterial(materialWithListPriceZero);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialWithListPriceZero);
      cartRobot.verifyMaterialUnitPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
      cartRobot.verifyMaterialCounterOfferButton(materialWithListPriceZero);
      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      requestCounterOfferRobot.verifySheet(isVisible: true);

      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialWithListPriceZero,
        newUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialCutOffPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
      await cartRobot.tapCheckoutButton();
      await checkoutRobot.verifyMaterial(materialWithListPriceZero);
      checkoutRobot.verifyMaterialUnitPrice(
        materialWithListPriceZero,
        newUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialWithListPriceZero,
        isVisible: true,
      );

      //verify cutoff List Price is Price Not Available
      checkoutRobot.verifyMaterialCutOffPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1000);

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
      const totalPrice = materialUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(
        totalPrice.excludeTax().priceDisplay(currency),
      );
      await orderSuccessRobot.verifyTax(
        totalPrice.taxValue(tax).priceDisplay(currency),
      );
      await orderSuccessRobot
          .verifyGrandTotal(totalPrice.includeTax(tax).priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(materialNumber);
      orderSuccessRobot.verifyMateriaDescription(materialName);
      orderSuccessRobot.verifyItemQty(1);
      orderSuccessRobot
          .verifyMaterialUnitPrice(materialUnitPrice.priceDisplay(currency));
      orderSuccessRobot.verifyMaterialTotalPrice(
        totalPrice.priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T125 | Verify display material on offer with bonus in order submitted',
        (tester) async {
      const qty = 10;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      const totalPrice = bonusMaterialNumberUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(bonusMaterialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyGrandTotal(totalPrice.includeTax(tax).priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(1);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot
          .verifyMaterialTotalPrice(totalPrice.priceDisplay(currency));
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
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

    testWidgets('EZRX-T125 | Verify display bundle in order submitted',
        (tester) async {
      const bundleMaterialQty1 = 1;
      const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
      const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
      const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await addBundleToCart({
        bundleMaterialNumber1: bundleMaterialQty1,
        bundleMaterialNumber2: bundleMaterialQty2,
      });
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal(bundleTotalPrice.priceDisplay(currency));
      await orderSuccessRobot.verifyGrandTotal(
        bundleTotalPrice.includeTax(tax).priceDisplay(currency),
      );
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyBundle(bundleNumber);
      orderSuccessRobot.verifyBundleRate(
        bundleTier1Qty,
        bundleTier1UnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyBundleTotalQty(bundleTotalQty);
      orderSuccessRobot
          .verifyBundleTotalPrice(bundleTotalPrice.priceDisplay(currency));
      await orderSuccessRobot.startVerifyBundleItem(
        bundleNumber,
        bundleMaterialNumber1,
      );
      orderSuccessRobot.verifyItemQty(bundleMaterialQty1);
      await orderSuccessRobot.startVerifyBundleItem(
        bundleNumber,
        bundleMaterialNumber2,
      );
      orderSuccessRobot.verifyItemQty(bundleMaterialQty2);
    });

    testWidgets('EZRX-T125 | Verify display covid material in order submitted',
        (tester) async {
      const qty = 10;
      const subtotalPriceForCovidMaterial = 0.0;
      const grandtotalPriceForCovidMaterial = 0.0;

      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
      await checkoutWithMaterial(covidMaterialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(
        subtotalPriceForCovidMaterial.excludeTax().priceDisplay(currency),
      );
      await orderSuccessRobot.verifyTax(
        subtotalPriceForCovidMaterial.taxValue(tax).priceDisplay(currency),
      );
      await orderSuccessRobot.verifyGrandTotal(
        grandtotalPriceForCovidMaterial.includeTax(tax).priceDisplay(currency),
      );
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(covidMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(covidMaterialName);
      orderSuccessRobot.verifyItemQty(1);
      orderSuccessRobot.verifyMaterialUnitPrice(covidMaterialUnitPrice);
      orderSuccessRobot.verifyMaterialTotalPrice(
        covidMaterialTotalPrice,
      );
      //TODO: Please do uncomment when these feature get ready

      // orderSuccessRobot.verifyCovidMaterialLabel();
    });

    testWidgets(
        'EZRX-T2109 | Verify cutoff List Price should be Price Not Available if material has List Price zero and counter offer applied in order submitted',
        (tester) async {
      const newUnitPrice = 500;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(materialWithListPriceZero);
      await productRobot.tapSearchMaterial(materialWithListPriceZero);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyMaterialCounterOfferButton(materialWithListPriceZero);
      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      requestCounterOfferRobot.verifySheet(isVisible: true);
      await cartRobot.tapMaterialCounterOfferButton(materialWithListPriceZero);
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialCutOffPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
      await cartRobot.tapCheckoutButton();
      await checkoutRobot.verifyMaterial(materialWithListPriceZero);
      checkoutRobot.verifyMaterialCutOffPrice(
        materialWithListPriceZero,
        materialPriceWithListPriceZero,
      );
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();
      await orderSuccessRobot.startVerifyMaterial(index: 0);

      //verify cutoff List Price is Price Not Available
      orderSuccessRobot
          .verifyMaterialCutOffPrice(materialPriceWithListPriceZero);
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
        const orderNumber = '0200365212';
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        final productName = viewByItemsRobot.getFirstProductName();
        await commonRobot.searchWithKeyboardAction(productName);
        viewByItemsRobot.verifyOrdersWithProductName(productName);
        await commonRobot.pullToRefresh();
        commonRobot.verifySearchBarText('');

        final materialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithSearchIcon(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
        await commonRobot.pullToRefresh();

        await commonRobot.autoSearch(orderNumber);
        viewByItemsRobot.verifyOrdersWithOrderCode(orderNumber);
        await commonRobot.pullToRefresh();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
        commonRobot.verifySearchBarText('');
        viewByItemsRobot.verifyOrders();

        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
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

        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByItemsRobot.verifyOrderWithStatus(
          [statusFilter],
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

        //TODO: We don't have the order id which have invoice number,
        //but this feature is workable on other market,
        //so if we don't get the data in future, we are fine with that

        // final invoiceNumber = viewByItemsDetailRobot.getInvoiceNumber();
        // await viewByItemsDetailRobot.tapInvoiceNumber();
        // accountInvoiceDetailRobot.verifyPage();
        // accountInvoiceDetailRobot.verifyInvoiceId(invoiceNumber);
        // await commonRobot.tapToBackScreen();

        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusManufacturerName);
        await viewByItemsDetailRobot.verifyItemComponent();
      });

      testWidgets('EZRX-T91 | Verify material in view by item detail',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot
            .verifyManufacturerName(materialPrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await checkoutWithMaterial(bonusMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOfferTag();
        await viewByItemsRobot.tapFirstOfferTag();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusManufacturerName);
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
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusManufacturerName);
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

      testWidgets('EZRX-T91 | Verify bundle in view by items detail',
          (tester) async {
        const bundleMaterialQty1 = 1;
        const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await addBundleToCart({
          bundleMaterialNumber1: bundleMaterialQty1,
          bundleMaterialNumber2: bundleMaterialQty2,
        });
        await cartRobot.tapCheckoutButton();
        await oosPreOrderRobot.tapContinueButton();
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        await viewByItemsRobot.tapFirstOrderWithMaterial(bundleMaterialNumber1);
        await viewByItemsDetailRobot
            .verifyManufacturerName(bundlePrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyBundleTag();
        viewByItemsDetailRobot.verifyMaterialNumber(bundleMaterialNumber1);
        viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemBundleTag();
        viewByItemsDetailRobot.verifyOtherItemQty(bundleMaterialQty2);

        await viewByItemsDetailRobot.tapBuyAgainButton();
        //right now all the materials are invalid
        // cartRobot.verifyPage();
        // await cartRobot.verifyMaterial(bundleMaterialNumber1);
        // cartRobot.verifyMaterialQty(bundleMaterialNumber1, bundleMaterialQty1);
      });

      testWidgets('EZRX-T91 | Verify covid material in view by item detail',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await checkoutWithMaterial(covidMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot
            .verifyManufacturerName(covidMaterialPrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(covidMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        viewByItemsDetailRobot.verifyCovidMaterialLabel();
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );
        viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(covidMaterialNumber);
        cartRobot.verifyMaterialQty(covidMaterialNumber, qty);
      });

      testWidgets(
        'EZRX-T2737 | Verify multiple batch and expiry in view by items detail',
        (tester) async {
          //init app
          await pumpAppWithHomeScreen(tester);

          await commonRobot.changeDeliveryAddress(shipToBatchAndExp);
          await commonRobot.navigateToScreen(NavigationTab.orders);

          //verify
          ordersRootRobot.verifyViewByItemsPage();
          await commonRobot.pullToRefresh();
          await commonRobot
              .searchWithKeyboardAction(orderIdMultipleBatchAndExp);
          await viewByItemsRobot
              .tapFirstOrderWithMaterial(materialNumberMultipleBatchAndExp);
          await viewByItemsDetailRobot.verifyItemComponent();
          viewByItemsDetailRobot
              .verifyMaterialNumber(materialNumberMultipleBatchAndExp);
          viewByItemsDetailRobot.verifyBatchExpiryDate(
            StockInfo.empty().copyWith(
              batch: StringValue(batch1),
              expiryDate: DateTimeStringValue(expiry1),
            ),
          );
          viewByItemsDetailRobot.verifyBatchExpiryDate(
            StockInfo.empty().copyWith(
              batch: StringValue(batch2),
              expiryDate: DateTimeStringValue(expiry2),
            ),
          );
        },
      );
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
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
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

      testWidgets(
          'EZRX-T2098 | Verify commercial item can not be buy again when cart contain covid item for customer who has attribute kattr7 = ZEV',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //checkout and place order with normal material
        await checkoutWithMaterial(materialNumber, 1000);
        await checkoutRobot.tapPlaceOrderButton();
        orderSuccessRobot.verifyPage();
        await orderSuccessRobot.verifyOrderSubmittedMessage();
        await orderSuccessRobot.dismissSnackbar();
        orderSuccessRobot.verifyOrderId();
        orderSuccessRobot.verifyOrderDate();
        await orderSuccessRobot.verifyOrderSummarySection();
        await orderSuccessRobot.tapCloseButton();

        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await commonRobot.navigateToScreen(NavigationTab.products);

        //then adding covid material to cart
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot
            .searchWithKeyboardAction(covidMaterialNumber);
        await productRobot.tapSearchMaterial(covidMaterialNumber);
        await covidDetailRobot.tapAddToCart();
        await covidDetailRobot.dismissSnackbar();
        await covidDetailRobot.tapBackButton();

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //try to buy again normal material
        await ordersRootRobot.switchToViewByOrders();
        await viewByOrdersRobot.tapFirstBuyAgainButton();

        //verify dialog
        covidDetailRobot.verifyProceedNotToAddToCartDialog();
        covidDetailRobot
            .verifyCommercialMaterialCannotBeAddedWithCovidErrorTextInDialog();

        //Tap cancel
        await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();

        //Continue proceed with normal material and verify normal material added to cart
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        covidDetailRobot.verifyProceedNotToAddToCartDialog();
        await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();
        await commonRobot.dismissSnackbar(dismissAll: true);
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
      });

      testWidgets(
          'EZRX-T2099 | Verify covid item can not be buy again when cart contain commercial item for customer who has attribute kattr7 = ZEV',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //checkout and place order with covid material
        await checkoutWithMaterial(covidMaterialNumber, 1);
        await checkoutRobot.tapPlaceOrderButton();
        orderSuccessRobot.verifyPage();
        await orderSuccessRobot.verifyOrderSubmittedMessage();
        await orderSuccessRobot.dismissSnackbar();
        orderSuccessRobot.verifyOrderId();
        orderSuccessRobot.verifyOrderDate();
        await orderSuccessRobot.verifyOrderSummarySection();
        await orderSuccessRobot.tapCloseButton();

        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await commonRobot.navigateToScreen(NavigationTab.products);

        //then adding normal material to cart
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productRobot.tapSearchMaterial(materialNumber);
        await covidDetailRobot.tapAddToCart();
        await covidDetailRobot.dismissSnackbar();
        await covidDetailRobot.tapBackButton();

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //try to buy again covid material
        await ordersRootRobot.switchToViewByOrders();
        await viewByOrdersRobot.tapFirstBuyAgainButton();

        //verify dialog
        covidDetailRobot.verifyProceedNotToAddToCartDialog();
        covidDetailRobot
            .verifyCovidCannotBeAddedWithCommercialMaterialErrorTextInDialog();

        //Tap cancel
        await covidDetailRobot.tapCancelCovidMaterialAddToCartButton();

        //Continue proceed with covid material and verify covid material added to cart
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        covidDetailRobot.verifyProceedNotToAddToCartDialog();
        await covidDetailRobot.tapProceedCovidMaterialAddToCartButton();
        await commonRobot.dismissSnackbar(dismissAll: true);
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(covidMaterialNumber);
      });
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1000;
        const totalPrice = materialUnitPrice * qty;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
        await checkoutRobot.tapPlaceOrderButton();
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
        viewByOrdersDetailRobot.verifyDeliveryInstructions(deliveryInstruction);
        viewByOrdersDetailRobot.verifyOrderAddress(shipToAddress);
        viewByOrdersDetailRobot.verifyCustomerCode(customerCode);
        viewByOrdersDetailRobot.verifyDeliveryTo(shipToCode);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot
            .verifySubTotal(totalPrice.priceDisplay(currency));
        viewByOrdersDetailRobot.verifyGrandTotal(
          totalPrice.includeTax(tax).priceDisplay(currency),
        );
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot
            .verifyMaterialTotalPrice(totalPrice.priceDisplay(currency));
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
        await checkoutWithMaterial(materialNumber, orderQty);
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

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
      });

      testWidgets(
          'EZRX-T90 | Verify material with offer + navigate to item detail + buy again',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //setup data
        await checkoutWithMaterial(bonusMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
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
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusManufacturerName);
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
        await viewByItemsDetailRobot
            .verifyManufacturerName(bonusManufacturerName);
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

      testWidgets(
          'EZRX-T90 | Verify bundle + navigate to item detail + buy again',
          (tester) async {
        const bundleMaterialQty1 = 1;
        const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
        const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
        const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);
        await addBundleToCart({
          bundleMaterialNumber1: bundleMaterialQty1,
          bundleMaterialNumber2: bundleMaterialQty2,
        });
        await cartRobot.tapCheckoutButton();
        await oosPreOrderRobot.tapContinueButton();
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot
            .verifySubTotal(bundleTotalPrice.priceDisplay(currency));
        viewByOrdersDetailRobot.verifyGrandTotal(
          bundleTotalPrice.includeTax(tax).priceDisplay(currency),
        );
        await viewByOrdersDetailRobot.startVerifyBundle(bundleNumber);
        viewByOrdersDetailRobot.verifyBundleRate(
          bundleTier1Qty,
          bundleTier1UnitPrice.priceDisplay(currency),
        );
        viewByOrdersDetailRobot.verifyBundleTotalQty(bundleTotalQty);
        viewByOrdersDetailRobot
            .verifyBundleTotalPrice(bundleTotalPrice.priceDisplay(currency));
        await viewByOrdersDetailRobot.startVerifyBundleItem(
          bundleNumber,
          bundleMaterialNumber1,
        );
        viewByOrdersDetailRobot.verifyQty(bundleMaterialQty1);
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        await viewByItemsDetailRobot
            .verifyManufacturerName(bundlePrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bundleMaterialNumber1);
        viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
        viewByItemsDetailRobot.verifyBundleTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyBundleItem(
          bundleNumber,
          bundleMaterialNumber2,
        );
        viewByOrdersDetailRobot.verifyQty(bundleMaterialQty2);
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
        cartRobot.verifyBundleItemQty(
          bundleNumber,
          bundleMaterialNumber1,
          bundleMaterialQty1,
        );
        await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
        cartRobot.verifyBundleItemQty(
          bundleNumber,
          bundleMaterialNumber2,
          bundleMaterialQty2,
        );
      });

      testWidgets(
          'EZRX-T90 | Verify click on Buy again in when having existing items in Cart',
          (tester) async {
        const orderQty = 15;
        const cartQty = 10;
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: otherShipToCode);

        //setup data
        await checkoutWithMaterial(covidMaterialNumber, orderQty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.products);
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot
            .searchWithKeyboardAction(covidMaterialNumber);
        await productRobot.tapSearchMaterial(covidMaterialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar();
        await productDetailRobot.tapCartButton();
        await cartRobot.changeMaterialQty(covidMaterialNumber, cartQty);
        await cartRobot.tapCloseButton();
        await productDetailRobot.tapBackButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.startVerifyMaterial(covidMaterialNumber);
        //TODO: will uncomment, need to implement done

        // viewByOrdersDetailRobot.verifyCovidMaterialLabel();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(covidMaterialNumber);
        cartRobot.verifyMaterialQty(covidMaterialNumber, orderQty + cartQty);
      });
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
