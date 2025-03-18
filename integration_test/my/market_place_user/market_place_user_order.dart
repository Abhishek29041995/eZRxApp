import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ezrxmobile/domain/order/entities/stock_info.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/aup_tc_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
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
import '../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../../robots/products/bundle_detail_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late AupTCRobot aupTCRobot;
  late MoreRobot moreRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late BundleDetailRobot bundleDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    aupTCRobot = AupTCRobot(tester);
    moreRobot = MoreRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    cartRobot = CartRobot(tester);
    orderPriceSummaryRobot = OrderPriceSummaryRobot(tester);
    oosPreOrderRobot = OOSPreOrderRobot(tester);
    checkoutRobot = CheckoutRobot(tester);
    orderSuccessRobot = OrderSuccessRobot(tester);

    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
  }

  const market = 'Malaysia';
  const username = 'mpmyclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030082707';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const nonMPShipToCode = '0000002012';
  const currency = 'MYR';
  const zpMOV = 300.0;
  const mpMOV = 400.0;

  const marketPlaceFilterTitle = 'Marketplace items';
  const mpMaterialNumber = '23357262';
  const mpMaterialName = 'DROP SHIPMENT TEST MATERIAL 23NB';
  const mpMaterialSeller = 'Actavis Hong Kong Ltd';
  const mpMaterialUnit = 'EA';
  const mpMaterialCountry = 'Indonesia';
  const mpMaterialPrice = 200.00;

  const diffSellerMPMaterialNumber = '23357267';
  const diffSellerMPMaterialName = 'DROP SHIPMENT TEST MATERIAL 28NB';
  const diffSellerMPMaterialSeller = 'MUNDIPHARMA PHARMACEUTICALS';
  const diffSellerMPMaterialPrice = 200.00;

  const sameSellerMPMaterialNumber = '23357263';
  const sameSellerMPMaterialName = 'DROP SHIPMENT TEST MATERIAL 24NB';
  const sameSellerMPMaterialPrice = 5000.00;

  const bonusMPMaterialNumber = '23357261';
  const bonusMPMaterialSeller = 'Actavis Hong Kong Ltd';
  const bonusMPMaterialName = 'DROP SHIPMENT TEST MATERIAL 22NB';
  const bonusMPMaterialTierQty = 10;
  const bonusMPMaterialPrice = 200.00;

  const mpSuspendedMaterialNumber = '23357269';

  const mpBundleShortNumber = '16399801';
  const mpBundleNumber = '0016399801';
  const mpBundleTier1Qty = 5;
  const mpBundleTier1Price = 100.0;
  const mpBundleTier2Qty = 10;
  const mpBundleTier2Price = 80.0;
  const mpBundleMaterialNumber1 = '23357261';
  const mpBundleMaterialNumber2 = '23357264';

  const zpMaterialNumber = '21038305';
  const zpMaterialManufacturer = 'BAXTER HEALTHCARE -M';
  const zpMaterialPrice = 273.60;

  const zpBundleShortNumber = '8896469';
  const zpBundleNumber = '0008896469';
  const zpBundleTier1Qty = 5;
  const zpBundleTier1Price = 100.0;
  const zpBundleMaterialNumber1 = '23046003';
  const zpBundleMaterialNumber2 = '23046018';

  Future<void> pumpAppWithHomeScreen(WidgetTester tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, market);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
      await commonRobot.changeDeliveryAddress(shipToCode);
    }
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> placeOrderWithMaterial(String materialNumber, int qty) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.autoSearch(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.changeMaterialQty(materialNumber, qty);
    await cartRobot.tapCheckoutButton();
    if (oosPreOrderRobot.isSheetVisible) {
      await oosPreOrderRobot.tapContinueButton();
    }
    await checkoutRobot.tapPlaceOrderButton();
    await orderSuccessRobot.tapCloseButton();
  }

  Future<void> placeOrderWithBundle(
    String bundle,
    Map<String, int> itemMap,
  ) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.autoSearch(bundle);
    await productSuggestionRobot.tapSearchResult(bundle);
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
    await cartRobot.tapCheckoutButton();
    if (oosPreOrderRobot.isSheetVisible) {
      await oosPreOrderRobot.tapContinueButton();
    }
    await checkoutRobot.tapPlaceOrderButton();
    await orderSuccessRobot.tapCloseButton();
  }

  group('Authentication -', () {
    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
      await loginRobot.tapToCloseAnnouncementBanner();
    }

    testWidgets('Verify login and show customer search page', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //login
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(market);
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();
      await loginRobot.login(username, password);

      //intro page
      await loginRobot.skipIntroIfHas();

      //verify customer search show successfully
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(shipToCode);
      customerSearchRobot.findCustomerCode(shipToCode);
    });

    testWidgets(
        'Verify pre-login with customer page and select non-marketplace ship to',
        (tester) async {
      await pumpAppInitialState(tester);

      //customer search
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(nonMPShipToCode);
      await commonRobot.closeAnnouncementAlertDialog();
      homeRobot.verify();

      //logout
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.findLogout();
      await moreRobot.tapLogout();
    });

    testWidgets('Verify select ship to with marketplace and accept MP TnC',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //Login
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(market);
      await loginRobot.verifySelectedMarket(market);

      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();
      await loginRobot.login(username, password);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);

      //Verify TnC
      if (aupTCRobot.isPageVisible) {
        aupTCRobot.verifyPage();
        aupTCRobot.verifyDefaultComponents();
        await aupTCRobot.tapAcceptButton();
        aupTCRobot.verifyConsentAllWarning();
        await aupTCRobot.dismissSnackbar();
        await aupTCRobot.tapPrivacyCheckBox();
        await aupTCRobot.tapTnCCheckBox();
        await aupTCRobot.tapDeclineButton();
        aupTCRobot.verifyPage();
        await aupTCRobot.tapAcceptButton();
        aupTCRobot.verifyPage(isVisible: false);
        homeRobot.verify();
      }
    });
  });

  group('Home -', () {
    testWidgets('Verify explore marketplace banner in home page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      homeRobot.verifyExploreMarketPlaceBanner();
      await homeRobot.tapExploreMarketPlaceButton();
      productRobot.verifyPageVisible();
      productRobot.verifyAllProductWithMarketPlace();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
      filterSortProductRobot.verifyMarketPlaceFilter();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        marketPlaceFilterTitle,
        true,
      );
      await filterSortProductRobot.tapToBackIcon();
      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      homeRobot.verifyExploreMarketPlaceBanner(isVisible: false);
    });

    testWidgets('Verify recent marketplace order in home page', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await placeOrderWithMaterial(
        mpMaterialNumber,
        (mpMOV / mpMaterialPrice).ceil(),
      );
      await commonRobot.navigateToScreen(NavigationTab.home);
      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      await commonRobot.changeDeliveryAddress(shipToCode);
      await homeRobot.findRecentlyOrderIcon();
      homeRobot.verifyMarketPlaceIcon();
      await homeRobot.tapFirstMarketPlaceIcon();
      viewByItemsDetailRobot.verifyPage();
      viewByItemsDetailRobot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
    });
  });

  group('Product -', () {
    testWidgets('Verify filter by MP material', (tester) async {
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
      filterSortProductRobot.verifyMarketPlaceFilter();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        marketPlaceFilterTitle,
        false,
      );
      await filterSortProductRobot
          .tapProductTypeCheckbox(marketPlaceFilterTitle);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyAllProductWithMarketPlace();
      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyMarketPlaceFilter(isVisible: false);
    });

    testWidgets('Verify filter by seller of MP material', (tester) async {
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot.searchWithKeyboardAction(mpMaterialSeller);
      filterSortProductRobot.verifyListManufacturerMatched(mpMaterialSeller);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(mpMaterialSeller);
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifyManufactureListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyAllProductWithMarketPlace();
      productRobot.verifyManufacturerMaterialFilterMatched(mpMaterialSeller);
    });
  });

  group('Product search -', () {
    testWidgets('Verify search MP material', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      productSuggestionRobot.verifyMarketPlaceLogo(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      productDetailRobot.verifyPage();
      productDetailRobot.verifyMarketPlaceLogo();
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.tapToBackScreen();

      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      // There is issue with data, in non MP customer code, the API still returns MP materials
      // await productSuggestionRobot.autoSearch(oosMPMaterialNumber);
      // productSuggestionRobot.verifyNoSuggestedProduct();
      // productSuggestionRobot.verifyNoRecordFound();
    });
  });

  group('Material detail -', () {
    testWidgets('Verify MP material detail with default components',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyMarketPlaceLogo();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyExpiryDate('NA');
      await productDetailRobot.tapExpiryDateInfoIcon();
      await productDetailRobot.verifyExpiryDateBottomSheetAndTapClose();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();

      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(mpMaterialNumber);
      productDetailRobot.verifySellerDisplayed(mpMaterialSeller);
      productDetailRobot.verifyUnitOfMeasurementLabelDisplayed(mpMaterialUnit);
      productDetailRobot.verifyCountryOfOriginLabelDisplayed(mpMaterialCountry);
      productDetailRobot.verifyExpiryDateLabelDisplayed(value: 'NA');
      productDetailRobot.verifyBatchDisplayed(value: 'NA', isVisible: false);
      await productDetailRobot.tapCloseButtonMaterialInformationDialog();

      await productDetailRobot.verifyRelateProductDisplayed();
      productDetailRobot.verifyRelatedProductMPLogo();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyMarketPlaceLogo();
      await productDetailRobot.tapBackButton();
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T1995| Verify available offers in MP material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.autoSearch(bonusMPMaterialNumber);
      await productSuggestionRobot.tapSearchResult(bonusMPMaterialNumber);
      productDetailRobot.verifyOnOfferLabel();
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      productDetailRobot.verifyMarketPlaceLogo();
      productDetailRobot.verifyExpiryDate('NA');
      await productDetailRobot.openAvailableOffers(scrollRequired: false);
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(bonusMPMaterialNumber);
      productDetailRobot.verifyQuantityProductDisplayed();
      productDetailRobot.verifyOfferBottomSheetCloseButton();
    });

    testWidgets('EZRX-T2000 | Verify suspended banner MP material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot.autoSearch(mpSuspendedMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpSuspendedMaterialNumber);
      productDetailRobot.verifySuspendedBanner();
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartSuccessMessage(isVisible: false);
      productDetailRobot.verifyCartButtonQty(0);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('Verify add to cart from MP material detail ', (tester) async {
      const maximumQty = 99999;
      await pumpAppWithHomeScreen(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
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
  });

  group('Ordering -', () {
    testWidgets('Verify minimum order value + price summary for ZP and MP',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Add ZP material to cart
      await productSuggestionRobot.autoSearch(zpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(zpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();
      // Verify ZP material in cart
      cartRobot.verifyManufacturerName(zpMaterialManufacturer);
      await cartRobot.verifyMaterial(zpMaterialNumber);
      cartRobot.verifyMaterialQty(zpMaterialNumber, 1);
      await cartRobot.verifyMarketPlaceSection(isVisible: false);
      // Verify price summary when not have MP in cart
      cartRobot.verifyCartTotalPrice(zpMaterialPrice.priceDisplay(currency));
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifyZPSubTotalLabel(
        zpMaterialPrice.priceDisplay(currency),
        isVisible: false,
      );
      orderPriceSummaryRobot.verifyMPSubTotalLabel(
        mpMaterialPrice.priceDisplay(currency),
        isVisible: false,
      );
      await orderPriceSummaryRobot.tapCloseButton();
      // Add MP material to cart
      await cartRobot.tapCloseButton();
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(2);
      await productDetailRobot.tapCartButton();
      // Verify MP material in cart
      await cartRobot.verifyMarketPlaceSection(isVisible: true);
      await cartRobot.verifySellerName(mpMaterialSeller);
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialQty(mpMaterialNumber, 1);
      //Verify MOV message
      cartRobot.verifyMarketPlaceMOVWarningMessage(
        isVisible: true,
        mpMOV: mpMOV.priceDisplay(currency),
        zpMOV: zpMOV.priceDisplay(currency),
      );
      final mpQty = (mpMOV / mpMaterialPrice).ceil();
      final zpQty = (zpMOV / zpMaterialPrice).ceil();
      await cartRobot.changeMaterialQty(zpMaterialNumber, zpQty);
      cartRobot.verifyMarketPlaceMOVWarningMessage(
        isVisible: true,
        mpMOV: mpMOV.priceDisplay(currency),
      );
      await cartRobot.verifyMaterial(mpMaterialNumber);
      await cartRobot.changeMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMarketPlaceMOVWarningMessage(isVisible: false);
      await cartRobot.verifyMaterial(zpMaterialNumber, reversed: true);
      await cartRobot.changeMaterialQty(zpMaterialNumber, 1);
      cartRobot.verifyMarketPlaceMOVWarningMessage(
        isVisible: true,
        zpMOV: zpMOV.priceDisplay(currency),
      );
      await cartRobot.changeMaterialQty(zpMaterialNumber, zpQty);
      cartRobot.verifyMarketPlaceMOVWarningMessage(isVisible: false);
      // Verify price summary when has MP in cart
      final zpTotal = zpMaterialPrice * zpQty;
      final mpTotal = mpMaterialPrice * mpQty;
      final totalPrice = (zpTotal + mpTotal).priceDisplay(currency);
      cartRobot.verifyCartTotalPrice(totalPrice);
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot
          .verifyMPSubTotalLabel(mpTotal.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyZPSubTotalLabel(zpTotal.priceDisplay(currency));
      orderPriceSummaryRobot.verifySubTotalLabel(totalPrice);
      orderPriceSummaryRobot.verifySubTotalLabel(totalPrice);
      orderPriceSummaryRobot.verifyGrandTotalLabel(totalPrice);
      await orderPriceSummaryRobot.tapCloseButton();
      // Go to checkout
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      checkoutRobot.verifyPage();
    });

    testWidgets('EZRX-1984 | Verify order with ZP and MP material',
        (tester) async {
      final mpQty = (mpMOV / mpMaterialPrice).ceil();
      final zpQty = (zpMOV / zpMaterialPrice).ceil();
      final zpTotal = zpMaterialPrice * zpQty;
      final mpTotal = mpMaterialPrice * mpQty;
      final totalPrice = (zpTotal + mpTotal).priceDisplay(currency);
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Verify ZP material in cart
      await productSuggestionRobot.autoSearch(zpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(zpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(zpMaterialNumber);
      cartRobot.verifyMaterialBonusSampleButton(zpMaterialNumber);
      cartRobot.verifyMaterialCounterOfferButton(zpMaterialNumber);
      await cartRobot.changeMaterialQty(zpMaterialNumber, zpQty);
      cartRobot.verifyMaterialQty(zpMaterialNumber, zpQty);
      cartRobot.verifyMaterialUnitPrice(
        zpMaterialNumber,
        zpMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        zpMaterialNumber,
        zpTotal.priceDisplay(currency),
      );
      // Verify MP material in cart
      await cartRobot.tapCloseButton();
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(2);
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialDescription(mpMaterialNumber, mpMaterialName);
      cartRobot.verifyMaterialBonusSampleButton(
        mpMaterialNumber,
        isVisible: false,
      );
      cartRobot.verifyMaterialCounterOfferButton(
        mpMaterialNumber,
        isVisible: false,
      );
      cartRobot.verifyMaterialExpiryDateAndBatch(
        mpMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      await cartRobot.changeMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      cartRobot.verifyCartShipToAddress(shipToAddress);
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMaterialPrincipal(zpMaterialManufacturer);
      await checkoutRobot.verifyMaterial(zpMaterialNumber);
      checkoutRobot.verifyMaterialQty(zpMaterialNumber, zpQty);
      checkoutRobot.verifyMaterialUnitPrice(
        zpMaterialNumber,
        zpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        zpMaterialNumber,
        zpTotal.priceDisplay(currency),
      );
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(mpMaterialSeller);
      await checkoutRobot.verifyMaterial(mpMaterialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        mpMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      checkoutRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      await checkoutRobot.verifyZPSubTotalLabel(zpTotal.priceDisplay(currency));
      await checkoutRobot.verifyMPSubTotalLabel(mpTotal.priceDisplay(currency));
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      // Verify navigate to order detail from order success
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyMarketPlaceOrderId(1, 1);
      await orderSuccessRobot.tapFirstMPOrderId();
      viewByOrdersDetailRobot.verifyPage();
      viewByOrdersDetailRobot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await viewByOrdersDetailRobot.tapToBackScreen();
      await orderSuccessRobot.tapFirstZPOrderId();
      viewByOrdersDetailRobot.verifyPage();
      viewByOrdersDetailRobot.verifyMarketPlaceLogoWithSeller(
        mpMaterialSeller,
        isVisible: false,
      );
      await viewByOrdersDetailRobot.tapToBackScreen();
      // Verify order success components
      await orderSuccessRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await orderSuccessRobot.verifyZPSubTotal(zpTotal.priceDisplay(currency));
      await orderSuccessRobot.verifyMPSubTotal(mpTotal.priceDisplay(currency));
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: false,
      );
      orderSuccessRobot.verifyMaterialNumber(zpMaterialNumber);
      orderSuccessRobot.verifyItemQty(zpQty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(zpMaterialPrice.priceDisplay(currency));
      orderSuccessRobot
          .verifyMaterialTotalPrice(zpTotal.priceDisplay(currency));
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(mpMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(mpMaterialNumber);
      orderSuccessRobot.verifyItemQty(mpQty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(mpMaterialPrice.priceDisplay(currency));
      orderSuccessRobot
          .verifyMaterialTotalPrice(mpTotal.priceDisplay(currency));
    });

    testWidgets(
        'EZRX-1993 | Verify order with MP material from different seller',
        (tester) async {
      final mpQty = (mpMOV / mpMaterialPrice).ceil();
      const mpQty1 = 2;
      final mpTotal = mpMaterialPrice * mpQty;
      const mpTotal1 = diffSellerMPMaterialPrice * mpQty1;
      final totalPrice = (mpTotal + mpTotal1).priceDisplay(currency);
      final sellers = [mpMaterialSeller, diffSellerMPMaterialSeller];
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Add MP materials in cart
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.autoSearch(diffSellerMPMaterialNumber);
      await productSuggestionRobot.tapSearchResult(diffSellerMPMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(2);
      await productDetailRobot.tapCartButton();
      // Verify MP materials in cart
      await cartRobot.verifySellerName(mpMaterialSeller);
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialDescription(mpMaterialNumber, mpMaterialName);
      await cartRobot.changeMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      await cartRobot.verifySellerName(diffSellerMPMaterialSeller);
      await cartRobot.verifyMaterial(diffSellerMPMaterialNumber);
      cartRobot.verifyMaterialDescription(
        diffSellerMPMaterialNumber,
        diffSellerMPMaterialName,
      );
      await cartRobot.changeMaterialQty(diffSellerMPMaterialNumber, mpQty1);
      cartRobot.verifyMaterialQty(diffSellerMPMaterialNumber, mpQty1);
      cartRobot.verifyMaterialUnitPrice(
        diffSellerMPMaterialNumber,
        diffSellerMPMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        diffSellerMPMaterialNumber,
        mpTotal1.priceDisplay(currency),
      );
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.verifyMarketPlaceDeliveryInfo(sellers);
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(mpMaterialSeller);
      await checkoutRobot.verifyMaterial(mpMaterialNumber);
      checkoutRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      checkoutRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      await checkoutRobot.verifySellerName(diffSellerMPMaterialSeller);
      await checkoutRobot.verifyMaterial(diffSellerMPMaterialNumber);
      checkoutRobot.verifyMaterialQty(diffSellerMPMaterialNumber, mpQty1);
      checkoutRobot.verifyMaterialUnitPrice(
        diffSellerMPMaterialNumber,
        diffSellerMPMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        diffSellerMPMaterialNumber,
        mpTotal1.priceDisplay(currency),
      );
      await checkoutRobot.verifyZPSubTotalLabel(0.priceDisplay(currency));
      await checkoutRobot.verifyMPSubTotalLabel(totalPrice);
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      // Verify order success components
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyMarketPlaceOrderId(0, 2);
      await orderSuccessRobot.verifyMarketPlaceDeliveryInfo(sellers);
      await orderSuccessRobot.verifyZPSubTotal(0.priceDisplay(currency));
      await orderSuccessRobot.verifyMPSubTotal(totalPrice);
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(diffSellerMPMaterialSeller);
      await orderSuccessRobot.verifySellerName(mpMaterialSeller);
    });

    testWidgets('EZRX-1991 | Verify order with MP material from same seller',
        (tester) async {
      final mpQty = (mpMOV / mpMaterialPrice).ceil();
      const mpQty1 = 2;
      final mpTotal = mpMaterialPrice * mpQty;
      const mpTotal1 = sameSellerMPMaterialPrice * mpQty1;
      final totalPrice = (mpTotal + mpTotal1).priceDisplay(currency);
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Add MP materials in cart
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.autoSearch(sameSellerMPMaterialNumber);
      await productSuggestionRobot.tapSearchResult(sameSellerMPMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(2);
      await productDetailRobot.tapCartButton();
      // Verify MP materials in cart
      await cartRobot.verifySellerName(mpMaterialSeller);
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialDescription(mpMaterialNumber, mpMaterialName);
      await cartRobot.changeMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      cartRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      await cartRobot.verifyMaterial(sameSellerMPMaterialNumber);
      cartRobot.verifyMaterialDescription(
        sameSellerMPMaterialNumber,
        sameSellerMPMaterialName,
      );
      await cartRobot.changeMaterialQty(sameSellerMPMaterialNumber, mpQty1);
      cartRobot.verifyMaterialQty(sameSellerMPMaterialNumber, mpQty1);
      cartRobot.verifyMaterialUnitPrice(
        sameSellerMPMaterialNumber,
        sameSellerMPMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        sameSellerMPMaterialNumber,
        mpTotal1.priceDisplay(currency),
      );
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(mpMaterialSeller);
      await checkoutRobot.verifyMaterial(mpMaterialNumber);
      checkoutRobot.verifyMaterialQty(mpMaterialNumber, mpQty);
      checkoutRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotal.priceDisplay(currency),
      );
      await checkoutRobot.verifyMaterial(sameSellerMPMaterialNumber);
      checkoutRobot.verifyMaterialQty(sameSellerMPMaterialNumber, mpQty1);
      checkoutRobot.verifyMaterialUnitPrice(
        sameSellerMPMaterialNumber,
        sameSellerMPMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        sameSellerMPMaterialNumber,
        mpTotal1.priceDisplay(currency),
      );
      await checkoutRobot.verifyZPSubTotalLabel(0.priceDisplay(currency));
      await checkoutRobot.verifyMPSubTotalLabel(totalPrice);
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      // Verify order success components
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyMarketPlaceOrderId(0, 1);
      await orderSuccessRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await orderSuccessRobot.verifyZPSubTotal(0.priceDisplay(currency));
      await orderSuccessRobot.verifyMPSubTotal(totalPrice);
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(mpMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      await orderSuccessRobot.startVerifyMaterial(
        index: 1,
        isMarketPlace: true,
      );
    });

    testWidgets('EZRX-1999 | Verify order with OOS MP material',
        (tester) async {
      const mpMaterialPrice = 8000.0;
      const mpMaterialNumber = '23357280';
      final qty = (mpMOV / mpMaterialPrice).ceil();

      const oosMPMaterialNumber = '21041761';
      const oosMPMaterialPrice = 9;
      const oosMPMaterialSeller = 'MUNDIPHARMA PHARMACEUTICALS';
      const oosMPMaterialManufacture = 'GLAXOSMITHKLINE CONSUMER';
      const oosQty = 100;

      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Add MP materials in cart
      await productSuggestionRobot.autoSearch(oosMPMaterialNumber);
      await productSuggestionRobot.tapSearchResult(oosMPMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      // Add normal material because OOS material test data have price as 0
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.changeQty(qty);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      // Verify MP materials in cart

      await cartRobot.verifySellerName(oosMPMaterialSeller);
      await cartRobot.verifyMaterial(oosMPMaterialNumber);
      cartRobot.verifyMaterialOOSPreOrderStatus(oosMPMaterialNumber);
      await cartRobot.changeMaterialQty(oosMPMaterialNumber, oosQty);
      cartRobot.verifyMaterialQty(oosMPMaterialNumber, oosQty);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifyManufacturerLabel(
        oosMPMaterialManufacture,
        isMarketPlace: false,
      );
      oosPreOrderRobot.verifyMaterial(oosMPMaterialNumber, qty);
      await oosPreOrderRobot.tapContinueButton();
      // Verify checkout components
      await checkoutRobot.verifyMarketPlaceDeliveryInfo([oosMPMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(oosMPMaterialSeller);
      await checkoutRobot.verifyMaterial(oosMPMaterialNumber);
      checkoutRobot.verifyMaterialQty(oosMPMaterialNumber, qty);

      await checkoutRobot.verifyZPSubTotalLabel(
        (oosMPMaterialPrice * oosQty).priceDisplay(currency),
      );
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyMarketPlaceOrderId(1, 1);
      await orderSuccessRobot
          .verifyMarketPlaceDeliveryInfo([oosMPMaterialSeller]);
      await orderSuccessRobot.verifyZPSubTotal(
        (oosMPMaterialPrice * oosQty).priceDisplay(currency),
      );
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(oosMPMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(mpMaterialNumber);
    });

    testWidgets('EZRX-1998 | Verify order with MP bonus offer material',
        (tester) async {
      const qty = 1000;
      const bonusQty = qty ~/ bonusMPMaterialTierQty;
      final totalPrice = (bonusMPMaterialPrice * qty).priceDisplay(currency);

      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      // Add MP materials in cart
      await productSuggestionRobot.autoSearch(bonusMPMaterialNumber);
      await productSuggestionRobot.tapSearchResult(bonusMPMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();
      // Verify MP materials in cart
      await cartRobot.verifySellerName(bonusMPMaterialSeller);
      await cartRobot.verifyMaterial(bonusMPMaterialNumber);
      cartRobot.verifyMaterialNumber(bonusMPMaterialNumber);
      await cartRobot.changeMaterialQty(bonusMPMaterialNumber, qty);
      cartRobot.verifyMaterialQty(bonusMPMaterialNumber, qty);
      cartRobot.verifyMaterialOfferTag(bonusMPMaterialNumber);
      cartRobot.verifyMaterialUnitPrice(
        bonusMPMaterialNumber,
        bonusMPMaterialPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(bonusMPMaterialNumber, totalPrice);
      await cartRobot.verifyBonusMaterial(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      cartRobot.verifyBonusItemExpiryDateAndBatch(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      cartRobot.verifyBonusMaterialDescription(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        bonusMPMaterialName,
      );
      cartRobot.verifyBonusMaterialTag(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        bonusQty,
      );
      await cartRobot.increaseBonusMaterialQty(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        bonusQty,
      );
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot
          .verifyMarketPlaceDeliveryInfo([bonusMPMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(2);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(bonusMPMaterialSeller);
      await checkoutRobot.verifyMaterial(bonusMPMaterialNumber);
      checkoutRobot.verifyMaterialQty(bonusMPMaterialNumber, qty);
      checkoutRobot.verifyMaterialUnitPrice(
        bonusMPMaterialNumber,
        bonusMPMaterialPrice.priceDisplay(currency),
      );
      await checkoutRobot.verifyBonusMaterial(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialQty(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        bonusQty,
      );
      checkoutRobot.verifyBonusMaterialTag(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialFreeLabel(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
      );
      checkoutRobot.verifyBonusMaterialExpiryDateAndBatch(
        bonusMPMaterialNumber,
        bonusMPMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyMaterialTotalPrice(bonusMPMaterialNumber, totalPrice);
      await checkoutRobot.verifyZPSubTotalLabel(0.priceDisplay(currency));
      await checkoutRobot.verifyMPSubTotalLabel(totalPrice);
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      // Verify order success components
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyMarketPlaceOrderId(0, 1);
      await orderSuccessRobot
          .verifyMarketPlaceDeliveryInfo([bonusMPMaterialSeller]);
      await orderSuccessRobot.verifyZPSubTotal(0.priceDisplay(currency));
      await orderSuccessRobot.verifyMPSubTotal(totalPrice);
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(bonusMPMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(bonusMPMaterialNumber);
      orderSuccessRobot.verifyMaterialBonusTag(isVisible: false);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(bonusMPMaterialPrice.priceDisplay(currency));
      orderSuccessRobot.verifyMaterialTotalPrice(totalPrice);
      await orderSuccessRobot.startVerifyMaterial(
        index: 1,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(bonusMPMaterialNumber);
      orderSuccessRobot.verifyMaterialBonusTag();
      orderSuccessRobot.verifyItemQty(bonusQty);
      orderSuccessRobot.verifyMaterialUnitPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
      orderSuccessRobot.verifyMaterialTotalPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
    });

    testWidgets('EZRX-1996 | Verify order with MP material and ZP bundle',
        (tester) async {
      const zpBundleMaterialQty1 = 1;
      const zpBundleMaterialQty2 = zpBundleTier1Qty - zpBundleMaterialQty1;
      const zpTotalPrice = zpBundleTier1Qty * zpBundleTier1Price;
      final mpMaterialQty = (mpMOV / mpMaterialPrice).ceil();
      final mpTotalPrice = mpMaterialQty * mpMaterialPrice;
      final totalPrice = mpTotalPrice + zpTotalPrice;

      await pumpAppWithHomeScreen(tester);

      // Add ZP bundle to cart
      await browseProductFromEmptyCart();
      await productSuggestionRobot.autoSearch(zpBundleShortNumber);
      await productSuggestionRobot.tapSearchResult(zpBundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        zpBundleMaterialNumber1,
        zpBundleMaterialQty1,
      );
      await bundleDetailRobot.enterMaterialQty(
        zpBundleMaterialNumber2,
        zpBundleMaterialQty2,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      bundleDetailRobot.verifyCartButtonQty(2);
      await commonRobot.dismissSnackbar();
      await bundleDetailRobot.tapBackButton();
      // Add MP material to cart
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.changeQty(mpMaterialQty);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(3);
      await productDetailRobot.tapCartButton();
      // Verify cart components
      await cartRobot.verifyBundle(zpBundleNumber);
      cartRobot.verifyBundleQty(zpBundleNumber, zpBundleTier1Qty);
      await cartRobot.verifyBundleItem(zpBundleNumber, zpBundleMaterialNumber1);
      cartRobot.verifyBundleItemQty(
        zpBundleNumber,
        zpBundleMaterialNumber1,
        zpBundleMaterialQty1,
      );
      await cartRobot.verifyBundleItem(zpBundleNumber, zpBundleMaterialNumber2);
      cartRobot.verifyBundleItemQty(
        zpBundleNumber,
        zpBundleMaterialNumber2,
        zpBundleMaterialQty2,
      );
      cartRobot.verifyBundleTotalPrice(
        zpBundleNumber,
        zpTotalPrice.priceDisplay(currency),
      );
      await cartRobot.verifyMarketPlaceSection();
      await cartRobot.verifySellerName(mpMaterialSeller);
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialQty(mpMaterialNumber, mpMaterialQty);
      cartRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotalPrice.priceDisplay(currency),
      );
      // Verify price summary
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot
          .verifyZPSubTotalLabel(zpTotalPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyMPSubTotalLabel(mpTotalPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(totalPrice.priceDisplay(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(3);
      await checkoutRobot.verifyBundle(zpBundleNumber);
      await checkoutRobot.verifyBundleItem(
        zpBundleNumber,
        zpBundleMaterialNumber1,
      );
      checkoutRobot.verifyBundleItemQty(
        zpBundleNumber,
        zpBundleMaterialNumber1,
        zpBundleMaterialQty1,
      );
      await checkoutRobot.verifyBundleItem(
        zpBundleNumber,
        zpBundleMaterialNumber2,
      );
      checkoutRobot.verifyBundleItemQty(
        zpBundleNumber,
        zpBundleMaterialNumber2,
        zpBundleMaterialQty2,
      );
      checkoutRobot.verifyBundleTotalPrice(
        zpBundleNumber,
        zpTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyBundleTotalQty(zpBundleNumber, zpBundleTier1Qty);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifySellerName(mpMaterialSeller);
      await checkoutRobot.verifyMaterial(mpMaterialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        mpMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyMaterialQty(mpMaterialNumber, mpMaterialQty);
      checkoutRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpTotalPrice.priceDisplay(currency),
      );
      await checkoutRobot
          .verifyZPSubTotalLabel(zpTotalPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyMPSubTotalLabel(mpTotalPrice.priceDisplay(currency));
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(totalPrice.priceDisplay(currency));
      // Verify order success components
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyMarketPlaceOrderId(1, 1);
      await orderSuccessRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await orderSuccessRobot
          .verifyZPSubTotal(zpTotalPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyMPSubTotal(mpTotalPrice.priceDisplay(currency));
      await orderSuccessRobot.verifySubTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyGrandTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(3);
      await orderSuccessRobot.startVerifyBundle(zpBundleNumber);
      orderSuccessRobot.verifyBundleTotalQty(zpBundleTier1Qty);
      orderSuccessRobot
          .verifyBundleTotalPrice(zpTotalPrice.priceDisplay(currency));
      await orderSuccessRobot.startVerifyBundleItem(
        zpBundleNumber,
        zpBundleMaterialNumber1,
      );
      orderSuccessRobot.verifyItemQty(zpBundleMaterialQty1);
      await orderSuccessRobot.startVerifyBundleItem(
        zpBundleNumber,
        zpBundleMaterialNumber2,
      );
      orderSuccessRobot.verifyItemQty(zpBundleMaterialQty2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(mpMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(mpMaterialNumber);
      orderSuccessRobot.verifyItemQty(mpMaterialQty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(mpMaterialPrice.priceDisplay(currency));
      orderSuccessRobot
          .verifyMaterialTotalPrice(mpTotalPrice.priceDisplay(currency));
    });

    testWidgets('EZRX-1994 | Verify order with MP material and MP bundle',
        (tester) async {
      const mpBundleMaterialQty1 = 1;
      var mpBundleMaterialQty2 = mpBundleTier1Qty - mpBundleMaterialQty1;
      var mpBundleTotalPrice = mpBundleTier1Qty * mpBundleTier1Price;
      final mpMaterialQty = (mpMOV / mpMaterialPrice).ceil();
      final mpMaterialTotalPrice = mpMaterialQty * mpMaterialPrice;
      var totalPrice =
          (mpMaterialTotalPrice + mpBundleTotalPrice).priceDisplay(currency);

      await pumpAppWithHomeScreen(tester);

      // Add MP bundle to cart
      await browseProductFromEmptyCart();
      await productSuggestionRobot.autoSearch(mpBundleShortNumber);
      await productSuggestionRobot.tapSearchResult(mpBundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        mpBundleMaterialNumber1,
        mpBundleMaterialQty1,
      );
      await bundleDetailRobot.enterMaterialQty(
        mpBundleMaterialNumber2,
        mpBundleMaterialQty2,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      bundleDetailRobot.verifyCartButtonQty(2);
      await commonRobot.dismissSnackbar();
      await bundleDetailRobot.tapBackButton();
      // Add MP material to cart
      await productSuggestionRobot.autoSearch(mpMaterialNumber);
      await productSuggestionRobot.tapSearchResult(mpMaterialNumber);
      await productDetailRobot.changeQty(mpMaterialQty);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(3);
      await productDetailRobot.tapCartButton();
      // Verify cart components
      await cartRobot.verifyMarketPlaceSection();
      await cartRobot.verifyBundle(mpBundleNumber);
      cartRobot.verifyBundleMarketPlaceLogo(mpBundleNumber);
      cartRobot.verifyBundleQty(mpBundleNumber, mpBundleTier1Qty);
      await cartRobot.verifyBundleItem(mpBundleNumber, mpBundleMaterialNumber1);
      cartRobot.verifyBundleItemQty(
        mpBundleNumber,
        mpBundleMaterialNumber1,
        mpBundleMaterialQty1,
      );
      cartRobot.verifyBundleItemExpiryDateAndBatch(
        mpBundleNumber,
        mpBundleMaterialNumber1,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      await cartRobot.verifyBundleItem(mpBundleNumber, mpBundleMaterialNumber2);
      cartRobot.verifyBundleItemQty(
        mpBundleNumber,
        mpBundleMaterialNumber2,
        mpBundleMaterialQty2,
      );
      cartRobot.verifyBundleItemExpiryDateAndBatch(
        mpBundleNumber,
        mpBundleMaterialNumber2,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      cartRobot.verifyBundleTotalPrice(
        mpBundleNumber,
        mpBundleTotalPrice.priceDisplay(currency),
      );
      mpBundleMaterialQty2 = mpBundleTier2Qty - mpBundleMaterialQty1;
      mpBundleTotalPrice = mpBundleTier2Qty * mpBundleTier2Price;
      totalPrice =
          (mpMaterialTotalPrice + mpBundleTotalPrice).priceDisplay(currency);
      await cartRobot.changeBundleItemQty(
        mpBundleNumber,
        mpBundleMaterialNumber2,
        mpBundleMaterialQty2,
      );
      cartRobot.verifyBundleQty(mpBundleNumber, mpBundleTier2Qty);
      cartRobot.verifyBundleTotalPrice(
        mpBundleNumber,
        mpBundleTotalPrice.priceDisplay(currency),
      );
      await cartRobot.verifySellerName(mpMaterialSeller);
      await cartRobot.verifyMaterial(mpMaterialNumber);
      cartRobot.verifyMaterialQty(mpMaterialNumber, mpMaterialQty);
      cartRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpMaterialTotalPrice.priceDisplay(currency),
      );

      // Verify price summary
      cartRobot.verifyCartTotalPrice(totalPrice);
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifyZPSubTotalLabel(0.priceDisplay(currency));
      orderPriceSummaryRobot.verifyMPSubTotalLabel(totalPrice);
      orderPriceSummaryRobot.verifySubTotalLabel(totalPrice);
      orderPriceSummaryRobot.verifyGrandTotalLabel(totalPrice);
      await orderPriceSummaryRobot.tapCloseButton();
      // Verify checkout components
      await cartRobot.tapCheckoutButton();
      if (oosPreOrderRobot.isSheetVisible) {
        await oosPreOrderRobot.tapContinueButton();
      }
      await checkoutRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await checkoutRobot.verifyYoursItemLabel(3);
      await checkoutRobot.verifyMarketPlaceSection();
      await checkoutRobot.verifyBundle(mpBundleNumber);
      checkoutRobot.verifyBundleMarketPlaceLogo(mpBundleNumber);
      await checkoutRobot.verifyBundleItem(
        mpBundleNumber,
        mpBundleMaterialNumber1,
      );
      checkoutRobot.verifyBundleItemQty(
        mpBundleNumber,
        mpBundleMaterialNumber1,
        mpBundleMaterialQty1,
      );
      checkoutRobot.verifyBundleItemExpiryDateAndBatch(
        mpBundleNumber,
        mpBundleMaterialNumber1,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      await checkoutRobot.verifyBundleItem(
        mpBundleNumber,
        mpBundleMaterialNumber2,
      );
      checkoutRobot.verifyBundleItemQty(
        mpBundleNumber,
        mpBundleMaterialNumber2,
        mpBundleMaterialQty2,
      );
      checkoutRobot.verifyBundleItemExpiryDateAndBatch(
        mpBundleNumber,
        mpBundleMaterialNumber2,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyBundleTotalPrice(
        mpBundleNumber,
        mpBundleTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyBundleTotalQty(mpBundleNumber, mpBundleTier2Qty);
      await checkoutRobot.verifySellerName(mpMaterialSeller);
      await checkoutRobot.verifyMaterial(mpMaterialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        mpMaterialNumber,
        StockInfo.empty(),
        isBatchNumberVisible: false,
      );
      checkoutRobot.verifyMaterialQty(mpMaterialNumber, mpMaterialQty);
      checkoutRobot.verifyMaterialUnitPrice(
        mpMaterialNumber,
        mpMaterialPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        mpMaterialNumber,
        mpMaterialTotalPrice.priceDisplay(currency),
      );
      await checkoutRobot.verifyZPSubTotalLabel(0.priceDisplay(currency));
      await checkoutRobot.verifyMPSubTotalLabel(totalPrice);
      await checkoutRobot.verifySubTotalLabel(totalPrice);
      await checkoutRobot.verifyGrandTotalLabel(totalPrice);
      // Verify order success components
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyMarketPlaceOrderId(0, 1);
      await orderSuccessRobot.verifyMarketPlaceDeliveryInfo([mpMaterialSeller]);
      await orderSuccessRobot.verifyZPSubTotal(0.priceDisplay(currency));
      await orderSuccessRobot.verifyMPSubTotal(totalPrice);
      await orderSuccessRobot.verifySubTotal(totalPrice);
      await orderSuccessRobot.verifyGrandTotal(totalPrice);
      await orderSuccessRobot.verifyOrderItemTotalQty(3);
      await orderSuccessRobot.startVerifyBundle(mpBundleNumber);
      orderSuccessRobot.verifyBundleMarketPlaceLogo();
      orderSuccessRobot.verifyBundleTotalQty(mpBundleTier2Qty);
      orderSuccessRobot
          .verifyBundleTotalPrice(mpBundleTotalPrice.priceDisplay(currency));
      await orderSuccessRobot.startVerifyBundleItem(
        mpBundleNumber,
        mpBundleMaterialNumber1,
      );
      orderSuccessRobot.verifyItemQty(mpBundleMaterialQty1);
      await orderSuccessRobot.startVerifyBundleItem(
        mpBundleNumber,
        mpBundleMaterialNumber2,
      );
      orderSuccessRobot.verifyItemQty(mpBundleMaterialQty2);
      await orderSuccessRobot.verifyMarketPlaceSection();
      await orderSuccessRobot.verifySellerName(mpMaterialSeller);
      await orderSuccessRobot.startVerifyMaterial(
        index: 0,
        isMarketPlace: true,
      );
      orderSuccessRobot.verifyMaterialNumber(mpMaterialNumber);
      orderSuccessRobot.verifyItemQty(mpMaterialQty);
      orderSuccessRobot
          .verifyMaterialUnitPrice(mpMaterialPrice.priceDisplay(currency));
      orderSuccessRobot.verifyMaterialTotalPrice(
        mpMaterialTotalPrice.priceDisplay(currency),
      );
    });
  });

  group('Order history -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 2));
    final toDate = DateTime.now();

    group('View by item -', () {
      testWidgets(
        'EZRX-T1986 | Verify search and filter MP item',
            (tester) async {
          final statusesFilter = [
            'Order created',
            'Picking in progress',
            'Pending release',
          ];

          await pumpAppWithHomeScreen(tester);

          await homeRobot.navigateToScreen(NavigationTab.orders);
          ordersRootRobot.verifyViewByItemsPage();
          ordersRootRobot.verifyFilterApplied(0);
          // Verify filter ZP order
          await ordersRootRobot.tapFilterButton();
          viewByItemsFilterRobot.verifyDefaultFilterApplied();
          viewByItemsFilterRobot.verifyOrderTypeFilter();
          await viewByItemsFilterRobot.tapOrderTypeFilter('ZP items');
          await viewByItemsFilterRobot.tapApplyButton();
          ordersRootRobot.verifyFilterApplied(0);
          viewByItemsRobot.verifyMarketPlaceLogo(isVisible: false);
          await commonRobot.searchWithSearchIcon(mpMaterialNumber);
          viewByItemsRobot.verifyNoRecordFound();
          await commonRobot.autoSearch(mpMaterialName);
          viewByItemsRobot.verifyNoRecordFound();
          await commonRobot.searchWithKeyboardAction(mpMaterialSeller);
          viewByItemsRobot.verifyNoRecordFound();
          await commonRobot.tapClearSearch();
          // Verify filter MP order
          await ordersRootRobot.tapFilterButton();
          await viewByItemsFilterRobot.tapOrderTypeFilter('MP items');
          await viewByItemsFilterRobot.tapApplyButton();
          viewByItemsRobot.verifyMarketPlaceLogo(isVisible: true);
          await commonRobot.searchWithSearchIcon(mpMaterialNumber);
          viewByItemsRobot.verifyOrdersWithProductCode(mpMaterialNumber);
          await commonRobot.autoSearch(mpMaterialName);
          viewByItemsRobot.verifyOrdersWithProductName(mpMaterialName);
          await commonRobot.searchWithKeyboardAction(mpMaterialSeller);
          viewByItemsRobot.verifyOrderGroups();
          await commonRobot.tapClearSearch();
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
          for (final status in statusesFilter) {
            await viewByItemsFilterRobot.tapStatusCheckbox(status);
          }
          await viewByItemsFilterRobot.tapApplyButton();
          ordersRootRobot.verifyFilterApplied(2);
          viewByItemsRobot.verifyOrderWithStatus(statusesFilter);
          // Verify filter not visible in non-marketplace
          await commonRobot.changeDeliveryAddress(nonMPShipToCode);
          await ordersRootRobot.tapFilterButton();
          viewByItemsFilterRobot.verifyOrderTypeFilter(isVisible: false);
        },
      );

      testWidgets('EZRX-T1987 | Verify MP material + buy again in item detail',
          (tester) async {
        const qty = 1000;
        await pumpAppWithHomeScreen(tester);

        await placeOrderWithMaterial(mpMaterialNumber, qty);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await commonRobot.pullToRefresh();
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.tapOrderNumber();
        viewByOrdersDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByOrdersDetailRobot.tapToBackScreen();
        await viewByItemsDetailRobot.verifyManufacturerName(
          mpMaterialSeller,
          isVisible: false,
        );
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(mpMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByItemsDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(mpMaterialNumber);
        cartRobot.verifyMaterialQty(mpMaterialNumber, qty);
      });

      testWidgets(
          'EZRX-T1987 | Verify MP material with bonus offer + buy again in item detail',
          (tester) async {
        const qty = 1000;
        const bonusQty = qty ~/ bonusMPMaterialTierQty;
        await pumpAppWithHomeScreen(tester);

        await placeOrderWithMaterial(bonusMPMaterialNumber, qty);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await commonRobot.pullToRefresh();
        //Verify offer material
        viewByItemsRobot.verifyOfferTag();
        await viewByItemsRobot.tapFirstOfferTag();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.verifyManufacturerName(
          mpMaterialSeller,
          isVisible: false,
        );
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyOfferTag();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMPMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByItemsDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        // Verify bonus material
        await viewByItemsDetailRobot.tapToBackScreen();
        viewByItemsRobot.verifyBonusLabel();
        await viewByItemsRobot.tapFirstBonusLabel();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.verifyManufacturerName(
          mpMaterialSeller,
          isVisible: false,
        );
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyBonusLabel();
        viewByItemsDetailRobot.verifyFreePrice();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMPMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty, isBonus: true);
        // Verify buy again
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMPMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMPMaterialNumber, qty);
        await cartRobot.verifyBonusMaterial(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
          bonusQty,
        );
      });

      testWidgets('EZRX-T1987 | Verify MP bundle + buy again in item detail',
          (tester) async {
        const bundleMaterialQty1 = 1;
        const bundleMaterialQty2 = mpBundleTier1Qty - bundleMaterialQty1;

        await pumpAppWithHomeScreen(tester);
        await placeOrderWithBundle(mpBundleShortNumber, {
          mpBundleMaterialNumber1: bundleMaterialQty1,
          mpBundleMaterialNumber2: bundleMaterialQty2,
        });
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await commonRobot.pullToRefresh();
        await viewByItemsRobot
            .tapFirstOrderWithMaterial(mpBundleMaterialNumber1);
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.verifyManufacturerName(
          mpMaterialSeller,
          isVisible: false,
        );
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyBundleTag();
        viewByItemsDetailRobot.verifyMaterialNumber(mpBundleMaterialNumber1);
        viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemBundleTag();
        viewByItemsDetailRobot.verifyOtherItemQty(bundleMaterialQty2);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(mpBundleMaterialNumber1);
        cartRobot.verifyMaterialQty(
          mpBundleMaterialNumber1,
          bundleMaterialQty1,
        );
      });
    });

    group('View by order -', () {
      testWidgets('EZRX-T1988 | Verify search and filter MP order',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await homeRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyOrderTypeFilter();
        await viewByOrdersFilterRobot.tapOrderTypeFilter('ZP orders');
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyMarketPlaceLogo(isVisible: false);
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapOrderTypeFilter('MP orders');
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyMarketPlaceLogo(isVisible: true);
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await commonRobot.changeDeliveryAddress(nonMPShipToCode);
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyOrderTypeFilter(isVisible: false);
      });

      testWidgets('EZRX-T1989 | Verify MP material + buy again in order detail',
          (tester) async {
        const qty = 1000;
        final totalPrice = (qty * mpMaterialPrice).priceDisplay(currency);
        await pumpAppWithHomeScreen(tester);

        await placeOrderWithMaterial(mpMaterialNumber, qty);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        // Verify buy again from order tab
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        await cartRobot.verifyMaterial(mpMaterialNumber);
        cartRobot.verifyMaterialQty(mpMaterialNumber, qty);
        await cartRobot.tapCloseButton();
        // Verify order detail
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot.verifySubTotal(totalPrice);
        viewByOrdersDetailRobot.verifyGrandTotal(totalPrice);
        await viewByOrdersDetailRobot.startVerifyMaterial(mpMaterialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(totalPrice);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByOrdersDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        await viewByOrdersDetailRobot.tapVerifyingItem();
        // Verify navigate to item detail
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(mpMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        //viewByItemsDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        await viewByItemsDetailRobot.tapToBackScreen();
        // Verify buy again from order detail
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        await cartRobot.verifyMaterial(mpMaterialNumber);
        cartRobot.verifyMaterialQty(mpMaterialNumber, qty * 2);
      });

      testWidgets(
          'EZRX-T1989 | Verify MP material with bonus offer + buy again in order detail',
          (tester) async {
        const qty = 1000;
        const bonusQty = qty ~/ bonusMPMaterialTierQty;
        final totalPrice = (bonusMPMaterialPrice * 1000).priceDisplay(currency);

        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await placeOrderWithMaterial(bonusMPMaterialNumber, qty);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        // Verify buy again from order tab
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        await cartRobot.verifyMaterial(bonusMPMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMPMaterialNumber, qty);
        await cartRobot.verifyBonusMaterial(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
          bonusQty,
        );
        await cartRobot.tapCloseButton();
        // Verify order detail
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot
            .verifyMarketPlaceLogoWithSeller(bonusMPMaterialSeller);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot.verifySubTotal(totalPrice);
        viewByOrdersDetailRobot.verifyGrandTotal(totalPrice);
        await viewByOrdersDetailRobot
            .startVerifyMaterial(bonusMPMaterialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyOfferTag();
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByOrdersDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(totalPrice);
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(bonusMPMaterialSeller);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMPMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyMaterial(
          bonusMPMaterialNumber,
          isBonus: true,
        );
        viewByOrdersDetailRobot.verifyQty(bonusQty);
        viewByOrdersDetailRobot.verifyBonusTag();
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByOrdersDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(
          0.priceDisplay(currency),
          isFree: true,
        );
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(bonusMPMaterialSeller);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMPMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty, isBonus: true);
        viewByItemsDetailRobot.verifyBonusLabel();
        await viewByItemsDetailRobot.tapToBackScreen();
        // Verify buy again from order detail
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        await cartRobot.verifyMaterial(bonusMPMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMPMaterialNumber, qty * 2);
        await cartRobot.verifyBonusMaterial(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMPMaterialNumber,
          bonusMPMaterialNumber,
          (qty * 2) ~/ bonusMPMaterialTierQty,
        );
      });

      testWidgets('EZRX-T1989 | Verify MP bundle + buy again in order detail',
          (tester) async {
        const bundleMaterialQty1 = 1;
        const bundleMaterialQty2 = mpBundleTier1Qty - bundleMaterialQty1;
        const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
        final bundleTotalPrice =
            (bundleTotalQty * mpBundleTier1Price).priceDisplay(currency);

        //init app
        await pumpAppWithHomeScreen(tester);
        await placeOrderWithBundle(mpBundleShortNumber, {
          mpBundleMaterialNumber1: bundleMaterialQty1,
          mpBundleMaterialNumber2: bundleMaterialQty2,
        });
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        // Verify buy again from order tab
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        await cartRobot.verifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber1,
        );
        cartRobot.verifyBundleItemQty(
          mpBundleNumber,
          mpBundleMaterialNumber1,
          bundleMaterialQty1,
        );
        await cartRobot.verifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber2,
        );
        cartRobot.verifyBundleItemQty(
          mpBundleNumber,
          mpBundleMaterialNumber2,
          bundleMaterialQty2,
        );
        await cartRobot.tapCloseButton();
        // Verify order detail
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot.verifySubTotal(bundleTotalPrice);
        viewByOrdersDetailRobot.verifyGrandTotal(bundleTotalPrice);
        await viewByOrdersDetailRobot.startVerifyBundle(mpBundleNumber);
        viewByOrdersDetailRobot.verifyBundleRate(
          mpBundleTier1Qty,
          mpBundleTier1Price.priceDisplay(currency),
        );
        viewByOrdersDetailRobot.verifyBundleTotalQty(bundleTotalQty);
        viewByOrdersDetailRobot.verifyBundleTotalPrice(bundleTotalPrice);
        await viewByOrdersDetailRobot.startVerifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber1,
        );
        viewByOrdersDetailRobot.verifyQty(bundleMaterialQty1);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByOrdersDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        viewByItemsDetailRobot
            .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(mpBundleMaterialNumber1);
        viewByItemsDetailRobot.verifyQty(bundleMaterialQty1);
        viewByItemsDetailRobot.verifyBundleTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber2,
        );
        viewByOrdersDetailRobot.verifyQty(bundleMaterialQty2);
        //TODO Martin blocked by https://zuelligpharma.atlassian.net/browse/EZRX-26134
        // viewByOrdersDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
        // Verify buy again from order detail
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber1,
        );
        cartRobot.verifyBundleItemQty(
          mpBundleNumber,
          mpBundleMaterialNumber1,
          bundleMaterialQty1 * 2,
        );
        await cartRobot.verifyBundleItem(
          mpBundleNumber,
          mpBundleMaterialNumber2,
        );
        cartRobot.verifyBundleItemQty(
          mpBundleNumber,
          mpBundleMaterialNumber2,
          bundleMaterialQty2 * 2,
        );
      });
    });
  });
}
