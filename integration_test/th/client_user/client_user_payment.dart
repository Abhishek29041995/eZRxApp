import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryRobot paymentSummaryRobot;
  late PaymentSummaryDetailRobot paymentSummaryDetailRobot;
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
  late CustomerSearchRobot customerSearchRobot;
  // late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

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
    // viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    paymentSummaryDetailRobot = PaymentSummaryDetailRobot(tester);
    accountSummaryTabRobot = AccountSummaryTabRobot(tester);
    accountSummaryTabFilterRobot = AccountSummaryTabFilterRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
  }

  //Initialize Variable
  const market = 'Thailand';
  const username = 'thclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030224907';
  const shipToCode = '0071115077';
  const shipToAddress = 'รพ.เจริญกรุงประชารักษ์';
  const currency = 'THB';
  final successSnackbarMessage = 'File downloaded successfully'.tr();

  var loginRequired = true;

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

  group('Payment Home Page - ', () {
    Future<void> goToPaymentHomePage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPaymentsTabPage();
    }

    testWidgets('EZRX-T181 | Verify Payments Page', (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyNewPaymentsButton();
      paymentHomeRobot.verifyPaymentHomeOptionMenu(
        verifyClaimsMenu: false,
        verifyStatementOfAccountsMenu: false,
      );
      paymentHomeRobot.verifyPaymentHomeInvoiceCard();
      paymentHomeRobot.verifyPaymentHomeInProgressCard();
    });

    testWidgets('EZRX-T182 | Verify Obscure & Download property',
        (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyPaymentHomeInvoiceCardObscure();
      paymentHomeRobot.verifyPaymentSummaryObscure();

      await paymentHomeRobot.tapToAllObscureButton(tapCreditSection: false);
      paymentHomeRobot.verifyNoObscureTextPresent();
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
  });

  group('Account Summary menu - invoice tab', () {
    final documentDateFrom = DateTime(2012, 11, 12);
    final documentDateTo = DateTime(2024, 1, 9);
    final dueDateFrom = DateTime(2024, 1, 4);
    final dueDateTo = DateTime(2024, 7, 6);
    const amountFrom = 200.0;
    const amountTo = 150000.0;
    const invoiceStatus = 'Cleared';
    const filterStatus = 'In progress';
    const invalidLengthSearchKey = '1';
    const invalidSearchKey = '1234567890';

    const invoiceId = '1310000455';
    final invoiceSubtotal = 2600.00.priceDisplay(currency);
    final invoiceGrandTotal = 2782.00.priceDisplay(currency);
    const invoiceOrderNumber = '0200312428';

    const materialGroupIndex = 0;
    const material1Index = 0;
    const materialNumber1 = '23268403';
    const materialQty1 = 50;
    final materialUnitPrice1 = '$currency ${52.00.priceFormatted}';
    final materialTotalPrice1 = invoiceSubtotal;

    Future<void> goToAccountSummaryInvoicePage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
    }

    Future<void> getFilterDataDocumentDate() async {
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
    }

    testWidgets('EZRX-T265 | Verify Invoice Page - all initial Fields',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

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
      await goToAccountSummaryInvoicePage(tester);

      //verify
      accountInvoiceRobot.verifyNewPaymentButton();
      await accountInvoiceRobot.tapNewPaymentButton();
      await newPaymentRobot.verifyPage();
    });

    testWidgets('EZRX-T131 | Verify filter tune icon - all features',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsInDocumentDateRange(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );

      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapStatusCheckbox(filterStatus);
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsWithStatus(invoiceStatus);

      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDueDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: dueDateFrom,
        toDate: dueDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItems();

      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.enterFromAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountTo.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsInAmountRange(
        fromAmount: amountFrom,
        toAmount: amountTo,
        currency: currency,
      );

      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapResetButton();
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
      await accountInvoiceFilterRobot.tapCloseIcon();
    });

    testWidgets('EZRX-T161 | Verify pull to refresh', (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      if (accountInvoiceRobot.noRecordFound) {
        accountInvoiceRobot.verifyNoRecordFound();
      }
      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      accountInvoiceRobot.verifySearchBarText(invalidSearchKey);
      accountInvoiceRobot.verifyNoRecordFound();
      await accountInvoiceRobot.pullToRefresh();
      if (accountInvoiceRobot.noRecordFound) {
        accountInvoiceRobot.verifyNoRecordFound();
      } else {
        accountInvoiceRobot.verifyItems();
      }
    });

    testWidgets(
        'EZRX-T129 | Verify search invoice by inputting invalid keyword on Invoices Tab - Unhappy Flow',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
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
          .verifyAndDismissInvalidLengthSearchMessageSnackbar(isVisible: false);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyItems();

      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      await accountInvoiceRobot.waitAutoSearchDuration();
      accountInvoiceRobot.verifyLoadingImage(isVisible: false);
      accountInvoiceRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T130 | Verify search invoice by inputting valid keyword on Invoices Tab - happy Flow',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await getFilterDataDocumentDate();

      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
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
      await commonRobot.dismissSnackbar(dismissAll: true);
      await accountInvoiceRobot.tapClearSearch();
      accountInvoiceRobot.verifyItems();
    });

    testWidgets(
        'EZRX-T267 | Verify search invoice by inputting valid keyword on Invoice Tab - on keyboard done',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyItems();

      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      accountInvoiceRobot.verifySearchBarText(invoiceId);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);
    });

    testWidgets('EZRX-T281 | Verify filter tune icon - Filter by status',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapStatusCheckbox(filterStatus);
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsWithStatus(filterStatus);
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyStatusFilterValue(filterStatus, true);
    });

    testWidgets('EZRX-T280 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.enterFromAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountTo.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsInAmountRange(
        fromAmount: amountFrom,
        toAmount: amountTo,
        currency: currency,
      );
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyAmountRangeApplied(
        amountFrom.toString(),
        amountTo.toString(),
      );
    });

    testWidgets('EZRX-T278 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
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
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyFilterApplied(1);
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.tapDueDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: dueDateFrom,
        toDate: dueDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDueDateRangeApplied(
        dueDateFrom.displayDate,
        dueDateTo.displayDate,
      );
    });

    testWidgets(
        'EZRX-T277 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot.tapFilterButton();
      await accountInvoiceFilterRobot.enterFromAmount(amountTo.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceFilterRobot.verifyInvalidAmountErrorVisible();
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
      );
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
      );
      await accountInvoiceFilterRobot.tapDueDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateTo,
        toDate: documentDateFrom,
      );
    });

    testWidgets('EZRX-T132 | Verify Invoice Detail Page', (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      await accountInvoiceRobot.tapFirstItem();
      accountInvoiceDetailRobot.verifyPage();
      accountInvoiceDetailRobot.verifyInvoiceDetails(
        invoiceId,
        invoiceStatus,
        invoiceOrderNumber,
      );
      accountInvoiceDetailRobot.verifyHyperLinkToOrderDetails();

      accountInvoiceDetailRobot.verifyCustomerCode(customerCode);
      accountInvoiceDetailRobot.verifyDeliveryTo(shipToCode);
      accountInvoiceDetailRobot.verifyOrderAddress(shipToAddress);
      accountInvoiceDetailRobot.verifySubTotal(invoiceSubtotal);
      accountInvoiceDetailRobot.verifyGrandTotal(invoiceGrandTotal);
      await accountInvoiceDetailRobot.verifyMaterial(
        materialGroupIndex,
        material1Index,
      );
      accountInvoiceDetailRobot.verifyMaterialNumber(materialNumber1);
      await accountInvoiceDetailRobot.verifyMaterialQty(materialQty1);
      accountInvoiceDetailRobot.verifyMaterialUnitPrice(materialUnitPrice1);
      accountInvoiceDetailRobot.verifyMaterialTotalPrice(materialTotalPrice1);
    });

    testWidgets('EZRX-T560 | Export Button Feature - Download Invoices',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      await getFilterDataDocumentDate();

      //verify download success
      accountInvoiceRobot.verifyDownloadButton();
      await accountInvoiceRobot.tapDownloadButton();
      await commonRobot.verifyCustomSnackBar(
        message: successSnackbarMessage,
      );
      await commonRobot.dismissSnackbar();
    });
  });

  group('Account summary menu - credit tab', () {
    //date
    final currentDate = DateTime.now();
    final pastTwentyYearsDate =
        currentDate.subtract(const Duration(days: 7200));
    const inValidCreditId = '1232136712';
    //material info
    const creditId = '4160003952';
    const creditStatus = 'Cleared';
    const tax = 7;
    final creditPrice = 10000.00.priceDisplay(currency);
    final creditTotalPrice = 10000.00.includeTax(tax).priceDisplay(currency);
    Future<void> goToAccountSummaryCreditPage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      await accountSummaryRootRobot.switchToCreditPage();
      accountSummaryRootRobot.verifyCreditsPage();
      accountCreditsRobot.verify();
    }

    Future<void> applyFilterDateToGetData({
      DateTime? fromDate,
      DateTime? toDate,
    }) async {
      accountCreditsRobot.verifyFilterTuneIcon();
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      await accountCreditsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate ?? pastTwentyYearsDate,
        toDate: toDate ?? currentDate,
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
      await goToAccountSummaryCreditPage(tester);

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
      await goToAccountSummaryCreditPage(tester);

      await applyFilterDateToGetData();

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
      await commonRobot.searchWithKeyboardAction(inValidCreditId);
      accountCreditsRobot.verifyNoCreditFound();
      await commonRobot.tapClearSearch();
    });

    testWidgets(
        'EZRX-T266 | Verify search credit by inputting valid keyword on Credits Tab - on keyboard done',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditTotalPrice,
        );
      }
    });

    testWidgets(
        'EZRX-T159 | Verify search credit by inputting valid keyword on Credits Tab - Happy flow - Every feature',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditTotalPrice,
        );
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
          creditTotalPrice,
        );
      }
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on search icon
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditTotalPrice,
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
          creditTotalPrice,
        );
      }
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      await commonRobot.tapClearSearch();

      //search bar - combine search by keyboard action & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditTotalPrice,
        );
      }
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      await commonRobot.tapClearSearch();
    });

    testWidgets('EZRX-T162 | verify pull to refresh', (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

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
      await goToAccountSummaryCreditPage(tester);

      //Tap on new payment button
      await accountCreditsRobot.tapPaymentButton();

      //verify new payment page
      await newPaymentRobot.verifyPage();

      //close
      await newPaymentRobot.tapCloseButton();

      //verify credit page
      accountCreditsRobot.verify();
    });

    testWidgets('EZRX-T169 | verify Credits Detail Page', (tester) async {
      //variables
      const documentType = 'Credit Memo';
      const referenceNumber = '0040027162';
      const returnMaterialNumber1 = '21068578';
      const returnQuantity1 = 1;
      const returnUnitPrice1 = 10000.00;

      const returnMaterialTotalPrice1 = (returnUnitPrice1 * returnQuantity1);

      const totalReturnQuantity = 1;

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);

      //verify item
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditTotalPrice,
        );
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
        accountCreditDetailsRobot.verifyCreditItemTotalPrice(creditTotalPrice);
        //return items
        accountCreditDetailsRobot.verifyReturnItems(totalReturnQuantity);
        await accountCreditDetailsRobot.verifyReturnMaterial(
          returnMaterialNumber1,
          returnQuantity1,
          returnUnitPrice1.priceDisplay(currency),
          returnMaterialTotalPrice1.priceDisplay(currency),
        );
      }
    });

    testWidgets('EZRX-T268 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData(
        fromDate: pastTwentyYearsDate,
        toDate: currentDate,
      );

      //verify Document Date in range
      accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
        fromDate: pastTwentyYearsDate,
        toDate: currentDate,
      );
    });

    testWidgets('EZRX-T270 | Verify filter tune icon - Filter by status',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply status - Cleared
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(creditStatus);
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditsItemListWithStatus(creditStatus);
      }
    });

    testWidgets('EZRX-T269 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      const fromAmount = '100.0';
      const toAmount = '12000.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();
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
    });

    testWidgets('EZRX-T178 | Verify filter tune icon - all features happy flow',
        (tester) async {
      //variable
      final fromDate = DateTime(2012, 10, 10);
      final toDate = DateTime(2023, 10, 10);
      const clearedStatus = 'Cleared';
      const openStatus = 'Open';
      const fromAmount = '10.0';
      const toAmount = '120000.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //Apply status - Document Date
      await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);

      //verify document date & status filter applied
      accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
        fromDate: fromDate,
        toDate: toDate,
      );

      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();
      //Apply status - cleared
      accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(clearedStatus);
      accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      //verify clear status credit filter list
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditsItemListWithStatus(clearedStatus);
      }
      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();
      //Apply status - open
      accountCreditsFilterRobot.verifyStatusFilter(openStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(openStatus);
      accountCreditsFilterRobot.verifyStatusFilter(openStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      accountCreditsRobot.verifyFilterAppliedCount(1);

      //verify document date credit filter list
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        //Again verify amount credit filter list
        accountCreditsRobot.verifyCreditsInAmountRange(
          fromAmount: double.parse(fromAmount),
          toAmount: double.parse(toAmount),
          currency: currency,
        );
      }

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
    });

    testWidgets(
        'EZRX-T271 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      //variable
      final fromDate = DateTime(2012, 12, 14);
      final toDate = DateTime(2023, 12, 20);
      const fromAmount = '110.0';
      const toAmount = '100.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);
      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply status - cleared
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, false);
      await accountCreditsFilterRobot.tapToChangeStatusCheckbox(creditStatus);
      accountCreditsFilterRobot.verifyStatusFilter(creditStatus, true);
      await accountCreditsFilterRobot.tapApplyButton();
      if (accountCreditsRobot.noCreditFound) {
        accountCreditsRobot.verifyNoCreditFound();
      } else {
        //verify clear status credit filter list
        accountCreditsRobot.verifyCreditsItemListWithStatus(
          creditStatus,
          isVisible: true,
        );
      }
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

      //invalid document date filter applied - fromDate > toDate
      await accountCreditsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: toDate,
        toDate: fromDate,
      );
      accountCreditsFilterRobot.verifyInvalidDateRangeError();
    });

    testWidgets('EZRX-T561 | Export Button Feature - Download Credits',
        (tester) async {
      //Redirect to credit page
      await goToAccountSummaryCreditPage(tester);

      await applyFilterDateToGetData();

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
    const creditId = '4160003952';
    const creditIdStatus = 'Open';
    const emptyReferenceListString = 'NA';
    const debitId = '1310000455';

    final fromDate = DateTime(2000, 1, 15);
    final toDate = DateTime.now();
    const inValidCreditId = '1232136712';

    Future<void> goToAccountSummaryPage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

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
        accountSummaryTabRobot.verifyItems();
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
        await commonRobot.searchWithKeyboardAction(creditId);

        accountSummaryTabRobot.verifyExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(
          referenceListString: emptyReferenceListString,
        );
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await commonRobot.tapClearSearch();
        accountSummaryTabRobot.verifyItems();
      },
    );

    // TODO: Enable when having credit with reference data
    // testWidgets(
    //   'EZRX-T566 | Verify Detail Feature - show reference details with Reference List',
    //   (tester) async {
    //     //Got to Summary Page
    //     await goToAccountSummaryPage(tester, shipToCode: refNumberShipToCode);

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
        await commonRobot.dismissSnackbar(dismissAll: true);
        accountSummaryTabRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        //No payment summary found - search by keyboard
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        await commonRobot.dismissSnackbar(dismissAll: true);
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
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
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
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(debitId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on auto search
      await commonRobot.autoSearch(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
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

      //search bar -  valid input with on search by keyboard
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on search by keyboard
      await commonRobot.searchWithKeyboardAction(debitId);
      accountSummaryTabRobot.verifyItemWithId(
        debitId,
        false,
      );
      await commonRobot.tapClearSearch();

      //search bar - combine keyboard done & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();

      //search bar - combine search icon & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
    });

    testWidgets('EZRX-T553 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //filter applied
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );
    });

    testWidgets('EZRX-T568 | Verify filter tune icon - Filter by due date',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //filter applied
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: false,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );
    });

    testWidgets('EZRX-T570 | Verify filter tune icon - all features',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //filter applied - Document Date
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //verify Document Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );

      accountSummaryTabRobot.verifyFilterApplied(1);
      //filter applied Due Date
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: false,
      );

      //verify Due Date in range
      accountSummaryTabRobot.verifySummaryItemsDate(
        fromDate: fromDate,
        toDate: toDate,
      );

      accountSummaryTabRobot.verifyFilterApplied(1);

      await verifySummaryStatusCheck(
        'Cleared',
        afterVerifyUncheckStatus: false,
      );
      accountSummaryTabRobot.verifyFilterApplied(1);
    });

    testWidgets(
        'EZRX-T571 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      final invalidFromDate = DateTime(2023, 10, 15);
      final invalidToDate = DateTime(2023, 10, 12);
      final outOfRangeToDate = toDate;
      final outOfRangeFromDate = toDate.add(const Duration(days: 1));
      //Got to Summary Page
      await goToAccountSummaryPage(tester);

      //filter applied - Document Date
      accountSummaryTabRobot.verifyFilterButton();
      await accountSummaryTabRobot.tapFilterButton();
      accountSummaryTabFilterRobot.verifyCreditsFilter();
      await accountSummaryTabFilterRobot.tapDocumentDateField();

      await commonRobot.setDateRangePickerValue(
        fromDate: outOfRangeFromDate,
        toDate: outOfRangeToDate,
      );
      accountSummaryTabFilterRobot.verifyDateOutOfRangeRangeError();

      await commonRobot.setDateRangePickerValue(
        fromDate: invalidFromDate,
        toDate: invalidToDate,
      );
      accountSummaryTabFilterRobot.verifyInvalidDateRangeError();
      await commonRobot.cancelDateRangePicker();

      //filter applied - Due Date
      await accountSummaryTabFilterRobot.tapDueDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: outOfRangeFromDate,
        toDate: outOfRangeToDate,
      );
      accountSummaryTabFilterRobot.verifyInvalidDateRangeError();

      await commonRobot.setDateRangePickerValue(
        fromDate: invalidFromDate,
        toDate: invalidToDate,
      );
      accountSummaryTabFilterRobot.verifyInvalidDateRangeError();
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
      await commonRobot.dismissSnackbar(dismissAll: true);
      accountSummaryTabRobot.verifyNoRecordFound();
      await commonRobot.pullToRefresh();
      accountSummaryTabRobot.verifyItems();
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
      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await accountSummaryTabRobot.tapItemWithId(creditId, true);
      accountCreditDetailsRobot.verify();
    });
  });

  group('Payment summary menu - ', () {
    const invalidSearchKey = 'invalid keyword';
    const invalidLengthSearchKey = 'a';
    const validLengthSearchKey = 'ab';
    String paymentId;
    final fromDate = DateTime.now().subtract(const Duration(days: 3600));
    final toDate = DateTime.now().subtract(const Duration(days: 2));
    const fromAmount = '500.123400';
    const toAmount = '100000.20';
    const invalidToAmount = '1';
    const formattedFromAmount = '500.1234';
    const formattedToAmount = '100000.2';

    double totalPrice;
    const filterOption = [
      'In Progress',
      'Failed',
      'Successful',
      'Processed',
      'Payment Received',
    ];

    Future<void> goToPaymentSummaryPage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
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

      paymentId = paymentSummaryRobot.getPaymentId(index);

      await commonRobot.searchWithKeyboardAction(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

      await commonRobot.tapClearSearch();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

      await commonRobot.searchWithKeyboardAction(paymentId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(paymentId);
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
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      //change filter date
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyDefaultFilterApplied(
        filterOption,
      );

      await paymentSummaryFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
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
      paymentSummaryFilterRobot.verifyDefaultFilterApplied(
        filterOption,
      );
      await accountInvoiceFilterRobot.tapCloseIcon();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    });

    //TODO: need to run once, as right now we have cache issue.
    testWidgets(
        'EZRX-T565 | verify Payment Summary Details Page with download invoice',
        (tester) async {
      const index = 3;
      const downloadMessage = 'Download Successful';
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.pullToRefresh();
      paymentId = paymentSummaryRobot.getPaymentId(index);
      totalPrice = paymentSummaryRobot.getPaymentIdPrice(index);

      await commonRobot.searchWithKeyboardAction(paymentId);
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
  });

// TODO Soa is not enable for TH
//   group('SOA menu - ', () {
//     Future<void> goToStatementOfAccountPage(WidgetTester tester) async {
//       //init app
//       await pumpAppWithHomeScreen(tester);
//       //Redirect to SOA page
//       await homeRobot.tapPaymentQuickAccess();
//       paymentHomeRobot.verifyPage();
//       await paymentHomeRobot.tapStatementOfAccountTile();
//       soaRootRobot.verifySOAPage();
//     }

//     testWidgets('EZRX-T190 | verify Statement of accounts Page',
//         (tester) async {
//       await goToStatementOfAccountPage(tester);

//       soaRootRobot.verifySOAShipToAddress(shipToAddress);
//       soaRootRobot.verifySOACustomerCode(customerCode);
//       soaRootRobot.verifySOAFilterButton();
//       soaRootRobot.verifySOAFilterCount(0);
//       soaRootRobot.verifySOASearchResults();
//       soaRootRobot.verifySOANewPaymentButton();
//     });

//     testWidgets('EZRX-T191 | Verify Filter by month Feature', (tester) async {
//       await goToStatementOfAccountPage(tester);

//       soaRootRobot.verifySOACustomerCode(customerCode);
//       soaRootRobot.verifySOAFilterButton();
//       await soaRootRobot.tapSOAFilterButton();
//       soaRootRobot.verifySOAFilterBottomSheet();
//       await soaRootRobot.enterTextSOAFilterDateField();
//       await soaRootRobot.tapSOAApplyButton();
//       soaRootRobot.verifySOAFilterBottomSheetNot();
//       soaRootRobot.verifySOAItem();
//       await soaRootRobot.tapSOAFilterButton();
//       soaRootRobot.verifySOAFilterBottomSheet();
//       await soaRootRobot.tapSOAResetFilterButton();
//     });

//     testWidgets('EZRX-T192 | Verify Download Feature', (tester) async {
//       await goToStatementOfAccountPage(tester);

//       soaRootRobot.verifySOAItem();

//       await soaRootRobot.verifyAndTapStatementOfAccountDownloadButton();
//     });

//     testWidgets('EZRX-T193 | Verify new Payment Feature', (tester) async {
//       await goToStatementOfAccountPage(tester);

//       soaRootRobot.verifySOANewPaymentButton();
//       await soaRootRobot.tapSOANewPaymentButton();
//     await newPaymentRobot.verifyPage();
//     });

//     testWidgets('EZRX-T263 | Verify pull to refresh Feature', (tester) async {
//       await goToStatementOfAccountPage(tester);
//       await soaRootRobot.verifyPullToRefresh();
//     });
//   });

  group('New Payment Button - ', () {
    final toDate = DateTime.now();
    final fromDate = DateTime(2012, 1, 1);
    String invoiceId;
    String creditId;
    var creditIdPrice = 0.0;
    var invoiceIdPrice = 0.0;
    final invalidFromDate = DateTime(2099, 1, 1);
    final defaultPaymentMethod = 'Payment Gateway'.tr();

    Future<void> filterTheDateToGetItem() async {
      await newPaymentStep2Robot.clickFilter();
      await newPaymentStep2Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep2Robot.tapApplyFilter();
    }

    group('Step 1 - ', () {
      final fromDate = DateTime(2012, 1, 1);
      final toDate = DateTime.now();
      const inValidKeyword = '00000000000';
      const validKeyword = '10';

      Future<void> goToPaymentStep1Page(WidgetTester tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
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

        await commonRobot.searchWithKeyboardAction('1');
        await commonRobot.verifySnackbarVisible();
        await commonRobot.dismissSnackbar();
        await commonRobot.searchWithKeyboardAction(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
      });

      testWidgets(
          'EZRX-T196 | verify New Payment Page Step 1 - Text Field Happy flow',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        await commonRobot.searchWithKeyboardAction(validKeyword);
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await commonRobot.autoSearch(validKeyword);
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await commonRobot.tapClearSearch();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T197 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Happy flow',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.clickDueDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.clickOpenSelector();
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyNoItemFound();
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickOverDueSelector();
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.tapResetFilter();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T198 | verify New Payment Page Step 1 - All button Feature',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
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
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await newPaymentStep1Robot.clickFirstItem();
        newPaymentStep1Robot.verifyButtonEnable();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
      });

      testWidgets(
          'EZRX-T200 | verify New Payment Page Step 1 - pull to refresh features',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.collectTheFirstItem();
        await newPaymentStep1Robot.pullToRefresh();
        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyTheFirstItemAfterRefresh();
      });

      testWidgets(
          'EZRX-T223 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Un Happy flow',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: invalidFromDate,
          toDate: toDate,
        );
        await commonRobot.cancelDateRangePicker();
        await newPaymentStep1Robot.tapResetFilter();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T254 | verify New Payment Page Step 1 - Textfield search on clear button',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await commonRobot.searchWithKeyboardAction(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
        await commonRobot.tapClearSearch();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T253 | verify New Payment Page Step 1 - Textfield search on done keyboard button',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await newPaymentStep1Robot.clickFilter();
        await newPaymentStep1Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep1Robot.tapApplyFilter();
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await commonRobot.searchWithKeyboardAction(inValidKeyword);
        newPaymentStep1Robot.verifyNoItemFound();
      });
    });

    group('Step 2 - ', () {
      const noResultCreditSearchKeyword = '0000000000';

      Future<void> goToPaymentStep2Page(WidgetTester tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
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
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
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
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
        await commonRobot.searchWithKeyboardAction('0');
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.dismissSnackbar();
        await commonRobot.searchWithKeyboardAction(noResultCreditSearchKeyword);
        newPaymentStep2Robot.verifyNoItemFound();
      });

      testWidgets(
          'EZRX-T256 | verify New Payment Page Step 2 - Text Field Textfield search on clear button',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
          await commonRobot.tapClearSearch();
          await newPaymentStep1Robot.clickFilter();
          newPaymentStep1Robot.verifyDefaultFilter();
        }
      });

      testWidgets(
          'EZRX-T257 | verify New Payment Page Step 2 - Text Field search on done keyboard button',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
        }
      });

      testWidgets(
          'EZRX-T258 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Un Happy flow',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await newPaymentStep2Robot.clickFilter();
        newPaymentStep2Robot.verifyDefaultFilter();
        await newPaymentStep2Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: invalidFromDate,
          toDate: toDate,
        );
        await newPaymentStep2Robot.verifyOutOfRangeError();
        await commonRobot.cancelDateRangePicker();
        await newPaymentStep2Robot.tapResetFilter();
        await newPaymentStep1Robot.clickFilter();
        newPaymentStep1Robot.verifyDefaultFilter();
      });

      testWidgets(
          'EZRX-T259 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Happy flow',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await newPaymentStep2Robot.clickFilter();
        newPaymentStep2Robot.verifyDefaultFilter();
        await newPaymentStep2Robot.clickDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await newPaymentStep2Robot.tapApplyFilter();
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          await newPaymentStep2Robot.clickFilter();
          await newPaymentStep2Robot.tapResetFilter();
          await newPaymentStep1Robot.clickFilter();
          newPaymentStep1Robot.verifyDefaultFilter();
        }
      });

      testWidgets(
          'EZRX-T260 | verify New Payment Page Step 2 - All button Feature',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
        newPaymentStep2Robot.verifyCheckboxStatus(false);
        if (newPaymentStep2Robot.creditPaymentItem.evaluate().isNotEmpty) {
          await newPaymentStep2Robot.tapAllCheckbox();
          newPaymentStep2Robot.verifyCheckboxStatus(true);
          newPaymentStep2Robot.verifyAtLeast1ItemIsCheck();
          await newPaymentStep2Robot.clickFirstItem();
          newPaymentStep2Robot.verifyCheckboxStatus(false);
          await newPaymentStep2Robot.clickFirstItem();
          newPaymentStep2Robot.verifyCheckboxStatus(true);
        }
      });

      testWidgets(
          'EZRX-T261 | verify New Payment Page Step 2 - pull to refresh features',
          (tester) async {
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
        if (newPaymentStep2Robot.noRecordFound) {
          newPaymentStep2Robot.verifyNoItemFound();
        } else {
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
        }
        if (newPaymentStep2Robot.creditPaymentItem.evaluate().isNotEmpty) {
          newPaymentStep2Robot.collectTheFirstItem();
          await commonRobot.pullToRefresh();
          await filterTheDateToGetItem();
          newPaymentStep2Robot.verifyTheFirstItemAfterRefresh();
        }
      });

      testWidgets(
          'EZRX-T564 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3 without credit',
          (tester) async {
        const newCreditIdPrice = 0.0;
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
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
        await goToPaymentStep2Page(tester);

        await filterTheDateToGetItem();
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
    });

    group('Step 3 - ', () {
      Future<void> goToPaymentStep3PageWithoutCredit(
        WidgetTester tester,
      ) async {
        //init app
        await pumpAppWithHomeScreen(tester);
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
        );
        await newPaymentStep1Robot.tapApplyFilter();
        invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
        invoiceIdPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
        await commonRobot.searchWithKeyboardAction(invoiceId);
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
        await newPaymentStep1Robot.clickFirstItem();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep2Robot.verifyPage();

        // newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
        // await filterTheDateToGetItem();
        // newPaymentStep2Robot.verifyThePriceAndButton(
        //   invoiceIdPrice,
        //   0.0,
        // );
        await newPaymentStep2Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
        // newPaymentStep3Robot.verifyPaymentAdviceWarning();
        newPaymentStep3Robot.verifyOrderAddressVisible(shipToAddress);
        newPaymentStep3Robot.verifyCustomerCode(customerCode);
        newPaymentStep3Robot.verifyShipToCode(shipToCode);
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
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
