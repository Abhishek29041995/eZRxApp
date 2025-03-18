import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/switch_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';

class NewReturnStep2Robot extends CommonRobot {
  NewReturnStep2Robot(super.tester);

  final newRequestStep2ItemImage =
      find.byKey(WidgetKeys.newRequestStep2ItemImage);
  final newRequestStep2ItemproductImage = find.byKey(WidgetKeys.productImage);
  final newRequestStep2QuantityAndPrice =
      find.byKey(WidgetKeys.newRequestStep2QuantityAndPrice);
  final newRequestStep2DetailsSection =
      find.byKey(WidgetKeys.newRequestStep2DetailsSection);
  final newRequestStep2BonusItemSection =
      find.byKey(WidgetKeys.bonusItemSection);
  Finder returnQtyField(uuid) =>
      find.byKey(WidgetKeys.returnQuantityField(uuid));
  Finder bonusQuantityField(uuid) =>
      find.byKey(WidgetKeys.bonusQuantityField(uuid));
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final newRequestStep2ReasonDropdown =
      find.byKey(WidgetKeys.newRequestStep2ReasonDropdown);
  final newRequestStep2RemoveIcon =
      find.byKey(WidgetKeys.newRequestStep2RemoveIcon);
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final includeBonusButton = find.byKey(WidgetKeys.toggleIncludeBonusButton);
  late Finder _verifyingItem;

  void verifyReturnDetailDisplayed(String materialNumber, String materialName) {
    expect(find.text(materialNumber), findsAtLeastNWidgets(1));
    expect(find.text(materialName), findsAtLeastNWidgets(1));
    expect(newRequestStep2ItemImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2ItemproductImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2QuantityAndPrice, findsAtLeastNWidgets(1));
    expect(newRequestStep2DetailsSection, findsAtLeastNWidgets(1));
  }

  void verifyReturnDetailDisplayedWithBonus(
    String materialNumber,
    String materialName,
  ) {
    expect(find.text(materialNumber), findsWidgets);
    //TODO Marin BE having this issue https://zuelligpharma.atlassian.net/browse/EZRX-25948
    // expect(find.text(materialName), findsWidgets);
    expect(newRequestStep2ItemImage, findsWidgets);
    expect(newRequestStep2ItemproductImage, findsWidgets);
    expect(newRequestStep2QuantityAndPrice, findsWidgets);
    expect(newRequestStep2DetailsSection, findsWidgets);
    expect(newRequestStep2BonusItemSection, findsWidgets);
  }

  List<String> getBonusUUIDList(String uuid) {
    final material = find.byKey(WidgetKeys.returnRequestMaterialCard(uuid));
    final bonuses = tester
        .widget<MaterialInfoWidget>(
          find.descendant(
            of: material,
            matching: find.byType(MaterialInfoWidget),
          ),
        )
        .data
        .bonusItems;

    return bonuses.map((e) => e.uuid).toList();
  }

  bool _bonusIncluded(String uuid) {
    final switchButton = find.descendant(
      of: find.byKey(WidgetKeys.returnRequestMaterialCard(uuid)),
      matching: includeBonusButton,
    );

    return tester.widgetList<SwitchWidget>(switchButton).firstOrNull?.value ??
        false;
  }

  Future<void> startVerifyItem(String uuid, {bool reversed = false}) async {
    _verifyingItem = find.byKey(WidgetKeys.returnRequestMaterialCard(uuid));
    await scrollEnsureFinderVisible(_verifyingItem, reversed: reversed);
  }

  void verifyMaterialBatchExpiryDate(StockInfo stockInfo) => verifyStockInfo(
        stockInfo,
        find.descendant(
          of: _verifyingItem,
          matching: find.byType(MaterialInfoWidget),
        ),
      );

  Future<void> startVerifyBonusItem(String bonusUuid) async {
    _verifyingItem = find.byKey(WidgetKeys.returnRequestBonusCard(bonusUuid));
    await scrollEnsureFinderVisible(_verifyingItem);
  }

  Future<void> tapIncludeBonus() async {
    final switchButton = find.descendant(
      of: _verifyingItem,
      matching: includeBonusButton,
    );
    await tester.tap(switchButton);
    await tester.pumpAndSettle();
  }

  void verifyBonusBatchExpiryDate(StockInfo stockInfo) => verifyStockInfo(
        stockInfo,
        find.descendant(
          of: _verifyingItem,
          matching: find.byType(BonusMaterialInfo),
        ),
      );

