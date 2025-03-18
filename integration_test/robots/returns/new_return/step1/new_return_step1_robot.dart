import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_item_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common_robot.dart';
import '../../../common/extension.dart';

class NewReturnStep1Robot extends CommonRobot {
  NewReturnStep1Robot(super.tester);

  final searchItem = find.byKey(WidgetKeys.newRequestSearchItem);
  final filterIcon = find.byKey(WidgetKeys.newRequestFilterIcon);
  final listAbleToReturn =
      find.byKey(WidgetKeys.newRequestListItemAbleToReturn);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final returnFor = find.byKey(WidgetKeys.newRequestReturnFor);
  final addressInfoSectionActionLabel =
      find.byKey(WidgetKeys.addressInfoSectionActionLabel);
  final addressInfoSectionCustomerCodeLabel =
      find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel);
  final addressInfoSectionDeliveryToLabel =
      find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel);
  final fromInvoiceDateField = find.byKey(
    WidgetKeys.fromInvoiceDateField,
  );
  final item = find.byKey(WidgetKeys.newReturnItem);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final closeSummaryInfoNewRequestPage =
      find.byKey(WidgetKeys.closeSummaryInfoNewRequestPage);
  final closeStep1 = find.byKey(WidgetKeys.closeButton);
  final cannotMoveToNextStep = find.byKey(WidgetKeys.cannotMoveToNextStep);
  final step2Title = find.byKey(WidgetKeys.newRequestStep2Title);
  final expandableSection = find.byKey(WidgetKeys.expandableSection);
  void verifySearchItemVisible() {
    expect(
      searchItem,
      findsOneWidget,
    );
  }

  String firstItemTitleWithoutFilter = '';

  void verifyFilterIconVisible() {
    expect(
      filterIcon,
      findsOneWidget,
    );
  }

  void verifyNewRequestItems() {
    expect(item, findsWidgets);
  }

  void verifyListAbleToReturnVisible() {
    expect(
      listAbleToReturn,
      findsOneWidget,
    );
  }

  void verifyReturnForVisible(String selectedAddress) {
    expect(
      returnFor,
      findsOneWidget,
    );
    expect(tester.widget<Text>(returnFor).data, contains(selectedAddress));
  }

  void verifyNewReturnStep1Display(String shipToAddress) {
    verifySearchItemVisible();
    verifyNextButtonVisible();
    verifyFilterIconVisible();
    verifyListAbleToReturnVisible();
    verifyReturnForVisible(shipToAddress);
    verifyNextButtonVisible();
  }

  Future<void> tapReturnFor() async {
    expect(
      returnFor,
      findsOneWidget,
    );
    await tester.tap(returnFor);
    await tester.pumpAndSettle();
  }

  void verifyDetailBottomSheetVisible() {
    expect(addressInfoSectionActionLabel, findsOneWidget);
    expect(addressInfoSectionCustomerCodeLabel, findsOneWidget);
    expect(addressInfoSectionDeliveryToLabel, findsOneWidget);
    expect(closeSummaryInfoNewRequestPage, findsOneWidget);
  }

  Future<void> closeBottomSheetDetail() async {
    await tester.tap(closeSummaryInfoNewRequestPage);
    await tester.pumpAndSettle();
  }

  void verifyDetailBottomSheetIsHide() {
    expect(addressInfoSectionActionLabel, findsNothing);
    expect(addressInfoSectionCustomerCodeLabel, findsNothing);
    expect(addressInfoSectionDeliveryToLabel, findsNothing);
    expect(closeSummaryInfoNewRequestPage, findsNothing);
  }

  Future<void> tapFilterIcon() async {
    expect(filterIcon, findsOneWidget);
    await tester.tap(filterIcon);
    await tester.pumpAndSettle(Durations.long4);
  }

  Future<void> tapTheDateField() async {
    expect(fromInvoiceDateField, findsOneWidget);
    await tester.tap(fromInvoiceDateField);
    await tester.pumpAndSettle();
  }

  Future<void> tapApply() async {
    expect(applyButton, findsOneWidget);
    await tester.tap(applyButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapReset() async {
    expect(resetButton, findsOneWidget);
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  void collectTheFirstItemTitleWithoutFilter() {
    expect(item, findsAtLeastNWidgets(1));
    firstItemTitleWithoutFilter = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
  }

  void verifyTheFirstItemAfterReset() {
    final itemTitleAfterReset = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
    expect(itemTitleAfterReset, equals(firstItemTitleWithoutFilter));
  }

  Future<void> verifyTheReturnListBaseOnFilter({
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    expect(item, findsAtLeastNWidgets(1));
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.textContaining('Invoice date'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Invoice date'.tr()}: ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyNextButtonVisible() {
    expect(
      nextButton,
      findsOneWidget,
    );
  }

  void verifyTheFirstItemAfterSearch(String searchKey) {
    //TODO Marin BE having this issue https://zuelligpharma.atlassian.net/browse/EZRX-25948

    // final itemTitleAfterReset = tester
    //     .widgetList<Text>(
    //       find.descendant(
    //         of: item,
    //         matching: find.byKey(WidgetKeys.itemTitleKey),
    //       ),
    //     )
    //     .map((e) => e.data!)
    //     .first;
    // expect(itemTitleAfterReset, contains(searchKey));
  }

  Future<void> tapItemAt({required int index}) async {
    await tester.tap(item.at(index));
    await tester.pumpAndSettle();
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyNoItemFound() {
    expect(item, findsNothing);
  }

  Future<void> pressCloseButtonToolbar() async {
    await tester.tap(closeStep1);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(WidgetKeys.confirmBottomSheetConfirmButton));
    await tester.pumpAndSettle();
  }

  void verifyStep2Visible() {
    expect(step2Title, findsOneWidget);
    final title = tester.widget<Text>(step2Title).data!;
    expect(
      title,
      equals(
        '${'Step'.tr()} 2 ${'of'.tr()} 3: ${'Fill in return details'.tr()}',
      ),
    );
  }

  void verifyCannotMoveToNextScreen() {
    expect(cannotMoveToNextStep, findsOneWidget);
  }

  Future<void> verifyTheFirstItemAfterClearSearch() async {
    final itemTitleAfterReset = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
    expect(itemTitleAfterReset, equals(firstItemTitleWithoutFilter));
  }

  void verifyReturnItemVisible() {
    expect(item, findsAtLeastNWidgets(1));
    // Verify image
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ProductImage &&
            widget.key == WidgetKeys.newReturnItemImage,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material Qty
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.key == WidgetKeys.itemQtyKey,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material number
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.itemMaterialNumberKey,
      ),
      findsAtLeastNWidgets(1),
    );
    //Verify unit price
    expect(
      find.byWidgetPredicate(
        (widget) => widget is ReturnItemPrice,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify total price
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is PriceComponent &&
            widget.key == WidgetKeys.itemTotalPriceKey,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify batch & Expires
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.returnBatchAndExpires,
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyItemMarketPlaceLogo({required int index}) => expect(
        find.descendant(
          of: item.at(index),
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOne,
      );

  void verifyItemBatchExpiryDate(StockInfo stockInfo, {required int index}) =>
      verifyStockInfo(
        stockInfo,
        find.descendant(
          of: item.at(index),
          matching: find.byType(MaterialInfoWidget),
        ),
      );

  void verifyItemBonusBatchExpiryDate(
    StockInfo stockInfo, {
    required int index,
  }) =>
      verifyStockInfo(
        stockInfo,
        find.descendant(
          of: item.at(index),
          matching: find.byType(BonusMaterialInfo),
        ),
      );

  String getItemUUID({required int index}) {
    final returnItemWidget = tester.widget<MaterialInfoWidget>(
      find.descendant(
        of: item.at(index),
        matching: find.byType(MaterialInfoWidget),
      ),
    );

    return returnItemWidget.data.uuid;
  }

  void verifyDetailCollapsed(bool isCollapsed) {
    expect(
      find.descendant(
        of: expandableSection,
        matching:
            find.text(isCollapsed ? 'Show details'.tr() : 'Hide details'.tr()),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnItemWithBonusVisible() {
    // Verify BonusTag
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is StatusLabel && widget.key == WidgetKeys.itemBonusTagKey,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify BonusItem
    expect(
      find.byWidgetPredicate(
        (widget) => widget is BonusMaterialInfo,
      ),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> tapShowDetailButton() async {
    await tester.tap(expandableSection.first);
    await tester.pump();
  }

  void verifyMaterialCannotFromSameSellerErrorMessage({
    bool isVisible = true,
  }) =>
      expect(
        find.text(
          'Please note that ZP and MP products cannot be returned together. Additionally, MP products must be from the same seller in each request.'
              .tr(),
        ),
        isVisible ? findsOne : findsNothing,
      );
}
