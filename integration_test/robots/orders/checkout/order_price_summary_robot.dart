import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderPriceSummaryRobot {
  final WidgetTester tester;

  OrderPriceSummaryRobot(this.tester);

  final bottomSheet = find.byKey(WidgetKeys.priceSummarySheet);
  final closeButton = find.byKey(WidgetKeys.closeButton);

  void verifySheet({required bool isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCloseButton() {
    expect(
      find.descendant(of: bottomSheet, matching: closeButton),
      findsOneWidget,
    );
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.descendant(of: bottomSheet, matching: closeButton));
    await tester.pumpAndSettle();
  }

  void verifyMPSubTotalLabel(String price, {bool isVisible = true}) =>
      _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryMPSubTotal),
        price,
        isVisible: isVisible,
      );

  void verifyZPSubTotalLabel(String price, {bool isVisible = true}) =>
      _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryZPSubTotal),
        price,
        isVisible: isVisible,
      );

  void verifySubTotalLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummarySubTotal),
        price,
      );

  void verifySmallOrderFeeLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.smallOrderFeeSection),
        price,
      );

  void verifyGrandTotalLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        price,
      );

  void verifyTotalSavingLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryTotalSaving),
        price,
      );

  void verifyTaxLabel(
    String price,
    int tax, {
    bool isVn = false,
  }) {
    _verifyPriceLabel(find.byKey(WidgetKeys.checkoutSummaryTaxPrice), price);
    if (!isVn) {
      _verifyPriceLabel(find.byKey(WidgetKeys.checkoutSummaryTax), '$tax%');
    }
  }

  void _verifyPriceLabel(Finder finder, String price, {bool isVisible = true}) {
    expect(
      find.descendant(
        of: find.descendant(of: bottomSheet, matching: finder),
        matching: find.textContaining(price, findRichText: true),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }
}
