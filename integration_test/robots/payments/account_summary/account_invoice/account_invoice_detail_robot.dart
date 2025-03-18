import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';

class AccountInvoiceDetailRobot extends CommonRobot {
  AccountInvoiceDetailRobot(super.tester);

  late Finder _verifyingMaterial;

  void verifyPage() {
    expect(find.byType(InvoiceDetailsPage), findsOneWidget);
  }

  void verifyInvoiceDetails(
    String id,
    String status,
    String orderNumber, {
    bool isVn = false,
    String govNo = '',
  }) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('${'Invoice'.tr()} #$id', status)),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(BalanceTextRow),
        matching: find.textContaining('Document date'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(BalanceTextRow),
        matching: find.textContaining('Due on'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.invoiceOrderNumber(orderNumber)),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Gov. no'.tr(), govNo)),
      isVn ? findsOneWidget : findsNothing,
    );
  }

  void verifyHyperLinkToOrderDetails() {
    expect(
      find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton),
      findsOneWidget,
    );
  }

  Future<void> redirectToOrderDetails() async {
    await tester.tap(find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton));
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
  }

  void verifyInvoiceId(String id) => expect(
        find.descendant(
          of: find.byKey(WidgetKeys.invoiceDetailIdAndStatus),
          matching: find.textContaining(id, findRichText: true),
        ),
        findsOneWidget,
      );

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

  void verifySubTotal(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.invoiceDetailSubTotal),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyTaxValue(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.invoiceDetailTax),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotal(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.invoiceDetailGrandTotal),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyMarketPlaceSection() async {
    final section = find.byKey(WidgetKeys.cartMPProductSectionLabel);
    await scrollEnsureFinderVisible(section);
    expect(section, findsOne);
  }

  Future<void> verifyMarketPlaceSeller(String name) =>
      verifySellerNameText(name, find.byKey(WidgetKeys.scrollList));

  Future<void> verifyMaterial(int groupIndex, int index) async {
    _verifyingMaterial = _material(groupIndex, index);
    await scrollEnsureFinderVisible(_verifyingMaterial);
    expect(_verifyingMaterial, findsOneWidget);
  }

  void verifyMaterialBatchExpiryDate(StockInfo stockInfo) =>
      verifyStockInfo(stockInfo, _verifyingMaterial);

  void verifyMaterialNumber(String materialNumber) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.commonTileItemLabel),
    );
    expect(tester.widget<Text>(label).data, equals(materialNumber));
  }

  Future<void> verifyMaterialQty(int qty) async {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.cartItemProductQty),
    );
    await scrollEnsureFinderVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyMaterialUnitPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.invoiceDetailMaterialUnitPrice),
    );
    if (isFree) {
      expect(label, findsNothing);
      return;
    }
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.cartItemProductTotalPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(isFree ? 'FREE'.tr() : price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Finder _material(int groupIndex, int index) =>
      find.byKey(WidgetKeys.invoiceDetailMaterial(groupIndex, index));
}
