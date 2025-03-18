import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class BonusSampleRobot extends CommonRobot {
  BonusSampleRobot(super.tester);

  final bottomSheet = find.byKey(WidgetKeys.bonusSampleSheet);
  final closeButton = find.byKey(WidgetKeys.bonusSampleSheetCloseButton);
  final items = find.byKey(WidgetKeys.bonusSampleSheetItemTile);
  final submitButton = find.byKey(WidgetKeys.cartButton);
  final materialNumberLabel =
      find.byKey(WidgetKeys.bonusSampleSheetItemMaterialNumber);
  final materialDescriptionLabel =
      find.byKey(WidgetKeys.bonusSampleSheetItemMaterialDescription);

  void verifySheet({required isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCloseButton() {
    expect(closeButton, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapSubmitButton(int index) async {
    await tester.tap(submitButton.at(index));
    await tester.pumpAndSettle();
  }

  Future<void> enterBonusSampleQty(int index, int qty) async {
    final materialQtyInput = find.descendant(
      of: items.at(index),
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );
    await tester.tap(materialQtyInput);
    await tester.enterText(materialQtyInput, qty.toString());
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyInvalidQtyMessage() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.customSnackBar),
        matching: find.text(
          'In cart quantity should not be more than {maximumNumber}.'
              .tr(namedArgs: {'maximumNumber': '99999'}),
        ),
      ),
      findsWidgets,
    );
  }

  void verifyEmptyQtyMessage({required bool isVisible}) {
    expect(
      find.byKey(WidgetKeys.bonusSampleSheetEmptyQtyWarning),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifyAddToCartSuccessMessage() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.customSnackBar),
        matching: find.text('Bonus/sample added to cart'.tr()),
      ),
      findsOneWidget,
    );
  }

  String getBonusSampleMaterialNumber(int index) =>
      tester
          .widget<Text>(
            find.descendant(
              of: items.at(index),
              matching: materialNumberLabel,
            ),
          )
          .data ??
      '';

  String getBonusSampleMaterialDescription(int index) =>
      tester
          .widget<Text>(
            find.descendant(
              of: items.at(index),
              matching: materialDescriptionLabel,
            ),
          )
          .data ??
      '';

  void verifyBonusSampleItems() {
    expect(items, findsAtLeastNWidgets(1));
    final itemCount = items.evaluate().length;
    expect(
      find.descendant(of: items, matching: find.byType(CartItemQuantityInput)),
      findsNWidgets(itemCount),
    );
    expect(
      tester
          .widgetList<TextFormField>(
            find.descendant(
              of: items,
              matching: find.byKey(WidgetKeys.quantityInputTextKey),
            ),
          )
          .every((widget) => widget.controller?.text == '0'),
      true,
    );
    expect(
      find.descendant(of: items, matching: find.byType(ProductImage)),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: materialNumberLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: materialDescriptionLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: submitButton),
      findsNWidgets(itemCount),
    );
  }

  void verifyNoRecordFound() {
    expect(
      find.byKey(WidgetKeys.noRecordsFoundSearchIcon),
      findsOneWidget,
    );
    expect(
      find.textContaining(
        'Looks like you don’t have any bonus/sample items'.tr(),
      ),
      findsOneWidget,
    );
    expect(
      find.textContaining(
        'Try adjusting the search or another product from cart'.tr(),
      ),
      findsOneWidget,
    );
  }
}
