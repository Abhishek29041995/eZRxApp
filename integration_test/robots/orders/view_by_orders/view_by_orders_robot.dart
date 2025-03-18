import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ViewByOrdersRobot extends CommonRobot {
  ViewByOrdersRobot(super.tester);

  final orderGroups = find.byKey(WidgetKeys.viewByOrdersGroupKey);
  final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
  final buyAgainButton = find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);
  final status = find.byKey(WidgetKeys.viewByOrderStatusKey);
  final orderCodeLabel = find.byKey(WidgetKeys.viewByOrdersCodeLabelKey);
  final orderQtyLabel = find.byKey(WidgetKeys.viewByOrdersQtyLabelKey);

  void verifyOrders() {
    verifyOrderGroups();
    verifyOrderItems();
  }

  void verifyOrdersForID() {
    verifyOrderGroups();
    verifyOrderItemsForID();
  }

  void verifyOrderGroups() {
    expect(orderGroups, findsAtLeastNWidgets(1));
    final groupCount = orderGroups.evaluate().length;
    expect(
      find.descendant(
        of: orderGroups,
        matching: find.textContaining('Ordered on'.tr()),
      ),
      findsNWidgets(groupCount),
    );
  }

  void verifyOrderItems() {
    expect(orderItems, findsAtLeastNWidgets(1));
    final itemCount = orderItems.evaluate().length;
    expect(
      find.descendant(of: orderItems, matching: orderCodeLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: orderQtyLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: buyAgainButton),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: buyAgainButton),
      findsNWidgets(itemCount),
    );
  }

  void verifyBuyAgainButtonDisabled() {
    expect(
      (tester.widget<OutlinedButton>(find.byType(OutlinedButton))).enabled,
      false,
    );
  }

  void verifyOrderItemsForID() {
    expect(orderItems, findsAtLeastNWidgets(1));
    final itemCount = orderItems.evaluate().length;
    expect(
      find.descendant(of: orderItems, matching: orderCodeLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: orderQtyLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: buyAgainButton),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: status),
      findsNWidgets(itemCount),
    );
  }

  void verifyMarketPlaceLogo({bool isVisible = true}) => expect(
        find.descendant(of: orderItems, matching: find.byType(MarketPlaceLogo)),
        isVisible ? findsAtLeast(1) : findsNothing,
      );

  void verifyNoRecordFound() {
    expect(orderGroups, findsNothing);
    expect(orderItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
  }

  void verifyOrdersWithOrderCode(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.viewByOrdersCodeLabelKey &&
            widget.text.toPlainText().contains(searchKey),
      ),
      findsNWidgets(orderItems.evaluate().length),
    );
  }

  void verifyOrderGroupInDateRange({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyOrderGroups();
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: orderGroups,
            matching: find.textContaining('Ordered on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Ordered on'.tr()} ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyOrderIdText(
    String text, {
    required int index,
    bool isVisible = true,
  }) {
    if (isVisible) {
      expect(getOrderIdText(index: index), text);
    } else {
      expect(
        orderCodeLabel.evaluate().length - 1 < index ||
            getOrderIdText(index: index) != text,
        true,
      );
    }
  }

  String getOrderIdText({required int index}) {
    const suffixText = '#';
    final labelText = tester
        .widget<RichText>(orderCodeLabel.at(index))
        .text
        .toPlainText(includePlaceholders: false);

    return labelText.split(suffixText)[1];
  }

  Future<void> tapFirstOrder() async {
    await tester.tap(orderCodeLabel.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstBuyAgainButton() async {
    await tester.tap(buyAgainButton.first);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.cartPage));
  }

  Future<void> tapFirstBuyAgainButtonForTender() async {
    await tester.tap(buyAgainButton.first);
    await tester.pumpAndSettle();
  }
}
