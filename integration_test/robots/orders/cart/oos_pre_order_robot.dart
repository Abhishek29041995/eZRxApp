import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OOSPreOrderRobot {
  final WidgetTester tester;

  OOSPreOrderRobot(this.tester);

  final cancelButton = find.byKey(WidgetKeys.preOrderModalCancelButton);
  final continueButton = find.byKey(WidgetKeys.preOrderModalContinueButton);
  final bottomSheet = find.byKey(WidgetKeys.preOrderModel);
  final materialDetailsStock = find.byKey(WidgetKeys.materialDetailsStock);

  bool get isSheetVisible => bottomSheet.evaluate().isNotEmpty;

  bool get isOosPreOrderMaterial => find
      .descendant(
        of: find.byType(StatusLabel),
        matching: find.text('OOS-Preorder'.tr()),
      )
      .evaluate()
      .isNotEmpty;

  void verifySheet({required bool isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCancelButton() {
    expect(cancelButton, findsOneWidget);
  }

  Future<void> tapCancelButton() async {
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();
  }

  void verifyContinueButton() {
    expect(continueButton, findsOneWidget);
  }

  Future<void> tapContinueButton() async {
    await tester.tap(continueButton);
    await tester.pumpAndSettle();
  }

  void verifyManufacturerLabel(String name, {bool isMarketPlace = false}) {
    final widget = find.descendant(
      of: bottomSheet,
      matching: find.byKey(WidgetKeys.cartPrincipalLabel),
    );
    expect(find.descendant(of: widget, matching: find.text(name)), findsOne);
    if (isMarketPlace) {
      expect(
        find.descendant(of: widget, matching: find.byType(MarketPlaceLogo)),
        findsOne,
      );
    }
  }

  void verifyWarningMessage() {
    expect(find.text('OOS-Preorder items in cart'.tr()), findsOneWidget);
    expect(
      find.text(
        'These item will only be delivered when stock is available.'.tr(),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterial(String materialNumber, int qty) {
    final material = find.byKey(WidgetKeys.preOrderMaterial(materialNumber));
    expect(material, findsWidgets);
    expect(
      find.descendant(
        of: material,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.preOrderMaterialQty &&
              widget is Text &&
              widget.data?.contains(qty.toString()) == true,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyExpiryDateAndBatch(
    String materialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: find.byKey(WidgetKeys.preOrderMaterial(materialNumber)),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch'.tr()}: ${stockInfo.batch.displayNAIfEmpty}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'Expires'.tr()}: ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }
}
