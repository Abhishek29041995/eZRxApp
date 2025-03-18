import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/full_summary.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountSummaryRootRobot {
  final WidgetTester tester;

  AccountSummaryRootRobot(this.tester);

  final _invoicesTab = find.byKey(WidgetKeys.invoiceTab);
  final _creditTab = find.byKey(WidgetKeys.creditsTab);
  final _summaryTab = find.byKey(WidgetKeys.summaryTab);
  final _page = find.byType(AccountSummary);
  final _invoicesPage = find.byType(AllInvoicesPage);
  final _creditPage = find.byType(AllCreditsPage);
  final _summaryPage = find.byType(FullSummaryPage);

  void verifyTabBar() {
    expect(_invoicesTab, findsOneWidget);
    expect(_creditTab, findsOneWidget);
    expect(_summaryTab, findsOneWidget);
  }

  void verifyRootPage() {
    expect(_page, findsOneWidget);
  }

  void verifyInvoicesPage() {
    expect(_invoicesPage, findsOneWidget);
  }

  void verifyCreditsPage() {
    expect(_creditPage, findsOneWidget);
  }

  void verifySummaryPage() {
    expect(_summaryPage, findsOneWidget);
  }

  Future<void> switchToInvoicesPage() async {
    await tester.tap(_invoicesTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToCreditPage() async {
    await tester.tap(_creditTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToSummaryPage() async {
    await tester.tap(_summaryTab);
    await tester.pumpAndSettle();
  }
}
