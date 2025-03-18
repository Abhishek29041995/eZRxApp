import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ClaimManagementRobot extends CommonRobot {
  final _claimManagementPage = find.byKey(WidgetKeys.claimManagementPage);
  final _filterButton = find.byKey(WidgetKeys.claimManagementFilterIcon);
  final _claimItem = find.byKey(
    WidgetKeys.claimManagementItem,
  );
  final Finder _searchBar = find.byKey(WidgetKeys.searchBar);
  final _claimItemPrincipalFinder = find.byKey(WidgetKeys.claimItemPrincipal);
  final _claimItemClaimTypeFinder = find.byKey(WidgetKeys.claimItemClaimType);
  final _claimItemIdFinder = find.byKey(WidgetKeys.claimItemId);
  final _claimItemSubmitDateFinder = find.byKey(WidgetKeys.claimItemSubmitDate);
  final _claimItemAmountFinder = find.byKey(WidgetKeys.claimItemAmount);

  final _newClaimButtonFinder = find.byKey(WidgetKeys.newClaimButton);

  ClaimManagementRobot(super.tester);

  void verifyPage() {
    expect(_claimManagementPage, findsOneWidget);
  }

  @override
  void verifySearchBar() {
    expect(_searchBar, findsOneWidget);
  }

  Future<void> searchClaim(String input) async {
    await tester.enterText(_searchBar, input);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyFilterButton() {
    expect(_filterButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(_filterButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: _filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyNewClaimButton() {
    expect(
      find.descendant(
        of: _claimManagementPage,
        matching: _newClaimButtonFinder,
      ),
      findsOneWidget,
    );
  }

  Future<void> tapNewClaimButton() async {
    await tester.tap(
      find.descendant(
        of: _claimManagementPage,
        matching: _newClaimButtonFinder,
      ),
    );
    await tester.pumpAndSettle();
  }

  void verifyNoRecordFound() {
    final widget = find.descendant(
      of: _claimManagementPage,
      matching: find.byType(NoRecordFound),
    );
    expect(widget, findsOneWidget);
    expect(
      find.descendant(
        of: widget,
        matching: find.text("That didn't match anything".tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: widget,
        matching: find.text(noRecordFoundDefaultSubTitle),
      ),
      findsOneWidget,
    );
  }

  @override
  Future<void> pullToRefresh() async {
    await tester.drag(
      find.descendant(
        of: _claimManagementPage,
        matching: find.byKey(WidgetKeys.scrollList),
      ),
      const Offset(0, 500),
    );
    await tester.pumpAndSettle();
  }

  void verifyItems() {
    expect(_claimItem, findsAtLeastNWidgets(1));
    final itemCount = _claimItem.evaluate().length;
    expect(
      find.descendant(of: _claimItem, matching: _claimItemPrincipalFinder),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _claimItem, matching: _claimItemClaimTypeFinder),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _claimItem, matching: _claimItemIdFinder),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _claimItem, matching: _claimItemSubmitDateFinder),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _claimItem, matching: _claimItemAmountFinder),
      findsAtLeastNWidgets(itemCount),
    );
  }

  void verifyItemWithId(String id, bool isCredit) {
    final itemId = 'eczs#$id';
    expect(
      find.descendant(of: _claimItem, matching: find.text(itemId)),
      findsOneWidget,
    );
  }

  void verifyClaimListWithType(String type, {bool isVisible = true}) {
    final statusText = tester
        .widgetList<Text>(
          _claimItemClaimTypeFinder,
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == type, isVisible);
    }
    expect(_claimItem.evaluate().length, isVisible ? statusText.length : 0);
  }

  void verifyItemsWithSearchKey(String searchKey) {
    verifyItems();
    final principalText = tester
        .widgetList<Text>(
          _claimItemPrincipalFinder,
        )
        .map((e) => e.data!);

    for (final text in principalText) {
      expect(text, contains(searchKey));
    }
  }
}
