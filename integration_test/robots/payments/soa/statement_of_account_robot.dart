import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class StatementOfAccountRobot extends CommonRobot {
  StatementOfAccountRobot(super.tester);

  final page = find.byKey(WidgetKeys.soaPage);
  final soaHeaderCustomerCodeKey = find.byKey(
    WidgetKeys.soaHeaderCustomerCodeKey,
  );
  final soaFilterButtonKey = find.byKey(WidgetKeys.soaFilterButton);
  final soaFromDateFilter = find.byKey(WidgetKeys.soaFromDateFieldKey);
  final soaToDateFilter = find.byKey(WidgetKeys.soaToDateFieldKey);
  final soaSearchResultsKey = find.byKey(WidgetKeys.soaSearchResultsKey);
  final soaNewPaymentButtonKey = find.byKey(WidgetKeys.newPaymentButton);
  final soaFilterApplyButtonKey =
      find.byKey(WidgetKeys.soaFilterApplyButtonKey);
  final firstSoaItemKey = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
  final soaDownloadButtonKey = find.byKey(WidgetKeys.soaItemTextKey);
  final soaFilterBottomSheetKey =
      find.byKey(WidgetKeys.soaFilterBottomSheetKey);
  final soaFilterResetButtonKey =
      find.byKey(WidgetKeys.soaFilterResetButtonKey);
  final soaCloseButtonKey = find.byKey(WidgetKeys.closeButton);

  List<String?> getItemList() {
    return tester
        .widgetList<Text>(find.byKey(WidgetKeys.soaItemTextKey))
        .map((e) => e.data)
        .toList();
  }

  void verifySOAPage() {
    expect(page, findsOneWidget);
  }

  void verifySOAShipToAddress(String shipToAddress) {
    expect(find.text(shipToAddress), findsOneWidget);
  }

  void verifySOACustomerCode(String shipToCode) {
    expect(soaHeaderCustomerCodeKey, findsOneWidget);
    final richTextChildren =
        (tester.widget<RichText>(soaHeaderCustomerCodeKey).text as TextSpan)
            .children;
    final shipToCodeText = (richTextChildren!.last as TextSpan).text;
    expect(shipToCodeText, shipToCode);
  }

  void verifySOAFilterButton() {
    if (getItemList().isEmpty) {
      expect(soaFilterButtonKey, findsNothing);
    } else {
      expect(soaFilterButtonKey, findsOneWidget);
    }
  }

  void verifySOAFilterCount(int count) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.soaFilterButton &&
            widget is CustomBadge &&
            widget.count == count,
      ),
      findsOneWidget,
    );
  }

  void verifySOASearchResults() {
    if (getItemList().isEmpty) {
      expect(soaSearchResultsKey, findsNothing);
    } else {
      expect(soaSearchResultsKey, findsWidgets);
    }
  }

  void verifySOANewPaymentButton() {
    expect(soaNewPaymentButtonKey, findsOneWidget);
  }

  void verifySOAFilterBottomSheet() {
    if (getItemList().isEmpty) {
      verifySOAFilterBottomSheetNot();
    } else {
      expect(soaFilterBottomSheetKey, findsOneWidget);
    }
  }

  void verifySOAFilterBottomSheetNot() {
    expect(soaFilterBottomSheetKey, findsNothing);
  }

  void verifySOAItemText(String item) {
    expect(
      tester
          .widget<Text>(
            find.descendant(
              of: firstSoaItemKey,
              matching: soaDownloadButtonKey,
            ),
          )
          .data,
      item,
    );
  }

  void verifySOAItem() {
    if (getItemList().isEmpty) {
      expect(firstSoaItemKey, findsNothing);
    } else {
      expect(firstSoaItemKey, findsOneWidget);
    }
  }

  Future<void> verifyPullToRefresh() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      final item = getItemList().first;
      verifySOAItemText(
        item ?? '',
      );
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, 500),
      );
      await tester.pumpAndSettle();
      verifySOAItemText(
        item ?? '',
      );
    }
  }

  Future<void> verifyAndTapStatementOfAccountDownloadButton() async {
    final soaDownloadButton = find.byKey(
      WidgetKeys.genericKey(key: 'soaDownloadButton#${getItemList().first}'),
    );
    expect(soaDownloadButton, findsOneWidget);
    await tester.tap(soaDownloadButton);
    await verifyCustomSnackBar(message: 'File downloaded successfully'.tr());
    await dismissSnackbar();
  }

  Future<void> tapSOAFilterButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> enterTextSOAFilterDateField() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.enterText(soaFromDateFilter, getItemList().first ?? '');
      await tester.enterText(soaToDateFilter, getItemList().last ?? '');
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOAApplyButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterApplyButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOANewPaymentButton() async {
    await tester.tap(soaNewPaymentButtonKey);
    await tester.pumpAndSettle();
  }

  Future<void> tapSOAResetFilterButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterResetButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOAFilterClosedButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaCloseButtonKey);
      await tester.pumpAndSettle();
    }
  }
}
