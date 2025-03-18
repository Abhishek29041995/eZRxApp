import 'dart:math';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
// import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
// import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
// import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/profile_robot.dart';
import '../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../robots/orders/cart/small_order_fee_robot.dart';
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
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;
  late ProfileRobot profileRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late CustomerSearchRobot customerSearchRobot;
  late SmallOrderFeeRobot smallOrderFeeRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    profileRobot = ProfileRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
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
    customerSearchRobot = CustomerSearchRobot(tester);

    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    smallOrderFeeRobot = SmallOrderFeeRobot(tester);
  }

  const marketIndonesia = 'Indonesia';
  const username = 'idclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0000100164';
  const shipToCode = '0000100164';
  const otherShipToCode = '0000124623';

  const licenseExpiredShipToCode = '0000100232';
  const orderId = '0100998752';
  const shipToAddress = 'MARGARETHA FARMA. AP.';
  const currency = 'IDR';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const materialNumber = 'DAULSL20';
  const customerLicenseExpiredMaterial = 'DAULSL20';

  const materialName = '8011 - AHA ULTRA SMOOTHINGLOTION 200ML';
  const materialPrincipalName = 'PT. DARYA VARIA LABORATORIA TBK';
  const materialUnitMeasurement = 'BOX';
  const materialCountryOfOrigin = 'NA';
  var materialUnitPrice = 0.0;
  const taxPercentage = 11;
  var smallOrderFee = 0.0;

  const multiImageMaterialNumber = 'TNACNESPLNP';
  const otherInfoMaterialNumber = 'TNACNESPLNP';

  const oosMaterialNumber = '3353621001';
  const smallOrderFeeMaterialNumber = 'TM1537N';

  //commenting this line as in prod ID MOV is 100, and there is no data
  //which have below MOV price material.
  const lowPriceMaterialNumber = materialNumber;
  var lowPriceMaterialUnitPrice = 0.0;

  const bonusMaterialNumber = 'TCW20';
  // const bonusMaterialNumberTierQty = 1;
  const bonusMaterialName = 'BANDAGES TATTOO WP, COOL';
  // final bonusMaterialStockInfo =
  //     StockInfo.empty().copyWith(expiryDate: DateTimeStringValue('2022-11-30'));
  var bonusMaterialNumberUnitPrice = 0.0;

  const orderMaterialNumber = materialNumber;
  const orderMaterialName = materialName;

  var poReference = 'id-po';
  const poReferenceErrorMessage = 'duplicated PO Number';

  final materialStockInfo = StockInfo.empty().copyWith(
    expiryDate: DateTimeStringValue(
      '2025-12-31',
    ),
  );
  final materialExpiryDate = materialStockInfo.expiryDate.dateOrNaString;
  final materialBatch = materialStockInfo.batch.displayNAIfEmpty;

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketIndonesia);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await commonRobot.dismissSnackbar(dismissAll: true);
    }
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> updateAndVerifySmallOrderFee() async {
    if (cartRobot.isCartPage) {
      await cartRobot.tapToSeePriceBreakDown();
      smallOrderFee = double.parse(cartRobot.getSmallOrderFeeValue);
      await cartRobot.tapToClosePriceBreakDown();
    } else {
      //it is on checkout page
      await checkoutRobot.tapToSeePriceBreakDown();
      smallOrderFee = double.parse(checkoutRobot.getSmallOrderFeeValue);
      await checkoutRobot.tapToClosePriceBreakDown();
    }
  }

  Future<void> checkoutWithMaterial(
    String materialNumber,
    int qty, {
    bool isPreOrder = false,
    bool isBonus = false,
  }) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productRobot.tapSearchMaterial(materialNumber);
    if (isBonus) {
      bonusMaterialNumberUnitPrice = productDetailRobot.getMaterialUnitPrice;
    } else {
      materialUnitPrice = productDetailRobot.getMaterialUnitPrice;
    }
    await productDetailRobot.tapAddToCart();
    await commonRobot.dismissSnackbar(dismissAll: true);
    await productDetailRobot.tapCartButton();
    await cartRobot.changeMaterialQty(materialNumber, qty);
    await updateAndVerifySmallOrderFee();
    await cartRobot.tapCheckoutButton();
    if (smallOrderFee > 0) {
      await smallOrderFeeRobot.tapAgreeButton();
    }
    if (isPreOrder) {
      await oosPreOrderRobot.tapContinueButton();
    }
  }

  String generateUniquePOReference() {
    const prefix = 'id-po';
    const length = 19;
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

    final random = Random();
    final randomString =
        List.generate(length, (index) => chars[random.nextInt(chars.length)])
            .join();

    return '$prefix$randomString';
  }

  Future<void> placeOrderWithValidPO(
    String materialNumber,
    int itemCount, {
    bool isBonus = false,
  }) async {
    poReference = generateUniquePOReference();
    await checkoutRobot.verifyPoReferenceField(isVisible: true);
    await checkoutRobot.enterPoReference(poReference);
    await checkoutRobot.verifyYoursItemLabel(itemCount);
    if (isBonus) {
      bonusMaterialNumberUnitPrice =
          checkoutRobot.getMaterialUnitPrice(materialNumber);
    } else {
      materialUnitPrice = checkoutRobot.getMaterialUnitPrice(materialNumber);
    }
    await checkoutRobot.tapPlaceOrderButton();
    while (
        await (checkoutRobot.isErrorSnackBarAppears(poReferenceErrorMessage))) {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await checkoutRobot.verifyPoReferenceField(
        isVisible: true,
        reversed: true,
      );
      await checkoutRobot.enterPoReference('');
      poReference = generateUniquePOReference();
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.tapPlaceOrderButton();
    }
  }

  group('Announcement Banner -', () {
    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
      await loginRobot.tapToCloseAnnouncementBanner();
    }

    testWidgets(
        'EZRX-T24121 | Integration with CMS- Maintenance Banner | find Banner in login',
        (tester) async {
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketIndonesia);
      await loginRobot.findAnnouncementBanner(marketIndonesia);
    });

    testWidgets(
        'EZRX-T24121 | Integration with CMS- Maintenance Banner | find banner in home',
        (tester) async {
      await pumpAppInitialState(tester);
      await loginRobot.loginToHomeScreen(username, password, marketIndonesia);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.findAnnouncementAlertDialog(marketIndonesia);
      await commonRobot.closeAnnouncementAlertDialog();
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
      await homeRobot.findBrowseProductsIcon();
      // await homeRobot.findAnnouncementsIcon();
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
    });

    testWidgets(
        'EZRX-T21 | Verify Search ShipTo with invalid keyword in Homepage',
        (tester) async {
      const invalidNumberSearchKey = '1231762381236123';

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

//Product on offer is not available for the filter issue
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

    testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      //tap on recently ordered
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapRecentlyOrderIcon();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

//Product on offer is not available for the filter issue
    // testWidgets(
    //     'EZRX-T50 | Verify display Product detail in Product on offer in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //move to products on offer
    //   homeRobot.findProductsOnOffer();
    //   homeRobot.verifyDisplayProductsWithOfferTag();

    //   //swipe products to right
    //   await homeRobot.slideToNextProductsOnOffer();

    //   //swipe products to left
    //   await homeRobot.slideToPreviousProductsOnOffer();
    // });

//Product on offer is not available for the filter issue
    // testWidgets('EZRX-T51 | Verify click on Product in Product on offer',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //move to Bundles
    //   homeRobot.findProductsOnOffer();

    //   //tap on first product
    //   await homeRobot.tapOnFirstProductOnOffer();

    //   //verify navigation to Material Detail Page
    //   productDetailRobot.verifyPage();
    // });

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
  });

  group('Product Tab - ', () {
    const sortByZToA = 'Z-A';
    testWidgets('EZRX-T30 | Verify default and display items in Product list',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyFilterFavoritesChip();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
    });
    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
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
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
    });
    testWidgets(
        'EZRX-T31 | Verify Search Product by inputting keyword contains product name',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productRobot.verifyPageVisible();

      await productRobot.openSearchProductScreen();

      await commonRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
    });
    testWidgets(
        'EZRX-T32 | Verify Search Product by inputting keyword contains Product code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      productSuggestionRobot.verifyNoSuggestedProduct();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      productRobot.verifyPageVisible();
    });
    testWidgets(
        'EZRX-T33 | Verify Search Product by inputting keyword not contain Product name/code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
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
    testWidgets('EZRX-T34 | Verify Favorite list', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyFirstNameProduct(nameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });
    testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
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
    testWidgets('EZRX-T38 | Verify Filter by Manufacturer', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();

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
    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyFilterCountryOfOriginInvisibleForIdMarket();
    });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
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
      productRobot.verifyCartButtonVisible();
      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
      productRobot.verifyProductSortChanged(firstProduct);
    });
    testWidgets('EZRX-T61 | Verify action click Cart icon in Product tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T1512 | Verify License Expired banner is visible in products tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: licenseExpiredShipToCode);

      await commonRobot.navigateToScreen(NavigationTab.products);

      productRobot.findLicenseExpiredBanner();
      productRobot.findViewLicenseButton();
      await productRobot.tapViewLicenseButton();
      profileRobot.verifyPageVisible();
    });
  });

  group('Product Detail - ', () {
    testWidgets('EZRX-T62 | Verify Product detail via Product tab',
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
      productDetailRobot.verifyBatchDisplayed(
        value: materialBatch,
        isVisible: false,
      );
      productDetailRobot.verifyExpiryDateLabelDisplayed(
        value: materialExpiryDate,
      );
    });

    testWidgets('EZRX-T42 | Verify Product detail via Home screen',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapOnFirstBrowseProduct();
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();
    });

    testWidgets(
        'EZRX-T63 | Verify material information in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(materialNumber);
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(materialUnitMeasurement);
      productDetailRobot
          .verifyCountryOfOriginLabelDisplayed(materialCountryOfOrigin);
      productDetailRobot.verifyBatchDisplayed(
        value: materialBatch,
        isVisible: false,
      );
      productDetailRobot.verifyExpiryDateLabelDisplayed(
        value: materialExpiryDate,
      );
    });

    testWidgets(
        'EZRX-T64 | Verify display image when Product has multiple images',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
      await productRobot.tapSearchMaterial(multiImageMaterialNumber);
      productDetailRobot.verifyImageMaterialSelected(0, true);
      productDetailRobot.verifyImageMaterialSelected(1, false);
      await productDetailRobot.tapToImageMaterial(1, false);
      productDetailRobot.verifyImageMaterialSelected(1, true);
    });

    testWidgets('EZRX-T66 | Verify Related products in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.dragMaterialDetailsInfoTileDisplayed();
      await productDetailRobot.verifyRelateProductDisplayed();
    });

    testWidgets('EZRX-T67 | Verify other information in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productRobot.tapSearchMaterial(otherInfoMaterialNumber);
      await productDetailRobot.tapToSeeMore();
      productDetailRobot.verifyMaterialHowToUseDisplayed();
      productDetailRobot.verifyMaterialCompositionDisplayed();
    });

    testWidgets('EZRX-T68 | Verify action click Cart icon in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
    });

    testWidgets('EZRX-T215 | Verify add favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: true);
    });

    testWidgets('EZRX-T216 | Verify remove favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(false);
      await productDetailRobot.tapBackButton();
      await commonRobot.pullToRefresh();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: false);
    });

    testWidgets(
        'EZRX-T1513 | Verify License Expired banner is visible in product details page',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: licenseExpiredShipToCode);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(customerLicenseExpiredMaterial);
      await productRobot.tapSearchMaterial(customerLicenseExpiredMaterial);
      productDetailRobot.verifyProductNameDisplayed();

      productDetailRobot.findLicenseExpiredBanner();
      productDetailRobot.findViewLicenseButton();
      await productDetailRobot.tapViewLicenseButton();
      profileRobot.verifyPageVisible();
    });
  });

  group('Cart - ', () {
    testWidgets('EZRX-T97 | Verify Cart when NO product is added to cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await homeRobot.tapMiniCartIcon();

      //verify
      cartRobot.verifyPage();
      await cartRobot.clearCart();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T98 | Verify Cart when products are added to the cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      materialUnitPrice = productDetailRobot.getMaterialUnitPrice;
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
        materialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      await updateAndVerifySmallOrderFee();
      final totalPrice =
          materialUnitPrice.includeTaxForID(taxPercentage) + smallOrderFee;
      cartRobot.verifyCartTotalPrice(
        totalPrice.priceDisplayForID(currency),
      );
    });

    testWidgets('EZRX-T113 | Verify delete all items in cart', (tester) async {
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
    });

    testWidgets('EZRX-T108 | Verify remove Product in the Cart',
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
      await cartRobot.swipeMaterialToDelete(materialNumber);
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T114 | Verify the customer code & deliver to in Order for [Selected address] in Cart detail',
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

    testWidgets(
        'EZRX-T107 | Verify update Cart when increasing/decreasing the quantity of the selected product from the cart details page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productRobot.tapSearchMaterial(materialNumber);
      materialUnitPrice = productDetailRobot.getMaterialUnitPrice;
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await updateAndVerifySmallOrderFee();
      var totalPrice =
          materialUnitPrice.includeTaxForID(taxPercentage) + smallOrderFee;

      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplayForID(currency),
      );
      //applied small order fees here as total price is less than 3,00,000
      cartRobot.verifyCartTotalPrice(
        totalPrice.priceDisplayForID(currency),
      );

      await cartRobot.increaseMaterialQty(materialNumber);
      //applied small order fees here as total price is less than 3,00,000
      final materialTotalPrice = materialUnitPrice * 2;
      await updateAndVerifySmallOrderFee();
      totalPrice =
          materialTotalPrice.includeTaxForID(taxPercentage) + smallOrderFee;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialTotalPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.priceDisplayForID(currency),
      );

      await cartRobot.changeMaterialQty(materialNumber, 10);
      //no applied small order fees here as total price is greater than 3,00,000
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTaxForID(taxPercentage).priceDisplayForID(currency),
      );

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTaxForID(taxPercentage).priceDisplayForID(currency),
      );
    });

    testWidgets(
        'EZRX-T110 | Verify notification if Cart is under the minimum order value',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productRobot.tapSearchMaterial(lowPriceMaterialNumber);
      lowPriceMaterialUnitPrice = productDetailRobot.getMaterialUnitPrice;
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(lowPriceMaterialNumber);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 1);
      cartRobot.verifyMaterialUnitPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplayForID(currency),
      );

      await updateAndVerifySmallOrderFee();

      cartRobot.verifyCartTotalPrice(
        (lowPriceMaterialUnitPrice.includeTaxForID(taxPercentage) +
                smallOrderFee)
            .priceDisplayForID(currency),
      );

      await cartRobot.changeMaterialQty(lowPriceMaterialNumber, 3);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 3);
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        (lowPriceMaterialUnitPrice * 3).priceDisplayForID(currency),
      );
      cartRobot.verifyCartTotalPrice(
        (lowPriceMaterialUnitPrice * 3)
            .includeTaxForID(taxPercentage)
            .priceDisplayForID(currency),
      );
      await updateAndVerifySmallOrderFee();
    });

    testWidgets('EZRX-T65| Verify Available offers in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(bonusMaterialNumber);
      productDetailRobot.verifyQuantityProductDisplayedForTirePriceOffer();
      productDetailRobot.verifyButtonCloseDisplayed();
    });

    testWidgets('EZRX-T115 | Verify checkout cart when having pre-order items',
        (tester) async {
      const qty = 2;
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(oosMaterialNumber);
      await productRobot.tapSearchMaterial(oosMaterialNumber);
      if (productDetailRobot.isOosPreOrderMaterial) {
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar();
        await productDetailRobot.tapCartButton();
        await cartRobot.verifyMaterial(oosMaterialNumber);
        cartRobot.verifyMaterialOOSPreOrderStatus(oosMaterialNumber);
        await cartRobot.changeMaterialQty(oosMaterialNumber, qty);
        await cartRobot.tapCheckoutButton();
        oosPreOrderRobot.verifySheet(isVisible: true);
        oosPreOrderRobot.verifyCancelButton();
        oosPreOrderRobot.verifyContinueButton();
        oosPreOrderRobot.verifyWarningMessage();
        oosPreOrderRobot.verifyMaterial(oosMaterialNumber, qty);
        oosPreOrderRobot.verifyExpiryDateAndBatch(
          oosMaterialNumber,
          StockInfo.empty(),
          isBatchNumberVisible: false,
        );
        await oosPreOrderRobot.tapCancelButton();
        cartRobot.verifyPage();
        oosPreOrderRobot.verifySheet(isVisible: false);
        await cartRobot.tapCheckoutButton();
        oosPreOrderRobot.verifyMaterial(oosMaterialNumber, qty);
        await oosPreOrderRobot.tapContinueButton();
        checkoutRobot.verifyPage();
      } else if (productDetailRobot.isOutOfStockMaterial) {
        productDetailRobot.verifyAddToCartButtonDisable();
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.tapCartButton();
        cartRobot.verifyPage();
        cartRobot.verifyNoRecordFound();
      }
    });

    testWidgets(
        'EZRX-T2058 | Verify cart when small order fee in the order on Cart detail',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(smallOrderFeeMaterialNumber);
      await productRobot.tapSearchMaterial(smallOrderFeeMaterialNumber);

      if (productDetailRobot.isOutOfStockMaterial) {
        return;
      }

      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.tapCheckoutButton();
      smallOrderFeeRobot.verifySheet(isVisible: true);
      smallOrderFeeRobot.verifyCancelButton();
      smallOrderFeeRobot.verifyAgreeButton();
      smallOrderFeeRobot.verifyBottomSheetContent();
      await smallOrderFeeRobot.tapCancelButton();
      cartRobot.verifyPage();
      smallOrderFeeRobot.verifySheet(isVisible: false);
      await cartRobot.tapCheckoutButton();
      smallOrderFeeRobot.verifySheet(isVisible: true);
      await smallOrderFeeRobot.tapAgreeButton();
      if (oosPreOrderRobot.isOosPreOrderMaterial) {
        await oosPreOrderRobot.tapContinueButton();
      }
      checkoutRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T1514 | Verify License Expired banner is visible in Cart page',
        (tester) async {
      await pumpAppWithHomeScreen(tester, shipToCode: licenseExpiredShipToCode);

      await homeRobot.tapMiniCartIcon();

      //verify
      cartRobot.verifyPage();

      commonRobot.findLicenseExpiredBanner();
      commonRobot.findViewLicenseButton();
      await commonRobot.tapViewLicenseButton();
      profileRobot.verifyPageVisible();
    });

    testWidgets(
        'EZRX-T1356 | [ID] - Verify Apl promotion label with default component',
        (tester) async {
      const offerQty = 1;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(bonusMaterialNumber);
      await productRobot.tapSearchMaterial(bonusMaterialNumber);
      bonusMaterialNumberUnitPrice = productDetailRobot.getMaterialUnitPrice;
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(bonusMaterialNumber);
      cartRobot.verifyMaterialNumber(bonusMaterialNumber);
      cartRobot.verifyMaterialQty(
        bonusMaterialNumber,
        offerQty,
      );
      cartRobot.verifyMaterialUnitPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        bonusMaterialNumber,
        bonusMaterialNumberUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyAplPromotionLabelForItem(
        materialNumber: bonusMaterialNumber,
      );
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1;
      const totalSaving = 0;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      final totalPrice = materialUnitPrice;
      final tax = materialUnitPrice.taxValueForID(taxPercentage);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.tapDeliveryInformationArrowButton();

      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
      await updateAndVerifySmallOrderFee();
      //we need to update the small order fee first, then we can finalize grand total value
      final grandTotalPrice =
          materialUnitPrice.includeTaxForID(taxPercentage) + smallOrderFee;
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      await checkoutRobot.verifyTaxLabel(tax.priceDisplayForID(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 3);

      await placeOrderWithValidPO(materialNumber, 1);
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(poReference);
    });

    //TODO: we will get back once it get resolved,
    //Issue - https://zuelligpharma.atlassian.net/browse/EZRX-20182?focusedCommentId=151477

    // testWidgets(
    //     'EZRX-T119 | Verify display material on offer with bonus in checkout',
    //     (tester) async {
    //   const qty = 3;
    //   const bonusQty = qty ~/ bonusMaterialNumberTierQty;
    //   //offer applied 7% so unit price changes
    //   const newBonusMaterialNumberUnitPrice = 115528;
    //   const totalPrice = (newBonusMaterialNumberUnitPrice * qty);

    //   //init app
    //   await pumpAppWithHomeScreen(tester);
    //   await checkoutWithMaterial(bonusMaterialNumber, qty);

    //   //verify
    //   await checkoutRobot.verifyPoReferenceField(isVisible: true);
    //   await checkoutRobot.enterPoReference(poReference);
    //   await checkoutRobot.tapDeliveryInformationArrowButton();
    //   await checkoutRobot.verifyYoursItemLabel(2);
    //   await checkoutRobot.verifyMaterial(bonusMaterialNumber);
    //   checkoutRobot.verifyMaterialUnitPrice(
    //     bonusMaterialNumber,
    //     bonusMaterialNumberUnitPrice.priceDisplayForID(currency),
    //   );
    //   checkoutRobot.verifyMaterialTotalPrice(
    //     bonusMaterialNumber,
    //     totalPrice.priceDisplayForID(currency),
    //   );
    //   checkoutRobot.verifyMaterialQty(bonusMaterialNumber, qty);
    //   await checkoutRobot.verifyBonusMaterial(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //   );
    //   checkoutRobot.verifyBonusMaterialDescription(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //     bonusMaterialName,
    //   );
    //   checkoutRobot.verifyBonusMaterialExpiryDateAndBatch(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //     bonusMaterialStockInfo,
    //     isBatchNumberVisible: false,
    //   );
    //   await checkoutRobot.tapBonusMaterialExpiryDateInfoIcon(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //   );
    //   await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
    //   checkoutRobot.verifyBonusMaterialImage(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //   );
    //   checkoutRobot.verifyBonusMaterialQty(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //     bonusQty,
    //   );
    //   checkoutRobot.verifyBonusMaterialTag(
    //     bonusMaterialNumber,
    //     bonusMaterialNumber,
    //     isVisible: false,
    //   );
    //   await checkoutRobot
    //       .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
    //   await updateAndVerifySmallOrderFee();
    //   await checkoutRobot.verifyGrandTotalLabel(
    //     totalPrice
    //         .includeTaxForID(taxPercentage)
    //         .floor()
    //         .priceDisplayForID(currency),
    //   );
    //   checkoutRobot.verifyStickyGrandTotal(
    //     totalPrice
    //         .includeTaxForID(taxPercentage)
    //         .floor()
    //         .priceDisplayForID(currency),
    //   );
    //   checkoutRobot.verifyStickyTotalQty(2);
    // });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      const qty = 1;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      await placeOrderWithValidPO(materialNumber, 1);
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
      const qty = 3;
      const totalSaving = 0;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      await updateAndVerifySmallOrderFee();

      await placeOrderWithValidPO(materialNumber, 1);
      final totalPrice = materialUnitPrice * qty;
      final grandTotalPrice =
          totalPrice.includeTaxForID(taxPercentage) + smallOrderFee;
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(
        totalPrice.priceDisplayForID(currency),
      );
      await orderSuccessRobot.verifyTax(
        totalPrice.taxValueForID(taxPercentage).priceDisplayForID(currency),
      );
      await orderSuccessRobot
          .verifySmallOrderFee(smallOrderFee.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifyGrandTotal(grandTotalPrice.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifyTotalSaving(totalSaving.priceDisplayForID(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
    });

    testWidgets(
        'EZRX-T125 | Verify display material on offer with bonus in order submitted',
        (tester) async {
      const qty = 3;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty, isBonus: true);

      await placeOrderWithValidPO(
        bonusMaterialNumber,
        2,
        isBonus: true,
      );
      final totalPrice = (bonusMaterialNumberUnitPrice * qty);

      final grandTotalPrice =
          totalPrice.includeTaxForID(taxPercentage) + smallOrderFee;
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal(totalPrice.priceDisplayForID(currency));
      await orderSuccessRobot.verifyGrandTotal(
        grandTotalPrice.floor().priceDisplayForID(currency),
      );
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplayForID(currency),
      );
      orderSuccessRobot
          .verifyMaterialTotalPrice(totalPrice.priceDisplayForID(currency));
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialBonusTag(isVisible: false);
      orderSuccessRobot.verifyMaterialTotalPrice(
        0.priceDisplayForID(currency),
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
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.searchWithKeyboardAction(orderMaterialName);
        viewByItemsRobot.verifyOrdersWithProductName(orderMaterialName);
        await commonRobot.tapClearSearch();
        await commonRobot.pullToRefresh();
        commonRobot.verifySearchBarText('');

        await commonRobot.searchWithSearchIcon(orderMaterialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(orderMaterialNumber);
        await commonRobot.pullToRefresh();

        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
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

      testWidgets(
          'EZRX-T1515 | Verify License Expired banner is visible in View by items tab',
          (tester) async {
        await pumpAppWithHomeScreen(
          tester,
          shipToCode: licenseExpiredShipToCode,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();

        commonRobot.findLicenseExpiredBanner();
        commonRobot.findViewLicenseButton();
        await commonRobot.tapViewLicenseButton();
        profileRobot.verifyPageVisible();
      });

      group('View by item detail -', () {
        testWidgets(
            'EZRX-T1516 | Verify License Expired banner is visible in View by items details page',
            (tester) async {
          //init app
          await pumpAppWithHomeScreen(
            tester,
            shipToCode: licenseExpiredShipToCode,
          );
          await commonRobot.navigateToScreen(NavigationTab.orders);

          //verify
          ordersRootRobot.verifyViewByItemsPage();
          await commonRobot.searchWithKeyboardAction(orderId);
          await viewByItemsRobot.tapFirstOrder();

          viewByItemsDetailRobot.verifyPage();

          viewByItemsDetailRobot.findLicenseExpiredBanner();
          viewByItemsDetailRobot.findViewLicenseButton();
          await viewByItemsDetailRobot.tapViewLicenseButton();
          profileRobot.verifyPageVisible();
        });
      });
    });

    group('View by orders - ', () {
      testWidgets(
          'EZRX-T71 | Verify display items in View by orders tab with data available',
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
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrdersForID();
      });

      testWidgets(
          'EZRX-T74 | Verify display items in View by orders tab with no data available with auto search feature',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrdersForID();
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(orderId);
        viewByOrdersRobot.verifyOrdersForID();
      });

      testWidgets(
          'EZRX-T78 | Verify search my order history by inputting keyword contains Order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
      });

      testWidgets(
          'EZRX-T80 | Verify search my order history by inputting keyword not contain order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      });

      testWidgets(
          'EZRX-T83 | Verify Filter by date when no having result found in View by orders tab',
          (tester) async {
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
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T84 | Verify Filter by date when having result found in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
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
      });

      testWidgets(
          'EZRX-T86 | Verify Filter by status when having result found in View by orders tab',
          (tester) async {
        const statusFilter = 'Order received';
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
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
        viewByOrdersRobot.verifyOrdersForID();
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
        viewByOrdersRobot.verifyOrdersForID();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: true,
        );
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
      });

      testWidgets('EZRX-T72 | Verify click on Buy again', (tester) async {
        const qty = 5;
        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);

        await placeOrderWithValidPO(materialNumber, 1);
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
          'EZRX-T90 | Verify click on Buy again in Order detail via View by orders tab when having existing items in Cart',
          (tester) async {
        const orderQty = 2;
        const cartQty = 3;
        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await checkoutWithMaterial(materialNumber, orderQty);
        await checkoutRobot.verifyMaterial(materialNumber);
        await placeOrderWithValidPO(materialNumber, 1);
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();

        await commonRobot.navigateToScreen(NavigationTab.products);
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productRobot.tapSearchMaterial(materialNumber);
        materialUnitPrice = productDetailRobot.getMaterialUnitPrice;

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
          'EZRX-T1517 | Verify License Expired banner is visible in View by orders tab',
          (tester) async {
        await pumpAppWithHomeScreen(
          tester,
          shipToCode: licenseExpiredShipToCode,
        );

        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();

        commonRobot.findLicenseExpiredBanner();
        commonRobot.findViewLicenseButton();
        await commonRobot.tapViewLicenseButton();
        profileRobot.verifyPageVisible();
      });
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T1518 | Verify License Expired banner is visible in View by order details page',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(
          tester,
          shipToCode: licenseExpiredShipToCode,
        );
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.searchWithKeyboardAction(orderId);
        await viewByOrdersRobot.tapFirstOrder();

        viewByOrdersDetailRobot.verifyPage();
        viewByOrdersDetailRobot.verifyOrderId(orderId);

        viewByOrdersDetailRobot.findLicenseExpiredBanner();
        viewByOrdersDetailRobot.findViewLicenseButton();
        await viewByOrdersDetailRobot.tapViewLicenseButton();
        profileRobot.verifyPageVisible();
      });
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
