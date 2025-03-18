import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ReturnsByItemsDetailRobot extends CommonRobot {
  ReturnsByItemsDetailRobot(super.tester);

  final copyButton = find.byKey(WidgetKeys.returnItemDetailCopyButton);
  final showDetailButton = find.byKey(WidgetKeys.returnDetailShowDetailButton);
  final showDetailButtonFoBonus =
      find.byKey(WidgetKeys.returnDetailShowDetailButton);
  final _page = find.byType(ReturnRequestSummaryByItemDetails);
  late Finder _verifyingItem;

  void verifyPage() {
    expect(_page, findsOneWidget);
  }

  bool get isReturnDetailPage => _page.evaluate().isNotEmpty;

  void verifyReturnIdVisible(String returnId) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.returnItemDetailReturnId &&
            widget is Text &&
            (widget.data ?? '').contains(returnId),
      ),
      findsOneWidget,
    );
  }

  void verifyRequestDateVisible() {
    expect(
      find.byKey(WidgetKeys.returnItemDetailRequestDate),
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

  void verifyStatusTrackerVisible(String status) {
    expect(
      find.byKey(WidgetKeys.statusTracker(status)),
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

  Future<void> dragToVerifyItemSectionVisible() async {
    await scrollEnsureFinderVisible(
      find.byType(ReturnItemCard),
    );
    await tester.pump();
  }

  Future<void> dragToVerifyBonusSectionVisible() async {
    await scrollEnsureFinderVisible(
      find.byKey(WidgetKeys.returnBonusItemCard),
    );
  }

  void verifyMaterialVisible(String materialNumber, int qty, String price) {
    final material = find.byKey(
      WidgetKeys.returnItemDetailMaterial(
        materialNumber,
        qty.toString(),
        price,
      ),
    );
    _verifyingItem = material;
    expect(_verifyingItem, findsOneWidget);
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

  void verifyMaterialVisibleWithBonus(
    String materialNumber,
    int qty,
    String price,
  ) {
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailMaterial(
          materialNumber,
          qty.toString(),
          price,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailBonusItem,
      ),
      findsOneWidget,
    );
  }

  void verifyOnlyBonusMaterial(
    String materialNumber,
    int qty,
    String price,
  ) {
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailOnlyBonusMaterial(
          materialNumber,
          qty.toString(),
          price,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialDetailCollapsed(bool isCollapsed) {
    expect(
      find.descendant(
        of: showDetailButton,
        matching:
            find.text(isCollapsed ? 'Show details'.tr() : 'Hide details'.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusDetailCollapsed(bool isCollapsed) {
    expect(
      find.descendant(
        of: showDetailButtonFoBonus,
        matching:
            find.text(isCollapsed ? 'Show details'.tr() : 'Hide details'.tr()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapShowDetailButton() async {
    await scrollEnsureFinderVisible(showDetailButton);
    await tester.tap(showDetailButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapToShowDetailForBonus() async {
    final finder = find.descendant(
      of: showDetailButtonFoBonus,
      matching: find.text('Show details'.tr()),
    );
    if (finder.evaluate().isNotEmpty) {
      await scrollEnsureFinderVisible(showDetailButtonFoBonus);
      await tester.tap(showDetailButtonFoBonus);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapToHideDetailForBonus() async {
    final finder = find.descendant(
      of: showDetailButtonFoBonus,
      matching: find.text('Hide details'.tr()),
    );
    if (finder.evaluate().isNotEmpty) {
      await scrollEnsureFinderVisible(showDetailButtonFoBonus);
      await tester.tap(showDetailButtonFoBonus);
      await tester.pumpAndSettle();
    }
  }

  void verifyMaterialPrincipalCode(String code) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Principal code'.tr(), code)),
      findsOneWidget,
    );
  }

  void verifyMaterialPrincipalName(String name) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Principal name'.tr(), name)),
      findsOneWidget,
    );
  }

  void verifyMaterialInvoiceNumber(String number) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Invoice number'.tr(), number)),
      findsOneWidget,
    );
  }

  void verifyMaterialInvoiceDate() {
    expect(
      find.byKey(WidgetKeys.returnItemDetailMaterialInvoiceDate),
      findsOneWidget,
    );
  }

  void verifyMaterialReturnReason(String reason) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Reason'.tr(), reason)),
      findsWidgets,
    );
  }

  void verifyMaterialReturnType(String returnType) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Return type'.tr(), returnType)),
      findsWidgets,
    );
  }

  void verifyMaterialReturnComments(String comment) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Comments'.tr(), comment)),
      findsWidgets,
    );
  }

  Future<void> tapCopyButton() async {
    await tester.tap(copyButton);
    await tester.pumpAndSettle();
  }

  void verifyCopiedTextVisible() {
    final copyButtonText = tester.widget<Text>(copyButton).data;
    expect(copyButtonText, 'Copied'.tr());
  }

  void verifyCopyTextVisible() {
    final copyButtonText = tester.widget<Text>(copyButton).data;
    expect(copyButtonText, 'Copy'.tr());
  }

  Future<void> verifyApproverUpdatedTag() async {
    await scrollEnsureFinderVisible(_approvalUpdateFiner);
    expect(_approvalUpdateFiner, findsOne);
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
