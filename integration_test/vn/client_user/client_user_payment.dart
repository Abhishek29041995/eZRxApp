import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/more/profile_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../robots/payments/account_summary/account_credits/account_credits_detail_robot.dart';
import '../../robots/payments/account_summary/account_credits/account_credits_filter_robot.dart';
import '../../robots/payments/account_summary/account_credits/account_credits_robot.dart';
import '../../robots/payments/account_summary/account_invoice/account_invoice_detail_robot.dart';
import '../../robots/payments/account_summary/account_invoice/account_invoice_filter_robot.dart';
import '../../robots/payments/account_summary/account_invoice/account_invoice_robot.dart';
import '../../robots/payments/account_summary/account_summary_root_robot.dart';
import '../../robots/payments/account_summary/account_summary_tab/account_summary_tab_filter_robot.dart';
import '../../robots/payments/account_summary/account_summary_tab/account_summary_tab_robot.dart';
import '../../robots/payments/new_payment/new_payment_robot.dart';
import '../../robots/payments/new_payment/new_payment_step1_robot.dart';
import '../../robots/payments/new_payment/new_payment_step2_robot.dart';
import '../../robots/payments/new_payment/new_payment_step3_robot.dart';
import '../../robots/payments/payment_home_robot.dart';
import '../../robots/payments/payment_summary/payment_detail_robot.dart';
import '../../robots/payments/payment_summary/payment_summary_filter_robot.dart';
import '../../robots/payments/payment_summary/payment_summary_robot.dart';
// import '../../robots/payments/soa/statement_of_account_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryRobot paymentSummaryRobot;
  late PaymentSummaryDetailRobot paymentSummaryDetailRobot;
  // late StatementOfAccountRobot statementAccountRobot;
  late NewPaymentRobot newPaymentRobot;
  late AccountSummaryRootRobot accountSummaryRootRobot;
  late AccountCreditsRobot accountCreditsRobot;
  late AccountCreditDetailsRobot accountCreditDetailsRobot;
  late AccountCreditsFilterRobot accountCreditsFilterRobot;
  late AccountSummaryTabRobot accountSummaryTabRobot;
  late AccountSummaryTabFilterRobot accountSummaryTabFilterRobot;
  late AccountInvoiceRobot accountInvoiceRobot;
  late AccountInvoiceFilterRobot accountInvoiceFilterRobot;
  late AccountInvoiceDetailRobot accountInvoiceDetailRobot;
  late PaymentSummaryFilterRobot paymentSummaryFilterRobot;
  // late StatementOfAccountRobot soaRootRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ProfileRobot profileRobot;
  late MoreRobot moreRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentSummaryRobot = PaymentSummaryRobot(tester);
    // statementAccountRobot = StatementOfAccountRobot(tester);
    newPaymentRobot = NewPaymentRobot(tester);
    accountSummaryRootRobot = AccountSummaryRootRobot(tester);
    accountCreditsRobot = AccountCreditsRobot(tester);
    accountCreditsFilterRobot = AccountCreditsFilterRobot(tester);
    accountCreditDetailsRobot = AccountCreditDetailsRobot(tester);
    accountInvoiceRobot = AccountInvoiceRobot(tester);
    accountInvoiceFilterRobot = AccountInvoiceFilterRobot(tester);
    accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);
    paymentSummaryFilterRobot = PaymentSummaryFilterRobot(tester);
    // soaRootRobot = StatementOfAccountRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    paymentSummaryDetailRobot = PaymentSummaryDetailRobot(tester);
    accountSummaryTabRobot = AccountSummaryTabRobot(tester);
    accountSummaryTabFilterRobot = AccountSummaryTabFilterRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    moreRobot = MoreRobot(tester);
    profileRobot = ProfileRobot(tester);
  }

  //Initialize Variable
  const market = 'Vietnam';
  const username = 'vnclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0000102668';
  const shipToCode = '0071192102';
  const shipToCodeWithCustomerCodeBlocked = '0071192102';
  const blockedShipToCode = '0071210440';
  const shipToAddress = 'LG VINA COSMETICS CO., LTD';
  const currency = 'VND';
  final successSnackbarMessage = 'File downloaded successfully'.tr();

  var loginRequired = true;
  const dateTimeFormat = 'dd/MM/yyyy';

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, market);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
    }
  }

  Future<String> getDateFormatBasedOnUserLanguage() async {
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapProfileTile();
    final language = profileRobot.getLanguage();
    await commonRobot.tapToBackScreen();
    await commonRobot.navigateToScreen(NavigationTab.home);
    return language == 'English' ? 'MM/dd/yyyy' : 'dd/MM/yyyy';
  }

  group('Payment Home Page - ', () {
    Future<void> goToPaymentHomePage(
      WidgetTester tester, {
      String shipToCode = shipToCode,
    }) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);

      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPaymentsTabPage();
    }

    testWidgets('EZRX-T181 | Verify Payments Page', (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyNewPaymentsButton();
      paymentHomeRobot.verifyPaymentHomeOptionMenu(
        verifyStatementOfAccountsMenu: false,
      );
      paymentHomeRobot.verifyPaymentHomeInvoiceCard();
      paymentHomeRobot.verifyPaymentHomeCreditCard();
      paymentHomeRobot.verifyPaymentHomeInProgressCard();
      //TODO:
      //***need help to add soa data on it */
      // await paymentHomeRobot.verifyPaymentStatementAccount();
    });

    testWidgets('EZRX-T182 | Verify Obscure & Download property',
        (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyPaymentHomeInvoiceCardObscure();
      paymentHomeRobot.verifyPaymentHomeCreditCardObscure();
      paymentHomeRobot.verifyPaymentSummaryObscure();

      await paymentHomeRobot.tapToAllObscureButton();
      paymentHomeRobot.verifyNoObscureTextPresent();

      //TODO:
      //***need help to add soa data on it */
      // await paymentHomeRobot.verifyPaymentStatementAccount();
      // await paymentHomeRobot.downloadFirstStatementAccount();

      // await commonRobot.verifyCustomSnackBar(
      //   message: successSnackbarMessage,
      // );
      // await commonRobot.dismissSnackbar();
    });

    testWidgets(
        'EZRX-T183 | Verify Redirection Feature - Payment summary & Statement of accounts & New Payment Button',
        (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyPaymentHomeInProgressCard();

      await paymentHomeRobot.navigateToPaymentSummaryScreen();
      paymentSummaryRobot.verifyPageVisible();
      await commonRobot.tapToBackScreen();

      await paymentHomeRobot.tapNewPayment();
      await newPaymentRobot.verifyPage();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Payment Home Page when customer code is blocked',
        (tester) async {
      await goToPaymentHomePage(
        tester,
        shipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Payment Home Page when ship to code is blocked',
        (tester) async {
      await goToPaymentHomePage(tester, shipToCode: blockedShipToCode);

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  group('Account Summary menu - invoice tab', () {
    final documentDateFrom = DateTime(2020, 11, 12);
    final documentDateTo = DateTime(2024, 2, 12);
    final dueDateFrom = documentDateFrom;
    final dueDateTo = documentDateTo;
    const amountFrom = 23657500.0;
    const amountTo = 23657600.0;
    const invoiceStatus = 'In Progress';
    const invalidLengthSearchKey = '1';
    const invalidSearchKey = '1234567890';

    const invoiceId = '1220027318';

    const invoiceOrderNumber = '0200331045';
    const invoiceGovNo = '0810232717';
    const invoicePoReference = 'NA';
    const invoiceDeliveryInstruction = 'NA';

    const materialGroupIndex = 0;
    const material1Index = 0;
    const materialNumber1 = '21248715';
    const materialQty1 = 10;
    const materialUnitPrice1 = 2253100.0;
    const materialTotalPrice1 = materialUnitPrice1 * materialQty1;

    const invoiceSubtotal = materialTotalPrice1;
    const taxPercentage = 5;

    Future<void> goToAccountSummaryInvoicePage(
      WidgetTester tester, {
      String shipToCode = shipToCode,
    }) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
    }

    Future<void> getFilterDataDocumentDate({
      required String dateTimeFormat,
    }) async {
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
        dateStringFormat: dateTimeFormat,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
    }

    testWidgets('EZRX-T265 | Verify Invoice Page - all initial Fields',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      //verify
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      accountInvoiceRobot.verifyFilterButton();
      accountInvoiceRobot.verifySearchBar();
      accountInvoiceRobot.verifyDownloadButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyNewPaymentButton();
    });

    testWidgets('EZRX-T133 | Verify new Payment Feature', (tester) async {
      //Redirect to invoice page
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();

      //verify
      accountInvoiceRobot.verifyNewPaymentButton();
      await accountInvoiceRobot.tapNewPaymentButton();
      await newPaymentRobot.verifyPage();
    });

    testWidgets('EZRX-T161 | Verify pull to refresh', (tester) async {
      //Redirect to invoice page
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();

      if (accountInvoiceRobot.noRecordFound) {
        accountInvoiceRobot.verifyNoRecordFound();
      }
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyItems(isVn: true);
      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      accountInvoiceRobot.verifySearchBarText(invalidSearchKey);
      accountInvoiceRobot.verifyNoRecordFound();
      await accountInvoiceRobot.pullToRefresh();
      if (accountInvoiceRobot.noRecordFound) {
        accountInvoiceRobot.verifyNoRecordFound();
      } else {
        accountInvoiceRobot.verifyItems(isVn: true);
      }
    });

    testWidgets(
        'EZRX-T129 | Verify search invoice by inputting invalid keyword on Invoices Tab - Unhappy Flow',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyItems(isVn: true);
      await accountInvoiceRobot.searchWithSearchIcon(invalidLengthSearchKey);
      await accountInvoiceRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await accountInvoiceRobot.dismissSnackbar();
      await accountInvoiceRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await accountInvoiceRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await accountInvoiceRobot.dismissSnackbar();
      await accountInvoiceRobot.autoSearch(invalidLengthSearchKey);
      await accountInvoiceRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
        dateStringFormat: dateFormat,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyItems(isVn: true);

      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      await accountInvoiceRobot.waitAutoSearchDuration();
      accountInvoiceRobot.verifyLoadingImage(isVisible: false);
      accountInvoiceRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T130 | Verify search invoice by inputting valid keyword on Invoices Tab - happy Flow',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      //verify
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      await accountInvoiceRobot.searchWithSearchIcon(invoiceId);
      await accountInvoiceRobot.waitAutoSearchDuration();
      accountInvoiceRobot.verifyLoadingImage(isVisible: false);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);

      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      await accountInvoiceRobot.waitAutoSearchDuration();
      accountInvoiceRobot.verifyLoadingImage(isVisible: false);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);

      await accountInvoiceRobot.autoSearch(invoiceId);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);

      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      accountInvoiceRobot.verifyNoRecordFound();
      await accountInvoiceRobot.tapClearSearch();
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
    });

    testWidgets(
        'EZRX-T267 | Verify search invoice by inputting valid keyword on Invoice Tab - on keyboard done',
        (tester) async {
      //Redirect to invoice page
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyItems(isVn: true);

      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      accountInvoiceRobot.verifySearchBarText(invoiceId);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);
    });

    testWidgets('EZRX-T281 | Verify filter tune icon - Filter by status',
        (tester) async {
      const status = 'Overdue';
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapStatusCheckbox(status);
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsWithStatus(status);
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyStatusFilterValue(status, true);
    });

    testWidgets('EZRX-T280 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();

      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.enterFromAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountTo.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      await commonRobot.dismissSnackbar(dismissAll: true);
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyAmountRangeApplied(
        amountFrom.toString(),
        amountTo.toString(),
      );
    });

    testWidgets('EZRX-T278 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      //verify
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
        dateStringFormat: dateFormat,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsInDocumentDateRange(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDocumentDateRangeApplied(
        documentDateFrom.displayDate,
        documentDateTo.displayDate,
      );
    });

    testWidgets('EZRX-T279 | Verify filter tune icon - Filter by due date',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDueDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: dueDateFrom,
        toDate: dueDateTo,
        dateStringFormat: dateFormat,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItems(isVn: true);
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDueDateRangeApplied(
        dueDateFrom.displayDate,
        dueDateTo.displayDate,
      );
    });

    testWidgets(
        'EZRX-T277 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyItems(
        isVn: true,
      );
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.enterFromAmount(amountTo.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceFilterRobot.verifyInvalidAmountErrorVisible();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
        dateStringFormat: dateFormat,
      );
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
        dateStringFormat: dateFormat,
      );
      await accountInvoiceFilterRobot.tapDueDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
        dateStringFormat: dateFormat,
      );
    });

    testWidgets('EZRX-T132 | Verify Invoice Detail Page', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify
      accountInvoiceRobot.verifyItems(isVn: true);
      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      await accountInvoiceRobot.tapFirstItem();
      accountInvoiceDetailRobot.verifyPage();
      accountInvoiceDetailRobot.verifyInvoiceDetails(
        invoiceId,
        invoiceStatus,
        invoiceOrderNumber,
        isVn: true,
        govNo: invoiceGovNo,
      );
      accountInvoiceDetailRobot.verifyHyperLinkToOrderDetails();
      await accountInvoiceDetailRobot.redirectToOrderDetails();

      viewByOrdersDetailRobot.verifyOrderId(invoiceOrderNumber);
      viewByOrdersDetailRobot.verifyOrderDate();
      viewByOrdersDetailRobot.verifyPoReference(invoicePoReference);
      viewByOrdersDetailRobot
          .verifyDeliveryInstructions(invoiceDeliveryInstruction);
      viewByOrdersDetailRobot.verifyOrderAddress(shipToAddress);
      viewByOrdersDetailRobot.verifyCustomerCode(customerCode);
      viewByOrdersDetailRobot.verifyDeliveryTo(shipToCode);
      await viewByOrdersDetailRobot.dragToVerifySummary();
      viewByOrdersDetailRobot
          .verifySubTotal(invoiceSubtotal.excludeTax().priceDisplay(currency));
      viewByOrdersDetailRobot.verifyTax(
        invoiceSubtotal.taxValue(taxPercentage).priceDisplay(currency),
      );
      viewByOrdersDetailRobot.verifyGrandTotal(
        invoiceSubtotal.includeTax(taxPercentage).priceDisplay(currency),
      );

      await viewByOrdersDetailRobot.dragToVerifyItemsSection();
      await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber1);
      viewByOrdersDetailRobot.verifyQty(materialQty1);
      viewByOrdersDetailRobot
          .verifyMaterialTotalPrice(materialTotalPrice1.priceDisplay(currency));

      viewByOrdersDetailRobot.verifyBuyAgainButton();
      await commonRobot.tapToBackScreen();

      accountInvoiceDetailRobot.verifyCustomerCode(customerCode);
      accountInvoiceDetailRobot.verifyDeliveryTo(shipToCode);
      accountInvoiceDetailRobot.verifyOrderAddress(shipToAddress);
      accountInvoiceDetailRobot.verifySubTotal(
        invoiceSubtotal.excludeTax().priceDisplay(currency),
      );
      accountInvoiceDetailRobot.verifyGrandTotal(
        invoiceSubtotal.includeTax(taxPercentage).priceDisplay(currency),
      );
      await accountInvoiceDetailRobot.verifyMaterial(
        materialGroupIndex,
        material1Index,
      );
      accountInvoiceDetailRobot.verifyMaterialNumber(materialNumber1);
      await accountInvoiceDetailRobot.verifyMaterialQty(materialQty1);
      accountInvoiceDetailRobot.verifyMaterialUnitPrice(
        materialUnitPrice1.priceDisplay(currency),
      );
      accountInvoiceDetailRobot.verifyMaterialTotalPrice(
        materialTotalPrice1.priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T560 | Export Button Feature - Download Invoices',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await getFilterDataDocumentDate(dateTimeFormat: dateFormat);

      //verify download success
      accountInvoiceRobot.verifyDownloadButton();
      await accountInvoiceRobot.tapDownloadButton();
      await commonRobot.verifyCustomSnackBar(
        message: successSnackbarMessage,
      );
      await commonRobot.dismissSnackbar();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in invoices tab when customer code is blocked',
        (tester) async {
      await goToAccountSummaryInvoicePage(
        tester,
        shipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in invoices tab when ship to code is blocked',
        (tester) async {
      await goToAccountSummaryInvoicePage(
        tester,
        shipToCode: blockedShipToCode,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  group('Account summary menu - credit tab', () {
    //date
    final currentDate = DateTime.now();
    final pastTwentyYearsDate =
        currentDate.subtract(const Duration(days: 7200));
    const inValidCreditId = '1232136712';
    //material info
    const creditId = '0580000003';
    const creditStatus = 'Cleared';
    final creditPrice = 2643391.0.priceDisplay(currency);

    Future<void> applyFilterDateToGetDataIfPresent({
      DateTime? fromDate,
      DateTime? toDate,
      required String dateFormat,
    }) async {
      accountCreditsRobot.verifyFilterTuneIcon();
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      await accountCreditsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate ?? pastTwentyYearsDate,
        toDate: toDate ?? currentDate,
        dateStringFormat: dateFormat,
      );
      accountCreditsFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate?.displayDate ?? pastTwentyYearsDate.displayDate,
        toDate: toDate?.displayDate ?? currentDate.displayDate,
      );
      await accountCreditsFilterRobot.tapApplyButton();
      //verify filter applied count
      accountCreditsRobot.verifyFilterAppliedCount(1);
      //verify at least one credit item
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItemsList();
      }
    }

    testWidgets('EZRX-T264 | verify Credit Page - all initial Fields',
        (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //search bar
      accountCreditsRobot.verifyCreditSearchBar();
      //filter
      accountCreditsRobot.verifyFilterTuneIcon();
      // accountCreditsRobot.verifyFilterAppliedCount(0);
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      accountCreditsFilterRobot.verifyDefaultFilterApplied();
      await accountCreditsFilterRobot.tapCloseButton();
      accountCreditsFilterRobot.verifyCreditsFilter(isVisible: false);
      //download button
      accountCreditsRobot.verifyDownloadButton();
      //new payment button
      accountCreditsRobot.verifyNewPaymentButton();
    });

    testWidgets(
        'EZRX-T158 | Verify search credits by inputting invalid keyword on Credits Tab - Unhappy Flow',
        (tester) async {
      const inValidShortText = '1';
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //search bar
      accountCreditsRobot.verifyCreditSearchBar();
      await commonRobot.autoSearch(inValidShortText);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
      await commonRobot.searchWithKeyboardAction(inValidShortText);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();

      //No credit found - keyboard done
      await commonRobot.searchWithKeyboardAction(inValidCreditId);
      accountCreditsRobot.verifyNoCreditFound();
      await commonRobot.tapClearSearch();

      //No credit found - auto search
      await commonRobot.autoSearch(inValidCreditId);
      accountCreditsRobot.verifyNoCreditFound();
      await commonRobot.tapClearSearch();

      //No credit found - search icon
      await commonRobot.searchWithSearchIcon(inValidCreditId);
      accountCreditsRobot.verifyNoCreditFound();
      await commonRobot.tapClearSearch();
    });

    testWidgets(
        'EZRX-T266 | Verify search credit by inputting valid keyword on Credits Tab - on keyboard done',
        (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();
      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
    });

    testWidgets(
        'EZRX-T159 | Verify search credit by inputting valid keyword on Credits Tab - Happy flow - Every feature',
        (tester) async {
      const govNumber = '';
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();
      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItemGovNumberForVN(creditId, govNumber);
      }
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on auto search
      await commonRobot.autoSearch(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on search icon
      await commonRobot.searchWithSearchIcon(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      await commonRobot.tapClearSearch();

      //search bar - combine keyboard done & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      await commonRobot.tapClearSearch();

      //search bar - combine search icon & auto search
      await commonRobot.searchWithSearchIcon(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      await commonRobot.tapClearSearch();
    });

    testWidgets('EZRX-T162 | verify pull to refresh', (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(inValidCreditId);
      accountCreditsRobot.verifyNoCreditFound();
      await commonRobot.pullToRefresh();
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItemsList();
      }
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      accountCreditsFilterRobot.verifyDefaultFilterApplied();
      await accountCreditsFilterRobot.tapCloseButton();
    });

    testWidgets(
        'EZRX-T164 | Verify new Payment Button Feature - Create new payment',
        (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //Tap on new payment button
      await accountCreditsRobot.tapPaymentButton();

      //verify new payment page
      await newPaymentRobot.verifyPage();

      //close
      await newPaymentRobot.tapCloseButton();

      //verify credit page
      accountCreditsRobot.verify();
    });

    // TODO: failing right now as Mobile have issue, asked wasim & ujwal to create bug ticket

    testWidgets('EZRX-T169 | verify Credits Detail Page', (tester) async {
      //variables
      const documentType = 'Credit memo';
      const referenceNumber = 'NA';
      // const documentDate = '23 Jun 2017'; //we need to cover once BE resolve
      const returnMaterialNumber1 = '11002232';
      const returnMaterialNumber2 = '13024707';
      const returnMaterialNumber3 = '13025839';
      const returnQuantity1 = 2;
      const returnQuantity2 = 1;
      const returnQuantity3 = 1;
      const returnUnitPrice1 = 94.66;
      const returnUnitPrice2 = 398.89;
      const returnUnitPrice3 = 483.55;

      const returnMaterialTotalPrice1 = (returnUnitPrice1 * returnQuantity1);
      const returnMaterialTotalPrice2 = (returnUnitPrice2 * returnQuantity2);
      const returnMaterialTotalPrice3 = (returnUnitPrice3 * returnQuantity3);

      const totalReturnQuantity = 3;

      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);

      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //verify item
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      }
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //Tap on first item after search
        await accountCreditsRobot.tapFirstCreditItem();

        //verify Details page
        accountCreditDetailsRobot.verify();
        accountCreditDetailsRobot.verifyCreditDetailId(creditId);
        accountCreditDetailsRobot.verifyCreditDetailStatus(creditStatus);
        accountCreditDetailsRobot.verifyCreditDetailDocumentDate();
        accountCreditDetailsRobot.verifyCreditDetailDocumentType(documentType);
        accountCreditDetailsRobot
            .verifyCreditDetailReferenceNumber(referenceNumber);
        accountCreditDetailsRobot.verifyCreditDetails(documentType);
        //verify address
        accountCreditDetailsRobot.verifyCustomerCode(customerCode);
        accountCreditDetailsRobot.verifyOrderAddress(shipToAddress);
        accountCreditDetailsRobot.verifyDeliveryTo(shipToCode);
        //credit summary
        accountCreditDetailsRobot
            .verifyCreditItemSubtotalTotalPrice(creditPrice);
        accountCreditDetailsRobot.verifyCreditItemTotalPrice(creditPrice);
        //return items
        accountCreditDetailsRobot.verifyReturnItems(totalReturnQuantity);
        await accountCreditDetailsRobot.verifyReturnMaterial(
          returnMaterialNumber1,
          returnQuantity1,
          returnUnitPrice1.priceDisplay(currency),
          returnMaterialTotalPrice1.priceDisplay(currency),
        );
        await accountCreditDetailsRobot.verifyReturnMaterial(
          returnMaterialNumber2,
          returnQuantity2,
          returnUnitPrice2.priceDisplay(currency),
          returnMaterialTotalPrice2.priceDisplay(currency),
        );
        await accountCreditDetailsRobot.verifyReturnMaterial(
          returnMaterialNumber3,
          returnQuantity3,
          returnUnitPrice3.priceDisplay(currency),
          returnMaterialTotalPrice3.priceDisplay(currency),
        );
      }
    });

    testWidgets('EZRX-T268 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(
        dateFormat: dateFormat,
        fromDate: pastTwentyYearsDate,
        toDate: currentDate,
      );
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //verify Document Date in range
        accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
          fromDate: pastTwentyYearsDate,
          toDate: currentDate,
        );
      }
    });

    testWidgets('EZRX-T270 | Verify filter tune icon - Filter by status',
        (tester) async {
      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply status - Cleared
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(creditStatus);
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      accountCreditsRobot.verifyCreditsItemListWithStatus(creditStatus);
    });

    testWidgets('EZRX-T269 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      const fromAmount = '2643300';
      const toAmount = '2643500';

      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //Tap on filter icon
        await accountCreditsRobot.tapFilterTuneIcon();

        //Apply status - Amount
        await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
        await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
        accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
          fromAmount: fromAmount,
          toAmount: toAmount,
        );
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(2);
        //verify amount credit filter list
        accountCreditsRobot.verifyCreditsInAmountRange(
          fromAmount: double.parse(fromAmount),
          toAmount: double.parse(toAmount),
          currency: currency,
        );
      }
    });

    testWidgets('EZRX-T178 | Verify filter tune icon - all features happy flow',
        (tester) async {
      //variable
      final fromDate = DateTime(2016, 10, 10);
      final toDate = DateTime(2024, 2, 15);
      const clearedStatus = 'Cleared';
      const openStatus = 'Open';
      const fromAmount = '20000';
      const toAmount = '2643600';

      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(
        dateFormat: dateFormat,
        fromDate: fromDate,
        toDate: toDate,
      );
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //verify document date & status filter applied
        accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );

        //Tap on filter icon
        await accountCreditsRobot.tapFilterTuneIcon();
        //Apply status - cleared
        accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, false);
        await accountCreditsFilterRobot
            .tapToChangeStatusCheckbox(clearedStatus);
        accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
        await accountCreditsFilterRobot.tapApplyButton();
        //verify clear status credit filter list
        accountCreditsRobot.verifyCreditsItemListWithStatus(clearedStatus);
        accountCreditsRobot.verifyFilterAppliedCount(1);

        //Tap on filter icon
        await accountCreditsRobot.tapFilterTuneIcon();
        //Apply status - open
        accountCreditsFilterRobot.verifyStatusFilter(openStatus, false);
        await accountCreditsFilterRobot.tapToChangeStatusCheckbox(openStatus);
        accountCreditsFilterRobot.verifyStatusFilter(openStatus, true);
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyCreditsItemListWithStatus(openStatus);
        accountCreditsRobot.verifyFilterAppliedCount(1);

        //Tap on filter icon
        await accountCreditsRobot.tapFilterTuneIcon();

        //Apply status - Amount
        await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
        await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
        accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
          fromAmount: fromAmount,
          toAmount: toAmount,
        );
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        //verify amount credit filter list
        accountCreditsRobot.verifyCreditsInAmountRange(
          fromAmount: double.parse(fromAmount),
          toAmount: double.parse(toAmount),
          currency: currency,
        );

        //verify reset feature
        await accountCreditsRobot.tapFilterTuneIcon();
        await accountCreditsFilterRobot.tapResetButton();
        //verify credit item list
        if (accountCreditsRobot.noCreditFound) {
          accountCreditsRobot.verifyNoCreditFound();
        } else {
          accountCreditsRobot.verifyCreditItemsList();
        }
        //verify filter
        await accountCreditsRobot.tapFilterTuneIcon();
        accountCreditsFilterRobot.verifyDefaultFilterApplied();
        await accountCreditsFilterRobot.tapCloseButton();
      }
    });

    testWidgets(
        'EZRX-T271 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      //variable

      const fromAmount = '1100.0';
      const toAmount = '1000.0';

      //Redirect to account summary credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      //filter applied
      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);
      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply status - cleared
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(creditStatus);
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      //verify clear status credit filter list
      accountCreditsRobot.verifyCreditsItemListWithStatus(
        creditStatus,
        isVisible: true,
      );
      accountCreditsRobot.verifyFilterAppliedCount(1);

      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
      await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
      accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: fromAmount,
        toAmount: toAmount,
      );
      await accountCreditsFilterRobot.tapApplyButton();
      accountCreditsFilterRobot.verifyInvalidAmountError();
    });

    testWidgets('EZRX-T561 | Export Button Feature - Download Credits',
        (tester) async {
      //Redirect to credit page
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();

      await applyFilterDateToGetDataIfPresent(dateFormat: dateFormat);

      //verify download success
      accountCreditsRobot.verifyDownloadButton();
      await accountCreditsRobot.tapDownloadButton();
      await commonRobot.verifyCustomSnackBar(
        message: successSnackbarMessage,
      );
      await commonRobot.dismissSnackbar();
    });
  });

  group('Account Summary menu - summary tab', () {
    const creditIdStatus = 'Overdue';

    const debitId = '1220027318';
    const emptyReferenceListString = 'NA';

    final fromDate = DateTime(2000, 1, 15);
    final toDate = DateTime.now();
    const inValidCreditId = '1232136712';

    Future<void> goToAccountSummaryPage(
      WidgetTester tester, {
      String shipToCode = shipToCode,
    }) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToSummaryPage();
      accountSummaryRootRobot.verifySummaryPage();
      accountSummaryTabRobot.verifyPage();
    }

    Future<void> applyFilterDateToGetData({
      required DateTime fromDate,
      required DateTime toDate,
      required bool isDocumentDate,
      required String dateFormat,
    }) async {
      accountSummaryTabRobot.verifyFilterButton();
      await accountSummaryTabRobot.tapFilterButton();
      accountSummaryTabFilterRobot.verifyCreditsFilter();
      if (isDocumentDate) {
        await accountSummaryTabFilterRobot.tapDocumentDateField();
      } else {
        await accountSummaryTabFilterRobot.tapDueDateField();
      }
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: dateFormat,
      );
      await accountSummaryTabFilterRobot.tapApplyButton();
    }

    Future<void> verifySummaryStatusCheck(
      String creditStatus, {
      bool afterVerifyUncheckStatus = true,
    }) async {
      await accountSummaryTabRobot.tapFilterButton();
      accountSummaryTabFilterRobot.verifyStatusFilterValue(
        creditStatus,
        false,
      );
      await accountSummaryTabFilterRobot.tapStatusCheckbox(creditStatus);
      accountSummaryTabFilterRobot.verifyStatusFilterValue(
        creditStatus,
        true,
      );
      await accountCreditsFilterRobot.tapApplyButton();
      accountSummaryTabRobot.verifyCreditsItemListWithStatus(creditStatus);
      if (afterVerifyUncheckStatus) {
        await accountSummaryTabRobot.tapFilterButton();
        await accountSummaryTabFilterRobot.tapStatusCheckbox(creditStatus);
        accountSummaryTabFilterRobot.verifyStatusFilterValue(
          creditStatus,
          false,
        );
        await accountCreditsFilterRobot.tapApplyButton();
      }
    }

    testWidgets(
      'EZRX-T548 | verify summary page - all initial Fields',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        commonRobot.verifySearchBar();
        accountSummaryTabRobot.verifyDownloadButton();
        accountSummaryTabRobot.verifyFilterButton();
        accountSummaryTabRobot.verifyFilterApplied(1);
        accountSummaryTabRobot.verifyNewPaymentButton();
        await accountSummaryTabRobot.tapFilterButton();
        accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
      },
    );

    testWidgets(
      'EZRX-T566 | Verify Detail Feature - show reference details with empty reference number',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        //Filter applied to get cleared credit
        await accountSummaryTabRobot.tapFilterButton();
        accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
        await accountSummaryTabFilterRobot.tapStatusCheckbox(creditIdStatus);
        await accountSummaryTabFilterRobot.tapApplyButton();

        //search credit Cleared Id
        await commonRobot.searchWithKeyboardAction(debitId);

        accountSummaryTabRobot.verifyExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(
          referenceListString: emptyReferenceListString,
        );
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await commonRobot.tapClearSearch();
        //Filter applied to get cleared credit
        await accountSummaryTabRobot.tapFilterButton();
        accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
      },
    );

    // TODO: Enable when having credit with reference data
    // testWidgets(
    //   'EZRX-T566 | Verify Detail Feature - show reference details with Reference List',
    //   (tester) async {
    //     //Got to Summary Page
    //     await goToAccountSummaryPage(tester, shipToCode: refNumberShipToCode);

    //     //Filter applied to get cleared credit
    //     await accountSummaryTabRobot.tapFilterButton();
    //     accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
    //     await accountSummaryTabFilterRobot.tapStatusCheckbox(creditIdStatus);
    //     await accountSummaryTabFilterRobot.tapApplyButton();

    //     //search credit Cleared Id
    //     await commonRobot.searchWithKeyboardAction(creditIdWithReference);

    //     accountSummaryTabRobot.verifyExpandableDetailsButton();
    //     accountSummaryTabRobot.displayDetails(isHidden: true);
    //     await accountSummaryTabRobot.tapExpandableDetailsButton();
    //     accountSummaryTabRobot.displayDetails(
    //       referenceListString: referenceList,
    //     );
    //     await accountSummaryTabRobot.tapExpandableDetailsButton();
    //     accountSummaryTabRobot.displayDetails(isHidden: true);
    //     await commonRobot.tapClearSearch();
    //     accountSummaryTabRobot.verifyItems();
    //   },
    // );

    testWidgets(
      'EZRX-T549 | Verify search summary by inputting invalid keyword on Summary Tab - Unhappy Flow',
      (tester) async {
        const invalidSearchKey = '000000000';
        const inValidShortText = '1';
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        commonRobot.verifySearchBar();
        await commonRobot.autoSearch(inValidShortText);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        await commonRobot.searchWithKeyboardAction(inValidShortText);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.dismissSnackbar(dismissAll: true);

        // No payment summary found - keyboard done
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        accountSummaryTabRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        //No payment summary found - auto search
        await commonRobot.autoSearch(invalidSearchKey);
        accountSummaryTabRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        //No payment summary found - search icon
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        accountSummaryTabRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
      },
    );

    testWidgets(
        'EZRX-T550 | Verify search summary by inputting valid keyword on Summary Tab - on keyboard done',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      commonRobot.verifySearchBar();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(debitId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
    });

    testWidgets(
        'EZRX-T567 | Verify new Payment Button Feature - Create new payment',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //Tap on new payment button
      await accountSummaryTabRobot.tapNewPaymentButton();

      //verify new payment page
      await newPaymentRobot.verifyPage();

      //close
      await newPaymentRobot.tapCloseButton();

      //verify credit page
      accountSummaryTabRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T551 | Verify search summary by inputting valid keyword on Summary Tab - Happy flow - Every feature',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(debitId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on auto search
      await commonRobot.autoSearch(debitId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on search icon
      await commonRobot.searchWithSearchIcon(debitId);
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar - combine keyboard done & auto search
      await commonRobot.searchWithKeyboardAction(debitId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar - combine search icon & auto search
      await commonRobot.searchWithSearchIcon(debitId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();
    });

    testWidgets('EZRX-T553 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToSummaryPage();
      accountSummaryRootRobot.verifySummaryPage();
      accountSummaryTabRobot.verifyPage();

      //filter applied
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
        dateFormat: dateFormat,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );
    });

    testWidgets('EZRX-T568 | Verify filter tune icon - Filter by due date',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToSummaryPage();
      accountSummaryRootRobot.verifySummaryPage();
      accountSummaryTabRobot.verifyPage();

      //filter applied
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: false,
        dateFormat: dateFormat,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );
    });

    testWidgets('EZRX-T570 | Verify filter tune icon - all features',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToSummaryPage();
      accountSummaryRootRobot.verifySummaryPage();
      accountSummaryTabRobot.verifyPage();

      //filter applied - Document Date
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
        dateFormat: dateFormat,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );

      accountSummaryTabRobot.verifyFilterApplied(1);
      //filter applied Document Date
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: false,
        dateFormat: dateFormat,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );

      accountSummaryTabRobot.verifyFilterApplied(1);

      await verifySummaryStatusCheck(
        creditIdStatus,
        afterVerifyUncheckStatus: false,
      );
      accountSummaryTabRobot.verifyFilterApplied(1);
    });

    testWidgets('EZRX-T562 | Export Button Feature - Download Summary',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //verify download success
      accountSummaryTabRobot.verifyDownloadButton();
      await accountSummaryTabRobot.tapDownloadButton();
      await commonRobot.verifyCustomSnackBar(
        message: successSnackbarMessage,
      );
      await commonRobot.dismissSnackbar();
    });

    testWidgets('EZRX-T552 | verify pull to refresh', (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(inValidCreditId);
      accountSummaryTabRobot.verifyNoRecordFound();
      await commonRobot.pullToRefresh();
      await accountSummaryTabRobot.tapFilterButton();
      accountSummaryTabFilterRobot.verifyCreditsFilter();
      accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
      await accountSummaryTabFilterRobot.tapCloseIcon();
    });

    testWidgets('EZRX-T572 | verify summary detail page - invoice and credits',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);
      commonRobot.verifySearchBar();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(debitId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await accountSummaryTabRobot.tapItemWithId(debitId, false);
      accountInvoiceDetailRobot.verifyPage();
      await commonRobot.tapToBackScreen();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in summary detail page when customer code is blocked',
        (tester) async {
      await goToAccountSummaryPage(
        tester,
        shipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in summary detail page when ship to code is blocked',
        (tester) async {
      await goToAccountSummaryPage(
        tester,
        shipToCode: blockedShipToCode,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  group('Payment summary menu - ', () {
    const invalidSearchKey = 'invalid keyword';
    const invalidLengthSearchKey = 'a';
    const validLengthSearchKey = 'ab';
    final fromDate = DateTime.now().subtract(const Duration(days: 3600));
    final toDate = DateTime.now().subtract(const Duration(days: 2));
    const fromAmount = '500.123400';
    const toAmount = '1000.20';
    const invalidToAmount = '1';
    const formattedFromAmount = '500.1234';
    const formattedToAmount = '1000.2';

    double totalPrice;

    const filterOption = ['In Progress', 'Failed', 'Processed', 'Successful'];

    Future<void> goToPaymentSummaryPage(
      WidgetTester tester, {
      String shipToCode = shipToCode,
    }) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);
      //Redirect to payment summary page
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
      await paymentHomeRobot.tapPaymentSummaryMenu();
      paymentSummaryRobot.verifyPageVisible();
    }

    testWidgets('EZRX-T184 | Verify Payment Summary Page', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(
        tester,
      );

      //verify
      paymentSummaryRobot.verifyPageVisible();
      paymentSummaryRobot.verifyDownloadButtonVisible();
      paymentSummaryRobot.verifySearchBarVisible();
      paymentSummaryRobot.verifyFilterButtonVisible();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      paymentSummaryRobot.verifyNewPaymentButtonVisible();

      if (paymentSummaryRobot.moreThanFiveItem) {
        await paymentSummaryRobot.scrollDown();
        paymentSummaryRobot.verifyScrollToTopButtonVisible();

        await paymentSummaryRobot.tapScrollToTopButton();
        paymentSummaryRobot.verifyScrollToTopButtonInvisible();
      }
    });

    testWidgets(
        'EZRX-T185 | Verify search payment advice by inputting invalid keyword - Unhappy Flow',
        (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.autoSearch(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );

      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar();

      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
    });

    testWidgets(
        'EZRX-T186 | Verify search payment advice by inputting valid keyword - happy Flow',
        (tester) async {
      const index = 0;
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.searchWithKeyboardAction(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();

      await commonRobot.autoSearch(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      final paymentId = paymentSummaryRobot.getPaymentId(index);

      await commonRobot.searchWithSearchIcon(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithSearchIcon(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

      await commonRobot.tapClearSearch();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

      await commonRobot.searchWithKeyboardAction(paymentId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithSearchIcon(paymentId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();
    });

    testWidgets('EZRX-T187 | Verify Download Feature', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();
      paymentSummaryRobot.verifyDownloadButtonVisible();
      await paymentSummaryRobot.tapDownloadButton();
      paymentSummaryRobot.verifyDownloadSuccessSnackbarVisible();
    });

    testWidgets('EZRX-T188 | Verify Filter Tune Icon', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      final dateFormat = await getDateFormatBasedOnUserLanguage();
      //Redirect to payment summary page
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
      await paymentHomeRobot.tapPaymentSummaryMenu();
      paymentSummaryRobot.verifyPageVisible();

      //verify
      paymentSummaryRobot.verifyPageVisible();

      //change filter date
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyDefaultFilterApplied(filterOption);
      await paymentSummaryFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: dateFormat,
      );
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);

      //change amount range
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot.enterFromAmount(fromAmount);
      await paymentSummaryFilterRobot.enterToAmount(invalidToAmount);
      await paymentSummaryFilterRobot.tapApplyButton();
      await paymentSummaryFilterRobot.enterToAmount(toAmount);
      await paymentSummaryFilterRobot.tapApplyButton();
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: formattedFromAmount,
        toAmount: formattedToAmount,
      );
      await paymentSummaryFilterRobot.tapCloseIcon();
      paymentSummaryRobot.verifyFilterApplied(1);
    });

    testWidgets('EZRX-T189 | Verify pull to refresh Feature', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();
      await paymentSummaryRobot.pullToRefresh();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    });

    testWidgets('EZRX-563 | Verify Reset Feature', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryRobot.verifyResetButton();
      await paymentSummaryRobot.tapResetButton();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyDefaultFilterApplied(filterOption);
      await accountInvoiceFilterRobot.tapCloseIcon();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    });

    //TODO: need to run once, as right now we have cache issue.
    testWidgets(
        'EZRX-T565 | verify Payment Summary Details Page with download invoice',
        (tester) async {
      const index = 0;
      const downloadMessage = 'Download Successful';
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.pullToRefresh();
      final paymentId = paymentSummaryRobot.getPaymentId(index);
      totalPrice = paymentSummaryRobot.getPaymentIdPrice(index);

      await commonRobot.searchWithSearchIcon(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await paymentSummaryRobot.tapItem();

      //payment summary Details
      paymentSummaryDetailRobot.verifyPaymentDetail(
        paymentId,
      );
      //address info
      paymentSummaryDetailRobot.verifyOrderAddressVisible(shipToAddress);
      paymentSummaryDetailRobot.verifyCustomerCode(customerCode);
      paymentSummaryDetailRobot.verifyShipToCode(shipToCode);

      //verify payment summary fields and verify total price
      await paymentSummaryDetailRobot.verifyPaymentSummaryInvoiceCredit();
      await paymentSummaryDetailRobot.verifyPaymentSummaryTotalPrice(
        totalPrice.priceDisplay(currency),
      );

      //Download Advice
      paymentSummaryDetailRobot.verifyDownloadAdviceButton();
      await paymentSummaryDetailRobot.tapDownloadAdviceButton();
      await commonRobot.verifyCustomSnackBar(
        message: downloadMessage,
      );
      await commonRobot.dismissSnackbar();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Payment Summary Details Page when customer code is blocked',
        (tester) async {
      await goToPaymentSummaryPage(
        tester,
        shipToCode: shipToCodeWithCustomerCodeBlocked,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });

    testWidgets(
        'EZRX-19747 | Find customer suspended banner in Payment Summary Details Page when ship to code is blocked',
        (tester) async {
      await goToPaymentSummaryPage(
        tester,
        shipToCode: blockedShipToCode,
      );

      commonRobot.verifyCustomerSuspendedBanner();
    });
  });

  // //TODO:
  // // *** need data for this */

  // group('SOA menu - ', () {
  //   Future<void> goToStatementOfAccountPage(WidgetTester tester) async {
  //     //init app
  //     await pumpAppWithHomeScreen(tester);
  //     //Redirect to SOA page
  //     await homeRobot.tapPaymentQuickAccess();
  //     paymentHomeRobot.verifyPage();
  //     await paymentHomeRobot.tapStatementOfAccountTile();
  //     soaRootRobot.verifySOAPage();
  //   }

  //   testWidgets('EZRX-T190 | verify Statement of accounts Page',
  //       (tester) async {
  //     await goToStatementOfAccountPage(tester);

  //     soaRootRobot.verifySOAShipToAddress(shipToAddress);
  //     soaRootRobot.verifySOACustomerCode(customerCode);
  //     soaRootRobot.verifySOAFilterButton();
  //     soaRootRobot.verifySOAFilterCount(0);
  //     soaRootRobot.verifySOASearchResults();
  //     soaRootRobot.verifySOANewPaymentButton();
  //   });

  //   testWidgets('EZRX-T191 | Verify Filter by month Feature', (tester) async {
  //     await goToStatementOfAccountPage(tester);

  //     soaRootRobot.verifySOACustomerCode(customerCode);
  //     soaRootRobot.verifySOAFilterButton();
  //     await soaRootRobot.tapSOAFilterButton();
  //     soaRootRobot.verifySOAFilterBottomSheet();
  //     await soaRootRobot.enterTextSOAFilterDateField();
  //     await soaRootRobot.tapSOAApplyButton();
  //     soaRootRobot.verifySOAFilterBottomSheetNot();
  //     soaRootRobot.verifySOAItem();
  //     await soaRootRobot.tapSOAFilterButton();
  //     soaRootRobot.verifySOAFilterBottomSheet();
  //     await soaRootRobot.tapSOAResetFilterButton();
  //   });

  //   testWidgets('EZRX-T192 | Verify Download Feature', (tester) async {
  //     await goToStatementOfAccountPage(tester);

  //     soaRootRobot.verifySOAItem();

  //     await soaRootRobot.verifyAndTapStatementOfAccountDownloadButton();
  //   });

  //   testWidgets('EZRX-T193 | Verify new Payment Feature', (tester) async {
  //     await goToStatementOfAccountPage(tester);

  //     soaRootRobot.verifySOANewPaymentButton();
  //     await soaRootRobot.tapSOANewPaymentButton();
  //   await newPaymentRobot.verifyPage();
  //   });

  //   testWidgets('EZRX-T263 | Verify pull to refresh Feature', (tester) async {
  //     await goToStatementOfAccountPage(tester);
  //     await soaRootRobot.verifyPullToRefresh();
  //   });
  // });

  group('New Payment Button - ', () {
    final toDate = DateTime.now();
    final fromDate = DateTime(2012, 1, 1);
    String invoiceId;
    String creditId;
    String govId;
    var invoiceIdPrice = 0.0;
    var creditIdPrice = 0.0;
    final invalidFromDate = DateTime(2099, 1, 1);
    final defaultPaymentMethod = 'Payment Gateway'.tr();

    Future<void> filterTheDateToGetItem({required String dateFormat}) async {
      await newPaymentStep2Robot.clickFilter();
      await newPaymentStep2Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: dateFormat,
      );
      await newPaymentStep2Robot.tapApplyFilter();
    }

    group('Step 1 - ', () {
      final fromDate = DateTime(2012, 1, 1);
      final toDate = DateTime.now();
      const inValidKeyword = '00000000000';
      const validKeyword = '10';

      Future<void> goToPaymentStep1Page(
        WidgetTester tester, {
        String shipToCode = shipToCode,
      }) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);
        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();
      }

      testWidgets(
          'EZRX-T195 | verify New Payment Page Step 1 - search Text Fields Unhappy flow',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await commonRobot.searchWithSearchIcon('');
        await commonRobot.verifySnackbarVisible();
        await commonRobot.dismissSnackbar();
        await commonRobot.searchWithSearchIcon(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
      });

      testWidgets(
          'EZRX-T196 | verify New Payment Page Step 1 - Text Field Happy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();
        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        await commonRobot.searchWithKeyboardAction(validKeyword);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await commonRobot.autoSearch(validKeyword);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await commonRobot.tapClearSearch();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T197 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Happy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.clickDueDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.clickOpenSelector();
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyNoItemFound();
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickOverDueSelector();
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.tapResetFilter();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T198 | verify New Payment Page Step 1 - All button Feature',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        await newPaymentStep1Robot.tapAllCheckbox();
        newPaymentStep1Robot.verifyAtLeast1ItemIsCheck();
        await newPaymentStep1Robot.clickFirstItem();
        newPaymentStep1Robot.verifyCheckboxStatus(false);
        await newPaymentStep1Robot.clickFirstItem();
        newPaymentStep1Robot.verifyCheckboxStatus(true);
        await newPaymentStep1Robot.tapAllCheckbox();
        newPaymentStep1Robot.verifyNoItemIsCheck();
      });

      testWidgets(
          'EZRX-T199 | verify New Payment Page Step 1 - Next Button Feature - Go to step 2',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        newPaymentStep1Robot.verifyButtonEnable();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
      });

      testWidgets(
          'EZRX-T200 | verify New Payment Page Step 1 - pull to refresh features',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.collectTheFirstItem();
        await newPaymentStep1Robot.pullToRefresh();
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyTheFirstItemAfterRefresh();
      });

      testWidgets(
          'EZRX-T223 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Un Happy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: invalidFromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await commonRobot.cancelDateRangePicker();
        await newPaymentStep1Robot.tapResetFilter();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T254 | verify New Payment Page Step 1 - Textfield search on clear button',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await commonRobot.searchWithKeyboardAction(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
        await commonRobot.tapClearSearch();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T253 | verify New Payment Page Step 1 - Textfield search on done keyboard button',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await commonRobot.searchWithKeyboardAction(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in New Payment step1 when customer code is blocked',
          (tester) async {
        await goToPaymentStep1Page(
          tester,
          shipToCode: shipToCodeWithCustomerCodeBlocked,
        );

        commonRobot.verifyCustomerSuspendedBanner();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in New Payment step1 when ship to code is blocked',
          (tester) async {
        await goToPaymentStep1Page(
          tester,
          shipToCode: blockedShipToCode,
        );

        commonRobot.verifyCustomerSuspendedBanner();
      });
    });

    group('Step 2 - ', () {
      const noResultCreditSearchKeyword = '0000000000';

      Future<void> goToPaymentStep2Page(
        WidgetTester tester, {
        String shipToCode = shipToCode,
        String dateTimeFormat = dateTimeFormat,
      }) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
      }

      testWidgets('EZRX-T224 | verify New Payment Page Step 2 - Initial Fields',
          (tester) async {
        await goToPaymentStep2Page(tester);
      });

      testWidgets(
          'EZRX-T255 | verify New Payment Page Step 2 - Text Field Unhappy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        await commonRobot.searchWithKeyboardAction('0');
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.dismissSnackbar();
        await commonRobot.searchWithKeyboardAction(noResultCreditSearchKeyword);
        newPaymentStep2Robot.verifyNoItemFound();
      });

      testWidgets(
          'EZRX-T256 | verify New Payment Page Step 2 - Text Field Textfield search on clear button',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
          await commonRobot.tapClearSearch();
          await newPaymentStep2Robot.clickFilter();
          newPaymentStep2Robot.verifyDefaultFilter();
        }
      });

      testWidgets(
          'EZRX-T257 | verify New Payment Page Step 2 - Text Field search on done keyboard button',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound(isVn: true);
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
        }
      });

      testWidgets(
          'EZRX-T258 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Un Happy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await newPaymentStep2Robot.clickFilter();
        newPaymentStep2Robot.verifyDefaultFilter();
        await newPaymentStep2Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: invalidFromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep2Robot.verifyOutOfRangeError();
        await commonRobot.cancelDateRangePicker();
        await newPaymentStep2Robot.tapResetFilter();
        await newPaymentStep2Robot.clickFilter();
        newPaymentStep2Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T259 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Happy flow',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await newPaymentStep2Robot.clickFilter();
        newPaymentStep2Robot.verifyDefaultFilter();
        await newPaymentStep2Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep2Robot.tapApplyFilter();
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound(isVn: true);
          await newPaymentStep2Robot.clickFilter();
          await newPaymentStep2Robot.tapResetFilter();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
          } else {
            newPaymentStep2Robot.verifyAtLeastOneItemFound(isVn: true);
          }
        }
      });

      testWidgets(
          'EZRX-T260 | verify New Payment Page Step 2 - All button Feature',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        newPaymentStep2Robot.verifyCheckboxStatus(false);
        await newPaymentStep2Robot.tapAllCheckbox();
        newPaymentStep2Robot.verifyCheckboxStatus(true);
        newPaymentStep2Robot.verifyAtLeast1ItemIsCheck();
        await newPaymentStep2Robot.clickFirstItem();
        newPaymentStep2Robot.verifyCheckboxStatus(false);
        await newPaymentStep2Robot.clickFirstItem();
        newPaymentStep2Robot.verifyCheckboxStatus(true);
      });

      testWidgets(
          'EZRX-T261 | verify New Payment Page Step 2 - pull to refresh features',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound(isVn: true);
          newPaymentStep2Robot.collectTheFirstItem();
          await commonRobot.pullToRefresh();
          await filterTheDateToGetItem(dateFormat: dateFormat);
          newPaymentStep2Robot.verifyTheFirstItemAfterRefresh();
        }
      });

      testWidgets(
          'EZRX-T564 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3 without credit',
          (tester) async {
        const newCreditIdPrice = 0.0;
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        creditId = newPaymentStep2Robot.getFirstCreditId(invoiceIdPrice);
        newPaymentStep2Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          newCreditIdPrice,
        );
        await newPaymentStep2Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
        newPaymentStep3Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          newCreditIdPrice,
        );
      });

      testWidgets(
          'EZRX-T262 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3 with credit',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        final dateFormat = await getDateFormatBasedOnUserLanguage();

        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);

        await filterTheDateToGetItem(dateFormat: dateFormat);
        creditId = newPaymentStep2Robot.getFirstCreditId(invoiceIdPrice);
        creditIdPrice = newPaymentStep2Robot.getFirstCreditIdPrice(
          invoiceIdPrice,
        );
        if (creditId.isNotEmpty && creditIdPrice != 0.0) {
          await commonRobot.searchWithKeyboardAction(creditId);
          await newPaymentStep2Robot.clickFirstItem();
          newPaymentStep2Robot.verifyThePriceAndButton(
            invoiceIdPrice,
            creditIdPrice,
          );
        }

        await newPaymentStep2Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
        newPaymentStep3Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          creditIdPrice,
        );
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in New Payment step2 when customer code is blocked',
          (tester) async {
        await goToPaymentStep2Page(
          tester,
          shipToCode: shipToCodeWithCustomerCodeBlocked,
          dateTimeFormat: 'MM/dd/yyyy',
        );

        commonRobot.verifyCustomerSuspendedBanner();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in New Payment step2 when ship to code is blocked',
          (tester) async {
        await goToPaymentStep2Page(
          tester,
          shipToCode: blockedShipToCode,
          dateTimeFormat: 'MM/dd/yyyy',
        );

        commonRobot.verifyCustomerSuspendedBanner();
      });
    });

    group('Step 3 - ', () {
      Future<void> goToPaymentStep3PageWithoutCredit(
        WidgetTester tester, {
        String dateTimeFormat = dateTimeFormat,
        String shipToCode = shipToCode,
      }) async {
        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: shipToCode);
        final dateFormat = await getDateFormatBasedOnUserLanguage();
        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
          dateStringFormat: dateFormat,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        govId = newPaymentStep1Robot.getFirstGovIdForVn;

        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound(isVn: true);
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();

        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
        await filterTheDateToGetItem(dateFormat: dateFormat);
        newPaymentStep2Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          0.0,
        );
        await newPaymentStep2Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
        newPaymentStep3Robot.verifyOrderAddressVisible(shipToAddress);
        newPaymentStep3Robot.verifyCustomerCode(customerCode);
        newPaymentStep3Robot.verifyShipToCode(shipToCode);
        await newPaymentStep3Robot.verifyInvoiceCreditItem(invoiceId, govId);
        newPaymentStep3Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          0.0,
        );
      }

      testWidgets('EZRX-T225 | verify New Payment Page Step 3 - Initial Fields',
          (tester) async {
        await goToPaymentStep3PageWithoutCredit(tester);
      });

      testWidgets('EZRX-T226 | verify New Payment Page Step 3 - Pay now Button',
          (tester) async {
        await goToPaymentStep3PageWithoutCredit(tester);

        newPaymentStep3Robot.verifyTotalAmountToPay(
          invoiceIdPrice,
          0.0,
        );
        newPaymentStep3Robot.verifyGeneratePaymentAdviceButton();
      });

      testWidgets(
          'EZRX-19747 | Find customer suspended banner in New Payment step 3',
          (tester) async {
        await goToPaymentStep3PageWithoutCredit(
          tester,
          shipToCode: shipToCodeWithCustomerCodeBlocked,
          dateTimeFormat: 'MM/dd/yyyy',
        );

        commonRobot.verifyCustomerSuspendedBanner();
      });
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
