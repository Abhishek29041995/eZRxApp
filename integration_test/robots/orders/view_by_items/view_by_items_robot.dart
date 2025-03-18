import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ViewByItemsRobot extends CommonRobot {
  ViewByItemsRobot(super.tester);

  final orderGroups = find.byKey(WidgetKeys.viewByItemsOrderGroupKey);
  final orderItems = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
  final orderId =
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderOrQueueNumber);
  final productName = find.byKey(WidgetKeys.viewOrderByItemTileTitle);
  final productId = find.byKey(WidgetKeys.viewOrderByItemTileLabel);
  final productQty = find.byKey(WidgetKeys.commonTileItemQty);
  final orderStatus = find.byKey(WidgetKeys.orderItemStatusKey);
  final bonusLabel = find.byKey(WidgetKeys.commonTileItemStatusLabel);
  final offerTag = find.byKey(WidgetKeys.offerTag);

  void verifyOrders() {
    verifyOrderGroups();
    verifyOrderItems();
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
    // Verify product name
    expect(
      find.descendant(of: orderItems, matching: productName),
      findsNWidgets(itemCount),
    );
    // Verify product code
    expect(
      find.descendant(of: orderItems, matching: productId),
      findsNWidgets(itemCount),
    );
    // Verify product image
    expect(
      find.descendant(of: orderItems, matching: find.byType(ProductImage)),
      findsNWidgets(itemCount),
    );
    // Verify order status
    expect(
      find.descendant(of: orderItems, matching: orderStatus),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(of: orderItems, matching: productQty),
      findsNWidgets(itemCount),
    );
    // Verify orderID
    expect(
      find.descendant(of: orderItems, matching: orderId),
      findsNWidgets(itemCount),
    );
  }

  void verifyMarketPlaceLogo({bool isVisible = true}) => expect(
        find.descendant(of: orderItems, matching: find.byType(MarketPlaceLogo)),
        isVisible ? findsAtLeast(1) : findsNothing,
      );

  void verifyBonusLabel() {
    expect(bonusLabel, findsAtLeastNWidgets(1));
  }

  Future<void> tapFirstBonusLabel() async {
    await tester.tap(bonusLabel.first);
    await tester.pumpAndSettle();
  }

  void verifyOfferTag() {
    expect(offerTag, findsAtLeastNWidgets(1));
  }

  Future<void> tapFirstOfferTag() async {
    await tester.tap(offerTag.first);
    await tester.pumpAndSettle();
  }

  void verifyOrdersWithProductName(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.viewOrderByItemTileTitle &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOrdersWithProductCode(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.viewOrderByItemTileLabel &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOrdersWithOrderCode(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.viewByItemsOrderDetailOrderOrQueueNumber &&
            widget.text.toPlainText().contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyNoRecordFound() {
    expect(orderGroups, findsNothing);
    expect(orderItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.byKey(WidgetKeys.startBrowsingViewByItem), findsOneWidget);
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

  void verifyOrderWithStatus(List<String> statuses) {
    verifyOrderItems();
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: find.byKey(WidgetKeys.orderItemStatusKey),
            matching: find.byType(Text),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(statuses.any((e) => text.contains(e)), true);
    }
  }

  String getFirstOrderId() {
    final stringText =
        tester.widget<RichText>(orderId.first).text.toPlainText();
    if (stringText.contains('${'Order'.tr()} #')) {
      return stringText.split('${'Order'.tr()} #')[1].substring(0, 4);
    }
    return stringText.split('${'Queue'.tr()} #')[1].substring(0, 4);
  }

  String getFirstProductName() => _getText(productName.first);

  String getFirstProductId({bool enableGMC = false}) {
    final code = _getText(productId.first);
    if (enableGMC) {
      return code.split(' | ').first;
    }
    return code;
  }

  String _getText(Finder finder) {
    final text = tester.widget<Text>(finder).data ?? '';
    if (text.isEmpty) return text;
    final specialCharRegex = RegExp(r'^[^a-zA-Z0-9\s]*');

    //Remove special characters from the beginning of the input string
    //some time we get the material name as ?Alcohol swabs box of 200's
    //but if we search, we should remove the special character at beginning
    return text.replaceFirst(specialCharRegex, '');
  }

  Future<void> tapFirstOrder() async {
    await tester.tap(orderItems.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstOrderWithMaterial(String materialNumber) async {
    await tester.tap(
      find
          .byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.viewOrderByItemTileLabel &&
                widget is Text &&
                (widget.data ?? '').contains(materialNumber),
          )
          .first,
    );
    await tester.pumpAndSettle();
  }

  void verifyTenderContractSection() {
    final itemCount = orderItems.evaluate().length;
    expect(
      find.byKey(WidgetKeys.tenderExpandableSection),
      findsAtLeastNWidgets(itemCount),
    );
  }
}
