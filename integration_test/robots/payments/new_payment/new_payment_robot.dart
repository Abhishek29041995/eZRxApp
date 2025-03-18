import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentRobot {
  final WidgetTester tester;

  NewPaymentRobot(this.tester);

  Future<void> verifyPage() async {
    final newPaymentPage = find.byKey(WidgetKeys.newPaymentPage);
    await tester.pumpUntilVisible(newPaymentPage, maxIteration: 5);
    expect(newPaymentPage, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tester.tap(find.byKey(WidgetKeys.backButton));
    await tester.pumpAndSettle();
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(MarketPlaceIcon),
        ),
        findsOne,
      );

  void verifyCreditAmountGreaterInvoiceAmount({bool isVisible = true}) =>
      expect(
        find.byKey(WidgetKeys.creditGreaterThanInvoiceWarning),
        isVisible ? findsOne : findsNothing,
      );
}