  Future<void> enterReturnQuantity(String returnQuantity, String uuid) async {
    final materialTextField = returnQtyField(uuid);
    await scrollEnsureFinderVisible(materialTextField);
    await tester.tap(materialTextField);
    await tester.enterText(materialTextField, returnQuantity);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    if (!_bonusIncluded(uuid)) return;
    for (final bonusUUID in getBonusUUIDList(uuid)) {
      final bonusTextField = returnQtyField(bonusUUID);
      await scrollEnsureFinderVisible(bonusTextField);
      await tester.tap(bonusTextField);
      await tester.enterText(bonusTextField, returnQuantity);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    }
    await scrollEnsureFinderVisible(materialTextField, reversed: true);
  }

  Future<void> selectReturnType(String returnType, String uuid) async {
    final materialReturnType = find.byKey(WidgetKeys.selectByRadio(returnType));
    await scrollEnsureFinderVisible(materialReturnType);
    if (!_bonusIncluded(uuid)) {
      await tester.tap(materialReturnType.first);
      await tester.pumpAndSettle();
      return;
    } else {
      await tester.tap(materialReturnType.first);
      await tester.pumpAndSettle();
      await scrollEnsureFinderVisible(materialReturnType.last);
      await tester.tap(materialReturnType.last);
      await tester.pumpAndSettle();
      await scrollEnsureFinderVisible(materialReturnType.first);
      return;
    }
  }

  Future<void> enterBonusReturnQuantityWithCommercialItem(
    String returnQuantity,
    String uuid,
  ) async {
    final bonusTextField = find.descendant(
      of: bonusQuantityField(uuid),
      matching: returnQtyField(uuid),
    );
    await scrollEnsureFinderVisible(bonusTextField);

    await tester.enterText(bonusTextField, returnQuantity);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  Future<void> selectBonusReasonWithCommercialItem(
    String reason,
    String uuid,
  ) async {
    final bonusTextField = find.descendant(
      of: bonusQuantityField(uuid),
      matching: returnQtyField(uuid),
    );
    await scrollEnsureFinderVisible(bonusTextField);

    await tester.tap(newRequestStep2ReasonDropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text(reason));
    await tester.pumpAndSettle();
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyReturnQuantityCannotExceedBalanceQuantity() {
    expect(
      find.text('Return quantity cannot exceed balance quantity.'.tr()),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> selectReason(String reason, String uuid) async {
    final materialDropdown = find.byKey(WidgetKeys.returnReasonDropdown(uuid));
    await scrollEnsureFinderVisible(materialDropdown);
    await tester.tap(materialDropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text(reason).last);
    await tester.pumpAndSettle();
    if (!_bonusIncluded(uuid)) return;
    for (final bonusUUID in getBonusUUIDList(uuid)) {
      final bonusTextField =
          find.byKey(WidgetKeys.returnReasonDropdown(bonusUUID));
      await scrollEnsureFinderVisible(bonusTextField);
      await tester.tap(bonusTextField);
      await tester.pumpAndSettle();
      await tester.tap(find.text(reason).last);
      await tester.pumpAndSettle();
    }
    await scrollEnsureFinderVisible(materialDropdown, reversed: true);
  }

  void verifyNextToStep3(String materialNumber, String materialName) {
    expect(find.text(materialNumber), findsWidgets);
    //TODO Marin BE having this issue https://zuelligpharma.atlassian.net/browse/EZRX-25948
    // expect(find.text(materialName), findsWidgets);
  }

  Future<void> deleteItem() async {
    expect(newRequestStep2RemoveIcon, findsOneWidget);
    await tester.tap(newRequestStep2RemoveIcon);
    await tester.pumpAndSettle();
    expect(confirmBottomSheetConfirmButton, findsOneWidget);
    await tester.tap(confirmBottomSheetConfirmButton);
    await tester.pumpAndSettle();
  }

  void verifyCannotMoveWithoutReturnQuantity() {
    expect(
      find.text('Return quantity is required field.'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.text('Please ensure all required fields are filled.'.tr()),
      findsOneWidget,
    );
  }

  void verifyCannotMoveWithoutReason() {
    expect(
      find.text('Return reason is required field.'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.text('Please ensure all required fields are filled.'.tr()),
      findsOneWidget,
    );
  }

  void verifyReturnCounterOfferField({
    bool isVisible = true,
    required String uuid,
  }) {
    expect(
      find.byKey(WidgetKeys.requestCounterOfferTextField(uuid)),
      isVisible ? findsAtLeastNWidgets(1) : findsNothing,
    );
  }
}
