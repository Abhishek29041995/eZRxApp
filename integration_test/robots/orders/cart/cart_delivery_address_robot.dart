import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CartDeliveryAddressRobot {
  final WidgetTester tester;

  CartDeliveryAddressRobot(this.tester);

  final shipToAddressSheet = find.byKey(WidgetKeys.cartShipToAddressSheet);

  void verifySheet({required bool isVisible}) {
    expect(shipToAddressSheet, isVisible ? findsOneWidget : findsNothing);
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

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.cartShipToAddressSheetCloseButton));
    await tester.pumpAndSettle();
  }
}
