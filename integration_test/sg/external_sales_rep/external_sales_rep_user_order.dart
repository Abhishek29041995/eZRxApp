import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
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
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late MoreRobot moreRobot;
  late NotificationRobot notificationRobot;
  late ProfileRobot profileRobot;

  late AnnouncementArticleRootRobot announcementArticleRootRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  // late BundleDetailRobot bundleDetailRobot;
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

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;

  late PaymentSummaryDetailRobot paymentDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    profileRobot = ProfileRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);

    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    // bundleDetailRobot = BundleDetailRobot(tester);
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

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);

    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
  }

  const marketSingapore = 'Singapore';
  const username = 'sgexternalsalesrep';
  const password = 'St@ysafe01';
  const userFirstName = 'SGExternalSR';
  const userLastName = 'User8';
  const customerCode = '0030032829';
  const shipToCode = '0070043298';
  const otherShipToCode = '0070042482';
  const shipToAddress = 'Group Procurement Office';
  const currency = 'SGD';
  const tax = 9;
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const minOrderAmount = 100.0;
  const materialNumber = '23011688';
  const materialName = "KD-Skelemon         Tab          50's";
  const materialPrincipalName = 'Cambert (F.E.) Pte Ltd';
  const materialCountryOfOrigin = 'USA';
  const materialUnitMeasurement = 'EA';
  const materialUnitPrice = 14.21;
  // const multiImageMaterialNumber = '21041786';
  const otherInfoMaterialNumber = '23012375';
  const relatedProductMaterialNumber = '23008054';
  const suspendedMaterialNumber = '21026761';
  const lowPriceMaterialNumber = materialNumber;
  const lowPriceMaterialUnitPrice = materialUnitPrice;
  const bonusMaterialNumber = '23008136';
  const oosPreOrderMaterialNumber = '23008071';
  const bonusMaterialName = "Singulair Oral Granu Sac  4mg    28's";
  const bonusMaterialNumberTierQty = 5;
  const bonusMaterialNumberUnitPrice = 71.40;
  const anotherMaterialNumber = '23008054';
  const twentySixSeriesShipToCode = '0070042061';
  const twentySixSeriesMaterialNumber = '26031206';

  final materialStockInfo =
      StockInfo.empty().copyWith(expiryDate: DateTimeStringValue('2025-12-31'));
  final bonusMaterialStockInfo =
      StockInfo.empty().copyWith(expiryDate: DateTimeStringValue('2024-08-08'));
  final oosPreOrderMaterialStockInfo = StockInfo.empty();
  final materialExpiryDate = materialStockInfo.expiryDate.dateOrNaString;
  final materialBatchNumber = materialStockInfo.batch.displayNAIfEmpty;

  // TODO we do not have bundle data for extsales rep so the test is done with rootadmin
  // const bundleShortNumber = '9880081';
  // const bundleNumber = '0009880081';
  // const bundleName = '6E';
  // const bundleTier1Qty = 3;
  // const bundleTier1UnitPrice = 100.00;
  // const bundleTier1UnitPriceDisplay = '$currency $bundleTier1UnitPrice';
  // const bundleTier2Qty = 11;
  // const bundleTier2UnitPrice = 95.00;
  // const bundleTier2UnitPriceDisplay = '$currency $bundleTier2UnitPrice';
  // const bundleMaterialNumber1 = '23008184';
  // const bundleMaterialName1 = "Singulair           Tab   10mg   28's";
  // const bundleMaterialNumber2 = '23008187';
  // const bundleMaterialName2 = 'Singulair           Tab   4mg    28s';

  Future<void> pumpAppWithLogin(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketSingapore);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
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
// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
  // Future<void> addBundleToCart(Map<String, int> itemMap) async {
  //   await browseProductFromEmptyCart();
  //   await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
  //   await productSuggestionRobot.tapSearchResult(bundleShortNumber);
  //   await bundleDetailRobot.tapAddToCartButton();
  //   for (final item in itemMap.entries) {
  //     await bundleDetailRobot.enterMaterialQty(
  //       item.key,
  //       item.value,
  //     );
  //   }
  //   await bundleDetailRobot.tapSheetAddToCartButton();
  //   await commonRobot.dismissSnackbar();
  //   await bundleDetailRobot.tapCartButton();
  // }

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

  group('Notification Tab -', () {
    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // contain customer code
      await customerSearchRobot.search(subCustomerCode);
      customerSearchRobot.verifySearchResults(subCustomerCode);
      await commonRobot.tapClearSearch();

      // contain customer name
      await customerSearchRobot.search(subCustomerName);
      customerSearchRobot.verifySearchResults(subCustomerName);
      await commonRobot.tapClearSearch();

      // contain ship to code
      await customerSearchRobot.search(subShipToCode);
      customerSearchRobot.verifySearchResults(subShipToCode);
      await commonRobot.tapClearSearch();

      // contain ship to name
      await customerSearchRobot.search(subShipToName);
      customerSearchRobot.verifySearchResults(subShipToName);
      await commonRobot.tapClearSearch();
    });

    testWidgets(
        'EZRX-T21 | Verify Search ShipTo with invalid keyword in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

      // search for valid products
      homeRobot.findSearchProductField();
      await homeRobot.tapSearchProductField();
      await commonRobot.searchWithKeyboardAction(materialName);

      productSuggestionRobot.verifySearchResults(materialName);
    });

    testWidgets('EZRX-T26 | Verify Tap & slide Banner in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();

      //verify go to returns page
      returnsRootRobot.verifyRootPageVisible();
    });

    testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      //tap on products on offer
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin

    // testWidgets('EZRX-T45 | Verify display Bundles in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);

    //   //tap on bundle
    //   homeRobot.findBundles();
    //   await homeRobot.tapBundlesIcon();

    //   //navigate to material page
    //   productRobot.verifyPageVisible();
    // });

    testWidgets('EZRX-T47 | Verify display Browse products in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      //tap on browse products
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapBrowseProductsIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
      //tap on browse products
      await homeRobot.findAnnouncementsIcon();
      await homeRobot.tapAnnouncementsIcon();

      //verify go to announcements page
      announcementArticleRootRobot.verifyAnnouncementPage();
    });

    testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin

    // testWidgets(
    //     'EZRX-T52 | Verify display Product detail in Bundles in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);

    //   // Move to bundle
    //   homeRobot.findBundles();

    //   //verify bundles details
    //   homeRobot.verifyDisplayBundlesTag();
    //   homeRobot.verifyDisplayBundlesManufactured();
    //   homeRobot.verifyDisplayBundlesDescription();
    //   await homeRobot.verifyDisplayBundlesNumber();

    //   //Swipe bundle to right
    //   await homeRobot.slideBundle();

    //   //Swipe bundle to left
    //   await homeRobot.slideBundle(reversed: true);
    // });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T53 | Verify click on Bundle in Bundle deals',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);

    //   //move to products on offer
    //   homeRobot.findBundles();

    //   //tap on first product
    //   await homeRobot.tapOnFirstBundle();
    //   bundleDetailRobot.verifyPage();
    // });

    testWidgets('EZRX-T54 | Verify slide Item in Recently Ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //tap on first product
      await homeRobot.tapOnFirstBrowseProduct();

      //verify navigate to material page
      productDetailRobot.verifyPage();
    });
  });

  group('Product Tab -', () {
    const sortByZToA = 'Z-A';

    testWidgets('EZRX-T30 | Verify product tab with default components',
        (tester) async {
      //init app
      //init app
      await pumpAppWithLogin(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyMaterial();
      productRobot.verifyCartButtonVisible();
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

      //init app
      await pumpAppWithLogin(tester);
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

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-38 | Verify Filter by bundle', (tester) async {
    //   const bundleCheckbox = 'Bundle offers';

    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await productRobot.navigateToScreen(NavigationTab.products);
    //   await productRobot.openFilterProductScreen();

    //   await filterSortProductRobot.tapProductTypeCheckbox(bundleCheckbox);
    //   await filterSortProductRobot.tapFilterApplyButton();
    //   productRobot.verifyBundle();
    //   await productRobot.tapFirstBundle();
    //   bundleDetailRobot.verifyPage();
    //   await bundleDetailRobot.tapToBackScreen();

    //   await productRobot.openFilterProductScreen();
    //   filterSortProductRobot.verifyCheckboxCheckedShowProduct(
    //     bundleCheckbox,
    //     true,
    //   );
    //   await filterSortProductRobot.tapProductTypeCheckbox(bundleCheckbox);
    //   filterSortProductRobot.verifyCheckboxCheckedShowProduct(
    //     bundleCheckbox,
    //     false,
    //   );
    // });

    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      //init app
      await pumpAppWithLogin(tester);

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
      //init app
      await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);
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
      //init app
      await pumpAppWithLogin(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await commonRobot.tapClearSearch();

      await productSuggestionRobot.searchWithKeyboardAction(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await commonRobot.tapClearSearch();

      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);

      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await productSuggestionRobot.dismissSnackbar();
    });

    testWidgets('EZRX-T32 | Verify search and navigate to material detail',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      productDetailRobot.verifyPage();
    });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T33 | Verify search and navigate to bundle detail',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);

    //   await productRobot.navigateToScreen(NavigationTab.products);
    //   productRobot.verifySearchBarVisible();
    //   await productRobot.openSearchProductScreen();
    //   await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    //   await productSuggestionRobot.tapSearchResult(bundleShortNumber);
    //   bundleDetailRobot.verifyPage();
    // });

    testWidgets('EZRX-T34 | Verify Save search history + clear search history',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapToBackScreen();
      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapSearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      await productSuggestionRobot
          .searchWithKeyboardAction(anotherMaterialNumber);
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
      await pumpAppWithLogin(tester);

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

// TODO We do not have multiImage material for now
    // testWidgets('EZRX-T64 | Verify display image when having multiple images',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);

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
      await pumpAppWithLogin(tester);

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
      await productDetailRobot.tapOfferBottomSheetCloseButton();
    });

    testWidgets('EZRX-T66 | Verify Related products in the material detail',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(relatedProductMaterialNumber);
      await productSuggestionRobot
          .tapSearchResult(relatedProductMaterialNumber);
      await productDetailRobot.verifyRelateProductDisplayed();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      await productDetailRobot.tapBackButton();
    });

    testWidgets('EZRX-T67 | Verify other information in material detail',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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

    testWidgets('EZRX-T68 | Verify add and navigate to cart in material detail',
        (tester) async {
      const maximumQty = 99999;
      //init app
      await pumpAppWithLogin(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      productDetailRobot.verifyAddToCartSuccessMessage();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.tapCloseButton();
      await productDetailRobot.changeQty(maximumQty);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartFailureMessage();
    });

    testWidgets('EZRX-T215 | Verify favorite in material detail',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

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
        'EZRX-T1438 | [SG]  Check whether salesrep user able to see sample material (26 series) in Product details page tab or not ',
        (tester) async {
      final productPrice = 'Price Not Available'.tr();

      //init app
      await pumpAppWithLogin(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(twentySixSeriesShipToCode);

      // change address
      customerSearchRobot.findCustomerCode(twentySixSeriesShipToCode);
      await customerSearchRobot.tapOnCustomerCode(twentySixSeriesShipToCode);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(twentySixSeriesMaterialNumber);
      await productSuggestionRobot
          .tapSearchResult(twentySixSeriesMaterialNumber);

      //verify Price Not Available
      productDetailRobot.verifyCurrentProductPrice(productPrice);
      //verify Add to Cart button
      await productDetailRobot.tapAddToCart();
    });
  });

  group('Cart -', () {
    testWidgets('EZRX-T98 | Verify material in cart + change material qty',
        (tester) async {
      final materialTotalPrice = materialUnitPrice.includeTax(tax);
      //init app
      await pumpAppWithLogin(tester);

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
      cartRobot.verifyCartTotalPrice(materialTotalPrice.priceDisplay(currency));
      cartRobot.verifyCheckoutButton();

      var totalPrice = materialUnitPrice;
      var cartTotalPrice = materialTotalPrice;
      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      cartTotalPrice = totalPrice.includeTax(tax);
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(cartTotalPrice.priceDisplay(currency));

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartTotalPrice = totalPrice.includeTax(tax);
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(cartTotalPrice.priceDisplay(currency));

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartTotalPrice = totalPrice.includeTax(tax);
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(cartTotalPrice.priceDisplay(currency));
    });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T99 | Verify bundle in cart + change bundle qty',
    //     (tester) async {
    //   var materialQty1 = 3;
    //   var materialQty2 = bundleTier2Qty - materialQty1;
    //   var totalQty = materialQty1 + materialQty2;
    //   var totalPrice = totalQty * bundleTier2UnitPrice;
    // var grandTotalPrice = (totalQty * bundleTier2UnitPrice).include(tax);

    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await addBundleToCart({
    //     bundleMaterialNumber1: materialQty1,
    //     bundleMaterialNumber2: materialQty2,
    //   });

    //   //verify
    //   cartRobot.verifyPage();
    //   await cartRobot.verifyBundle(bundleNumber);
    //   cartRobot.verifyBundleNumber(bundleNumber);
    //   cartRobot.verifyBundleName(bundleNumber, bundleName);
    //   cartRobot.verifyBundleQty(bundleNumber, totalQty);
    //   cartRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier2Qty,
    //     bundleTier2UnitPriceDisplay,
    //   );
    //   await cartRobot.verifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   cartRobot.verifyBundleItemMaterialNumber(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   cartRobot.verifyBundleItemMaterialDescription(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     bundleMaterialName1,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     materialQty1,
    //   );
    //   cartRobot.verifyBundleItemDeleteButton(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   await cartRobot.verifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   cartRobot.verifyBundleItemMaterialNumber(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   cartRobot.verifyBundleItemMaterialDescription(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     bundleMaterialName2,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     materialQty2,
    //   );
    //   cartRobot.verifyBundleItemDeleteButton(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   cartRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     totalPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartQty(2);
    //   cartRobot.verifyCartShipToAddress(shipToAddress);
    //   cartRobot.verifyCartTotalPrice(grandTotalPrice.priceDisplay(currency));
    //   cartRobot.verifyCheckoutButton();

    //   await cartRobot.decreaseBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   materialQty1--;
    //   totalQty--;
    //   totalPrice = totalQty * bundleTier1UnitPrice;
    // grandTotalPrice = totalPrice.include(tax);
    //   cartRobot.verifyBundleQty(bundleNumber, totalQty);
    //   cartRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier1Qty,
    //     bundleTier1UnitPriceDisplay,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     materialQty1,
    //   );
    //   cartRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     totalPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartTotalPrice(grandTotalPrice.priceDisplay(currency));

    //   await cartRobot.increaseBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   materialQty2++;
    //   totalQty++;
    //   totalPrice = totalQty * bundleTier2UnitPrice;
    //   grandTotalPrice = totalPrice.include(tax);
    //   cartRobot.verifyBundleQty(bundleNumber, totalQty);
    //   cartRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier2Qty,
    //     bundleTier2UnitPriceDisplay,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     materialQty2,
    //   );
    //   cartRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     totalPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartTotalPrice(grandTotalPrice.priceDisplay(currency));

    //   materialQty1--;
    //   totalQty--;
    //   totalPrice = totalQty * bundleTier1UnitPrice;
    //   grandTotalPrice = totalPrice.include(tax);
    //   await cartRobot.changeBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     materialQty1,
    //   );
    //   cartRobot.verifyBundleQty(bundleNumber, totalQty);
    //   cartRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier1Qty,
    //     bundleTier1UnitPriceDisplay,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     materialQty1,
    //   );
    //   cartRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     totalPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartTotalPrice(grandTotalPrice.priceDisplay(currency));
    // });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T100 | Verify material and bundle in cart',
    //     (tester) async {
    //   const materialQty = 1;
    //   const bundleMaterialQty1 = 3;
    //   const bundleMaterialQty2 = bundleTier2Qty - bundleMaterialQty1;
    //   const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
    //   const bundleTotalPrice = bundleTotalQty * bundleTier2UnitPrice;
    //   const totalPrice = materialQty * materialUnitPrice + bundleTotalPrice;
    //   const grandTotalPrice =
    //       (materialQty * materialUnitPrice + bundleTotalPrice).include(tax);

    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await addBundleToCart({
    //     bundleMaterialNumber1: bundleMaterialQty1,
    //     bundleMaterialNumber2: bundleMaterialQty2,
    //   });

    //   //verify
    //   await cartRobot.tapCloseButton();
    //   await bundleDetailRobot.tapBackButton();
    //   await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    //   await productRobot.tapSearchMaterial(materialNumber);
    //   await productDetailRobot.tapAddToCart();
    //   await productDetailRobot.dismissSnackbar();
    //   productDetailRobot.verifyCartButtonQty(3);
    //   await productDetailRobot.tapCartButton();
    //   cartRobot.verifyPage();
    //   await cartRobot.verifyMaterial(materialNumber);
    //   cartRobot.verifyMaterialQty(materialNumber, materialQty);
    //   cartRobot.verifyMaterialUnitPrice(
    //     materialNumber,
    //     materialUnitPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyMaterialTotalPrice(
    //     materialNumber,
    //     materialUnitPrice.priceDisplay(currency),
    //   );
    //   await cartRobot.verifyBundle(bundleNumber);
    //   cartRobot.verifyBundleQty(bundleNumber, bundleTotalQty);
    //   cartRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier2Qty,
    //     bundleTier2UnitPriceDisplay,
    //   );
    //   await cartRobot.verifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     bundleMaterialQty1,
    //   );
    //   await cartRobot.verifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   cartRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     bundleMaterialQty2,
    //   );
    //   cartRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     bundleTotalPrice.priceDisplay(currency),
    //   );
    //   cartRobot.verifyCartQty(3);
    //   cartRobot.verifyQtyOnAppBar(3);
    //   cartRobot.verifyCartShipToAddress(shipToAddress);
    //   cartRobot.verifyCartTotalPrice(grandTotalPrice.priceDisplay(currency));
    //   cartRobot.verifyCheckoutButton();
    // });

    testWidgets('EZRX-T101 | Verify material on offer with bonus in cart',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T108 | Verify remove item in cart', (tester) async {
    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await browseProductFromEmptyCart();

    //   //verify
    //   await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    //   await productRobot.tapSearchMaterial(materialNumber);
    //   await productDetailRobot.tapAddToCart();
    //   await productDetailRobot.dismissSnackbar();
    //   await productDetailRobot.tapCartButton();
    //   await cartRobot.verifyMaterial(materialNumber);
    //   await cartRobot.swipeMaterialToDelete(materialNumber);
    //   await cartRobot.verifyClearCartSuccessMessage();
    //   cartRobot.verifyNoRecordFound();
    //   await cartRobot.tapBrowseProductButton();
    //   await productRobot.openSearchProductScreen();
    //   await productSuggestionRobot
    //       .searchWithKeyboardAction(bonusMaterialNumber);
    //   await productRobot.tapSearchMaterial(bonusMaterialNumber);
    //   await bundleDetailRobot.tapAddToCartButton();
    //   await bundleDetailRobot.enterMaterialQty(
    //     bundleMaterialName1,
    //     bundleTier1Qty,
    //   );
    //   await bundleDetailRobot.tapSheetAddToCartButton();
    //   await bundleDetailRobot.dismissSnackbar();
    //   await bundleDetailRobot.tapCartButton();
    //   await cartRobot.verifyBundle(bonusMaterialNumber);
    //   await cartRobot.swipeBundleToDelete(bonusMaterialNumber);
    //   cartRobot.verifyNoRecordFound();
    //   await cartRobot.verifyClearCartSuccessMessage();
    // });

    testWidgets('EZRX-T113 | Verify clear cart', (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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
      requestCounterOfferRobot.verifyOfferPrice(
        materialUnitPrice.priceDisplay(currency),
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
      requestCounterOfferRobot.verifyPriceTextErrorMessage('SGD');
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.enterRemark(remark);
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot
          .verifyOfferPrice(newUnitPrice.priceDisplay(currency));
      requestCounterOfferRobot.verifyPriceText(newUnitPrice.toStringAsFixed(2));
      requestCounterOfferRobot.verifyRemarkText(remark);
    });

    testWidgets('EZRX-T114 | Verify address information in cart',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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
      final materialTotalPrice = materialUnitPrice.includeTax(tax);
      //init app
      await pumpAppWithLogin(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyCartTotalPrice(materialTotalPrice.priceDisplay(currency));
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot.verifySubTotalLabel(
        materialUnitPrice.priceDisplay(currency),
      );
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        materialTotalPrice.priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T110 | Verify cart under minimum order value',
        (tester) async {
      final lowPriceMaterialTotalPrice =
          lowPriceMaterialUnitPrice.includeTax(tax);

      final validQty = (minOrderAmount / lowPriceMaterialUnitPrice).ceil();
      final validTotalPrice = lowPriceMaterialUnitPrice * validQty;

      //init app
      await pumpAppWithLogin(tester);
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
        lowPriceMaterialTotalPrice.priceDisplay(currency),
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
      await pumpAppWithLogin(tester);
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

    testWidgets('EZRX-274 | Verify discount override', (tester) async {
      //variable
      final materialUnitPriceDisplay = materialUnitPrice.priceDisplay(currency);
      const discountRate = 10;
      final newUnitPrice = double.parse(
        (materialUnitPrice * (1 - discountRate * 0.01)).toStringAsFixed(2),
      );
      final newUnitPriceDisplay = newUnitPrice.priceDisplay(currency);
      const materialQty = 100;
      final totalPrice =
          (materialUnitPrice * materialQty).priceDisplay(currency);
      final totalCartPrice = (materialUnitPrice * materialQty)
          .includeTax(tax)
          .priceDisplay(currency);
      //init app
      await pumpAppWithLogin(tester);
      await browseProductFromEmptyCart();

      //verify display
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();

      //verify cart item
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyManufacturerName(materialPrincipalName);
      cartRobot.verifyMaterialNumber(materialNumber);
      cartRobot.verifyMaterialImage(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialDescription(materialNumber, materialName);

      await cartRobot.changeMaterialQty(materialNumber, materialQty);
      cartRobot.verifyMaterialQty(materialNumber, materialQty);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPriceDisplay,
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice,
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartTotalPrice(totalCartPrice);
      cartRobot.verifyCheckoutButton();

      //verify discount override
      cartRobot.verifyMaterialCounterOfferButton(materialNumber);
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifyOfferPrice(materialUnitPriceDisplay);
      await requestCounterOfferRobot
          .enterDiscountCounterPriceRate(discountRate.toString());
      requestCounterOfferRobot
          .verifyDiscountCounterPriceRate(discountRate.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(materialNumber, newUnitPriceDisplay);
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifyOfferPrice(newUnitPriceDisplay);
      requestCounterOfferRobot
          .verifyDiscountCounterPriceRate(discountRate.toStringAsFixed(1));
      await requestCounterOfferRobot.tapCancelButton();

      final newTotalPrice = (newUnitPrice * materialQty).priceDisplay(currency);
      final newCartTotalPrice =
          (newUnitPrice * materialQty).includeTax(tax).priceDisplay(currency);

      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        newTotalPrice,
      );
      cartRobot.verifyCartTotalPrice(newCartTotalPrice);
    });

    testWidgets('EZRX-T68 | Verify suspended banner ', (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(suspendedMaterialNumber);
      await productRobot.tapSearchMaterial(suspendedMaterialNumber);
      //TODO: suspensionStatus as false comes from material details API, uncomment this line once resolved from BE side
      // productDetailRobot.verifySuspendedBanner();
      // await productDetailRobot.tapAddToCart();
      // productDetailRobot.verifyAddToCartSuccessMessage(isVisible: false);
      // productDetailRobot.verifyCartButtonQty(0);
      // await productDetailRobot.tapCartButton();
      // cartRobot.verifyPage();
      // cartRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T1439 | [SG] Check whether salesrep user cart page with sample materials whether counter offer and add bonus displaying or not ',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(twentySixSeriesShipToCode);

      // change address
      customerSearchRobot.findCustomerCode(twentySixSeriesShipToCode);
      await customerSearchRobot.tapOnCustomerCode(twentySixSeriesShipToCode);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(twentySixSeriesMaterialNumber);
      await productSuggestionRobot
          .tapSearchResult(twentySixSeriesMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();

      //verify cart item
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(twentySixSeriesMaterialNumber);
      cartRobot.verifyMaterialNumber(twentySixSeriesMaterialNumber);
      cartRobot.verifyMaterialImage(twentySixSeriesMaterialNumber);
      cartRobot.verifyMaterialQty(twentySixSeriesMaterialNumber, 1);

      //verify Bonus and counter offer not visible
      cartRobot.verifyMaterialBonusSampleButton(
        twentySixSeriesMaterialNumber,
        isVisible: false,
      );
      cartRobot.verifyMaterialCounterOfferButton(
        twentySixSeriesMaterialNumber,
        isVisible: false,
      );
      //verify 26 series message when cart contain only 26 series material
      cartRobot.verifyTwentySixSeriesMessage();
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1000;
      const totalPrice = materialUnitPrice * qty;
      final totalCheckOutPrice = (materialUnitPrice * qty).includeTax(tax);
      //init app
      await pumpAppWithLogin(tester);
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
      await checkoutRobot
          .verifyGrandTotalLabel(totalCheckOutPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(totalCheckOutPrice.priceDisplay(currency));
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(totalCheckOutPrice.priceDisplay(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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
      orderSuccessRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1000;
      const newUnitPrice = materialUnitPrice + 100;
      const newTotalPrice = (newUnitPrice * qty);
      final newCheckoutTotalPrice = (newUnitPrice * qty).includeTax(tax);

      //init app
      await pumpAppWithLogin(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialQty(materialNumber, qty);
      checkoutRobot.verifyMaterialDescription(materialNumber, materialName);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
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
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
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
      await checkoutRobot
          .verifyGrandTotalLabel(newCheckoutTotalPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(newCheckoutTotalPrice.priceDisplay(currency));
    });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T120 | Verify display bundle in Checkout',
    //     (tester) async {
    //   const bundleMaterialQty1 = 1;
    //   const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
    //   const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
    //   const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;
    //   const bundleGrandTotalPrice =
    //       (bundleTotalQty * bundleTier1UnitPrice).include(tax);

    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await addBundleToCart({
    //     bundleMaterialNumber1: bundleMaterialQty1,
    //     bundleMaterialNumber2: bundleMaterialQty2,
    //   });
    //   await cartRobot.tapCheckoutButton();
    //   await oosPreOrderRobot.tapContinueButton();

    //   //verify
    //   await checkoutRobot.verifyBundle(bundleNumber);
    //   checkoutRobot.verifyBundleName(bundleNumber, bundleName);
    //   checkoutRobot.verifyBundleRate(
    //     bundleNumber,
    //     bundleTier1Qty,
    //     bundleTier1UnitPriceDisplay,
    //   );
    //   await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
    //   checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber1);
    //   checkoutRobot.verifyBundleItemDescription(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     bundleMaterialName1,
    //   );
    //   checkoutRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //     bundleMaterialQty1,
    //   );
    //   await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
    //   checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber2);
    //   checkoutRobot.verifyBundleItemDescription(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     bundleMaterialName2,
    //   );
    //   checkoutRobot.verifyBundleItemQty(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //     bundleMaterialQty2,
    //   );
    //   checkoutRobot.verifyBundleTotalQty(
    //     bundleNumber,
    //     bundleTotalQty,
    //   );
    //   await checkoutRobot
    //       .verifySubTotalLabel(bundleTotalPrice.priceDisplay(currency));
    //   await checkoutRobot
    //       .verifyGrandTotalLabel(bundleGrandTotalPrice.priceDisplay(currency));
    //   checkoutRobot.verifyBundleTotalPrice(
    //     bundleNumber,
    //     bundleTotalPrice.priceDisplay(currency),
    //   );
    //   checkoutRobot.verifyStickyTotalQty(2);
    //   checkoutRobot
    //       .verifyStickyGrandTotal(bundleGrandTotalPrice.priceDisplay(currency));
    // });

    testWidgets(
        'EZRX-T119 | Verify display material on offer with bonus in checkout',
        (tester) async {
      const qty = 1000;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);
      final totalCheckoutPrice =
          ((bonusMaterialNumberUnitPrice * qty).includeTax(tax))
              .priceDisplay(currency);

      //init app
      await pumpAppWithLogin(tester);
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
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalCheckoutPrice);
      checkoutRobot.verifyStickyGrandTotal(totalCheckoutPrice);
      checkoutRobot.verifyStickyTotalQty(2);
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithLogin(tester);
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
      //init app
      await pumpAppWithLogin(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal((materialUnitPrice * qty).priceDisplay(currency));
      await orderSuccessRobot.verifyGrandTotal(
        ((materialUnitPrice * qty).includeTax(tax)).priceDisplay(currency),
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
      const qty = 1000;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      final totalPrice =
          (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);
      final totalCheckoutPrice =
          ((bonusMaterialNumberUnitPrice * qty).includeTax(tax))
              .priceDisplay(currency);

      //init app
      await pumpAppWithLogin(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
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
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(bonusQty);
      orderSuccessRobot.verifyMaterialBonusTag();
    });

// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
    // testWidgets('EZRX-T125 | Verify display bundle in order submitted',
    //     (tester) async {
    //   const bundleMaterialQty1 = 1;
    //   const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
    //   const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
    //   final bundleTotalPrice =
    //       (bundleTotalQty * bundleTier1UnitPrice).priceDisplay(currency);
    //   final bundleGrandTotalPrice =
    //       ((bundleTotalQty * bundleTier1UnitPrice).include(tax))
    //           .priceDisplay(currency);

    //   //init app
    //   await pumpAppWithLogin(tester);
    //   await addBundleToCart({
    //     bundleMaterialNumber1: bundleMaterialQty1,
    //     bundleMaterialNumber2: bundleMaterialQty2,
    //   });
    //   await cartRobot.tapCheckoutButton();
    //   await oosPreOrderRobot.tapContinueButton();
    //   await checkoutRobot.tapPlaceOrderButton();
    //   await orderSuccessRobot.dismissSnackbar();

    //   //verify
    //   await orderSuccessRobot.verifyOrderSummarySection();
    //   await orderSuccessRobot.verifySubTotal(bundleTotalPrice);
    //   await orderSuccessRobot.verifyGrandTotal(bundleGrandTotalPrice);
    //   await orderSuccessRobot.verifyOrderItemTotalQty(2);
    //   await orderSuccessRobot.startVerifyBundle(bundleNumber);
    //   orderSuccessRobot.verifyBundleRate(
    //     bundleTier1Qty,
    //     bundleTier1UnitPrice.priceDisplay(currency),
    //   );
    //   orderSuccessRobot.verifyBundleTotalQty(bundleTotalQty);
    //   orderSuccessRobot.verifyBundleTotalPrice(bundleTotalPrice);
    //   await orderSuccessRobot.startVerifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber1,
    //   );
    //   orderSuccessRobot.verifyItemQty(bundleMaterialQty1);
    //   await orderSuccessRobot.startVerifyBundleItem(
    //     bundleNumber,
    //     bundleMaterialNumber2,
    //   );
    //   orderSuccessRobot.verifyItemQty(bundleMaterialQty2);
    // });
  });

  group('Order Tab -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 150));
    final toDate = DateTime.now().subtract(const Duration(days: 2));

    group('View by items -', () {
      testWidgets('EZRX-T69 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithLogin(tester);
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
        await pumpAppWithLogin(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.pullToRefresh();
        await commonRobot.searchWithSearchIcon(materialNumber);
        final productName = viewByItemsRobot.getFirstProductName();
        await commonRobot.searchWithKeyboardAction(productName.toUpperCase());
        viewByItemsRobot.verifyOrdersWithProductName(productName);
        await commonRobot.pullToRefresh();
        commonRobot.verifySearchBarText('');

        final firstMaterialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithSearchIcon(firstMaterialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(firstMaterialNumber);
        await commonRobot.pullToRefresh();

        const orderCode = '0200363348';
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
        await pumpAppWithLogin(tester);
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
        const statusFilter = 'Pending';

        //init app
        await pumpAppWithLogin(tester);
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
        const orderId = '0200363348';

        //init app
        await pumpAppWithLogin(tester);
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
        const qty = 1000;

        //init app
        await pumpAppWithLogin(tester);
        await checkoutWithMaterial(materialNumber, qty);
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
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        // Uncomment this when test data is material without offer
        // await viewByItemsDetailRobot.verifyOtherItemsComponent(
        //   isVisible: false,
        // );
        // viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        viewByItemsDetailRobot.verifyBuyAgainButton(
          isVisible: false,
        );
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 1000;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;

        //init app
        await pumpAppWithLogin(tester);
        await checkoutWithMaterial(bonusMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await commonRobot.dismissSnackbar(dismissAll: true);
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

        viewByItemsDetailRobot.verifyBuyAgainButton(
          isVisible: false,
        );
      });
//TODO we do not have bundle for ext salesrep so the test is done with rootadmin
      // testWidgets('EZRX-T91 | Verify bundle in view by items detail',
      //     (tester) async {
      //   const bundleMaterialQty1 = 1;
      //   const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;

      //   //init app
      //   await pumpAppWithLogin(tester);
      //   await addBundleToCart({
      //     bundleMaterialNumber1: bundleMaterialQty1,
      //     bundleMaterialNumber2: bundleMaterialQty2,
      //   });
      //   await cartRobot.tapCheckoutButton();
      //   await oosPreOrderRobot.tapContinueButton();
      //   await checkoutRobot.tapPlaceOrderButton();
      //   await orderSuccessRobot.tapCloseButton();
      //   await commonRobot.navigateToScreen(NavigationTab.orders);

      //   //verify
      //   ordersRootRobot.verifyViewByItemsPage();
      //   await commonRobot.pullToRefresh();
      //   await viewByItemsRobot.tapFirstOrderWithMaterial(bundleMaterialNumber1);
      //   await viewByItemsDetailRobot.verifyItemComponent();
      //   viewByItemsDetailRobot.verifyBundleTag();
      //   viewByItemsDetailRobot.verifyMaterialNumber(bundleMaterialNumber1);
      //   viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
      //   await viewByItemsDetailRobot.verifyOtherItemsComponent();
      //   await viewByItemsDetailRobot.startVerifyOtherItem(0);
      //   viewByItemsDetailRobot.verifyOtherItemBundleTag();
      //   viewByItemsDetailRobot.verifyOtherItemQty(bundleMaterialQty2);
// TODO for ext salesrep we need to uncomment this line
      //   // viewByItemsDetailRobot.verifyBuyAgainButton(isVisible: false);
      // });
    });

    group('View by orders -', () {
      testWidgets('EZRX-T71 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithLogin(tester);
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
        await pumpAppWithLogin(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();
        var orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();

        orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
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
        await pumpAppWithLogin(tester);
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
        await pumpAppWithLogin(tester);
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
        await pumpAppWithLogin(tester);
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
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1000;
        final price = (materialUnitPrice * qty).priceDisplay(currency);
        final totalPrice =
            ((materialUnitPrice * qty).includeTax(tax)).priceDisplay(currency);
        const poReference = 'test Po Reference';
        const deliveryInstruction = 'test Delivery Instruction';

        //init app
        await pumpAppWithLogin(tester);
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
        viewByOrdersDetailRobot.verifySubTotal(price);
        viewByOrdersDetailRobot.verifyGrandTotal(totalPrice);
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
        await pumpAppWithLogin(tester);

        //setup data
        await checkoutWithMaterial(materialNumber, orderQty);
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
        const qty = 1000;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;
        //init app
        await pumpAppWithLogin(tester);

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
// TODO we do not have bundle data for extsales rep so the test is done with rootadmin
      // testWidgets(
      //     'EZRX-T90 | Verify bundle + navigate to item detail + buy again',
      //     (tester) async {
      //   const bundleMaterialQty1 = 1;
      //   const bundleMaterialQty2 = bundleTier1Qty - bundleMaterialQty1;
      //   const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
      //   const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;

      //   //init app
      //   await pumpAppWithLogin(tester);
      //   await addBundleToCart({
      //     bundleMaterialNumber1: bundleMaterialQty1,
      //     bundleMaterialNumber2: bundleMaterialQty2,
      //   });
      //   await cartRobot.tapCheckoutButton();
      //   await oosPreOrderRobot.tapContinueButton();
      //   await checkoutRobot.tapPlaceOrderButton();
      //   await orderSuccessRobot.tapCloseButton();
      //   await commonRobot.navigateToScreen(NavigationTab.orders);

      //   //verify
      //   await ordersRootRobot.switchToViewByOrders();
      //   await commonRobot.pullToRefresh();
      //   await viewByOrdersRobot.tapFirstOrder();
      //   await viewByOrdersDetailRobot.startVerifyBundle(bundleNumber);
      //   viewByOrdersDetailRobot.verifyBundleRate(
      //     bundleTier1Qty,
      //     bundleTier1UnitPrice.priceDisplay(currency),
      //   );
      //   viewByOrdersDetailRobot.verifyBundleTotalQty(bundleTotalQty);
      //   viewByOrdersDetailRobot
      //       .verifyBundleTotalPrice(bundleTotalPrice.priceDisplay(currency));
      //   await viewByOrdersDetailRobot.startVerifyBundleItem(
      //     bundleNumber,
      //     bundleMaterialNumber1,
      //   );
      //   viewByOrdersDetailRobot.verifyQty(bundleMaterialQty1);
      //   await viewByOrdersDetailRobot.tapVerifyingItem();
      //   viewByItemsDetailRobot.verifyPage();
      //   await viewByItemsDetailRobot.verifyItemComponent();
      //   viewByItemsDetailRobot.verifyMaterialNumber(bundleMaterialNumber1);
      //   viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
      //   viewByItemsDetailRobot.verifyBundleTag();
      //   await viewByItemsDetailRobot.tapToBackScreen();
      //   await viewByOrdersDetailRobot.startVerifyBundleItem(
      //     bundleNumber,
      //     bundleMaterialNumber2,
      //   );
      //   viewByOrdersDetailRobot.verifyQty(bundleMaterialQty2);
      //   await viewByOrdersDetailRobot.tapBuyAgainButton();
      //   cartRobot.verifyPage();
      //   await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
      //   cartRobot.verifyBundleItemQty(
      //     bundleNumber,
      //     bundleMaterialNumber1,
      //     bundleMaterialQty1,
      //   );
      //   await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
      //   cartRobot.verifyBundleItemQty(
      //     bundleNumber,
      //     bundleMaterialNumber2,
      //     bundleMaterialQty2,
      //   );
      // });
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
      //init app
      await pumpAppWithLogin(tester);
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
      await pumpAppWithLogin(tester);
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

    testWidgets('EZRX-T179 | Verify change language suscess', (tester) async {
      //Cannot change Language because SG market has only English language.
      //Skip this test cases
    });

    testWidgets('EZRX-T180 | Verify update profile after clear changes',
        (tester) async {
      //Cannot change Language because SG market has only English language,
      //So that cannot verify update profile after clear changes,
      //Skip this test cases
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
