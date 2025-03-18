import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/credit_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep2Robot {
  final WidgetTester tester;
  NewPaymentStep2Robot(this.tester);
  final availableCreditsTabPage =
      find.byKey(WidgetKeys.availableCreditsTabPage);
  final priceText = find.byKey(WidgetKeys.priceText);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  final filterBadge = find.byKey(WidgetKeys.customBadge);
  final fromDocumentDateField = find.byKey(WidgetKeys.fromDocumentDateField);
  final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
  final creditPaymentItem = find.byKey(WidgetKeys.creditPaymentItem);
  final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
  final itemCheckBadge = find.byKey(WidgetKeys.itemCheckBadge);
  final accountingDocument = find.byKey(WidgetKeys.accountingDocument);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final govNumber = find.byKey(WidgetKeys.governmentNumber);
  final creditTile = find.byType(CreditItemCard);
  final creditPrice = find.byKey(WidgetKeys.creditIdPrice);

  String firstAccountingDocument = '';

  void verifyPage() {
    expect(availableCreditsTabPage, findsOneWidget);
  }

  void verifyStep2InitialField(double price) {
    expect(
      find.textContaining('Select credit (Optional)'.tr()),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.searchBar),
      findsOneWidget,
    );
    expect(checkAllWidget, findsOneWidget);
    expect(
      find.textContaining(price.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> clickFilter() async {
    await tester.tap(filterBadge);
    await tester.pumpAndSettle();
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

  Future<void> tapApplyFilter() async {
    await tester.tap(filterApplyButton);
    await tester.pumpAndSettle();
  }

  void verifyNoItemFound() {
    expect(creditPaymentItem, findsNothing);
  }

  bool get noRecordFound => find.byType(NoRecordFound).evaluate().isNotEmpty;

  void verifyAtLeastOneItemFound({bool isVn = false}) {
    expect(creditPaymentItem, findsAtLeastNWidgets(1));
    expect(govNumber, isVn ? findsAtLeastNWidgets(1) : findsNothing);
  }

  void verifyDefaultFilter() {
    expect(
      find.text(DateTime.now().displayDate),
      findsWidgets,
    );
    expect(
      find.text(
        DateTime.now().subtract(const Duration(days: 90)).displayDate,
      ),
      findsWidgets,
    );
  }

  Future<void> verifyOutOfRangeError() async {
    expect(find.textContaining('Out of range.'), findsOneWidget);
  }

  Future<void> tapResetFilter() async {
    await tester.tap(filterResetButton);
    await tester.pumpAndSettle();
  }

  void verifyCheckboxStatus(bool status) {
    expect(tester.widget<CheckboxListTile>(checkAllWidget).value, status);
  }

  Future<void> tapAllCheckbox() async {
    await tester.tap(checkAllWidget);
    await tester.pumpAndSettle();
  }

  void verifyNoItemIsCheck() {
    expect(itemCheckBadge, findsNothing);
  }

  void verifyAtLeast1ItemIsCheck() {
    expect(itemCheckBadge, findsAtLeastNWidgets(1));
  }

  Future<void> clickFirstItem() async {
    await tester.tap(creditPaymentItem.first);
    await tester.pumpAndSettle();
  }

  void collectTheFirstItem() {
    firstAccountingDocument =
        tester.widget<Text>(accountingDocument.first).data!;
  }

  String getValidCredit(double invoicePrice, {bool fetchPrice = false}) {
    final accountingDocumentList =
        tester.widgetList<Text>(accountingDocument).toList();
    final creditIdPriceList =
        tester.widgetList<PriceComponent>(creditPrice).toList();
    for (var i = 0; i < accountingDocumentList.length; i++) {
      final price = creditIdPriceList[i].price;
      if (price.isNotEmpty && double.parse(price) <= invoicePrice) {
        return fetchPrice ? price : accountingDocumentList[i].data!;
      }
    }
    return '';
  }

  String getFirstCreditId(double invoicePrice) {
    return getValidCredit(invoicePrice);
  }

  String getCreditId(int index) => tester
      .widget<CreditItemCard>(creditTile.at(index))
      .customerOpenItem
      .accountingDocument;

  double getCreditPrice(int index) =>
      double.parse(tester.widget<PriceComponent>(creditPrice.at(index)).price);

  double getFirstCreditIdPrice(double invoicePrice) {
    final priceValue = getValidCredit(invoicePrice, fetchPrice: true);
    if (priceValue.isEmpty) {
      return 0.0;
    }
    return double.parse(priceValue);
  }

  void verifyTheFirstItemAfterRefresh() {
    expect(
      tester.widget<Text>(accountingDocument.first).data!,
      equals(firstAccountingDocument),
    );
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyThePriceAndButton(
    double priceWithoutCredit,
    double priceWithCredit, {
    bool verifyButtonEnabled = true,
  }) {
    expect(
      find.textContaining(priceWithCredit.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(
        priceWithoutCredit.priceFormatted,
        findRichText: true,
      ),
      findsAtLeastNWidgets(1),
    );
    if (verifyButtonEnabled) {
      expect(tester.widget<ElevatedButton>(nextButton).enabled, true);
    }
  }
}
