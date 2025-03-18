import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class PaymentSummaryDetailRobot extends CommonRobot {
  final Finder _downloadAdviceButtonKey =
      find.byKey(WidgetKeys.downloadAdviceButtonKey);
  final Finder _accountSummaryBankAccountSection =
      find.byKey(WidgetKeys.accountSummaryBankAccountSection);
  final Finder _paymentSummaryDetailsPage =
      find.byKey(WidgetKeys.paymentSummaryDetailsPage);
  final Finder _cancelAdviceButtonKey =
      find.byKey(WidgetKeys.cancelAdviceButtonKey);
  final Finder _deleteCancelAdviceBottomSheetButton =
      find.byKey(WidgetKeys.deleteCancelAdviceBottomSheetButton);
  final Finder _paymentSummaryDetailsBackButton =
      find.byKey(WidgetKeys.paymentSummaryDetailsBackButton);

  PaymentSummaryDetailRobot(super.tester);

  void verifyPage() {
    expect(_paymentSummaryDetailsPage, findsOneWidget);
  }

  bool get isPaymentDetailPage =>
      _paymentSummaryDetailsPage.evaluate().isNotEmpty;

  void verifyPaymentDetail(
    String paymentId,
  ) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.paymentSummaryDetails),
        matching: find.textContaining(paymentId),
      ),
      findsOneWidget,
    );
    _verifyBalanceTextRow('Payment method');
    _verifyBalanceTextRow('PA created date');
    _verifyBalanceTextRow('Advice expiry');
    _verifyBalanceTextRow('Payment date');
  }

  void _verifyBalanceTextRow(String text) {
    expect(
      find.descendant(
        of: find.byType(BalanceTextRow),
        matching: find.textContaining(text.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderAddressVisible(String address) {
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

  void verifyShipToCode(String shipToCode) {
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

  Future<void> verifyPaymentSummaryInvoiceCredit() async {
    final invoiceText = find.byKey(
      WidgetKeys.paymentSummaryTitle('Invoice total:'),
    );
    await scrollEnsureFinderVisible(invoiceText);
    final creditText = find.byKey(
      WidgetKeys.paymentSummaryTitle('Credits applied:'),
    );
    await scrollEnsureFinderVisible(creditText);
  }

  Future<void> verifyPaymentSummaryTotalPrice(
    String invoicePrice,
  ) async {
    final widget = find.descendant(
      of: find.byKey(WidgetKeys.paymentSummaryTitle('${'Total'.tr()}:')),
      matching: _getPriceFinder(invoicePrice),
    );
    await scrollEnsureFinderVisible(widget);
    expect(widget, findsOneWidget);
  }

  Future<void> verifyPaymentSummaryDetailForID(
    String title,
    double invoicePrice,
    String currency,
  ) async {
    final paymentSummaryTitle = find.byKey(
      WidgetKeys.paymentSummaryTitle(
        title,
      ),
    );
    await scrollEnsureFinderVisible(paymentSummaryTitle);
    expect(
      find.descendant(
        of: paymentSummaryTitle,
        matching: _getPriceFinder(
          invoicePrice.priceDisplayForID(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyPaymentItems(
    String title,
    String id,
    double price,
    String currency,
  ) async {
    final paymentItem = find.byKey(WidgetKeys.paymentItems(title, id));
    await scrollEnsureFinderVisible(paymentItem);
    expect(
      find.descendant(
        of: paymentItem,
        matching: _getPriceFinder(price.priceDisplay(currency)),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyPaymentItemsForID(
    String title,
    String id,
    double price,
    String currency,
  ) async {
    final paymentItem = find.byKey(WidgetKeys.paymentItems(title, id));
    await tester.dragUntilVisible(
      paymentItem,
      _paymentSummaryDetailsPage,
      const Offset(0.0, -200),
    );
    await tester.pump();
    expect(
      find.descendant(
        of: paymentItem,
        matching: _getPriceFinder(
          price.priceDisplayForID(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyDownloadAdviceButton() {
    expect(_downloadAdviceButtonKey, findsOneWidget);
  }

  void verifyBankAccountStatementSection() {
    expect(_accountSummaryBankAccountSection, findsOneWidget);
  }

  void verifyDownloadAdviceButtonForSuccessfulStatus() {
    expect(_downloadAdviceButtonKey, findsNothing);
  }

  void verifyDeleteCancelAdviceBottomSheetButton() {
    expect(_deleteCancelAdviceBottomSheetButton, findsOneWidget);
  }

  Future<void> tapDeleteCancelAdviceBottomSheetButton() async {
    await tester.tap(_deleteCancelAdviceBottomSheetButton);
    await tester.pumpAndSettle();
  }

  void verifyPaymentSummaryDetailsBackButton() {
    expect(_paymentSummaryDetailsBackButton, findsOneWidget);
  }

  Future<void> tapPaymentSummaryDetailsBackButton() async {
    await tester.tap(_paymentSummaryDetailsBackButton);
    await tester.pumpAndSettle();
  }

  void verifyCancelAdviceButtonKey() {
    expect(_cancelAdviceButtonKey, findsOneWidget);
  }

  Future<void> tapCancelAdviceButtonKey() async {
    await tester.tap(_cancelAdviceButtonKey);
    await tester.pumpAndSettle();
  }

  Future<void> tapDownloadAdviceButton() async {
    await tester.tap(_downloadAdviceButtonKey);
    await tester.pumpAndSettle();
  }

  Finder _getPriceFinder(String price) => find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      );

  void verifyMarketPlaceLogo() =>
      expect(find.byType(MarketPlaceRectangleLogo), findsOne);
}
