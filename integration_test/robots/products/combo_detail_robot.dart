import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class ComboDetailRobot extends CommonRobot {
  ComboDetailRobot(super.tester);

  void verifyPage() {
    final comboDetail = find.byKey(WidgetKeys.comboDealDetailPage);
    expect(comboDetail, findsOneWidget);
  }

  Future<double> getMaterialUnitPrice(
    String materialNumber, {
    bool getOriginalPrice = false,
  }) async {
    final comboMaterialItem = find.byKey(
      WidgetKeys.comboItemProductTile(
        materialNumber,
      ),
    );
    await scrollEnsureFinderVisible(comboMaterialItem);
    final priceWidgetFinder = find.descendant(
      of: comboMaterialItem,
      matching: find.byKey(
        getOriginalPrice
            ? WidgetKeys.comboMaterialOriginalPrice
            : WidgetKeys.comboMaterialDiscountedPrice,
      ),
    );
    final priceString = tester.widget<PriceComponent>(priceWidgetFinder).price;
    return priceString.extractDouble;
  }

  Finder getComboTitleFinder({
    required ComboDealScheme scheme,
  }) =>
      find.text(scheme.comboDealTitleAppbar);

// All Combo Schemes information
  void verifyComboDetailInformation() {
    expect(find.byKey(WidgetKeys.comboDetailAppBarTitle), findsOneWidget);
    expect(find.byKey(WidgetKeys.comboDetailRequirement), findsOneWidget);
    expect(find.byKey(WidgetKeys.totalMaterialItemCount), findsOneWidget);
    expect(find.byKey(WidgetKeys.comboDetailMaterialList), findsOneWidget);
    expect(find.byKey(WidgetKeys.comboDetailTotalUnits), findsOneWidget);
    expect(find.byKey(WidgetKeys.comboDealSubtotalDiscounted), findsOneWidget);
    expect(
      find.byKey(WidgetKeys.comboDealAddOrEditComboButton),
      findsOneWidget,
    );
    expect(find.byKey(WidgetKeys.comboDetailOrderForListTile), findsOneWidget);
  }

  // Material information
  Future<void> verifyComboMaterialInformation({
    required String materialNumberMatNo,
    required String expiryDate,
    required String materialName,
    required String materialManufacturer,
  }) async {
    final comboMaterialItem = find.byKey(
      WidgetKeys.comboItemProductTile(
        materialNumberMatNo,
      ),
    );
    await scrollEnsureFinderVisible(comboMaterialItem);

    expect(comboMaterialItem, findsOneWidget);

    expect(
      find.byKey(WidgetKeys.comboItemImageDetail(materialNumberMatNo)),
      findsOneWidget,
    );

    final materialItemDetail =
        find.byKey(WidgetKeys.comboItemMaterialDetail(materialNumberMatNo));
    expect(
      materialItemDetail,
      findsOneWidget,
    );

    final materialNameFinder = find.descendant(
      of: materialItemDetail,
      matching: find.byKey(WidgetKeys.materialDetailsMaterialDescription),
    );
    expect(
      materialNameFinder,
      findsOne,
    );
    expect(
      tester
          .widget<Text>(
            materialNameFinder,
          )
          .data,
      materialName,
    );

    final materialManufactureFinder = find.descendant(
      of: materialItemDetail,
      matching: find.byKey(WidgetKeys.manufacturerMaterials),
    );
    expect(
      materialManufactureFinder,
      findsOne,
    );
    expect(
      tester
          .widget<Text>(
            materialManufactureFinder,
          )
          .data,
      materialManufacturer,
    );

    expect(
      find.descendant(
        of: materialItemDetail,
        matching: find.text('${'Expires'.tr()}: $expiryDate'),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: comboMaterialItem,
        matching: find.byKey(WidgetKeys.comboMaterialDiscountedPrice),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: comboMaterialItem,
        matching: find.byKey(WidgetKeys.comboMaterialQuantityInput),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: comboMaterialItem,
        matching: find.byKey(WidgetKeys.itemSubtotalPrice),
      ),
      findsOneWidget,
    );
  }

  void verifyComboK1Displayed() {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k1,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k1,
          unit: '',
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Per item'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyDiscountTagDisplayed();
    _verifyOriginalPriceDisplayed();
    verifyBestDealDisplay();
    verifyAddToCartButtonEnableDisplayed();
  }

  void verifyComboK21Displayed() {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k21,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k21,
          unit: '',
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Per item'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.itemOriginalSubtotalPrice),
      findsOneWidget,
    );

    _verifyFixedDiscountTagDisplayed();
    _verifyDiscountTagDisplayed();
    _verifyComboNotEligibleDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  void verifyComboK22Displayed({required String minQty}) {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k22,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k22,
          unit: minQty,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Total Quantity'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyComboNotEligibleDisplayed();
    _verifyTotalDiscountedPercentNotDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  void verifyComboK3Displayed() {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k3,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k3,
          unit: '',
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Total SKUs'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyComboNotEligibleDisplayed();
    _verifyTotalDiscountedPercentNotDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  void verifyComboK41Displayed({required String minQty}) {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k4,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k4,
          unit: minQty,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Total Quantity'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyComboNotEligibleDisplayed();
    _verifyTotalDiscountedPercentNotDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  void verifyComboK42Displayed() {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k42,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k42,
          unit: '50',
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Per item'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyComboNotEligibleDisplayed();
    _verifyTotalDiscountedPercentNotDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  void verifyComboK5Displayed() {
    expect(
      getComboTitleFinder(
        scheme: ComboDealScheme.k5,
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: getComboConditionMessageFinder(
          scheme: ComboDealScheme.k5,
          unit: '50.0',
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.comboDetailRequirement),
        matching: find.text(
          'Total Order Amount'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedList),
      findsNothing,
    );

    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsNothing,
    );

    _verifyComboNotEligibleDisplayed();
    _verifyTotalDiscountedPercentNotDisplayed();
    verifyAddToCartButtonDisableDisplayed();
  }

  Future<void> verifyOnSelectFixedComboMaterial(
    String materialNumber,
  ) async {
    await _verifyComboMaterialSelectedDisplayed(materialNumber);
    await _tapToComboMaterial(materialNumber);
    await _verifyComboMaterialSelectedDisplayed(materialNumber);
  }

  Future<void> verifyOnSelectOptionalComboMaterial(
    String materialNumber,
  ) async {
    await _verifyComboMaterialUnSelectedDisplayed(materialNumber);
    await _tapToComboMaterial(materialNumber);
    await _verifyComboMaterialSelectedDisplayed(materialNumber);
  }

  Future<void> verifyOnSelectK1ComboMaterial(String materialNumber) async {
    await _tapToComboMaterial(materialNumber);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.customSnackBar));
  }

  void verifyFixedMaterialsTagDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDetailFixedTag),
      findsOneWidget,
    );
  }

  void verifyMaterialNextTierDiscountDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDealMaterialItemNextTierDiscount),
      findsOneWidget,
    );
  }

  // Add combo
  void verifyCartButtonDisplayed() {
    expect(find.byKey(WidgetKeys.cartButton), findsOneWidget);
  }

  // Edit combo
  void verifyDeleteComboButtonDisplayed() {
    expect(find.byKey(WidgetKeys.comboDeteleButton), findsOneWidget);
  }

  void verifyComboFixedMaterialsDisplayed() {
    expect(find.byKey(WidgetKeys.comboDetailFixedList), findsOneWidget);
  }

  void verifyFixedMaterialsWarningMessageDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDetailFixedWarningMessage),
      findsOneWidget,
    );
  }

  void verifySuggestProductsSearchByName(String keyword) {
    final listSuggestTile = tester
        .widgetList<Text>(
          find.byKey(WidgetKeys.materialDetailsMaterialDescription),
        )
        .map((e) => e.data);

    for (final e in listSuggestTile) {
      expect(e?.toLowerCase(), contains(keyword));
    }
  }

  void verifySuggestProductsSearchByCode(String keyword) {
    final listSuggestTile = tester
        .widgetList<Text>(
          find.byKey(WidgetKeys.materialDetailsMaterialNumber),
        )
        .map((e) => e.data);

    for (final e in listSuggestTile) {
      expect(e, contains(keyword));
    }
  }

  void _verifyTotalDiscountedPercentNotDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDetailTotalDiscountedPercent),
      findsNothing,
    );
  }

  void _verifyComboNotEligibleDisplayed() {
    expect(find.byKey(WidgetKeys.comboNotEligibleMessage), findsOneWidget);
  }

  void verifyBestDealDisplay() {
    final nextDealComponentFinder = find.byKey(WidgetKeys.comboNextDealInfo);
    expect(
      nextDealComponentFinder,
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: nextDealComponentFinder,
        matching: find.text(
          'Yay! You’ve got the best deal.'.tr(),
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: nextDealComponentFinder,
        matching: find.byKey(WidgetKeys.comboBestDealIcon),
      ),
      findsOneWidget,
    );
  }

  void verifyNextDealDisplay({
    required ComboDealScheme scheme,
    required String unit,
    required String discount,
  }) {
    var nextDealMessage = '';
    switch (scheme) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k22:
        nextDealMessage = '';
        break;
      case ComboDealScheme.k3:
        nextDealMessage =
            'Buy {unit} more items to get {discount}% discount'.tr(
          namedArgs: {
            'unit': unit.toString(),
            'discount': discount.toString(),
          },
        );
        break;

      case ComboDealScheme.k4:
        nextDealMessage = 'Buy {unit} more to get {discount}% discount'.tr(
          namedArgs: {
            'unit': unit.toString(),
            'discount': discount.toString(),
          },
        );
        break;
      case ComboDealScheme.k42:
        nextDealMessage =
            'Buy {unit} more quantity to achieve next tier discount'.tr(
          namedArgs: {
            'unit': unit.toString(),
          },
        );
        break;
      case ComboDealScheme.k5:
        nextDealMessage = 'Buy \${unit} more to get {discount}% discount'.tr(
          namedArgs: {
            'unit': unit.toString(),
            'discount': discount.toString(),
          },
        );
        break;
    }

    final nextDealComponentFinder = find.byKey(WidgetKeys.comboNextDealInfo);

    expect(
      nextDealComponentFinder,
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: nextDealComponentFinder,
        matching: find.text(
          nextDealMessage,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: nextDealComponentFinder,
        matching: find.byKey(WidgetKeys.comboNextDealIcon),
      ),
      findsOneWidget,
    );
  }

  void _verifyOriginalPriceDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboMaterialOriginalPrice),
      findsAtLeastNWidgets(1),
    );
  }

  void _verifyDiscountTagDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDealMaterialItemDiscountTag),
      findsAtLeastNWidgets(1),
    );
  }

  void _verifyFixedDiscountTagDisplayed() {
    expect(
      find.byKey(WidgetKeys.comboDetailFixedTag),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> _verifyComboMaterialSelectedDisplayed(
    String materialNumber,
  ) async {
    final comboMaterial =
        find.byKey(WidgetKeys.comboItemProductTile(materialNumber));
    await scrollEnsureFinderVisible(comboMaterial);
    expect(
      find.descendant(
        of: comboMaterial,
        matching: find.byKey(WidgetKeys.itemCheckBadge),
      ),
      findsOneWidget,
    );
  }

  Future<void> _verifyComboMaterialUnSelectedDisplayed(
    String materialNumber,
  ) async {
    final comboMaterial =
        find.byKey(WidgetKeys.comboItemProductTile(materialNumber));
    await scrollEnsureFinderVisible(comboMaterial);
    expect(
      find.descendant(
        of: comboMaterial,
        matching: find.byKey(WidgetKeys.itemCheckBadge),
      ),
      findsNothing,
    );
  }

  Future<void> changeMaterialQuantity({
    required String materialNumber,
    required int quantity,
  }) async {
    final comboMaterialInput = find.descendant(
      of: find.byKey(WidgetKeys.comboItemMaterialDetail(materialNumber)),
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );

    expect(comboMaterialInput, findsOneWidget);

    await tester.tap(comboMaterialInput);
    await tester.enterText(comboMaterialInput, quantity.toString());
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(Durations.long2);
  }

  Future<void> decreaseMaterialQuantity({
    required String materialNumber,
    required int currentQuantity,
    bool enableDecreaseButton = true,
  }) async {
    final decreasedQuantity =
        (enableDecreaseButton ? currentQuantity - 1 : currentQuantity)
            .toString();

    final finderComboMaterial =
        find.byKey(WidgetKeys.comboItemMaterialDetail(materialNumber));

    final decreaseQuantityButton = find.descendant(
      of: finderComboMaterial,
      matching: find.byKey(WidgetKeys.decreaseQuantityKey),
    );

    expect(decreaseQuantityButton, findsOneWidget);

    final comboMaterialInput = find.descendant(
      of: finderComboMaterial,
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );

    expect(comboMaterialInput, findsOneWidget);
    expect(
      tester.widget<TextFormField>(comboMaterialInput).controller?.text,
      currentQuantity.toString(),
    );

    await tester.tap(decreaseQuantityButton);
    await tester.pumpAndSettle();

    expect(
      tester.widget<TextFormField>(comboMaterialInput).controller?.text,
      decreasedQuantity,
    );
  }

  Future<void> increaseMaterialQuantity({
    required String materialNumber,
    required int currentQuantity,
    bool enableIncreaseButton = true,
  }) async {
    final increasedQuantity =
        (enableIncreaseButton ? currentQuantity + 1 : currentQuantity)
            .toString();

    final finderComboMaterial =
        find.byKey(WidgetKeys.comboItemMaterialDetail(materialNumber));

    final increaseQuantityButton = find.descendant(
      of: finderComboMaterial,
      matching: find.byKey(WidgetKeys.increaseQuantityKey),
    );

    expect(increaseQuantityButton, findsOneWidget);

    final comboMaterialInput = find.descendant(
      of: finderComboMaterial,
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );

    expect(comboMaterialInput, findsOneWidget);
    expect(
      tester.widget<TextFormField>(comboMaterialInput).controller?.text,
      currentQuantity.toString(),
    );

    await tester.tap(increaseQuantityButton);
    await tester.pumpAndSettle();

    expect(
      tester.widget<TextFormField>(comboMaterialInput).controller?.text,
      increasedQuantity,
    );
  }

  void verifyAddToCartButtonDisableDisplayed() {
    final addToCartButton =
        find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
    expect(tester.widget<ElevatedButton>(addToCartButton).enabled, false);
  }

  void verifyAddToCartButtonEnableDisplayed() {
    final addToCartButton =
        find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
    expect(tester.widget<ElevatedButton>(addToCartButton).enabled, true);
  }

  Future<void> tapToAddToCartButton() async {
    final addToCartButton =
        find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
    await tester.tap(addToCartButton);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.customSnackBar));
  }

  void verifyEditComboDetailEligibility() {
    final deleteButton = find.byKey(WidgetKeys.comboDeteleButton);
    expect(deleteButton, findsOneWidget);

    final updateCartText = find.descendant(
      of: find.byKey(WidgetKeys.comboDealAddOrEditComboButton),
      matching: find.text('Update cart'.tr()),
    );

    expect(updateCartText, findsOneWidget);
  }

  Future<void> _tapToComboMaterial(String materialNumber) async {
    final comboMaterial =
        find.byKey(WidgetKeys.comboItemProductTile(materialNumber));
    await scrollEnsureFinderVisible(comboMaterial);

    expect(comboMaterial, findsOneWidget);

    // Get the bottom-left corner of the widget.
    final bottomLeft = tester.getBottomLeft(comboMaterial);

    // Calculate the position 10 pixels above the bottom-left corner.
    // we will need to tap on this position to avoid click on the quantity input
    final tapPosition = bottomLeft - const Offset(0, 10);

    await tester.tapAt(tapPosition);
    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tester.tap(find.byKey(WidgetKeys.backButton));
    await tester.pumpAndSettle();
    final confirmBottomSheet = find.byType(ConfirmBottomSheet);
    final confirmButton =
        find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
    expect(confirmBottomSheet, findsOneWidget);
    expect(confirmButton, findsOneWidget);
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();
  }

  Finder getComboConditionMessageFinder({
    required ComboDealScheme scheme,
    required String unit,
  }) {
    var comboConditionMessage = '';
    switch (scheme) {
      case ComboDealScheme.k1:
        comboConditionMessage =
            'Purchase all items with min. of its quantity.'.tr();
        break;
      case ComboDealScheme.k21:
        comboConditionMessage =
            'Purchase FIXED product with min. of its quantity and any product in the list.'
                .tr();
        break;
      case ComboDealScheme.k22:
        comboConditionMessage =
            'Purchase any products with min. {minQty} of total quantity.'.tr(
          namedArgs: {
            'minQty': unit,
          },
        );
        break;
      case ComboDealScheme.k3:
        comboConditionMessage =
            'Purchase different products with min. of its quantity. Buy more save more.'
                .tr();
        break;
      case ComboDealScheme.k4:
        comboConditionMessage =
            'Purchase min. {minQty} items from any of these products. Buy more save more.'
                .tr(
          namedArgs: {
            'minQty': unit,
          },
        );
        break;
      case ComboDealScheme.k42:
        comboConditionMessage =
            'Purchase min. {minQty} QTYs from any of these products. Buy more save more.'
                .tr(
          namedArgs: {
            'minQty': unit,
          },
        );
        break;
      case ComboDealScheme.k5:
        comboConditionMessage =
            'Purchase min. \${amount} from these products. Buy more save more.'
                .tr(
          namedArgs: {
            'amount': unit,
          },
        );
        break;
    }

    return find.text(comboConditionMessage);
  }
}
