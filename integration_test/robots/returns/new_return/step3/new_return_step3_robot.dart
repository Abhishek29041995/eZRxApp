import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';

class NewReturnStep3Robot extends CommonRobot {
  NewReturnStep3Robot(super.tester);

  final page = find.byType(ReturnReviewTab);
  final submitButton = find.byKey(WidgetKeys.submitButton);
  final returnReferenceField = find.byKey(WidgetKeys.returnReferenceField);
  final specialInstructionsField =
      find.byKey(WidgetKeys.specialInstructionsField);
  final newRequestStep3MaterialDetail =
      find.byKey(WidgetKeys.newRequestStep3MaterialDetail);
  final returnFor = find.byKey(WidgetKeys.newRequestReturnFor);
  final newRequestSuccessMessage =
      find.byKey(WidgetKeys.newRequestSuccessMessage);
  final newReturnBonusDetailsCard =
      find.byKey(WidgetKeys.newReturnBonusDetailsCard);
  late Finder _verifyingItem;

  void verifyStep3Visible() {
    expect(returnReferenceField, findsOneWidget);
    expect(specialInstructionsField, findsOneWidget);
    expect(submitButton, findsOneWidget);
    expect(newRequestStep3MaterialDetail, findsWidgets);
    expect(returnFor, findsOneWidget);
  }

  void verifyStep3VisibleWithOnlyBonus() {
    expect(returnReferenceField, findsOneWidget);
    expect(specialInstructionsField, findsOneWidget);
    expect(newReturnBonusDetailsCard, findsOneWidget);
    expect(submitButton, findsOneWidget);
    expect(returnFor, findsOneWidget);
  }

  String grandTotal = '';
  String returnForAddress = '';
  Future<void> tapSubmit() async {
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
  }

  void collectInfoBeforeSubmit() {
    returnForAddress = tester.widget<Text>(returnFor).data!;
    grandTotal = tester
        .widget<RichText>(find.byKey(WidgetKeys.priceComponent).last)
        .text
        .toPlainText();
  }

  void verifySubmitSuccessFully(String shipToAddress) {
    expect(newRequestSuccessMessage, findsOneWidget);
    expect(returnForAddress, contains(shipToAddress));
    final grandTotalSuccessPage = grandTotal = tester
        .widget<RichText>(find.byKey(WidgetKeys.priceComponent).last)
        .text
        .toPlainText();
    expect(grandTotalSuccessPage, equals(grandTotal));
  }

  Future<void> startVerifyItem(String uuid) async {
    _verifyingItem = find.descendant(
      of: page,
      matching: find.byKey(WidgetKeys.returnRequestMaterialCard(uuid)),
    );
    await scrollEnsureFinderVisible(_verifyingItem);
  }

  void verifyMaterialBatchExpiryDate(StockInfo stockInfo) => verifyStockInfo(
        stockInfo,
        find.descendant(
          of: _verifyingItem,
          matching: find.byType(MaterialInfoWidget),
        ),
      );

  Future<void> startVerifyBonusItem(String bonusUuid) async {
    _verifyingItem = find.descendant(
      of: page,
      matching: find.byKey(WidgetKeys.returnRequestBonusCard(bonusUuid)),
    );
    await scrollEnsureFinderVisible(_verifyingItem);
  }

  void verifyBonusBatchExpiryDate(StockInfo stockInfo) => verifyStockInfo(
        stockInfo,
        find.descendant(
          of: _verifyingItem,
          matching: find.byType(BonusMaterialInfo),
        ),
      );
}
