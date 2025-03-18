import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/explore_marketplace_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class HomeRobot extends CommonRobot {
  HomeRobot(super.tester);

  final miniCart = find.byType(CartButton);
  final quickAccessMenu = find.byType(QuickAccessMenuPanel);
  final banner = find.byType(CarouselBanner);
  final browseProductIcon = find.byKey(WidgetKeys.browseProductIcon);
  final announcementIcon = find.byKey(WidgetKeys.announcementIcon);
  final buttonNextBanner = find.byKey(WidgetKeys.nextBannerIcon);
  final buttonPreviousBanner = find.byKey(WidgetKeys.previousBannerIcon);
  final recentlyOrder = find.byKey(WidgetKeys.recentlyOrder);
  final productsOnOffer = find.byKey(WidgetKeys.productsOnOffer);
  final bundles = find.byKey(WidgetKeys.bundles);
  final iconArrow = find.byKey(WidgetKeys.iconArrow);
  final listViewHomeScreen = find.byType(SingleChildScrollView).last;
  final homeQuickAccessOrders =
      find.byKey(WidgetKeys.homeQuickAccessOrdersMenu);
  final homeQuickAccessReturns =
      find.byKey(WidgetKeys.homeQuickAccessReturnsMenu);
  final homeQuickAccessPayments =
      find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
  final homeQuickAccessChatSupport =
      find.byKey(WidgetKeys.homeQuickAccessChatSupportMenu);

  final productsOnOfferList = find.byKey(WidgetKeys.productOnOffer);
  final bundlesTag = find.text('Bundle offer');
  final bundlesNumberID = find.byKey(WidgetKeys.bundlesNumber);
  final bundlesDescription = find.byKey(WidgetKeys.bundlesDescription);
  final bundlesManufactured = find.byKey(WidgetKeys.bundlesManufactured);
  final bundlesItem = find.byKey(WidgetKeys.materialListBundleCard);
  final recentlyOrderedList = find.byKey(WidgetKeys.listRecentlyOrdered);
  final browseProductsList = find.byKey(WidgetKeys.browseProductsList);
  final announcementsList = find.byKey(WidgetKeys.announcementItemDateKey);
  final productImage = find.byKey(WidgetKeys.productImage);
  final productStockLabel = find.byKey(WidgetKeys.materialListStockLabel);
  final productDescription = find.byKey(WidgetKeys.nameCart);
  final productManufactured = find.byKey(WidgetKeys.manufacturerMaterials);
  final productPrice = find.byKey(WidgetKeys.priceComponent);
  final govtMaterialListPrice = find.byKey(WidgetKeys.govtMaterialListPrice);
  final productNumber = find.byKey(WidgetKeys.materialNumberText);
  final productFavoriteIcon = find.byKey(WidgetKeys.favoritesIcon);
  final searchByProductField = find.byKey(WidgetKeys.searchProductField);
  final homeBanner = find.byKey(WidgetKeys.homeBanner);
  final customerCodeSelectShipTo =
      find.byKey(WidgetKeys.customerCodeSelectShipTo);
  final comboOffer = find.byKey(WidgetKeys.combodealsBody);
  final exploreComboDeal = find.byKey(WidgetKeys.exploreComboDealsButtton);
  final exploreMarketPlaceBanner = find.byType(ExploreMarketPlaceBanner);
  final exploreMarketPlaceButton =
      find.byKey(WidgetKeys.exploreMarketPlaceButton);
  final marketplaceLogo = find.byType(MarketPlaceLogo);
  final marketplacePaymentQuickAccess =
      find.byKey(WidgetKeys.homeQuickAccessMPPaymentsMenu);

  void verify() {
    expect(homeTab, findsOneWidget);
  }

  void verifyEdiCustomer() {
    final ediUserBannerFinder = find.byKey(WidgetKeys.ediUserBanner);
    final title = 'You are an EDI customer.'.tr();
    final subTitle =
        'Ordering is disabled on eZRx+, please place your orders through the EDI system only.'
            .tr();
    expect(
      find.descendant(
        of: ediUserBannerFinder,
        matching: find.text(title),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: ediUserBannerFinder,
        matching: find.text(subTitle),
      ),
      findsOneWidget,
    );
  }

  void findQuickAccessMenu() {
    expect(quickAccessMenu, findsOneWidget);
  }

  void findBannerInHomeScreen() {
    expect(banner, findsOneWidget);
  }

  Future<void> findBrowseProductsIcon() async {
    await scrollEnsureFinderVisible(browseProductIcon);
    expect(browseProductIcon, findsOneWidget);
  }

  Future<void> tapBrowseProductsIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Browse products'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  void findMiniCartIcon() {
    expect(miniCart, findsOneWidget);
  }

  Future<void> findAnnouncementsIcon() async {
    await scrollEnsureFinderVisible(announcementIcon);
    expect(announcementIcon, findsOneWidget);
  }

  Future<void> tapAnnouncementsIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Announcements'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  void findNextBanner() {
    expect(buttonNextBanner, findsOneWidget);
  }

  Future<void> tapNextBanner() async {
    await tester.tap(buttonNextBanner);
    await tester.pump();
  }

  void findPreviousBanner() {
    expect(buttonPreviousBanner, findsOneWidget);
  }

  Future<void> tapPreviousBanner() async {
    await tester.tap(buttonPreviousBanner);
    await tester.pump();
  }

  Future<void> findRecentlyOrderIcon() async {
    await scrollEnsureFinderVisible(recentlyOrder);
    expect(recentlyOrder, findsOneWidget);
  }

  Future<void> tapRecentlyOrderIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Your recent order items'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  void verifyMarketPlaceIcon() => expect(
        find.descendant(of: recentlyOrderedList, matching: marketplaceLogo),
        findsWidgets,
      );

  Future<void> tapFirstMarketPlaceIcon() async {
    await tester.tap(
      find.descendant(of: recentlyOrderedList.first, matching: marketplaceLogo),
    );
    await tester.pumpAndSettle();
  }

  void findProductsOnOffer() {
    expect(productsOnOffer, findsOneWidget);
  }

  Future<void> tapProductsOnOfferIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Products on offer'.tr()));
    await scrollEnsureFinderVisible(iconArrow);
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  Future<void> findBundles() async {
    await tester.pumpUntilVisible(bundles);
    expect(bundles, findsOneWidget);
  }

  Future<void> tapBundlesIcon() async {
    final iconArrow = find.byKey(WidgetKeys.sectionTileIcon('Bundles'.tr()));
    await scrollEnsureFinderVisible(iconArrow);
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  Future<void> slideNextBanner() async {
    final imageBanner = find.byKey(WidgetKeys.imageBanner).first;
    await tester.drag(imageBanner, const Offset(-400, 100));
    await tester.pump();
  }

  Future<void> slidePreviousBanner() async {
    final imageBanner = find.byKey(WidgetKeys.imageBanner).first;
    await tester.drag(imageBanner, const Offset(400, 100));
    await tester.pump();
  }

  bool get isBannerEmpty => homeBanner.evaluate().isEmpty;

  void verifyHomeBanner({bool isVisible = true}) {
    expect(homeBanner, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyFirstBannerIsDisplay() {
    final listPosition = tester.widget<PageView>(homeBanner);
    expect((listPosition.controller?.page ?? -1) >= 0, true);
  }

  void findQuickAccessOrders() {
    expect(homeQuickAccessOrders, findsOneWidget);
  }

  Future<void> tapOrdersQuickAccess() async {
    await tester.tap(homeQuickAccessOrders);
    await tester.pumpAndSettle();
  }

  void findQuickAccessReturns({bool isVisible = true}) {
    expect(homeQuickAccessReturns, isVisible ? findsOneWidget : findsNothing);
  }

  void findQuickAccessPayments({bool isVisible = true}) {
    expect(homeQuickAccessPayments, isVisible ? findsOneWidget : findsNothing);
  }

  void findQuickAccessChatSupport() {
    expect(homeQuickAccessChatSupport, findsOneWidget);
  }

  Future<void> tapChatSupportQuickAccess() async {
    await tester.tap(homeQuickAccessChatSupport);
    await tester.pumpAndSettle();
  }

  Future<void> tapReturnsQuickAccess() async {
    await tester.tap(homeQuickAccessReturns);
    await tester.pumpAndSettle();
    await closeAnnouncementAlertDialog();
  }

  Future<void> tapPaymentQuickAccess() async {
    await tester.tap(homeQuickAccessPayments);
    await tester.pumpAndSettle();
    await closeAnnouncementAlertDialog();
  }

  Future<void> slideToNextProductsOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.drag(productsOnOffer, const Offset(-380, 100));
    await tester.pump();
  }

  Future<void> slideToPreviousProductsOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.drag(productsOnOffer, const Offset(380, 100));
    await tester.pump();
  }

  void verifyDisplayProductsWithOfferTag() {
    final offerTag = find.byKey(WidgetKeys.offerTag);
    expect(offerTag, findsWidgets);
  }

  Future<void> tapOnFirstProductOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.ensureVisible(productsOnOffer);
    await tester.tap(productsOnOffer);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstBundle() async {
    final firstBundle = bundlesItem.first;
    await scrollEnsureFinderVisible(firstBundle);
    await tester.tap(firstBundle);
    await tester.pumpAndSettle();
  }

  void verifyDisplayBundlesTag() {
    expect(bundlesTag, findsWidgets);
  }

  Future<void> verifyDisplayBundlesNumber() async {
    await scrollEnsureFinderVisible(bundlesNumberID.first);
    expect(bundlesNumberID, findsWidgets);
  }

  void verifyDisplayBundlesDescription() {
    expect(bundlesDescription, findsWidgets);
  }

  void verifyDisplayBundlesManufactured() {
    expect(bundlesManufactured, findsWidgets);
  }

  Future<void> slideBundle({bool reversed = true}) async {
    await tester.drag(bundlesItem.first, Offset(reversed ? 150 : -150, 150));
    await tester.pump();
  }

  Future<void> slideToNextRecentlyOrdered() async {
    final ordered = recentlyOrderedList.first;
    await tester.drag(ordered, const Offset(-1000, 150));
    await tester.pump();
  }

  bool checkBrowseProductsEnoughItemToScroll() {
    return browseProductsList.evaluate().length > 3;
  }

  Future<void> slideToNextBrowseProducts() async {
    final browse = browseProductsList.first;
    await tester.drag(browse, const Offset(-500, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousRecentlyOrdered() async {
    final ordered = recentlyOrderedList.at(1);
    await tester.drag(ordered, const Offset(1000, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousBrowseProducts() async {
    final browse = browseProductsList.at(1);
    await tester.drag(browse, const Offset(500, 150));
    await tester.pump();
  }

  String? getFirstAnnouncementInfo() {
    final titleAnnouncement = find.byKey(WidgetKeys.announcementTitle);
    final info = tester.widgetList<Text>(titleAnnouncement).first;
    return info.data;
  }

  Future<void> tapOnFirstRecentlyOrdered() async {
    final firstOrdered = recentlyOrderedList.first;
    await tester.tap(firstOrdered);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstBrowseProduct() async {
    final firstProduct = browseProductsList.first;
    await tester.tap(firstProduct);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstAnnouncement() async {
    final firstAnnouncement = announcementsList.first;
    await tester.tap(firstAnnouncement);
    await tester.pumpAndSettle();
  }

  void findSearchProductField() {
    expect(searchByProductField, findsOneWidget);
  }

  Future<void> tapSearchProductField() async {
    await tester.tap(searchByProductField);
    await tester.pumpAndSettle();
  }

  void verifyNotFoundWidgetByText(String textInfo) {
    final text = find.text(textInfo);
    expect(text.hitTestable(), findsNothing);
  }

  void verifyFoundWidgetByText(String textInfo) {
    final text = find.text(textInfo);
    expect(text.hitTestable(), findsOneWidget);
  }

  void findProductImage() {
    expect(productImage, findsWidgets);
  }

  void findProductDescription() {
    expect(productDescription, findsWidgets);
  }

  void findProductManufactured() {
    expect(productManufactured, findsWidgets);
  }

  void findProductPrice() {
    expect(productPrice, findsWidgets);
  }

  void findGovtMaterialListPrice() {
    expect(govtMaterialListPrice, findsWidgets);
  }

  void findProductFavouriteIcon() {
    expect(productFavoriteIcon, findsWidgets);
  }

  void verifyProductNumber() {
    expect(productNumber, findsWidgets);
  }

  Future<void> tapMiniCartIcon() async {
    await tester.tap(miniCart);
    await tester.pumpAndSettle();
  }

  String getFirstBundleInfo() {
    final materialNumber = find.byKey(WidgetKeys.bundlesNumber);
    final info = tester.widgetList<Text>(materialNumber).first;
    return info.data ?? '';
  }

  String getFirstBrowseProductInfo() {
    final materialNumber = find.byKey(WidgetKeys.materialNumberText);
    final info = tester.widgetList<Text>(materialNumber).first;
    return info.data ?? '';
  }

  void verifyExploreMarketPlaceBanner({bool isVisible = true}) {
    if (isVisible) {
      expect(exploreMarketPlaceBanner, findsOneWidget);
      expect(exploreMarketPlaceButton, findsOneWidget);
    } else {
      expect(exploreMarketPlaceBanner, findsNothing);
    }
  }

  Future<void> tapExploreMarketPlaceButton() async {
    await tester.tap(exploreMarketPlaceButton);
    await tester.pumpAndSettle();
  }

  Future<bool> isCustomerCodeNotSelected(String shipToCode) async {
    await tester.pumpUntilVisible(customerCodeSelectShipTo);
    return tester.widget<Text>(customerCodeSelectShipTo).data != shipToCode;
  }

  void findComboOffer() {
    expect(productsOnOffer, findsOneWidget);
  }

  Future<void> tapExploreComboDeal() async {
    expect(exploreComboDeal, findsOneWidget);
    await tester.tap(exploreComboDeal);
    await tester.pumpAndSettle();
  }

  void verifyMarketPlacePaymentQuickAccess({bool isVisible = true}) => expect(
        marketplacePaymentQuickAccess,
        isVisible ? findsOne : findsNothing,
      );

  Future<void> tapMarketPlacePaymentQuickAccess() async {
    await tester.tap(marketplacePaymentQuickAccess);
    await tester.pumpAndSettle();
  }
}
