import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ViewByOrdersDetailRobot extends CommonRobot {
  ViewByOrdersDetailRobot(super.tester);

  final buyAgainButton = find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);
  final contactNumberSection =
      find.byKey(WidgetKeys.viewByOrderDetailsContactNumber);

  final _page = find.byType(ViewByOrderDetailsPage);
  late Finder _verifyingItem;

  void verifyPage() {
    expect(_page, findsOneWidget);
  }

  bool get isOrderDetailPage => _page.evaluate().isNotEmpty;

  void verifyOrderId(String orderId) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.viewByOrderDetailOrderCode &&
            widget is RichText &&
            widget.text.toPlainText().contains(orderId),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderDate() {
    expect(
      find.byKey(WidgetKeys.viewByOrderDetailOrderDate),
      findsOneWidget,
    );
  }

  void verifyPoReference(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('PO reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyDeliveryInstructions(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Delivery instructions'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyPaymentTerm(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Payment term'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyOrderAddress(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is RichText &&
            widget.text.toPlainText().contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyDeliveryTo(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  Future<void> dragToVerifySummary() =>
      scrollEnsureFinderVisible(find.byType(OrderSummarySection));
  Future<void> dragToVerifyItems() =>
      scrollEnsureFinderVisible(find.byKey(WidgetKeys.viewByOrderOrderItems));

  void verifySubTotal(String value) {
    final subTotalWidget = find.byKey(WidgetKeys.viewByOrderSubtotalKey);
    expect(subTotalWidget, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalWidget,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyTax(String value) {
    final taxFinder = find.byKey(WidgetKeys.viewByOrderTaxKey);
    expect(taxFinder, findsOneWidget);
    expect(
      find.descendant(
        of: taxFinder,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotal(String value) {
    final subTotalWidget = find.byKey(WidgetKeys.viewByOrderGrandTotalKey);
    expect(subTotalWidget, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalWidget,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderSummaryComponentVisibleForID(String value) {
    final subTotalWidget = find.byKey(WidgetKeys.viewByOrderIdSubtotalKey);
    final viewByOrderIdTaxKey = find.byKey(WidgetKeys.viewByOrderIdTaxKey);
    final viewByOrderIdSmallOrderFeeKey =
        find.byKey(WidgetKeys.viewByOrderIdSmallOrderFeeKey);
    final viewByOrderIdManualFeeKey =
        find.byKey(WidgetKeys.viewByOrderIdManualFeeKey);
    final viewByOrderIdGrandTotalKey =
        find.byKey(WidgetKeys.viewByOrderIdGrandTotalKey);
    final viewByOrderIdTotalSavingsKey =
        find.byKey(WidgetKeys.viewByOrderIdTotalSavingsKey);
    expect(subTotalWidget, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalWidget,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
    expect(viewByOrderIdTaxKey, findsOneWidget);
    expect(viewByOrderIdSmallOrderFeeKey, findsOneWidget);
    expect(viewByOrderIdManualFeeKey, findsOneWidget);
    expect(viewByOrderIdGrandTotalKey, findsOneWidget);
    expect(viewByOrderIdTotalSavingsKey, findsOneWidget);
  }

  Future<void> dragToVerifyItemsSection() => scrollEnsureFinderVisible(
        find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
      );

  Future<void> startVerifyMaterial(
    String materialNumber, {
    bool isBonus = false,
  }) async {
    final productWidget =
        find.byKey(WidgetKeys.viewByOrderDetailItem(materialNumber, isBonus));
    await tester.pumpUntilVisible(productWidget);
    await scrollEnsureFinderVisible(productWidget);
    _verifyingItem = productWidget;
    await Future.delayed(const Duration(seconds: 4));
  }

  void verifyMaterialTotalPrice(String price, {bool isFree = false}) => expect(
        find.descendant(
          of: find.descendant(
            of: _verifyingItem,
            matching: find.byKey(WidgetKeys.cartItemProductTotalPrice),
          ),
          matching: find.text(isFree ? 'FREE'.tr() : price, findRichText: true),
        ),
        findsOneWidget,
      );

  void verifyBatchExpiryDate(StockInfo stockInfo) =>
      verifyStockInfo(stockInfo, _verifyingItem);

  Future<void> startVerifyBundle(String bundleNumber) async {
    final bundle = find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));
    _verifyingItem = bundle;
    await tester.pumpUntilVisible(find.byType(OrderBundleItem));
    await scrollEnsureFinderVisible(bundle);
    expect(bundle, findsOneWidget);
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
    final bundle = find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));
    final item = find.descendant(
      of: bundle,
      matching:
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial(materialNumber)),
    );
    await tester.pumpUntilVisible(item);
    await scrollEnsureFinderVisible(item);
    _verifyingItem = item;
  }

  Future<void> tapVerifyingItem() async {
    await tester.tap(_verifyingItem);
    await tester.pumpAndSettle();
  }

  void verifyQty(int qty) {
    final widget = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemProductQty),
    );
    expect(
      tester.widget<Text>(widget).data,
      contains(qty.toString()),
    );
  }

  void verifyOfferTag() => expect(
        find.descendant(
          of: _verifyingItem,
          matching: find.byKey(WidgetKeys.offerTag),
        ),
        findsOneWidget,
      );

  void verifyBonusTag() => expect(
        find.descendant(
          of: _verifyingItem,
          matching: find.byKey(WidgetKeys.commonTileItemStatusLabel),
        ),
        findsOneWidget,
      );

  void verifyBuyAgainButton() => expect(buyAgainButton, findsOneWidget);

  Future<void> tapBuyAgainButton() async {
    await tester.tap(buyAgainButton);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.cartPage));
  }

  Future<void> tapBuyAgainButtonForTender() async {
    await tester.tap(buyAgainButton);
    await tester.pumpAndSettle();
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

  String getOrderContactNumber() {
    final contactNumberText =
        tester.widget<BalanceTextRow>(contactNumberSection).valueText;
    if (contactNumberText == '-') {
      return '';
    }
    return contactNumberText;
  }
}
