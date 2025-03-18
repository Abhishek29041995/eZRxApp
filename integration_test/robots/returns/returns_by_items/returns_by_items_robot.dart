import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ReturnsByItemsRobot extends CommonRobot {
  ReturnsByItemsRobot(super.tester);

  final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByItem);
  final filterButton = find.byKey(WidgetKeys.returnByItemsFilterButton);
  final newRequestButton = find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final item = find.byKey(WidgetKeys.returnItemTile);
  final itemGroupDate = find.byKey(WidgetKeys.returnItemGroupDate);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  late final returnIdLabel = find.descendant(
    of: item,
    matching: find.byKey(WidgetKeys.returnRequestId),
  );

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyExportButtonVisible() {
    expect(exportReturnByItem, findsOneWidget);
  }

  Future<void> tapExportButton() async {
    await tester.tap(exportReturnByItem);
    await tester.pumpAndSettle();
  }

  void verifyInvalidSearchTextMessageVisible() {
    expect(
      find.text('Please enter at least 2 characters.'.tr()),
      findsOneWidget,
    );
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterButtonVisible() {
    expect(filterButton, findsOneWidget);
  }

  void verifyNewRequestButtonVisible() {
    expect(newRequestButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyReturnItemsVisible() {
    expect(itemGroupDate, findsAtLeastNWidgets(1));
    expect(item, findsAtLeastNWidgets(1));
    final itemCount = item.evaluate().length;
    // Verify return code
    expect(returnIdLabel, findsNWidgets(itemCount));
    // Verify material number
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
      findsNWidgets(itemCount),
    );
    // Verify material description
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemTitle),
      ),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemQty),
      ),
      findsNWidgets(itemCount),
    );
    // Verify image
    expect(
      find.descendant(
        of: item,
        matching: find.byType(ProductImage),
      ),
      findsNWidgets(itemCount),
    );
    // Verify batch
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.returnBatchAndExpires),
      ),
      findsNWidgets(itemCount),
    );
    // Verify status
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.returnItemTileStatus),
      ),
      findsNWidgets(itemCount),
    );
  }

  void verifyMarketPlaceLogo({bool isVisible = true}) => expect(
        find.descendant(
          of: item,
          matching: find.byType(MarketPlaceLogo),
        ),
        isVisible ? findsWidgets : findsNothing,
      );

  void verifyBatchExpiryDate({
    required StockInfo stockInfo,
    required int index,
  }) =>
      verifyStockInfo(stockInfo, item.at(index));

  void verifyNoRecordFoundVisible() {
    expect(item, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text("That didn't match anything".tr()), findsOneWidget);
  }

  void verifyReturnsWithProductNameVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemTitle &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnsWithProductCodeVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemLabel &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnsWithIdVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.returnRequestId &&
            (widget.data?.contains(searchKey) ?? false),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnItemWithBonusVisible() {
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.returnItemTileBonusTag),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOutsideReturnPolicy() {
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifywareHouseStorageConditionTag() {
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.wareHouseStorageConditionTag),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnGroupInDateRangeVisible({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyReturnItemsVisible();
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: itemGroupDate,
            matching: find.textContaining('Requested on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Requested on'.tr()} ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyReturnsWithStatusVisible(String status) {
    verifyReturnItemsVisible();
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: find.byKey(WidgetKeys.returnItemTileStatus),
            matching: find.byType(Text),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status, true);
    }
  }

  Future<void> tapFirstReturn() async {
    await tester.tap(item.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstReturnBonusItem() async {
    final firstBonusItem = find.descendant(
      of: item,
      matching: find.byKey(WidgetKeys.returnItemTileBonusTag).first,
    );
    await tester.tap(firstBonusItem);
    await tester.pumpAndSettle();
  }

  Future<void> tapReturnWithMaterialNumber(String materialNumber) async {
    final materialNumberLabel = find.byWidgetPredicate(
      (w) =>
          w.key == WidgetKeys.commonTileItemLabel &&
          w is Text &&
          w.data!.contains(materialNumber),
    );
    await tester.tap(find.descendant(of: item, matching: materialNumberLabel));
    await tester.pumpAndSettle();
  }

  String getReturnIdText({required int index}) =>
      tester.widget<Text>(returnIdLabel.at(index)).data?.split('#').last ?? '';

  void verifyReturnIdTextVisible(String text, {required int index}) {
    expect(
      getReturnIdText(index: index),
      text,
    );
  }

  void verifyReturnIdTextNotVisible(String text, {required int index}) {
    expect(
      returnIdLabel.evaluate().length - 1 < index ||
          getReturnIdText(index: index) != text,
      true,
    );
  }
}
