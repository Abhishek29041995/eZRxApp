import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class PaymentHomeRobot extends CommonRobot {
  PaymentHomeRobot(super.tester);

  final accountSummaryMenu = find.byKey(WidgetKeys.accountSummaryMenu);
  final paymentSummaryMenu = find.byKey(WidgetKeys.paymentSummaryMenu);
  final claimMenu = find.byKey(WidgetKeys.claimsMenu);
  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);
  final totalOutstanding = find.byKey(WidgetKeys.totalOutstanding);
  final newPaymentButton = find.byKey(WidgetKeys.newPaymentButton);
  final paymentHomeSoa = find.byKey(WidgetKeys.paymentHomeSoa);
  final totalOverdue = find.byKey(WidgetKeys.totalOverdue);
  final totalCreditLimit = find.byKey(WidgetKeys.totalCreditLimit);
  final creditLimitUtilized = find.byKey(WidgetKeys.creditLimitUtilized);
  final creditLimitRemaining = find.byKey(WidgetKeys.creditLimitRemaining);
  final inProgressAmount = find.byKey(WidgetKeys.inProgressAmount);
  final itemStatementAccounts = find.byKey(WidgetKeys.itemStatementAccounts);
  final downloadStatementAccountIcon =
      find.byKey(WidgetKeys.downloadStatementAccountIcon);
  final paymentHomeObscuredAmount =
      find.byKey(WidgetKeys.paymentHomeObscuredAmount);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.paymentsTabPage), findsOneWidget);
  }

  Future<void> tapAccountSummaryMenu() async {
    await tester.tap(accountSummaryMenu);
    await tester.pumpAndSettle();
  }

  Future<void> tapPaymentSummaryMenu() async {
    await tester.tap(paymentSummaryMenu);
    await tester.pumpAndSettle();
  }

  Future<void> tapClaimMenu() async {
    await tester.tap(claimMenu);
    await tester.pumpAndSettle();
  }

  Future<void> tapStatementOfAccountTile() async {
    await tester.tap(statementOfAccountsMenu);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToPaymentSummaryScreen({
    bool isMarketPlace = false,
  }) async {
    final section = find.byKey(
      WidgetKeys.sectionTileIcon(
        (isMarketPlace ? 'MP Payment summary' : 'Payment summary').tr(),
      ),
    );
    await tester.tap(section);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToStatementOfAccountScreen() async {
    final soaSectionFinder =
        find.byKey(WidgetKeys.sectionTileIcon('Statement of accounts'.tr()));
    await scrollEnsureFinderVisible(soaSectionFinder);
    await tester.tap(
      soaSectionFinder,
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapToAllObscureButton({
    bool tapOutstandingSection = true,
    bool tapCreditSection = true,
    bool tapPaymentSummarySection = true,
  }) async {
    if (tapOutstandingSection) {
      await tester.tap(paymentHomeObscuredAmount.first);
      await tester.pump();
    }
    if (tapCreditSection) {
      await tester.tap(paymentHomeObscuredAmount.at(1));
      await tester.pump();
    }
    if (tapPaymentSummarySection) {
      await tester.tap(paymentHomeObscuredAmount.last);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapToAllObscureButtonForID() async {
    await tester.tap(paymentHomeObscuredAmount.first);
    await tester.pump();
    await tester.tap(paymentHomeObscuredAmount.at(1));
    await tester.pumpAndSettle();
  }

  Future<void> downloadFirstStatementAccount() async {
    await tester.dragUntilVisible(
      downloadStatementAccountIcon.first,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -200),
    );
    await tester.pumpAndSettle();
    await tester.tap(downloadStatementAccountIcon.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewPayment() async {
    await tester.tap(newPaymentButton);
    await tester.pumpAndSettle();
  }

  void verifyPaymentsTabPage() {
    expect(find.byKey(WidgetKeys.paymentsTabPage), findsOneWidget);
  }

  void verifyNewPaymentsButton() {
    expect(newPaymentButton, findsOneWidget);
  }

  void verifyPaymentHomeOptionMenu({
    bool verifyClaimsMenu = false,
    bool verifyStatementOfAccountsMenu = true,
    bool verifyPaymentSummaryMenu = true,
    bool verifyAccountSummaryMenu = true,
  }) {
    expect(
      find.byKey(WidgetKeys.accountSummaryMenu),
      verifyAccountSummaryMenu ? findsOneWidget : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.paymentSummaryMenu),
      verifyPaymentSummaryMenu ? findsOneWidget : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.statementOfAccountsMenu),
      verifyStatementOfAccountsMenu ? findsOneWidget : findsNothing,
    );
    expect(
      find.byKey(WidgetKeys.claimsMenu),
      verifyClaimsMenu ? findsOneWidget : findsNothing,
    );
  }

  void verifyPaymentHomeInvoiceCard() {
    expect(totalOutstanding, findsOneWidget);
    expect(totalOverdue, findsOneWidget);
  }

  void verifyPaymentHomeCreditCard() {
    expect(totalCreditLimit, findsOneWidget);
    expect(creditLimitUtilized, findsOneWidget);
    expect(creditLimitRemaining, findsOneWidget);
  }

  void verifyPaymentHomeCreditCardForID() {
    expect(totalCreditLimit, findsNothing);
    expect(creditLimitUtilized, findsNothing);
    expect(creditLimitRemaining, findsNothing);
  }

  void verifyPaymentHomeInProgressCard() {
    expect(find.byKey(WidgetKeys.inProgressAmount), findsOneWidget);
  }

  Future<void> verifyPaymentStatementAccount() async {
    await tester.dragUntilVisible(
      paymentHomeSoa,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -200),
    );
    expect(paymentHomeSoa, findsOneWidget);
  }

  void verifyPaymentHomeInvoiceCardObscure() {
    expect(_getPriceOptionPayment(totalOutstanding), contains('*'));
    expect(_getPriceOptionPayment(totalOverdue), contains('*'));
  }

  void verifyPaymentHomeCreditCardObscure() {
    expect(_getPriceOptionPayment(totalCreditLimit), contains('*'));
    expect(_getPriceOptionPayment(creditLimitUtilized), contains('*'));
    expect(_getPriceOptionPayment(creditLimitRemaining), contains('*'));
  }

  void verifyPaymentSummaryObscure() {
    if (_getPriceOptionPayment(inProgressAmount).contains('NA')) {
      expect(_getPriceOptionPayment(inProgressAmount), contains('NA'));
    } else {
      expect(_getPriceOptionPayment(inProgressAmount), contains('*'));
    }
  }

  void verifyNoObscureTextPresent() {
    expect(find.textContaining('*', findRichText: true), findsNothing);
  }

  String _getPriceOptionPayment(Finder component) {
    return tester
        .widget<RichText>(
          find.descendant(
            of: component,
            matching: find.byKey(WidgetKeys.priceComponent),
          ),
        )
        .toString();
  }
}
