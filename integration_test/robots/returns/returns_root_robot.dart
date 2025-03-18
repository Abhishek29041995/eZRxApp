import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class ReturnsRootRobot {
  final WidgetTester tester;

  ReturnsRootRobot(this.tester);

  final page = find.byKey(WidgetKeys.returnRootPage);
  final viewByItemsTab = find.byKey(WidgetKeys.returnByItemTab);
  final viewByRequestTab = find.byKey(WidgetKeys.returnByRequestTab);
  final viewByItemsPage = find.byKey(WidgetKeys.returnByItemPage);
  final viewByRequestPage = find.byKey(WidgetKeys.returnByRequestRootPage);

  void verifyRootPageVisible() {
    expect(page, findsOneWidget);
  }

  void verifyViewByItemsPageVisible() {
    expect(viewByItemsPage, findsOneWidget);
  }

  void verifyViewByRequestPageVisible() {
    expect(viewByRequestPage, findsOneWidget);
  }

  Future<void> switchToViewByItemPage() async {
    await tester.tap(viewByItemsTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToViewByRequestPage() async {
    await tester.tap(viewByRequestTab);
    await tester.pumpAndSettle();
  }

  void verifyTabBarVisible() {
    expect(viewByItemsTab, findsOneWidget);
    expect(viewByRequestTab, findsOneWidget);
  }
}
