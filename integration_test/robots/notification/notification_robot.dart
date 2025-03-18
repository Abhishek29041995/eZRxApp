import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/notification/notification_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class NotificationRobot extends CommonRobot {
  NotificationRobot(super.tester);

  final deleteButton = find.byKey(WidgetKeys.notificationDeleteButton);
  final items = find.byKey(WidgetKeys.notificationItem);
  final itemDescription = find.byKey(WidgetKeys.notificationItemDescription);
  final itemIcon = find.byKey(WidgetKeys.notificationItemIcon);
  final itemTitle = find.byKey(WidgetKeys.notificationItemTitle);
  final itemCreatedAt = find.byKey(WidgetKeys.notificationItemCreatedAt);
  final itemDifferenceTime =
      find.byKey(WidgetKeys.notificationItemDifferenceTime);

  bool checkIfNotificationListEmpty() => items.evaluate().isEmpty;

  void verifyPage() {
    expect(find.byType(NotificationTab), findsOneWidget);
  }

  void verifyScrollList() {
    expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
  }

  void verifyNoRecordFound() => expect(
        find.byKey(WidgetKeys.notificationNotFoundRecordKey),
        findsOneWidget,
      );

  void verifyDeleteButton() {
    expect(deleteButton, findsOneWidget);
  }

  Future<void> scrollAlertNotification() async {
    var alertNotification = _alertNotificationFinder;
    while (alertNotification.evaluate().isNotEmpty) {
      expect(alertNotification, findsWidgets);
      await scrollEnsureFinderVisible(alertNotification.last);
      alertNotification = _alertNotificationFinder;
      if (alertNotification.evaluate().length == 1) {
        break;
      }
    }
  }

  void verifyNotificationItems() {
    expect(
      find.descendant(of: items, matching: itemCreatedAt),
      findsWidgets,
    );
    expect(
      find.descendant(of: items, matching: itemDifferenceTime),
      findsWidgets,
    );
    expect(
      find.descendant(of: items, matching: itemIcon),
      findsWidgets,
    );
    expect(
      find.descendant(of: items, matching: itemTitle),
      findsWidgets,
    );
    expect(
      find.descendant(of: items, matching: itemDescription),
      findsWidgets,
    );
    expect(
      find.descendant(of: items, matching: itemDescription),
      findsWidgets,
    );
  }

  String getNotificationDescription(int index) {
    if (tester.widget<Text>(itemTitle.at(index)).data == 'Alert'.tr()) {
      return tester.widget<Html>(itemDescription.at(index)).data ?? '';
    }
    return tester.widget<Text>(itemDescription.at(index)).data ?? '';
  }

  void verifyNotificationWithDescription(int index, String descriptionText) {
    if (tester.widget<Text>(itemTitle.at(index)).data == 'Alert'.tr()) {
      expect(
        tester.widget<Html>(itemDescription.at(index)).data,
        descriptionText,
      );
    } else {
      expect(
        tester.widget<Text>(itemDescription.at(index)).data,
        descriptionText,
      );
    }
  }

  String getFirstBasicNotificationTitle() {
    final count = itemTitle.evaluate().length;

    for (var i = 0; i < count; i++) {
      final data = tester.widget<Text>(itemTitle.at(i)).data ?? '';
      if (data != 'Alert'.tr()) {
        return data;
      }
    }
    return '';
  }

  Future<void> tapFirstBasicNotificationItem(String title) async {
    await tester.tap(find.text(title).first);
    await tester.pumpAndSettle();
  }

  Future<void> tapNotificationItem(int index) async {
    await tester.tap(items.at(index));
    await tester.pumpAndSettle();
  }

  void verifyRedirectNotAvailableMessage() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.customSnackBar),
        matching: find.text("You don't have access".tr()),
      ),
      findsOneWidget,
    );
  }

  Finder get _alertNotificationFinder => find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.notificationItemTitle &&
            widget is Text &&
            widget.data == 'Alert'.tr(),
      );
}
