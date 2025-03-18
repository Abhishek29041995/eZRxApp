import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:flutter_test/flutter_test.dart';

class OrdersRootRobot {
  final WidgetTester tester;

  OrdersRootRobot(this.tester);

  final viewByItemsTab = find.byKey(WidgetKeys.viewByItemsTabKey);
  final viewByItemsPage = find.byType(ViewByItemsPage);
  final viewByOrdersTab = find.byKey(WidgetKeys.viewByOrdersTabKey);
  final viewByOrdersPage = find.byType(ViewByOrdersPage);
  final searchBar = find.byKey(WidgetKeys.ordersTabSearchBarKey);
  final filterButton = find.byKey(WidgetKeys.ordersTabFilterButtonKey);

  void verifyPage() {
    expect(find.byType(OrdersTab), findsOneWidget);
  }

  void verifyTabBar() {
    expect(viewByItemsTab, findsOneWidget);
    expect(viewByOrdersTab, findsOneWidget);
  }

  Future<void> switchToViewByItems() async {
    await tester.tap(viewByItemsTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToViewByOrders() async {
    await tester.tap(viewByOrdersTab);
    await tester.pumpAndSettle();
  }

  void verifyViewByItemsPage() {
    expect(viewByItemsPage, findsOneWidget);
  }

  void verifyViewByOrdersPage() {
    expect(viewByOrdersPage, findsOneWidget);
  }

  void verifySearchBar() {
    expect(searchBar, findsOneWidget);
  }

  void verifyFilterButton() {
    expect(filterButton, findsOneWidget);
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

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
    await tester.pumpAndSettle();
  }
}
