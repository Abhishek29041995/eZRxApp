import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/login_on_behalf_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/more/profile_robot.dart';
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
import '../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../../robots/payments/payment_summary/payment_detail_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';
import '../../robots/products/tender_contract_details_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;
  late AnnouncementArticleRootRobot announcementArticleRootRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late LoginOnBehalfRobot loginOnBehalfRobot;
  late CartRobot cartRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late RequestCounterOfferRobot requestCounterOfferRobot;
  late BonusSampleRobot bonusSampleRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;
  late ProfileRobot profileRobot;

  late TenderContractDetailRobot tenderContractDetailRobot;
  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;

  late PaymentSummaryDetailRobot paymentDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);
    loginOnBehalfRobot = LoginOnBehalfRobot(tester);
    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    profileRobot = ProfileRobot(tester);

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
    tenderContractDetailRobot = TenderContractDetailRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);

    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
  }

  const marketVietnam = 'Vietnam';
  const username = 'vnrootadmin';
  const password = 'St@ysafe01';
  const proxyUserName = 'vnexternalsalesrep';
  const customerCode = '0030282241';
  const shipToCode = '0071209479';
  const shipToCodeWithCustomerCodeBlocked = '0071210440';
  const blockedShipToCode = '0071192119';
  const otherShipToCode = '0071201150';
  const shipToAddress = 'Benh Vien Dai Hoc Y Duoc TP.';
  const currency = 'VND';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const materialNumber = '21128991';
  const materialName = "100% MALE CAPSULE  15G 30'S";
  const materialPrincipalName = 'Besins Healthcare (Hong Kong) Ltd.';
  const materialPrincipalNameForFilter = 'Novartis(Singapore) Pte Ltd Sandoz';
  const materialCountryOfOrigin = 'Monaco';
  const materialUnitMeasurement = 'EA';
  const materialUnitPrice = 189000.00;
  const minOrderAmount = 1000000.0;
  const tax = 5;
  const multiImageMaterialNumber = '21128991';
  const otherInfoMaterialNumber = multiImageMaterialNumber;
  const lowPriceMaterialNumber = '21129956';
  const lowPriceMaterialUnitPrice = 33019.00;
  const bonusMaterialNumber = '21129929';
  const bonusMaterial = '21129956';
  const offerMaterialName = '1 DEPO MEDROL INJ 40MG/ML 1ML';
  const oosPreOrderMaterialNumber = '21129724';
  const bonusMaterialName = "SOLU-MEDROL INJ 40MG 1'S";
  const freeMaterialName = 'DEPO MEDROL INJ 40MG/ML 1ML';
  const bonusMaterialNumberTierQty = 10;
  const bonusMaterialNumberUnitPrice = 34676.00;
  const anotherMaterialNumber = bonusMaterialNumber;
  const poReference = 'test Po Reference';
  const deliveryInstruction = 'test Delivery Instruction';
  const mandatoryTenderContractMaterialNumber = '21129929';
  const mandatoryTenderContractMaterialName = "SOLU-MEDROL INJ 40MG 1'S";
  const mandatoryTenderContractMaterialPrincipleName =
      'PFIZER (THAILAND) Limited';
  const mandatoryTenderContractMaterialUnitPrice = 32769.00;
  const mandatoryTenderContractMaterialTotalPrice = 3276900.00;
  const mandatoryTenderContractMaterialTenderReferenceNumber = 'HCM-01234';
  const mandatoryTenderContractMaterialTenderExpiryDate = '31 Dec 2025';

  const firstName = 'VNExternalSR';
  const lastName = 'User20';

  Future<void> pumpAppWithLogin(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketVietnam);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await commonRobot.closeAnnouncementAlertDialog();
    }
  }

  // Login on behalf with sales org
  Future<void> pumpAppWithLoginOnBehalf(
    WidgetTester tester, {
    String behalfName = proxyUserName,
    String selectedShipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketVietnam);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      customerSearchRobot.verifyPage();
      await customerSearchRobot.selectCustomerSearch(shipToCode);

      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    }
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.scrollToProfileName();
    if (!moreRobot.isCorrectUser(firstName, lastName)) {
      await moreRobot.verifyLoginOnBehalfTile();
      await moreRobot.tapLoginOnBehalfTile();
      await loginOnBehalfRobot.enterUserNameField(behalfName);
      await loginOnBehalfRobot.tapLoginButton();
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      customerSearchRobot.verifyPage();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await moreRobot.scrollToProfileName();
      moreRobot.verifyProfileName(firstName, lastName);
      await commonRobot.navigateToScreen(NavigationTab.home);
    } else {
      await commonRobot.navigateToScreen(NavigationTab.home);
      await commonRobot.dismissSnackbar(dismissAll: true);
      if (await homeRobot.isCustomerCodeNotSelected(shipToCode)) {
        await homeRobot.changeDeliveryAddress(shipToCode);
      }
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

  group('Authentication with login on behalf - ', () {
    testWidgets(
        'EZRX-T575 | Verify login on behalf mandatory fields for external sales rep',
        (tester) async {
      const emptyString = '';
      //init app
      await pumpAppWithLogin(tester);

      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.verifyLoginOnBehalfTile();
      await moreRobot.tapLoginOnBehalfTile();
      await loginOnBehalfRobot.enterUserNameField(emptyString);
      await loginOnBehalfRobot.tapLoginButton();
      //error text field validation
      loginOnBehalfRobot.verifyErrorMessageUsernameCannotBeEmpty();
    });

    testWidgets(
        'EZRX-T574 | Verify login on behalf Unsuccessfully for external sales rep',
        (tester) async {
      const inCorrectUsername = 'abc';
      const usernameNotFoundMessage = 'Username not found';
      //init app
      await pumpAppWithLogin(tester);

      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.verifyLoginOnBehalfTile();
      await moreRobot.tapLoginOnBehalfTile();
      await loginOnBehalfRobot.enterUserNameField(inCorrectUsername);
      await loginOnBehalfRobot.tapLoginButton();
      //snackbar error
      await commonRobot.verifyCustomSnackBar(message: usernameNotFoundMessage);
      loginOnBehalfRobot.verifySheet();
    });

    testWidgets(
        'EZRX-T573 | Verify login on behalf Successfully for external sales rep',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await commonRobot.navigateToScreen(NavigationTab.home);
      //verify home page
      homeRobot.verify();
    });
  });

  group('Notification Tab -', () {
    const orderNotificationKeyword = 'Order';
    const returnNotificationKeyword = 'Return request';
    const paymentNotificationKeyword = 'Payment';
    const notificationIndex = 1;

    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
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
      await pumpAppWithLoginOnBehalf(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();

        return;
      }
      notificationRobot.verifyNotificationItems();
      final itemDescription =
          notificationRobot.getNotificationDescription(notificationIndex);
      await notificationRobot.tapNotificationItem(notificationIndex);
      if (itemDescription.startsWith(orderNotificationKeyword.tr())) {
        viewByOrdersDetailRobot.verifyPage();
      } else if (itemDescription.startsWith(returnNotificationKeyword.tr())) {
        returnsByItemsDetailRobot.verifyPage();
      } else if (itemDescription.startsWith(paymentNotificationKeyword.tr())) {
        paymentDetailRobot.verifyPage();
      } else {
        notificationRobot.verifyRedirectNotAvailableMessage();
      }
    });

    testWidgets('EZRX-T128 | Pull to Refresh Feature - verify item visible',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();

        return;
      }
      notificationRobot.verifyNotificationItems();
      final itemDescription =
          notificationRobot.getNotificationDescription(notificationIndex);
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
      notificationRobot.verifyNotificationWithDescription(
        notificationIndex,
        itemDescription,
      );
    });
  });

  group('Home Tab -', () {
    testWidgets(
        'EZRX-T17 | Access Homepage after logging in and having existing ShipTo',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      // await Future.delayed(const Duration(seconds: 5));
      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      homeRobot.findMiniCartIcon();
      homeRobot.findQuickAccessMenu();
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.findAnnouncementsIcon();
    });

    testWidgets(
        'EZRX-T18 | Verify select ShipTo in Homepage incase existing items in cart',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

      // select customer code
      await commonRobot.changeDeliveryAddress(
        otherShipToCode,
      );
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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

      // search for valid products
      homeRobot.findSearchProductField();
      await homeRobot.tapSearchProductField();
      await commonRobot.searchWithKeyboardAction(materialName);

      productSuggestionRobot.verifySearchResults(materialName);
    });

    testWidgets('EZRX-T26 | Verify Tap & slide Banner in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

      //change address
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      customerSearchRobot.verifyCustomerCodeIsSelected(shipToCode);
    });

    testWidgets(
        'EZRX-T22 | Verify click on Orders action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T23 | Verify click on Returns action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();

      //verify go to returns page
      returnsRootRobot.verifyRootPageVisible();
    });

    testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      //tap on products on offer
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T47 | Verify display Browse products in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      //tap on browse products
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapBrowseProductsIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      //tap on browse products
      await homeRobot.findAnnouncementsIcon();
      await homeRobot.tapAnnouncementsIcon();

      //verify go to announcements page
      announcementArticleRootRobot.verifyAnnouncementPage();
    });

    testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLogin(tester);

      //move to Bundles
      homeRobot.findProductsOnOffer();

      //tap on first product
      await homeRobot.tapOnFirstProductOnOffer();

      //verify navigation to Material Detail Page
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T54 | Verify slide Item in Recently Ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

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
      await pumpAppWithLoginOnBehalf(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //tap on first product
      await homeRobot.tapOnFirstBrowseProduct();

      //verify navigate to material page
      productDetailRobot.verifyPage();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in home tab when customer code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      await commonRobot.navigateToScreen(NavigationTab.home);

      homeRobot.verify();

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in home tab when ship to code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: blockedShipToCode,
      );

      await commonRobot.navigateToScreen(NavigationTab.home);

      homeRobot.verify();

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  group('Product Tab -', () {
    const sortByZToA = 'Z-A';

    testWidgets('EZRX-T30 | Verify product tab with default components',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyMaterial();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyCustomerCodeSelector();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifySheet();
      filterSortProductRobot.verifyDefaultFilterProduct(
        verifyBundleOffer: false,
        verifyTenderContract: true,
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

      //init app
      await pumpAppWithLoginOnBehalf(tester);
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
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
          .searchWithKeyboardAction(materialPrincipalNameForFilter);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot
          .verifyManufacturerSelected(materialPrincipalNameForFilter);
      await commonRobot.tapToBackIcon();
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyMaterial();
      productRobot.verifyManufacturerMaterialFilterMatched(
        materialPrincipalNameForFilter,
      );
      productRobot.verifyProductSortChanged(firstProduct);
    });

    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct(
        verifyBundleOffer: false,
        verifyTenderContract: true,
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
        verifyTenderContract: true,
      );
    });

    testWidgets('EZRX-T1712 | Verify Filter By Tender Contract',
        (tester) async {
      const offerCheckbox = 'Tender Contract';
      await pumpAppWithLoginOnBehalf(tester);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openFilterProductScreen();

      await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyTenderAvailableLabel();
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyTenderAvailableLabel();
    });

    testWidgets('EZRX-T34 | Verify filter by favorite', (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await productRobot.navigateToScreen(NavigationTab.products);

      await productRobot.setProductFavoriteStatus(index, true);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(true);
      await productDetailRobot.tapBackButton();
      await productRobot.setProductFavoriteStatus(index, false);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(false);
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Products tab when customer code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
      );
      await productRobot.navigateToScreen(NavigationTab.products);

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Products tab when ship to code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: blockedShipToCode,
      );
      await productRobot.navigateToScreen(NavigationTab.products);

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  group('Product search -', () {
    testWidgets(
        'EZRX-T31 | Verify search by material number/material description (happy/unhappy case)',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
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
      await productSuggestionRobot.tapClearSearch();
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);
    });

    testWidgets('EZRX-T32 | Verify search and navigate to material detail',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T34 | Verify Save search history + clear search history',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapSearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchBarText(materialNumber);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      await productSuggestionRobot.autoSearch(anotherMaterialNumber);
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchHistoryItem(anotherMaterialNumber);

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
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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

// TODO We do not have multiImage material for now
    // testWidgets('EZRX-T64 | Verify display image when having multiple images',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLoginOnBehalf(tester);

    //   await commonRobot.navigateToScreen(NavigationTab.products);
    //   await productRobot.openSearchProductScreen();
    //   await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
    //   await productRobot.tapSearchMaterial(multiImageMaterialNumber);
    //   await productDetailRobot.verifyMultipleImages();
    //   productDetailRobot.verifyImageMaterialSelected(0, true);
    //   productDetailRobot.verifyImageMaterialSelected(1, false);
    //   await productDetailRobot.tapToImageMaterial(1, false);
    //   productDetailRobot.verifyImageMaterialSelected(1, true);
    // });

    testWidgets('EZRX-T65| Verify available offers in the material detail',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(offerMaterialName);
      productDetailRobot.verifyCodeProductOffer(bonusMaterial);
      productDetailRobot.verifyQuantityProductDisplayed();
      productDetailRobot.verifyOfferBottomSheetCloseButton();
      await productDetailRobot.tapOfferBottomSheetCloseButton();
    });

    testWidgets('EZRX-T66 | Verify Related products in the material detail',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bonusMaterial);
      await productRobot.tapSearchMaterial(bonusMaterial);
      await productDetailRobot.verifyRelateProductDisplayed();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      await productDetailRobot.tapBackButton();
    });

    testWidgets('EZRX-T67 | Verify other information in material detail',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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

    //TODO: Fail because still allow add 99999 to cart when cart have exist material
    // testWidgets('EZRX-T68 | Verify add and navigate to cart in material detail',
    //     (tester) async {
    //   const maximumQty = 99999;
    //   //init app
    //   await pumpAppWithLoginOnBehalf(tester);

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

    testWidgets('EZRX-T215 | Verify favorite in material detail',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);

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
        'EZRX-T1713 | Verify Tender Contracts on the product detail page',
        (tester) async {
      await pumpAppWithLoginOnBehalf(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(mandatoryTenderContractMaterialNumber);
      await productSuggestionRobot
          .tapSearchResult(mandatoryTenderContractMaterialNumber);
      tenderContractDetailRobot.verifyTenderContractSection();
      tenderContractDetailRobot.verifyUseTenderContractToggle(true);
      tenderContractDetailRobot.verifyTenderContractItems(true);
      await tenderContractDetailRobot.tapUseTenderContractToggle();
      tenderContractDetailRobot.verifyUseTenderContractToggle(true);
      tenderContractDetailRobot.verifyTenderContractItem(
        index: 0,
        isSelected: true,
      );
      await tenderContractDetailRobot.tapSecondTenderContractItem();
      tenderContractDetailRobot.verifyTenderContractItem(
        index: 0,
        isSelected: false,
      );
      tenderContractDetailRobot.verifyTenderContractItem(
        index: 1,
        isSelected: true,
      );
    });
  });

  group('Cart -', () {
    testWidgets('EZRX-T98 | Verify material in cart + change material qty',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
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

    testWidgets('EZRX-T101 | Verify material on offer with bonus in cart',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
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
        bonusMaterial,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
        1,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        bonusMaterialNumber,
        bonusMaterial,
      );
      cartRobot.verifyBonusMaterialTag(
        bonusMaterialNumber,
        bonusMaterial,
      );
      cartRobot.verifyBonusMaterialDescription(
        bonusMaterialNumber,
        bonusMaterial,
        freeMaterialName,
      );
      cartRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterial,
      );
      var newBonusQty = 2;
      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberTierQty * newBonusQty,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
        newBonusQty,
      );
      await cartRobot.decreaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
      );
      newBonusQty--;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
        newBonusQty,
      );
      await cartRobot.increaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
      );
      newBonusQty++;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
        newBonusQty,
      );
    });

    testWidgets('EZRX-T108 | Verify remove item in cart', (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
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
      await pumpAppWithLoginOnBehalf(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();

      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productRobot.tapSearchMaterial(lowPriceMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyCartQty(2);
      await cartRobot.tapClearCartButton();
      await cartRobot.verifyClearCartSuccessMessage();
      await commonRobot.dismissSnackbar(dismissAll: true);
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
    });

    testWidgets('EZRX-T102 | Verify add bonus/sample item in cart',
        (tester) async {
      const maxQty = 99999;
      const validQty = 10;
      const materialIndex = 0;

      //init app
      await pumpAppWithLoginOnBehalf(tester);
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

    // TODO: API fail, check later
    // testWidgets('EZRX-T105 | Verify counter offer price with remark',
    //     (tester) async {
    //   const newUnitPrice = materialUnitPrice + 100;
    //   const remark = 'AUTO-TEST';

    //   //init app
    //   await pumpAppWithLoginOnBehalf(tester);
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
    //   await requestCounterOfferRobot.enterPrice('');
    //   await requestCounterOfferRobot.tapConfirmButton();
    //   // requestCounterOfferRobot.verifyPriceTextEmptyMessage();
    //   await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
    //   await requestCounterOfferRobot.enterRemark(remark);
    //   await requestCounterOfferRobot.tapConfirmButton();
    //   requestCounterOfferRobot.verifySheet(isVisible: false);
    //   cartRobot.verifyMaterialUnitPrice(
    //     materialNumber,
    //     newUnitPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartTotalPrice(
    //     newUnitPrice.includeTax(tax).priceDisplay(currency),
    //   );
    //   await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    //   requestCounterOfferRobot
    //       .verifyOfferPrice(newUnitPrice.priceDisplay(currency));
    //   requestCounterOfferRobot.verifyPriceText(newUnitPrice.toString());
    //   requestCounterOfferRobot.verifyRemarkText(remark);
    // });

    testWidgets('EZRX-T114 | Verify address information in cart',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
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
      await pumpAppWithLoginOnBehalf(tester);
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
      // orderPriceSummaryRobot.verifyTaxLabel(
      //   (materialUnitPrice.includeTax(tax) - materialUnitPrice)
      //       .priceDisplay(currency),
      //   tax,
      // );
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
      await pumpAppWithLoginOnBehalf(tester);
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
      await pumpAppWithLoginOnBehalf(tester);
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

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Cart page when customer code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      await commonRobot.navigateToScreen(NavigationTab.home);

      homeRobot.verify();

      homeRobot.findMiniCartIcon();
      await homeRobot.tapMiniCartIcon();
      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Cart page when ship to code is blocked',
        (tester) async {
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: blockedShipToCode,
      );

      await commonRobot.navigateToScreen(NavigationTab.home);

      homeRobot.verify();

      homeRobot.findMiniCartIcon();
      await homeRobot.tapMiniCartIcon();
      commonRobot.verifyCustomerSuspendedBanner();
    });
    testWidgets(
      'EZRX-T2064 | Verify tender contract material in cart + edit tender contract',
      (tester) async {
        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await browseProductFromEmptyCart();
        await productSuggestionRobot
            .searchWithKeyboardAction(mandatoryTenderContractMaterialNumber);
        await productSuggestionRobot
            .tapSearchResult(mandatoryTenderContractMaterialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar(dismissAll: true);
        productDetailRobot.verifyCartButtonQty(1);
        await productDetailRobot.tapCartButton();

        //verify
        cartRobot.verifyClearCartButton();
        await cartRobot.verifyMaterial(mandatoryTenderContractMaterialNumber);
        cartRobot.verifyManufacturerName(
          mandatoryTenderContractMaterialPrincipleName,
        );
        cartRobot.verifyMaterialNumber(mandatoryTenderContractMaterialNumber);
        cartRobot.verifyMaterialImage(mandatoryTenderContractMaterialNumber);
        cartRobot.verifyMaterialQty(mandatoryTenderContractMaterialNumber, 1);
        cartRobot.verifyMaterialDescription(
          mandatoryTenderContractMaterialNumber,
          mandatoryTenderContractMaterialName,
        );
        cartRobot.verifyMaterialUnitPrice(
          mandatoryTenderContractMaterialNumber,
          mandatoryTenderContractMaterialUnitPrice.priceDisplay(currency),
        );
        cartRobot.verifyMaterialTotalPrice(
          mandatoryTenderContractMaterialNumber,
          mandatoryTenderContractMaterialUnitPrice.priceDisplay(currency),
        );
        cartRobot.verifyCartQty(1);
        cartRobot.verifyQtyOnAppBar(1);
        cartRobot.verifyCartTotalPrice(
          mandatoryTenderContractMaterialUnitPrice
              .includeTax(tax)
              .priceDisplay(currency),
        );
        cartRobot.verifyCheckoutButton();

        var totalPrice = mandatoryTenderContractMaterialUnitPrice;
        await cartRobot
            .increaseMaterialQty(mandatoryTenderContractMaterialNumber);
        totalPrice = mandatoryTenderContractMaterialUnitPrice * 2;
        cartRobot.verifyMaterialQty(mandatoryTenderContractMaterialNumber, 2);
        cartRobot.verifyMaterialTotalPrice(
          mandatoryTenderContractMaterialNumber,
          totalPrice.priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          totalPrice.includeTax(tax).priceDisplay(currency),
        );

        await cartRobot.changeMaterialQty(
          mandatoryTenderContractMaterialNumber,
          10,
        );
        totalPrice = mandatoryTenderContractMaterialUnitPrice * 10;
        cartRobot.verifyMaterialQty(mandatoryTenderContractMaterialNumber, 10);
        cartRobot.verifyMaterialTotalPrice(
          mandatoryTenderContractMaterialNumber,
          totalPrice.priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          totalPrice.includeTax(tax).priceDisplay(currency),
        );

        await cartRobot
            .decreaseMaterialQty(mandatoryTenderContractMaterialNumber);
        totalPrice = mandatoryTenderContractMaterialUnitPrice * 9;
        cartRobot.verifyMaterialQty(mandatoryTenderContractMaterialNumber, 9);
        cartRobot.verifyMaterialTotalPrice(
          mandatoryTenderContractMaterialNumber,
          totalPrice.priceDisplay(currency),
        );
        cartRobot.verifyCartTotalPrice(
          totalPrice.includeTax(tax).priceDisplay(currency),
        );
        tenderContractDetailRobot
            .verifyTenderContractSectionInCartAndCheckout();
        await tenderContractDetailRobot.tapTenderContractSection();
        tenderContractDetailRobot.verifyTenderContractDetailsSection(
          price:
              mandatoryTenderContractMaterialTotalPrice.priceDisplay(currency),
          expiryDate: mandatoryTenderContractMaterialTenderExpiryDate,
          referance: mandatoryTenderContractMaterialTenderReferenceNumber,
        );
        tenderContractDetailRobot.verifyEditTenderContractSection();
        await tenderContractDetailRobot.tapEditTenderContractSection();
        productDetailRobot.verifyPage();
      },
    );

    testWidgets(
      'EZRX-T2064 | Verify mandetory tender contract material in cart with commertial material',
      (tester) async {
        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await browseProductFromEmptyCart();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productSuggestionRobot.tapSearchResult(materialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar(dismissAll: true);
        productDetailRobot.verifyCartButtonQty(1);
        await productDetailRobot.tapBackButton();
        await productSuggestionRobot.tapClearSearch();
        await productSuggestionRobot
            .searchWithKeyboardAction(mandatoryTenderContractMaterialNumber);
        await productSuggestionRobot
            .tapSearchResult(mandatoryTenderContractMaterialNumber);
        await productDetailRobot.tapAddToCart();
        tenderContractDetailRobot
            .verifyMandetoryTenderContactMessageWhenCartHasNonTenderMaterial();
        await tenderContractDetailRobot
            .tapCancelTenderMaterialAddToCartButton();
        await productDetailRobot.tapAddToCart();
        tenderContractDetailRobot
            .verifyMandetoryTenderContactMessageWhenCartHasNonTenderMaterial();
        await tenderContractDetailRobot
            .tapProceedTenderMaterialAddToCartButton();
        productDetailRobot.verifyCartButtonQty(1);
      },
    );

    testWidgets(
      'EZRX-T2064 | Verify commertial material in cart with mandetory tender contract material',
      (tester) async {
        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await browseProductFromEmptyCart();
        await productSuggestionRobot
            .searchWithKeyboardAction(mandatoryTenderContractMaterialNumber);
        await productSuggestionRobot
            .tapSearchResult(mandatoryTenderContractMaterialNumber);
        await tenderContractDetailRobot.tapUseTenderContractToggle();
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar(dismissAll: true);
        productDetailRobot.verifyCartButtonQty(1);
        await productDetailRobot.tapCartButton();
        await cartRobot.tapCloseButton();
        await productDetailRobot.tapBackButton();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productSuggestionRobot.tapSearchResult(materialNumber);
        await productDetailRobot.tapAddToCart();
        tenderContractDetailRobot
            .verifyMessageWhenCartHasMandetoryTenderMaterial();
        await tenderContractDetailRobot
            .tapCancelTenderMaterialAddToCartButton();
        await productDetailRobot.tapAddToCart();
        tenderContractDetailRobot
            .verifyMessageWhenCartHasMandetoryTenderMaterial();
        await tenderContractDetailRobot
            .tapProceedTenderMaterialAddToCartButton();
        productDetailRobot.verifyCartButtonQty(1);
      },
    );
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1000;
      const totalPrice = materialUnitPrice * qty;
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(
        materialNumber,
        qty,
        isPreOrder: false,
      );

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
      // Should be 2 here because material has offer
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
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
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
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(
        materialNumber,
        1000,
        isPreOrder: false,
      );

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: false);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: false);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1000;
      const newUnitPrice = materialUnitPrice + 100;
      const newTotalPrice = (newUnitPrice * qty);

      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(
        materialNumber,
        qty,
        isPreOrder: false,
      );
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);

      //verify
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
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
      // Should be 2 here because material has offer
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T119 | Verify display material on offer with bonus in checkout',
        (tester) async {
      const qty = 100;
      const bonusQty = 10;
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);
      final grandTotalPrice = (bonusMaterialNumberUnitPrice * qty)
          .includeTax(tax)
          .priceDisplay(currency);

      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty, isPreOrder: false);

      //verify
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMaterial(bonusMaterialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(bonusMaterialNumber, totalPrice);
      checkoutRobot.verifyMaterialQty(bonusMaterialNumber, qty);
      await checkoutRobot.verifyBonusMaterial(
        bonusMaterialNumber,
        bonusMaterial,
      );
      checkoutRobot.verifyBonusMaterialDescription(
        bonusMaterialNumber,
        bonusMaterial,
        freeMaterialName,
      );
      checkoutRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterial,
      );
      checkoutRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterial,
        bonusQty,
      );
      checkoutRobot.verifyBonusMaterialTag(
        bonusMaterialNumber,
        bonusMaterial,
      );
      checkoutRobot.verifyBonusMaterialFreeLabel(
        bonusMaterialNumber,
        bonusMaterial,
      );
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(grandTotalPrice);
      checkoutRobot.verifyStickyGrandTotal(grandTotalPrice);
      checkoutRobot.verifyStickyTotalQty(2);
    });

    testWidgets(
      'EZRX-T2064 | Verify tender contract material in checkout page',
      (tester) async {
        const qty = 5;
        const totalPrice = mandatoryTenderContractMaterialUnitPrice * qty;
        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await checkoutWithMaterial(mandatoryTenderContractMaterialNumber, qty);

        //verify
        checkoutRobot.verifyPage();
        checkoutRobot.verifyAddressSection();
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.verifyDeliveryDateField(isVisible: false);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyPaymentTermField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.verifyYoursItemLabel(1);
        await checkoutRobot
            .verifyMaterial(mandatoryTenderContractMaterialNumber);
        tenderContractDetailRobot
            .verifyTenderContractSectionInCartAndCheckout();
        await tenderContractDetailRobot.tapTenderContractSection();
        tenderContractDetailRobot.verifyTenderContractDetailsSection(
          price:
              mandatoryTenderContractMaterialTotalPrice.priceDisplay(currency),
          expiryDate: mandatoryTenderContractMaterialTenderExpiryDate,
          referance: mandatoryTenderContractMaterialTenderReferenceNumber,
        );
        tenderContractDetailRobot.verifyEditTenderContractSection(
          isVisible: false,
        );
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
          totalPrice.taxValue(tax).priceDisplay(currency),
          tax,
          isVn: true,
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
      },
    );
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(
        materialNumber,
        1000,
      );
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
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
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(
        materialNumber,
        qty,
      );
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();
      await tester.pumpAndSettle();
      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal((materialUnitPrice * qty).priceDisplay(currency));
      await orderSuccessRobot.verifyGrandTotal(
        ((materialUnitPrice * qty)).includeTax(tax).priceDisplay(currency),
      );
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(materialNumber);
      orderSuccessRobot.verifyMateriaDescription(materialName);
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
      const qty = 100;
      const bonusQty = 20;
      const tenderContractPrice = 32769.00;
      final totalPrice = (tenderContractPrice * qty).priceDisplay(currency);
      final totalCheckoutPrice =
          (tenderContractPrice * qty).includeTax(tax).priceDisplay(currency);

      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty, isPreOrder: false);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      // wrong price
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalCheckoutPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyMaterialTotalPrice(totalPrice);
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterial);
      orderSuccessRobot.verifyMateriaDescription(freeMaterialName);
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
        await pumpAppWithLoginOnBehalf(tester);
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
        await pumpAppWithLoginOnBehalf(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        //This part is not working for now getting some BE issue
        // final productName = viewByItemsRobot.getFirstProductName();
        // await commonRobot.searchWithKeyboardAction(productName);
        // viewByItemsRobot.verifyOrdersWithProductName(productName);
        // await commonRobot.pullToRefresh();
        // commonRobot.verifySearchBarText('');

        final materialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithSearchIcon(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
        await commonRobot.pullToRefresh();

        const orderCode = '0200321414';
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
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
        await pumpAppWithLoginOnBehalf(tester);
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
        await pumpAppWithLoginOnBehalf(tester);
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

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in view by items tab when customer code is blocked',
          (tester) async {
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();

        commonRobot.verifyCustomerSuspendedBanner();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in view by items tab when ship to code is blocked',
          (tester) async {
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: blockedShipToCode,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();

        commonRobot.verifyCustomerSuspendedBanner();
      });
    });

    group('View by item detail -', () {
      testWidgets(
          'EZRX-T87 | Verify view by item detail with default components',
          (tester) async {
        const orderId = '0200321414';

        //init app
        await pumpAppWithLoginOnBehalf(tester);
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
            .verifyManufacturerName(materialPrincipalName);
        await viewByItemsDetailRobot.verifyItemComponent();
      });

      testWidgets('EZRX-T91 | Verify material in view by item detail',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await checkoutWithMaterial(
          materialNumber,
          qty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
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
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );
        viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        viewByItemsDetailRobot.verifyBuyAgainButton(
          isVisible: false,
        );
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 100;
        const bonusQty = 10;

        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await checkoutWithMaterial(bonusMaterialNumber, qty, isPreOrder: false);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);

        await checkoutRobot.tapPlaceOrderButton();
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
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterial);
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

        viewByItemsDetailRobot.verifyBuyAgainButton(
          isVisible: false,
        );
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in view by items details  when customer code is blocked',
          (tester) async {
        const orderId = '6a57f4b1-4892-49cd-84b1-e82cc2e2862b';
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
        );
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(orderId);
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        commonRobot.verifyCustomerSuspendedBanner();
        viewByItemsDetailRobot.verifyBuyAgainButton(isVisible: true);
        viewByItemsDetailRobot.verifyBuyAgainButtonDisabled();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in view by items details when ship to code is blocked',
          (tester) async {
        const orderId = '3661e562-8f71-4765-b8b6-66d86ba83654';
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: blockedShipToCode,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(orderId);
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        commonRobot.verifyCustomerSuspendedBanner();
        viewByItemsDetailRobot.verifyBuyAgainButton(isVisible: true);
        viewByItemsDetailRobot.verifyBuyAgainButtonDisabled();
      });
    });

    group('View by orders -', () {
      testWidgets('EZRX-T71 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithLoginOnBehalf(tester);
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
        await tester.pumpAndSettle();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        await tester.pumpAndSettle();
        viewByOrdersRobot.verifyOrders();
      });

      testWidgets('EZRX-T78 | Verify search by order number', (tester) async {
        //init app
        await pumpAppWithLoginOnBehalf(tester);
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
        await pumpAppWithLoginOnBehalf(tester);
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
        await pumpAppWithLoginOnBehalf(tester);
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
        await pumpAppWithLoginOnBehalf(tester);
        await checkoutWithMaterial(
          materialNumber,
          qty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
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
          'EZRX-19747 | Find customer suspended banner in view by order when customer code is blocked',
          (tester) async {
        const orderId = '6a57f4b1-4892-49cd-84b1-e82cc2e2862b';
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();

        commonRobot.verifyCustomerSuspendedBanner();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        viewByOrdersRobot.verifyBuyAgainButtonDisabled();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in view by order when ship to code is blocked',
          (tester) async {
        const orderId = '3661e562-8f71-4765-b8b6-66d86ba83654';
        await pumpAppWithLoginOnBehalf(
          tester,
          selectedShipToCode: blockedShipToCode,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();

        commonRobot.verifyCustomerSuspendedBanner();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        viewByOrdersRobot.verifyBuyAgainButtonDisabled();
      });
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1000;
        final price = (materialUnitPrice * qty).priceDisplay(currency);
        final grandTotal =
            (materialUnitPrice * qty).includeTax(tax).priceDisplay(currency);

        //init app
        await pumpAppWithLoginOnBehalf(tester);
        await checkoutWithMaterial(
          materialNumber,
          qty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
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
        await pumpAppWithLoginOnBehalf(tester);

        //setup data
        await checkoutWithMaterial(
          materialNumber,
          orderQty,
        );
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
        await checkoutRobot.tapPlaceOrderButton();
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
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
        // TODO: Revist when popup 'Reoder for this delivery address? is added to add new test step
      });

      testWidgets(
          'EZRX-T90 | Verify material with offer + navigate to item detail + buy again',
          (tester) async {
        const qty = 100;
        const bonusQty = 10;
        //init app
        await pumpAppWithLoginOnBehalf(tester);

        //setup data
        await checkoutWithMaterial(bonusMaterialNumber, qty, isPreOrder: false);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyReferenceNoteField(isVisible: false);
        await checkoutRobot.verifyContactPersonField(isVisible: false);
        await checkoutRobot.verifyMobileNumberField(isVisible: false);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
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
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyMaterial(
          bonusMaterial,
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
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterial);
        viewByItemsDetailRobot.verifyQty(bonusQty);
        viewByItemsDetailRobot.verifyBonusLabel();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMaterialNumber, qty);
        await cartRobot.verifyBonusMaterial(
          bonusMaterialNumber,
          bonusMaterial,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMaterialNumber,
          bonusMaterial,
          bonusQty,
        );
      });
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in order details page  when customer code is blocked',
        (tester) async {
      const orderId = '6a57f4b1-4892-49cd-84b1-e82cc2e2862b';
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      await commonRobot.navigateToScreen(NavigationTab.orders);
      await ordersRootRobot.switchToViewByOrders();

      await commonRobot.searchWithKeyboardAction(orderId);
      viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
      await viewByOrdersRobot.tapFirstOrder();
      commonRobot.verifyCustomerSuspendedBanner();
      viewByOrdersDetailRobot.verifyOrderId(orderId);
      viewByOrdersRobot.verifyBuyAgainButtonDisabled();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in order details page when ship to code is blocked',
        (tester) async {
      const orderId = '3661e562-8f71-4765-b8b6-66d86ba83654';
      await pumpAppWithLoginOnBehalf(
        tester,
        selectedShipToCode: blockedShipToCode,
      );

      await commonRobot.navigateToScreen(NavigationTab.orders);
      await ordersRootRobot.switchToViewByOrders();

      await commonRobot.searchWithKeyboardAction(orderId);
      viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
      await viewByOrdersRobot.tapFirstOrder();
      commonRobot.verifyCustomerSuspendedBanner();
      viewByOrdersDetailRobot.verifyOrderId(orderId);
      viewByOrdersRobot.verifyBuyAgainButtonDisabled();
    });
  });

  group('Profile -', () {
    void verifyAllComponentsVisible() {
      profileRobot.verifyAccountAndBusinessDetailsVisible(
        firstName: 'VNExternalSR',
        lastName: 'User20',
        email: 'jhchoo@zuelligpharma.com',
        username: proxyUserName,
        mobilePhone: 'NA',
        language: 'English',
      );
      profileRobot.verifyLicenseListVisible();
      profileRobot.verifyButtonsDisabled();
    }

    testWidgets('EZRX-T176 | Verify Profile Page', (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await commonRobot.dismissSnackbar(
        dismissAll: true,
      );
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
    });

    testWidgets('EZRX-T177 | Verify Refresh Profile Page', (tester) async {
      //init app
      await pumpAppWithLoginOnBehalf(tester);
      await commonRobot.dismissSnackbar(
        dismissAll: true,
      );
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
      await commonRobot.pullToRefresh();
      verifyAllComponentsVisible();
    });

    // testWidgets('EZRX-T179 | Verify change language suscess', (tester) async {
    //   //init app
    //   await pumpAppWithLoginOnBehalf(tester);
    //   await commonRobot.dismissSnackbar(
    //     dismissAll: true,
    //   );
    //   await commonRobot.navigateToScreen(NavigationTab.more);
    //   await moreRobot.tapProfileTile();

    //   //verify
    //   profileRobot.verifyPageVisible();
    //   profileRobot.verifyProfilePageLanguageDropdown('English');
    //   await profileRobot
    //       .tapProfilePageLanguageDropdownAndChangeLanguage('Tiếng Việt');
    //   await profileRobot.tapClearButton();
    //   await profileRobot
    //       .tapProfilePageLanguageDropdownAndChangeLanguage('Tiếng Việt');
    //   await profileRobot.tapSaveButton();
    //   verifyAllComponentsVisible();
    //   await profileRobot
    //       .tapProfilePageLanguageDropdownAndChangeLanguage('English');
    //   await profileRobot.tapSaveButton();
    //   verifyAllComponentsVisible();
    // });

    // testWidgets('EZRX-T180 | Verify update profile after clear changes',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLoginOnBehalf(tester);
    //   await commonRobot.dismissSnackbar(
    //     dismissAll: true,
    //   );
    //   await commonRobot.navigateToScreen(NavigationTab.more);
    //   await moreRobot.tapProfileTile();

    //   //verify
    //   profileRobot.verifyPageVisible();
    //   profileRobot.verifyProfilePageLanguageDropdown('English');
    //   await profileRobot
    //       .tapProfilePageLanguageDropdownAndChangeLanguage('Tiếng Việt');
    //   await profileRobot.tapSaveButton();
    //   verifyAllComponentsVisible();
    // });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
