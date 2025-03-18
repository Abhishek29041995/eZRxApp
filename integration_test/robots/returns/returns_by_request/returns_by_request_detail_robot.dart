import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ReturnsByRequestDetailRobot extends CommonRobot {
  ReturnsByRequestDetailRobot(super.tester);

  final showDetailButton = find.byKey(WidgetKeys.returnDetailShowDetailButton);
  late Finder _verifyingItem;

  void verifyReturnIdVisible(
    String returnId,
  ) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.returnItemDetailReturnId &&
            widget is BalanceTextRow &&
            widget.keyText.contains(returnId),
      ),
      findsOneWidget,
    );
  }

  void verifyRequestDateVisible() {
    expect(
      find.byKey(WidgetKeys.returnRequestDetailRequestDate),
      findsOneWidget,
    );
  }

  void verifyReturnReferenceVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Return reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifySpecialInstructionsVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Special instructions'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyStatusTrackerVisible(String status) {
    expect(
      find.byKey(WidgetKeys.statusTracker(status)),
      findsOneWidget,
    );
  }

  void verifyReturnAddressVisible(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is RichText &&
            widget.text.toPlainText().contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCodeVisible(String customerCode) {
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

  void verifyDeliveryToVisible(String shipToCode) {
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

  void verifySubTotalVisible(String value) {
    final subTotalLabel = find.byKey(WidgetKeys.returnRequestDetailSubTotal);
    expect(subTotalLabel, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalLabel,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotalVisible(String value) {
    final grandTotalLabel =
        find.byKey(WidgetKeys.returnRequestDetailGrandTotal);
    expect(grandTotalLabel, findsOneWidget);
    expect(
      find.descendant(
        of: grandTotalLabel,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyROCreationFailedMessage() => expect(
        find.byKey(WidgetKeys.returnRequestROCreationFailedMessage),
        findsOne,
      );

  Future<void> verifyMaterialVisible({
    required int index,
    required String materialNumber,
  }) async {
    await scrollEnsureFinderVisible(
      find.descendant(
        of: _materialWidget(index),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.commonTileItemLabel &&
              widget is Text &&
              widget.data == materialNumber,
        ),
      ),
    );
  }

  Future<void> startVerifyMaterial({
    required int qty,
    required String materialNumber,
    required String price,
  }) async {
    _verifyingItem = find.byKey(
      WidgetKeys.returnItemDetailMaterial(
        materialNumber,
        qty.toString(),
        price,
      ),
    );
    await scrollEnsureFinderVisible(
      find.descendant(
        of: _verifyingItem,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.commonTileItemLabel &&
              widget is Text &&
              widget.data == materialNumber,
        ),
      ),
    );
  }

  void verifyMarketPlaceLogo() => expect(
        find.descendant(
          of: _verifyingItem,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOne,
      );

  void verifyBatchExpiryDate(StockInfo stockInfo) =>
      verifyStockInfo(stockInfo, _verifyingItem);

  Future<void> verifyMaterialDetailCollapsed(int index, bool isCollapsed) =>
      scrollEnsureFinderVisible(showDetailButton.at(index));

  Future<void> tapShowDetailButton(int index) async {
    await tester.tap(showDetailButton.at(index));
    await tester.pumpAndSettle();
  }

  Finder _materialWidget(int index) =>
      find.byKey(WidgetKeys.returnRequestDetailMaterial(index));

  Future<void> verifyApproverUpdatedTag() async {
    await scrollEnsureFinderVisible(_approvalUpdateFiner);
    expect(_approvalUpdateFiner, findsAny);
  }

  Future<void> tapApproverUpdatedTag() async {
    await tester.tap(_approvalUpdateFiner);
    await tester.pump(Durations.long2);
  }

  void verifyApproverQuantityChangeInfo() {
    final sheetFinder = find.byKey(WidgetKeys.returnSummaryInfoBottomSheet);
    expect(
      find.descendant(
        of: sheetFinder,
        matching: find.textContaining('Request Return quantity :'.tr()),
      ),
      findsOne,
    );
    expect(
      find.descendant(
        of: sheetFinder,
        matching: find.text('Approver updated the QTY'.tr()),
      ),
      findsOne,
    );
  }

  Future<void> tapApprovalGotItButton() async {
    await tester.tap(find.text('Got it'.tr()));
    await tester.pumpAndSettle();
  }

  Finder get _approvalUpdateFiner {
    return find
        .descendant(
          of: find.byType(ReturnOverrideInfoIcon),
          matching: find.text('Approver updated'.tr()),
        )
        .last;
  }

  void verifywareHouseStorageConditionTag() {
    expect(
      find.byKey(WidgetKeys.wareHouseStorageConditionTag),
      findsOneWidget,
    );
  }
}
