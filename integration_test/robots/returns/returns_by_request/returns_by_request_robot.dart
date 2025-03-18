import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class ReturnsByRequestRobot {
  final WidgetTester tester;

  ReturnsByRequestRobot(this.tester);

  final searchBar = find.byKey(WidgetKeys.returnByRequestSearchBar);
  final exportReturnByRequest = find.byKey(WidgetKeys.exportReturnByRequest);
  final filterButton = find.byKey(WidgetKeys.returnByRequestFilterButton);
  final newRequestButton =
      find.byKey(WidgetKeys.returnByRequestNewRequestButton);
  final item = find.byKey(WidgetKeys.returnRequestTile);
  final itemGroupDate = find.byKey(WidgetKeys.returnRequestGroupDate);
  final returnIdLabel = find.byKey(WidgetKeys.returnRequestTileIdLabel);
  final returnPriceLabel = find.byKey(WidgetKeys.priceComponent);
  final returnStatusLabel = find.byKey(WidgetKeys.returnRequestTileStatus);

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyExportButtonVisible() {
    expect(exportReturnByRequest, findsOneWidget);
  }

  Future<void> tapExportButton() async {
    expect(exportReturnByRequest, findsOneWidget);
    await tester.tap(exportReturnByRequest);
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
    await tester.pumpAndSettle(const Duration(seconds: 1));
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

  void verifyReturnRequestVisible() {
    expect(itemGroupDate, findsAtLeastNWidgets(1));
    expect(item, findsAtLeastNWidgets(1));
    final itemCount = item.evaluate().length;
    // Verify return code
    expect(
      find.descendant(of: item, matching: returnIdLabel),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.returnRequestTileQtyLabel),
      ),
      findsNWidgets(itemCount),
    );
    // Verify status
    expect(
      find.descendant(of: item, matching: returnStatusLabel),
      findsNWidgets(itemCount),
    );
    // Verify price
    expect(
      find.descendant(of: item, matching: returnPriceLabel),
      findsNWidgets(itemCount),
    );
  }

  void verifyNoRecordFoundVisible() {
    expect(item, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text("That didn't match anything".tr()), findsOneWidget);
  }

  void verifyReturnsWithIdVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.returnRequestTileIdLabel &&
            (widget.data ?? '').contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyMarketPlaceLogo({bool isVisible = true}) => expect(
        find.descendant(
          of: item,
          matching: find.byType(MarketPlaceRectangleLogo),
        ),
        isVisible ? findsWidgets : findsNothing,
      );

  void verifyReturnGroupInDateRangeVisible({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyReturnRequestVisible();
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

  void verifyReturnGroupInAmountRangeVisible({
    required double fromAmount,
    required double toAmount,
    required String currency,
  }) {
    verifyReturnRequestVisible();
    final dateText = tester
        .widgetList<RichText>(returnPriceLabel)
        .map((e) => e.text.toPlainText());
    for (final text in dateText) {
      final priceText = text.split('${'Return value: '.tr()}$currency');
      final price = priceText[1].priceValue;
      expect(fromAmount <= price && price <= toAmount, true);
    }
  }

  void verifyReturnsWithStatusVisible(List<String> statuses) {
    verifyReturnRequestVisible();
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: find.byKey(WidgetKeys.returnItemTileStatus),
            matching: find.byType(Text),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(statuses.contains(text), true);
    }
  }

  Future<void> tapFirstReturnVisible() async {
    await tester.tap(item.first);
    await tester.pumpAndSettle();
  }
}
