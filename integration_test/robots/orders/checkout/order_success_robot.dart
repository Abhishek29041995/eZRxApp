import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class OrderSuccessRobot extends CommonRobot {
  OrderSuccessRobot(super.tester);

  late Finder _verifyingItem;
  final orderIdText = find.byKey(WidgetKeys.orderSuccessOrderId);
  final zpOrderIdSection = find.byKey(WidgetKeys.orderSuccessZPOrderNumbers);
  final mpOrderIdSection = find.byKey(WidgetKeys.orderSuccessMPOrderNumbers);
  final orderItem = find.byType(CommonTileItem);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.orderSuccess), findsOneWidget);
  }

  void verifyPoReference(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('PO reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyReferenceNote(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Reference note'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyDeliveryInstruction(String text) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Delivery instructions'.tr(), text),
      ),
      findsOneWidget,
    );
  }

  void verifyMobileNumber(String text) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Contact number'.tr(), text),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
          )
          .data,
      contains(customerCode),
    );
  }

  void verifyDeliveryTo(String shipToCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
          )
          .data,
      contains(shipToCode),
    );
  }

  void verifyOrderAddress(String address) {
    expect(
      tester
          .widget<RichText>(
            find.byKey(WidgetKeys.addressInfoSectionActionLabel),
          )
          .text
          .toPlainText(),
      contains(address),
    );
  }

  Future<void> verifyOrderSubmittedMessage() async =>
      await verifyCustomSnackBar(message: 'Order submitted'.tr());

  void verifyOrderDate() {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow(
          'Order Date'.tr(),
          DateTimeStringValue(DateTime.now().toIso8601String()).dateString,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderId() {
    expect(orderIdText, findsOneWidget);
  }

  void verifyMarketPlaceOrderId(int zpOrderCount, int mpOrderCount) {
    expect(
      find.descendant(of: zpOrderIdSection, matching: orderIdText),
      findsNWidgets(zpOrderCount),
    );
    expect(
      find.descendant(of: mpOrderIdSection, matching: orderIdText),
      findsNWidgets(mpOrderCount),
    );
  }

  Future<void> tapFirstZPOrderId() async {
    await tester.tap(
      find.descendant(of: zpOrderIdSection, matching: orderIdText).first,
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstMPOrderId() async {
    await tester.tap(
      find.descendant(of: mpOrderIdSection, matching: orderIdText).first,
    );
    await tester.pumpAndSettle();
  }

  Future<void> verifyMarketPlaceDeliveryInfo(List<String> sellers) async {
    final widget = find.byType(MarketPlaceDeliveryExpansionTile);
    await scrollEnsureFinderVisible(widget);
    expect(widget, findsOne);
    for (final text in sellers) {
      await verifySellerNameText(text, widget);
    }
  }

  Future<void> verifyOrderSummarySection() => scrollEnsureFinderVisible(
        find.byKey(WidgetKeys.orderSuccessOrderSummarySection),
      );

  Future<void> verifyMPSubTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummaryMPSubTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyZPSubTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummaryZPSubTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifySubTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyGrandTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.text(price, findRichText: true),
        ),
      );
  Future<void> verifyTax(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSummaryTax),
          matching: find.text(price, findRichText: true),
        ),
      );
  Future<void> verifySmallOrderFee(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.smallOrderFeePrice),
          matching: find.text(price, findRichText: true),
        ),
      );
  Future<void> verifyTotalSaving(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSummaryTotalSaving),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyOrderItemTotalQty(int qty) async {
    final label = find.byKey(WidgetKeys.orderSuccessItemTotalQty);
    await scrollEnsureFinderVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  Future<void> verifyMarketPlaceSection() async {
    final sectionTitle = find.byKey(WidgetKeys.cartMPProductSectionLabel);
    await scrollEnsureFinderVisible(sectionTitle);
    expect(sectionTitle, findsOne);
  }

  Future<void> verifySellerName(String text) => verifySellerNameText(
        text,
        find.byKey(WidgetKeys.orderSuccessMPItemsSection),
      );

  Future<void> startVerifyMaterial({
    required int index,
    bool isMarketPlace = false,
  }) async {
    final materialSection = find.byKey(
      isMarketPlace
          ? WidgetKeys.orderSuccessMPItemsSection
          : WidgetKeys.orderSuccessZPItemsSection,
    );
    await scrollEnsureFinderVisible(materialSection);
    final material =
        find.descendant(of: materialSection, matching: _material(index));
    await scrollEnsureFinderVisible(material);
    _verifyingItem = material;
  }

  void verifyMaterialNumber(
    String materialNumber, {
    String? govermentMaterialCode,
  }) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.commonTileItemLabel),
    );
    var materialCode = materialNumber;
    if (govermentMaterialCode != null) {
      materialCode = '$materialNumber | $govermentMaterialCode';
    }
    expect(tester.widget<Text>(label).data, equals(materialCode));
  }

  void verifyMateriaDescription(String text) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.commonTileItemTitle),
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyItemQty(int qty) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemProductQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyMaterialUnitPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: orderItem.at(_getMaterialIndex(isBonus: isFree)),
      matching: find.byKey(WidgetKeys.orderItemUnitPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      isFree ? findsNothing : findsOneWidget,
    );
  }

  void verifyGovtMaterialListPrice(String price) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.govtMaterialListPrice),
    );

    expect(
      find.descendant(
        of: label,
        matching: find.text('${'List price'.tr()}: $price', findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: orderItem.at(_getMaterialIndex(isBonus: isFree)),
      matching: find.byKey(WidgetKeys.orderSuccessItemTotalPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(isFree ? 'FREE'.tr() : price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialOnOfferTag() {
    expect(
      find.descendant(
        of: _verifyingItem,
        matching: find.byKey(WidgetKeys.offerTag),
      ),
      findsOneWidget,
    );
  }

  void verifyCovidMaterialLabel() {
    expect(
      find.descendant(
        of: _verifyingItem,
        matching: find.byKey(WidgetKeys.covidLabel),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialBonusTag({
    bool isVisible = true,
  }) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _verifyingItem,
          matching: find.byKey(WidgetKeys.commonTileItemStatusLabel),
        ),
        matching: find.text('Bonus'.tr()),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Finder _material(int index) =>
      find.byKey(WidgetKeys.orderSuccessMaterialItem(index));

  Future<void> startVerifyBundle(String bundleNumber) async {
    await scrollEnsureFinderVisible(_bundle(bundleNumber));
    _verifyingItem = _bundle(bundleNumber);
  }

  void verifyBundleMarketPlaceLogo() {
    expect(
      find.descendant(
        of: _verifyingItem,
        matching: find.byType(MarketPlaceLogo),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleRate(int qty, String rate) {
    final rateWidget = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemBundleRate),
    );
    final rateText = tester.widget<Text>(rateWidget).data;
    expect(rateText, contains(qty.toString()));
    expect(rateText, contains(rate));
  }

  void verifyBundleTotalPrice(String price) {
    final priceWidget = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemBundleTotalPrice),
    );
    expect(
      find.descendant(
        of: priceWidget,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleTotalQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(
        of: _verifyingItem,
        matching: find.byKey(WidgetKeys.cartItemBundleQty),
      ),
    );
    expect(widget.data, contains(qty.toString()));
  }

  Future<void> startVerifyBundleItem(
    String bundleNumber,
    String materialNumber,
  ) async {
    final item = find.descendant(
      of: _bundle(bundleNumber),
      matching:
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial(materialNumber)),
    );
    await tester.pumpUntilVisible(item);
    await scrollEnsureFinderVisible(item);
    _verifyingItem = item;
  }

  Finder _bundle(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  //============================================================
  //  Promotion For ID
  //============================================================
  void verifyAplPromotionLabelForItem({
    required String materialNumber,
  }) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.promotionLabel(materialNumber) &&
            widget is Text &&
            widget.data!.contains('offer applied'.tr()),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyOrderSuccessDetail() async {
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.orderSuccessDetail));
  }

  void verifyMaterialCutOffPrice(String price) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.orderItemPriceStrikeThrough),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  double getMaterialUnitPrice({bool isBonus = false}) {
    final priceWidgetFinder = find.descendant(
      of: orderItem.at(_getMaterialIndex(isBonus: isBonus)),
      matching: find.byKey(WidgetKeys.orderItemUnitPrice),
    );
    final priceString = tester.widget<PriceComponent>(priceWidgetFinder).price;
    return priceString.extractDouble;
  }

  void _verifyItemComponent(
    Finder finder, {
    bool isMarketPlace = false,
  }) {
    final materialSection = find.byKey(
      isMarketPlace
          ? WidgetKeys.orderSuccessMPItemsSection
          : WidgetKeys.orderSuccessZPItemsSection,
    );
    expect(
      find.descendant(of: materialSection, matching: finder),
      findsOneWidget,
    );
  }

  int _getMaterialIndex({required bool isBonus}) {
    for (var i = 0; i < orderItem.evaluate().length; i++) {
      final isBonusMaterialPresent = find
          .descendant(
            of: orderItem.at(i),
            matching: find.descendant(
              of: find.descendant(
                of: orderItem.at(i),
                matching: find.byKey(WidgetKeys.commonTileItemStatusLabel),
              ),
              matching: find.text('Bonus'.tr()),
            ),
          )
          .evaluate()
          .isNotEmpty;

      if ((isBonus && isBonusMaterialPresent) ||
          (!isBonus && !isBonusMaterialPresent)) {
        return i;
      }
    }

    return -1;
  }

  Future<void> verifyItemComponent({
    bool isBonus = false,
    required int qty,
    String price = '',
  }) async {
    final item = orderItem.at(_getMaterialIndex(isBonus: isBonus));
    await scrollEnsureFinderVisible(item);
    _verifyItemComponent(item);
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemTitle),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byType(ProductImage),
      ),
    );
    final cartItemProductQty = find.descendant(
      of: item,
      matching: find.byKey(WidgetKeys.cartItemProductQty),
    );
    expect(
      tester.widget<Text>(cartItemProductQty).data,
      contains(qty.toString()),
    );
    final orderSuccessItemTotalPrice = find.descendant(
      of: orderItem.at(_getMaterialIndex(isBonus: isBonus)),
      matching: find.byKey(WidgetKeys.orderSuccessItemTotalPrice),
    );
    expect(
      find.descendant(
        of: orderSuccessItemTotalPrice,
        matching: find.text(isBonus ? 'FREE'.tr() : price, findRichText: true),
      ),
      findsOneWidget,
    );
  }
}
