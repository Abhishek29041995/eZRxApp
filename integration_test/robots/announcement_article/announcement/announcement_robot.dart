import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class AnnouncementRobot extends CommonRobot {
  AnnouncementRobot(super.tester);

  final itemTitle = find.byKey(WidgetKeys.announcementItemTitleKey);
  final itemDate = find.byKey(WidgetKeys.announcementItemDateKey);
  final itemNewTag = find.byKey(WidgetKeys.announcementItemNewTagKey);
  final filterButton = find.byKey(WidgetKeys.announcementFilterKey);

  void verifyFilterButton() {
    expect(filterButton, findsOneWidget);
  }

  Future<void> tapFirstItem() async {
    await tester.tap(itemTitle.first);
    await tester.pumpAndSettle();
  }

  void verifyItems() {
    final itemCount = itemTitle.evaluate().length;
    expect(itemTitle, findsAtLeastNWidgets(1));
    expect(itemDate, findsNWidgets(itemCount));
  }

  void verifyItemsWithKeyword(String searchKey) {
    verifyItems();
    final titles = tester.widgetList<Text>(itemTitle);
    for (final title in titles) {
      expect(
        (title.data ?? '').toLowerCase(),
        contains(searchKey.toLowerCase()),
      );
    }
  }

  void verifyNoRecordFound() {
    expect(itemTitle, findsNothing);
    expect(
      find.byKey(WidgetKeys.announcementNotFoundRecordKey),
      findsOneWidget,
    );
    expect(
      find.text('No Announcement found'.tr()),
      findsOneWidget,
    );
    expect(
      find.text(noRecordFoundDefaultSubTitle),
      findsOneWidget,
    );
  }
}
