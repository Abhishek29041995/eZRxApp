import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep1Robot {
  final WidgetTester tester;
  NewPaymentStep1Robot(this.tester);
  final outstandingInvoicesPage =
      find.byKey(WidgetKeys.outstandingInvoicesPage);
  final filterBadge = find.byKey(WidgetKeys.customBadge);
  final textOutStanding = find.byKey(WidgetKeys.textOutstanding);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  final priceText = find.byKey(WidgetKeys.priceText);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final paymentItem = find.byKey(WidgetKeys.paymentItem);
  final fromDocumentDateField = find.byKey(WidgetKeys.fromDocumentDateField);
  final fromDueDateField = find.byKey(WidgetKeys.fromDueDateField);
  final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
  final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
  final itemCheckBadge = find.byKey(WidgetKeys.itemCheckBadge);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final openSelector = find.byKey(WidgetKeys.genericKey(key: 'Open'));
  final overDueSelector = find.byKey(WidgetKeys.genericKey(key: 'Overdue'));
  final govNumber = find.byKey(WidgetKeys.governmentNumber);

  String invoiceId = '';
  String orderId = '';
  String invoiceIdPrice = '';
  String govIdForVn = '';

  Future<void> verifyPage() async {
    await tester.pumpUntilVisible(outstandingInvoicesPage, maxIteration: 5);
    expect(outstandingInvoicesPage, findsOneWidget);
  }

  void verifyStep1InitialField() {
    expect(
      find.textContaining('Select invoice(s) for payment'.tr()),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.genericKey(key: '')),
      findsOneWidget,
    );
    expect(filterBadge, findsOneWidget);
    expect(textOutStanding, findsOneWidget);
    expect(priceComponent, findsAtLeastNWidgets(2));
    expect(priceText, findsAtLeastNWidgets(2));
    expect(checkAllWidget, findsOneWidget);
  }

  void verifyNoItemFound() {
    expect(paymentItem, findsNothing);
  }

  void verifyAtLeast1ItemFound({
    isVn = false,
  }) {
    expect(paymentItem, findsAtLeastNWidgets(1));
    expect(govNumber, isVn ? findsAtLeastNWidgets(1) : findsNothing);
  }

  void collectTheFirstItem({isVn = false}) {
    invoiceId =
        tester.widget<Text>(find.byKey(WidgetKeys.invoiceId).first).data!;
    invoiceIdPrice = tester
        .widget<PriceComponent>(find.byKey(WidgetKeys.invoiceIdPrice).first)
        .price;
    orderId = tester
        .widget<Text>(find.byKey(WidgetKeys.invoiceItemOrderId).first)
        .data!;
    if (isVn) {
      govIdForVn = tester
          .widget<Text>(find.byKey(WidgetKeys.governmentNumber).first)
          .data!;
    }
  }

  String get getFirstInvoiceId {
    collectTheFirstItem();
    return invoiceId;
  }

  double get getFirstInvoiceIdPrice {
    collectTheFirstItem();
    return double.parse(invoiceIdPrice);
  }

  String get getFirstGovIdForVn {
    collectTheFirstItem();
    return govIdForVn;
  }

  Future<void> pullToRefresh() async {
    await tester.drag(paymentItem.first, const Offset(0, 1000));
    await tester.pumpAndSettle();
  }

  void verifyTheFirstItemAfterRefresh() {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.invoiceId).first).data!,
      equals(invoiceId),
    );
    expect(
      tester
          .widget<Text>(find.byKey(WidgetKeys.invoiceItemOrderId).first)
          .data!,
      equals(orderId),
    );
  }

  Future<void> clickFilter() async {
    await tester.tap(filterBadge);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: filterBadge,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  Future<void> clickDocumentDateField() async {
    await tester.tap(fromDocumentDateField);
    await tester.pumpAndSettle();
  }

  Future<void> clickDueDateField() async {
    await tester.tap(fromDueDateField);
    await tester.pumpAndSettle();
  }

  Future<void> clickOpenSelector() async {
    await tester.tap(openSelector);
    await tester.pumpAndSettle();
  }

  Future<void> clickOverDueSelector() async {
    await tester.tap(overDueSelector);
    await tester.pumpAndSettle();
  }

  Future<void> tapResetFilter() async {
    await tester.tap(filterResetButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapAllCheckbox() async {
    await tester.tap(checkAllWidget);
    await tester.pumpAndSettle();
  }

  void verifyAtLeast1ItemIsCheck() {
    expect(itemCheckBadge, findsAtLeastNWidgets(1));
  }

  void verifyNoItemIsCheck() {
    expect(itemCheckBadge, findsNothing);
  }

  void verifyCheckboxStatus(bool status) {
    expect(tester.widget<CheckboxListTile>(checkAllWidget).value, status);
  }

  void verifyButtonEnable() {
    expect(tester.widget<ElevatedButton>(nextButton).enabled, true);
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickFirstItem() async {
    await tester.tap(paymentItem.first);
    await tester.pumpAndSettle();
  }

  void verifyDefaultFilter() {
    final currentTime = DateTime.now();
    expect(
      find.text(currentTime.displayDate),
      findsOneWidget,
    );
    expect(
      find.text(currentTime.subtract(const Duration(days: 90)).displayDate),
      findsOneWidget,
    );
  }

  Future<void> tapApplyFilter() async {
    await tester.tap(filterApplyButton);
    await tester.pumpAndSettle();
  }
}
