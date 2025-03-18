import 'package:easy_localization/easy_localization.dart';
// import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
// import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
// import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
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
  // late StatementOfAccountRobot statementAccountRobot;
  late NewPaymentRobot newPaymentRobot;
  late AccountSummaryRootRobot accountSummaryRootRobot;
  late AccountCreditsRobot accountCreditsRobot;
  late AccountCreditsFilterRobot accountCreditsFilterRobot;
  late AccountInvoiceRobot accountInvoiceRobot;
  late AccountInvoiceFilterRobot accountInvoiceFilterRobot;
  late AccountInvoiceDetailRobot accountInvoiceDetailRobot;
  late PaymentSummaryFilterRobot paymentSummaryFilterRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;
  late CustomerSearchRobot customerSearchRobot;
  late AccountSummaryTabRobot accountSummaryTabRobot;
  late AccountSummaryTabFilterRobot accountSummaryTabFilterRobot;
  late AccountCreditDetailsRobot accountCreditDetailsRobot;

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
    accountInvoiceRobot = AccountInvoiceRobot(tester);
    accountInvoiceFilterRobot = AccountInvoiceFilterRobot(tester);
    accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);
    paymentSummaryFilterRobot = PaymentSummaryFilterRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
    paymentSummaryDetailRobot = PaymentSummaryDetailRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    accountSummaryTabRobot = AccountSummaryTabRobot(tester);
    accountSummaryTabFilterRobot = AccountSummaryTabFilterRobot(tester);
    accountCreditDetailsRobot = AccountCreditDetailsRobot(tester);
  }

  //Initialize Variable
  const marketMalaysia = 'Indonesia';
  const username = 'idclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0000100164';
  const shipToCode = '0000100164';
  const shipToAddress = 'MARGARETHA FARMA. AP.';
  const currency = 'IDR';
  final successSnackbarMessage = 'File downloaded successfully'.tr();
  const inValidShortText = '1';
  const statusFilter = 'In Progress';

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
    }
  }

  Future<void> goToPaymentSummaryPage(WidgetTester tester) async {
    //init app
    await pumpAppWithHomeScreen(tester);
    //Redirect to payment summary page
    await homeRobot.tapPaymentQuickAccess();
    paymentHomeRobot.verifyPage();
    await paymentHomeRobot.tapPaymentSummaryMenu();
    paymentSummaryRobot.verifyPageVisible();
  }

  Future<void> checkForInProgressPaymentAndCancelIt(WidgetTester tester) async {
    await paymentHomeRobot.tapPaymentSummaryMenu();
    paymentSummaryRobot.verifyPageVisible();
    //change status
    await paymentSummaryRobot.tapFilterButton();
    await paymentSummaryFilterRobot.tapStatusCheckbox(statusFilter);
    paymentSummaryFilterRobot.verifyStatusFilterValue(statusFilter);
    await paymentSummaryFilterRobot.tapApplyButton();
    final item = find.byKey(WidgetKeys.paymentSummaryTile);
    if (item.evaluate().isNotEmpty) {
      while (item.evaluate().isNotEmpty) {
        await paymentSummaryRobot.tapFirstItem();
        paymentSummaryDetailRobot.verifyCancelAdviceButtonKey();
        await paymentSummaryDetailRobot.tapCancelAdviceButtonKey();
        paymentSummaryDetailRobot.verifyDeleteCancelAdviceBottomSheetButton();
        await paymentSummaryDetailRobot
            .tapDeleteCancelAdviceBottomSheetButton();
        await commonRobot.dismissSnackbar(dismissAll: true);
        paymentSummaryDetailRobot.verifyPaymentSummaryDetailsBackButton();
        await paymentSummaryDetailRobot.tapPaymentSummaryDetailsBackButton();
        await paymentSummaryRobot.tapFilterButton();
        await paymentSummaryFilterRobot.tapStatusCheckbox(statusFilter);
        paymentSummaryFilterRobot.verifyStatusFilterValue(statusFilter);
        await paymentSummaryFilterRobot.tapApplyButton();
      }
    }
    await tester.pageBack();
    await tester.pumpAndSettle();
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
        verifyStatementOfAccountsMenu: false,
      );
      paymentHomeRobot.verifyPaymentHomeInvoiceCard();
      paymentHomeRobot.verifyPaymentHomeCreditCardForID();
      paymentHomeRobot.verifyPaymentHomeInProgressCard();
    });

    testWidgets('EZRX-T182 | Verify Obscure & Download property',
        (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyPaymentHomeInvoiceCardObscure();
      paymentHomeRobot.verifyPaymentSummaryObscure();

      await paymentHomeRobot.tapToAllObscureButtonForID();
      paymentHomeRobot.verifyNoObscureTextPresent();
    });

    testWidgets(
        'EZRX-T183 | Verify Redirection Feature - Payment summary & New Payment Button',
        (tester) async {
      //Go to payment home page
      await goToPaymentHomePage(tester);

      paymentHomeRobot.verifyPaymentHomeInProgressCard();

      await paymentHomeRobot.navigateToPaymentSummaryScreen();
      paymentSummaryRobot.verifyPageVisible();
      await commonRobot.tapToBackScreen();

      await checkForInProgressPaymentAndCancelIt(tester);
      await paymentHomeRobot.tapNewPayment();
      await newPaymentRobot.verifyPage();
    });
  });

  group('Account Summary menu - invoice tab', () {
    final documentDateFrom = DateTime(2023, 1, 15);
    final documentDateTo = DateTime.now();
    final dueDateFrom = DateTime(2023, 1, 10);
    final dueDateTo = DateTime(2023, 5, 10);
    const amountFrom = 2000.0;
    const amountTo = 200000.0;
    const invoiceStatus = 'Cleared';
    const invalidLengthSearchKey = '1';
    const invalidSearchKey = '1234567890';

    const invoiceId = '1200021546';
    final invoiceSubtotal = '$currency ${12500.priceFormattedForID}';
    final invoiceGrandTotal = '$currency ${13875.priceFormattedForID}';
    const invoiceOrderNumber = '0100792172';

    const materialGroupIndex = 0;
    const material1Index = 0;
    const materialNumber1 = 'MLENA100';
    const materialQty1 = 1;
    final materialUnitPrice1 = '$currency ${12500.priceFormattedForID}';
    final materialTotalPrice1 = materialUnitPrice1;

    Future<void> goToAccountSummaryInvoicePage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
      accountInvoiceRobot.verifyFilterApplied(1);
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
      accountInvoiceRobot.verifyNewPaymentButton();
    });

    testWidgets('EZRX-T133 | Verify new Payment Feature', (tester) async {
      //Redirect to invoice page
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await checkForInProgressPaymentAndCancelIt(tester);
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();

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
      await accountInvoiceFilterRobot.tapStatusCheckbox(invoiceStatus);
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
      accountInvoiceRobot.verifyItems();
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
      await accountInvoiceFilterRobot.tapCloseIcon();
    });

    testWidgets('EZRX-T161 | Verify pull to refresh', (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
      accountInvoiceRobot.verifySearchBarText(invalidSearchKey);
      accountInvoiceRobot.verifyNoRecordFound();
      await accountInvoiceRobot.pullToRefresh();
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
    });

    testWidgets(
        'EZRX-T129 | Verify search invoice by inputting invalid keyword on Invoices Tab - Unhappy Flow',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
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
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
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
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();

      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);

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
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      accountInvoiceRobot.verifySearchBarText(invoiceId);
      accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);
    });

    testWidgets('EZRX-T281 | Verify filter tune icon - Filter by status',
        (tester) async {
      const status = 'Cleared';
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();

      await accountInvoiceFilterRobot.tapStatusCheckbox(status);
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyFilterApplied(1);
      accountInvoiceRobot.verifyItemsWithStatus(status);
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyStatusFilterValue(status, true);
    });
    testWidgets('EZRX-T280 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
      // set document date range that have data
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );
      await accountInvoiceFilterRobot.enterFromAmount(amountFrom.toString());
      await accountInvoiceFilterRobot.enterToAmount(amountTo.toString());
      await accountInvoiceFilterRobot.tapApplyButton();
      accountInvoiceRobot.verifyItemsInAmountRange(
        fromAmount: amountFrom,
        toAmount: amountTo,
        currency: currency,
      );
      accountInvoiceRobot.verifyFilterApplied(1);
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
      accountInvoiceFilterRobot.verifyDocumentDateRangeApplied(
        documentDateFrom.displayDate,
        documentDateTo.displayDate,
      );
    });

    testWidgets('EZRX-T279 | Verify filter tune icon - Filter by due date',
        (tester) async {
      //Redirect to invoice page
      await goToAccountSummaryInvoicePage(tester);

      //verify
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
      // set document date range that have data
      await accountInvoiceFilterRobot.tapDocumentDateField();
      await accountInvoiceFilterRobot.setDateRangePickerValue(
        fromDate: documentDateFrom,
        toDate: documentDateTo,
      );

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

      //verify
      await accountInvoiceRobot.tapFilterButton();
      accountInvoiceFilterRobot.verifyDefaultFilterApplied();
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

      //verify
      await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
      await accountInvoiceRobot.tapFirstItem();
      accountInvoiceDetailRobot.verifyPage();
      accountInvoiceDetailRobot.verifyInvoiceDetails(
        invoiceId,
        invoiceStatus,
        invoiceOrderNumber,
      );
      accountInvoiceDetailRobot.verifyHyperLinkToOrderDetails();
      //Need to cover the tap to go order details
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
    final pastTenYearsDate = currentDate.subtract(const Duration(days: 3600));
    const inValidCreditId = '1232136712';
    //material info
    const creditId = '1200021569';
    final creditPrice = '$currency ${106071.priceFormattedForID}';
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
      accountInvoiceRobot.verifyFilterApplied(1);
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
        fromDate: fromDate ?? pastTenYearsDate,
        toDate: toDate ?? currentDate,
      );
      accountCreditsFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate?.displayDate ?? pastTenYearsDate.displayDate,
        toDate: toDate?.displayDate ?? currentDate.displayDate,
      );
      await accountCreditsFilterRobot.tapApplyButton();
      //verify filter applied count
      accountCreditsRobot.verifyFilterAppliedCount(1);
      //verify at least one credit item
      accountCreditsRobot.verifyCreditItemsListForID();
    }

    testWidgets('EZRX-T264 | verify Credit Page - all initial Fields',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //search bar
      accountCreditsRobot.verifyCreditSearchBar();
      //filter
      accountCreditsRobot.verifyFilterTuneIcon();
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      accountCreditsFilterRobot.verifyDefaultFilterAppliedForID();
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
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

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
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
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
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on auto search
      await commonRobot.autoSearch(creditId);
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
      await commonRobot.tapClearSearch();

      //search bar -  valid input with on search icon
      await commonRobot.searchWithSearchIcon(creditId);
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
      await commonRobot.tapClearSearch();

      //search bar - combine keyboard done & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      await commonRobot.tapClearSearch();

      //search bar - combine search icon & auto search
      await commonRobot.searchWithSearchIcon(creditId);
      accountCreditsRobot.verifyCreditItemForID(creditId, creditPrice);
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
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyCreditsFilter();
      accountCreditsFilterRobot.verifyDefaultFilterAppliedForID();
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

    testWidgets('EZRX-T268 | Verify filter tune icon - Filter by document date',
        (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData(
        fromDate: pastTenYearsDate,
        toDate: currentDate,
      );

      //verify Document Date in range
      accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
        fromDate: pastTenYearsDate,
        toDate: currentDate,
      );
    });

    testWidgets('EZRX-T269 | Verify filter tune icon - Filter by Amount value',
        (tester) async {
      const toAmount = '110000.0';
      const fromAmount = '100000.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();
      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply filter - Amount
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
      final fromDate = DateTime(2020, 10, 10);
      final toDate = DateTime(2024, 05, 05);
      const toAmount = '110000.0';
      const fromAmount = '100000.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //Apply filter - Document Date
      await applyFilterDateToGetData();

      //verify document date filter applied
      accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
        fromDate: fromDate,
        toDate: toDate,
      );
      //Tap on filter icon
      await accountCreditsRobot.tapFilterTuneIcon();

      //Apply filter - Amount
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
      //verify document date credit filter list
      accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
        fromDate: fromDate,
        toDate: toDate,
      );

      //verify document date credit filter list
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

      //verify reset feature
      await accountCreditsRobot.tapFilterTuneIcon();
      await accountCreditsFilterRobot.tapResetButton();
      //verify filter
      await accountCreditsRobot.tapFilterTuneIcon();
      accountCreditsFilterRobot.verifyDefaultFilterAppliedForID();
      await accountCreditsFilterRobot.tapCloseButton();
    });

    testWidgets(
        'EZRX-T271 | Verify filter tune icon - all features unhappy flow',
        (tester) async {
      //variable
      final fromDate = DateTime(2015, 10, 5);
      final toDate = DateTime(2023, 10, 12);
      const fromAmount = '1000000.0';
      const toAmount = '10000.0';

      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);

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

      //verify download success
      accountCreditsRobot.verifyDownloadButton();
      await accountCreditsRobot.tapDownloadButton();
      await commonRobot.verifyCustomSnackBar(
        message: successSnackbarMessage,
      );
      await commonRobot.dismissSnackbar();
    });

    testWidgets('EZRX-T169 | verify Credits Detail Page', (tester) async {
      //Redirect to account summary credit page
      await goToAccountSummaryCreditPage(tester);

      //filter applied
      await applyFilterDateToGetData();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);

      //verify item
      accountCreditsRobot.verifyCreditItemsListForID();

      //Tap on first item after search
      await accountCreditsRobot.tapFirstCreditItem();

      //verify not to go Details page
      accountCreditsRobot.verify();
    });
  });

  group('Account Summary menu - summary tab', () {
    const creditId = '1200021569';
    const creditIdStatus = 'Cleared';

    final fromDate = DateTime(2000, 1, 15);
    final toDate = DateTime.now();
    const inValidCreditId = '1232136712';
    const emptyReferenceListString = 'NA';

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
        await applyFilterDateToGetData(
          fromDate: fromDate,
          toDate: toDate,
          isDocumentDate: true,
        );
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
        await applyFilterDateToGetData(
          fromDate: fromDate,
          toDate: toDate,
          isDocumentDate: true,
        );

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
      },
    );

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

        //No payment summary found - search icon
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
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
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      commonRobot.verifySearchBar();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
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
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );
      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();

      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar -  valid input with on auto search
      await commonRobot.autoSearch(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
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
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar -  valid input with on search icon
      await commonRobot.searchWithSearchIcon(creditId);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar -  valid input with on search icon
      await commonRobot.searchWithSearchIcon(creditId);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar - combine keyboard done & auto search
      await commonRobot.searchWithKeyboardAction(creditId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await commonRobot.tapClearSearch();
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

      //search bar - combine search icon & auto search
      await commonRobot.searchWithSearchIcon(creditId);
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

      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );

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
      if (accountSummaryTabRobot.isNoRecordFound) {
        accountSummaryTabRobot.verifyNoRecordFound();
      } else {
        accountSummaryTabRobot.verifyItems();
      }
      await accountSummaryTabRobot.tapFilterButton();
      accountSummaryTabFilterRobot.verifyCreditsFilter();
      accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
      await accountSummaryTabFilterRobot.tapCloseIcon();
    });

    testWidgets('EZRX-T572 | verify summary detail page - invoice and credits',
        (tester) async {
      //Got to Summary Page
      await goToAccountSummaryPage(tester);
      await applyFilterDateToGetData(
        fromDate: fromDate,
        toDate: toDate,
        isDocumentDate: true,
      );
      commonRobot.verifySearchBar();

      //search bar - valid input with on done keyboard button
      await commonRobot.searchWithKeyboardAction(creditId);
      accountSummaryTabRobot.verifyItems();
      accountSummaryTabRobot.verifyItemWithId(
        creditId,
        true,
      );
      await accountSummaryTabRobot.tapItemWithId(creditId, true);
      accountCreditDetailsRobot.verify();
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
    const paymentId = 'TR202312051166';
    final fromDate = DateTime.now().subtract(const Duration(days: 360));
    final toDate = DateTime.now();
    const fromAmount = '100000.123400';
    const toAmount = '200000.20';
    const invalidToAmount = '1';
    const formattedFromAmount = '100000.1234';
    const formattedToAmount = '200000.2';
    const statusFilter = 'Successful';

    const totalText = 'Total:';
    const totalPrice = 105450.0;
    const invoiceTitle = 'Invoice';
    const invoiceId = '1200021559';

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
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
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
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
    });

    testWidgets(
        'EZRX-T186 | Verify search payment advice by inputting valid keyword - happy Flow',
        (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.searchWithKeyboardAction(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();

      await commonRobot.autoSearch(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithSearchIcon(validLengthSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithSearchIcon(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();

      await commonRobot.tapClearSearch();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();

      await commonRobot.searchWithKeyboardAction(paymentId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithSearchIcon(paymentId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
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
      paymentSummaryFilterRobot.verifyDefaultFilterAppliedForID();
      await paymentSummaryFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);

      //change status
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot.tapStatusCheckbox(statusFilter);
      paymentSummaryFilterRobot.verifyStatusFilterValue(statusFilter);
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);

      //change amount range
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot.enterFromAmount(fromAmount);
      await paymentSummaryFilterRobot.enterToAmount(invalidToAmount);
      await paymentSummaryFilterRobot.tapApplyButton();
      await paymentSummaryFilterRobot.enterToAmount(toAmount);
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);

      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: formattedFromAmount,
        toAmount: formattedToAmount,
      );
    });

    testWidgets('EZRX-T189 | Verify pull to refresh Feature', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();
      await paymentSummaryRobot.pullToRefresh();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
    });

    testWidgets('EZRX-563 | Verify Reset Feature', (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryRobot.verifyResetButton();
      await paymentSummaryRobot.tapResetButton();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await paymentSummaryRobot.tapFilterButton();
      paymentSummaryFilterRobot.verifyDefaultFilterAppliedForID();
      await accountInvoiceFilterRobot.tapCloseIcon();
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
    });

    testWidgets(
        'EZRX-T565 | verify Payment Summary Details Page without download invoice',
        (tester) async {
      //navigate to page
      await goToPaymentSummaryPage(tester);

      //verify
      paymentSummaryRobot.verifyPageVisible();

      await commonRobot.searchWithKeyboardAction(paymentId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisibleForID();
      await paymentSummaryRobot.tapItem();

      //payment summary Details
      paymentSummaryDetailRobot.verifyPaymentDetail(
        paymentId,
      );
      //payment summary Details
      paymentSummaryDetailRobot.verifyBankAccountStatementSection();
      //address info
      paymentSummaryDetailRobot.verifyOrderAddressVisible(shipToAddress);
      paymentSummaryDetailRobot.verifyCustomerCode(customerCode);
      paymentSummaryDetailRobot.verifyShipToCode(shipToCode);

      //verify price
      await paymentSummaryDetailRobot.verifyPaymentSummaryDetailForID(
        totalText,
        totalPrice,
        currency,
      );
      await paymentSummaryDetailRobot.verifyPaymentItemsForID(
        invoiceTitle,
        invoiceId,
        totalPrice,
        currency,
      );

      //Download Advice Button checking
      paymentSummaryDetailRobot.verifyDownloadAdviceButtonForSuccessfulStatus();
    });
  });

  group('New Payment Button - ', () {
    final toDate = DateTime.now();
    final fromDate = DateTime(2013, 1, 1);
    String invoiceId;
    var invoiceIdPrice = 0.0;
    final invalidFromDate = DateTime(2099, 1, 1);

    group('Step 1 - ', () {
      final fromDate = DateTime(2014, 1, 1);
      final toDate = DateTime.now();
      const inValidKeyword = '00000000000';
      const validKeyword = '66';

      Future<void> goToPaymentStep1Page(WidgetTester tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        await checkForInProgressPaymentAndCancelIt(tester);
        paymentHomeRobot.verifyPage();
        await paymentHomeRobot.tapNewPayment();
        await newPaymentStep1Robot.verifyPage();
      }

      testWidgets(
          'EZRX-T195 | verify New Payment Page Step 1 - search Text Fields Unhappy flow',
          (tester) async {
        await goToPaymentStep1Page(tester);

        await commonRobot.searchWithSearchIcon('');
        await commonRobot.verifySnackbarVisible(isVisible: false);
        await commonRobot.dismissSnackbar();
        await commonRobot.searchWithSearchIcon(inValidKeyword);
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
        newPaymentStep1Robot.verifyAtLeast1ItemFound();
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
        newPaymentStep3Robot.verifyStep3InitialFieldForID();
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
      Future<void> goToPaymentStep3PageForID(
        WidgetTester tester,
      ) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        //Redirect to Payment Step1 page
        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPage();
        await checkForInProgressPaymentAndCancelIt(tester);
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
        newPaymentStep1Robot.verifyButtonEnable();
        await newPaymentStep1Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialFieldForID();
      }

      testWidgets('EZRX-T225 | verify New Payment Page Step 2 - Initial Fields',
          (tester) async {
        await goToPaymentStep3PageForID(tester);
        newPaymentStep3Robot.verifyStep3BankAccount();
        await newPaymentStep3Robot.verifyOrderAddressVisibleForID(
          shipToAddress,
          customerCode,
          shipToCode,
        );
      });

      testWidgets('EZRX-T226 | verify New Payment Page Step 2 - Pay now Button',
          (tester) async {
        await goToPaymentStep3PageForID(tester);

        await newPaymentStep3Robot.verifyStep3SelectBankAccount();
        newPaymentStep3Robot.verifyTotalAmountToPayForID(
          invoiceIdPrice,
        );
      });
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
