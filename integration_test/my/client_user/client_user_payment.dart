import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
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
import '../../robots/payments/soa/statement_of_account_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
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
  late StatementOfAccountRobot soaRootRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
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
    soaRootRobot = StatementOfAccountRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    paymentSummaryDetailRobot = PaymentSummaryDetailRobot(tester);
    accountSummaryTabRobot = AccountSummaryTabRobot(tester);
    accountSummaryTabFilterRobot = AccountSummaryTabFilterRobot(tester);
  }

  //Initialize Variable
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const customerCode = '0030082707';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const currency = 'MYR';
  final successSnackbarMessage = 'File downloaded successfully'.tr();

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    try {
      initializeRobot(tester);
      await runAppForTesting(tester);
      if (loginRobot.isLoginPage) {
        await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
        await customerSearchRobot.selectCustomerSearch(shipToCode);
        await commonRobot.dismissSnackbar(dismissAll: true);
        await commonRobot.closeAnnouncementAlertDialog();
      } else {
        await commonRobot.dismissSnackbar(dismissAll: true);
        await commonRobot.changeDeliveryAddress(
          shipToCode,
        );
      }
    } catch (e) {
      await commonRobot.forceLogout();
    }
  }

  group(
    'Payment Home Page - ',
    () {
      Future<void> goToPaymentHomePage(WidgetTester tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);

        await homeRobot.tapPaymentQuickAccess();
        paymentHomeRobot.verifyPaymentsTabPage();
      }

      testWidgets(
        'EZRX-T181 | Verify Payments Page',
        (tester) async {
          //Go to payment home page
          await goToPaymentHomePage(tester);

          paymentHomeRobot.verifyNewPaymentsButton();
          paymentHomeRobot.verifyPaymentHomeOptionMenu();
          paymentHomeRobot.verifyPaymentHomeInvoiceCard();
          paymentHomeRobot.verifyPaymentHomeCreditCard();
          paymentHomeRobot.verifyPaymentHomeInProgressCard();
          //TODO: Statement of account on MY auto disable, cannot change

          // await paymentHomeRobot.verifyPaymentStatementAccount();
        },
      );

      //TODO: Statement of account on MY auto disable, cannot change

      // testWidgets('EZRX-T182 | Verify Obscure & Download property',
      //     (tester) async {
      //   //Go to payment home page
      //   await goToPaymentHomePage(tester);

      //   paymentHomeRobot.verifyPaymentHomeInvoiceCardObscure();
      //   paymentHomeRobot.verifyPaymentHomeCreditCardObscure();
      //   paymentHomeRobot.verifyPaymentSummaryObscure();

      //   await paymentHomeRobot.tapToAllObscureButton();
      //   paymentHomeRobot.verifyNoObscureTextPresent();

      //   await paymentHomeRobot.verifyPaymentStatementAccount();

      //   await paymentHomeRobot.downloadFirstStatementAccount();

      //   await commonRobot.verifyCustomSnackBar(
      //     message: successSnackbarMessage,
      //   );
      //   await commonRobot.dismissSnackbar();
      // });

      testWidgets(
          'EZRX-T183 | Verify Redirection Feature - Payment summary & Statement of accounts & New Payment Button',
          (tester) async {
        //Go to payment home page
        await goToPaymentHomePage(tester);

        paymentHomeRobot.verifyPaymentHomeInProgressCard();

        await paymentHomeRobot.navigateToPaymentSummaryScreen();
        paymentSummaryRobot.verifyPageVisible();
        await commonRobot.tapToBackScreen();

        //TODO: Statement of account on MY auto disable, cannot change

        // await paymentHomeRobot.navigateToStatementOfAccountScreen();
        // statementAccountRobot.verifySOAPage();
        // await commonRobot.tapToBackScreen();

        await paymentHomeRobot.tapNewPayment();
        await newPaymentRobot.verifyPage();
      });
    },
  );

  group('Account Summary menu - invoice tab', () {
    final documentDateFrom = DateTime(2023, 1, 15);
    final documentDateTo = DateTime(2024, 1, 9);
    final dueDateFrom = DateTime(2023, 7, 10);
    final dueDateTo = DateTime(2023, 8, 29);
    const amountFrom = 50.0;
    const amountTo = 300.0;
    const invoiceStatus = 'Cleared';
    const invalidLengthSearchKey = '1';
    const invalidSearchKey = '1234567890';

    const invoiceId = '1100001344';
    final invoiceSubtotal = '$currency ${245.0.priceFormatted}';
    final invoiceGrandTotal = invoiceSubtotal;
    const invoiceOrderNumber = '0200297747';
    const invoicePoReference = 'jjmtest';
    const invoiceDeliveryInstruction = 'NA';

    const materialGroupIndex = 0;
    const material1Index = 0;
    const materialNumber1 = '23031411';
    const materialQty1 = 1;
    final materialUnitPrice1 = '$currency ${125.0.priceFormatted}';
    final materialTotalPrice1 = materialUnitPrice1;
    const material2Index = 1;
    const materialNumber2 = '23031416';
    const materialQty2 = 1;
    final materialUnitPrice2 = '$currency ${120.0.priceFormatted}';
    final materialTotalPrice2 = materialUnitPrice2;

    Future<void> goToAccountSummaryInvoicePage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.tapPaymentQuickAccess();
      await paymentHomeRobot.tapAccountSummaryMenu();
      accountSummaryRootRobot.verifyRootPage();
      accountSummaryRootRobot.verifyTabBar();
      accountSummaryRootRobot.verifyInvoicesPage();
    }

    testWidgets(
      'EZRX-T265 | Verify Invoice Page - all initial Fields',
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
      },
    );

    testWidgets(
      'EZRX-T133 | Verify new Payment Feature',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyNewPaymentButton();
        await accountInvoiceRobot.tapNewPaymentButton();
        await newPaymentRobot.verifyPage();
      },
    );

    testWidgets(
      'EZRX-T131 | Verify filter tune icon - all features',
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
        accountInvoiceRobot.verifyItems();
      },
    );

    testWidgets(
      'EZRX-T161 | Verify pull to refresh',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
        accountInvoiceRobot.verifySearchBarText(invalidSearchKey);
        accountInvoiceRobot.verifyNoRecordFound();
        await accountInvoiceRobot.pullToRefresh();
        accountInvoiceRobot.verifyItems();
      },
    );

    testWidgets(
      'EZRX-T129 | Verify search invoice by inputting invalid keyword on Invoices Tab - Unhappy Flow',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        await accountInvoiceRobot.searchWithSearchIcon(invalidLengthSearchKey);
        await accountInvoiceRobot
            .verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await accountInvoiceRobot
            .searchWithKeyboardAction(invalidLengthSearchKey);
        await accountInvoiceRobot
            .verifyAndDismissInvalidLengthSearchMessageSnackbar();
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
        accountInvoiceRobot.verifyItems();

        await accountInvoiceRobot.searchWithKeyboardAction(invalidSearchKey);
        await accountInvoiceRobot.waitAutoSearchDuration();
        accountInvoiceRobot.verifyLoadingImage(isVisible: false);
        accountInvoiceRobot.verifyNoRecordFound();
      },
    );

    testWidgets(
      'EZRX-T130 | Verify search invoice by inputting valid keyword on Invoices Tab - happy Flow',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot.tapDocumentDateField();
        await accountInvoiceFilterRobot.setDateRangePickerValue(
          fromDate: documentDateFrom,
          toDate: documentDateTo,
        );
        await accountInvoiceFilterRobot.tapApplyButton();

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
        accountInvoiceRobot.verifyItems();
      },
    );

    testWidgets(
      'EZRX-T267 | Verify search invoice by inputting valid keyword on Invoice Tab - on keyboard done',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();

        await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
        accountInvoiceRobot.verifySearchBarText(invoiceId);
        accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);
      },
    );

    testWidgets(
      'EZRX-T281 | Verify filter tune icon - Filter by status',
      (tester) async {
        const status = 'Cleared';
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot.tapStatusCheckbox(status);
        await accountInvoiceFilterRobot.tapApplyButton();
        accountInvoiceRobot.verifyFilterApplied(1);
        accountInvoiceRobot.verifyItemsWithStatus(status);
        await accountInvoiceRobot.tapFilterButton();
        accountInvoiceFilterRobot.verifyStatusFilterValue(status, true);
      },
    );

    testWidgets(
      'EZRX-T280 | Verify filter tune icon - Filter by Amount value',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        accountInvoiceRobot.verifyFilterApplied(1);
        await accountInvoiceRobot.tapFilterButton();

        // Input date range have data
        await accountInvoiceFilterRobot.tapDocumentDateField();
        await accountInvoiceFilterRobot.setDateRangePickerValue(
          fromDate: documentDateFrom,
          toDate: documentDateTo,
        );
        // Input amount range
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
      },
    );

    testWidgets(
      'EZRX-T278 | Verify filter tune icon - Filter by document date',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
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
      },
    );

    testWidgets(
      'EZRX-T279 | Verify filter tune icon - Filter by due date',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

        //verify
        accountInvoiceRobot.verifyItems();
        accountInvoiceRobot.verifyFilterApplied(1);
        await accountInvoiceRobot.tapFilterButton();
        // Input date range have data
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
      },
    );

    testWidgets(
      'EZRX-T277 | Verify filter tune icon - all features unhappy flow',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

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
      },
    );

    testWidgets(
      'EZRX-T132 | Verify Invoice Detail Page',
      (tester) async {
        //Redirect to invoice page
        await goToAccountSummaryInvoicePage(tester);

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
        viewByOrdersDetailRobot.verifySubTotal(invoiceSubtotal);
        viewByOrdersDetailRobot.verifyGrandTotal(invoiceGrandTotal);
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber1);
        viewByOrdersDetailRobot.verifyQty(materialQty1);
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(materialTotalPrice1);
        await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber2);
        viewByOrdersDetailRobot.verifyQty(materialQty2);
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(materialTotalPrice2);

        viewByOrdersDetailRobot.verifyBuyAgainButton();
        await commonRobot.tapToBackScreen();

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
        await accountInvoiceDetailRobot.verifyMaterial(
          materialGroupIndex,
          material2Index,
        );
        accountInvoiceDetailRobot.verifyMaterialNumber(materialNumber2);
        await accountInvoiceDetailRobot.verifyMaterialQty(materialQty2);
        accountInvoiceDetailRobot.verifyMaterialUnitPrice(materialUnitPrice2);
        accountInvoiceDetailRobot.verifyMaterialTotalPrice(materialTotalPrice2);
      },
    );

    testWidgets(
      'EZRX-T560 | Export Button Feature - Download Invoices',
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
      },
    );
  });

  group('Account summary menu - credit tab', () {
    //date
    final currentDate = DateTime.now();
    final pastTenYearsDate = currentDate.subtract(const Duration(days: 3600));
    const inValidCreditId = '1232136712';
    //material info
    const creditId = '4040002409';
    const creditStatus = 'Cleared';
    const creditPrice = '$currency 1,160.00';
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
      accountCreditsRobot.verifyCreditItemsList();
    }

    testWidgets(
      'EZRX-T264 | verify Credit Page - all initial Fields',
      (tester) async {
        //Redirect to account summary credit page
        await goToAccountSummaryCreditPage(tester);

        //search bar
        accountCreditsRobot.verifyCreditSearchBar();
        //filter
        accountCreditsRobot.verifyFilterTuneIcon();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        await accountCreditsRobot.tapFilterTuneIcon();
        accountCreditsFilterRobot.verifyCreditsFilter();
        accountCreditsFilterRobot.verifyDefaultFilterApplied();
        await accountCreditsFilterRobot.tapCloseButton();
        accountCreditsFilterRobot.verifyCreditsFilter(isVisible: false);
        //download button
        accountCreditsRobot.verifyDownloadButton();
        //new payment button
        accountCreditsRobot.verifyNewPaymentButton();
      },
    );

    testWidgets(
      'EZRX-T158 | Verify search credits by inputting invalid keyword on Credits Tab - Unhappy Flow',
      (tester) async {
        const inValidShortText = '1';
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
        await commonRobot.dismissSnackbar(dismissAll: true);
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
      },
    );

    testWidgets(
      'EZRX-T266 | Verify search credit by inputting valid keyword on Credits Tab - on keyboard done',
      (tester) async {
        //Redirect to account summary credit page
        await goToAccountSummaryCreditPage(tester);

        //filter applied
        await applyFilterDateToGetData();

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
      },
    );

    testWidgets(
      'EZRX-T159 | Verify search credit by inputting valid keyword on Credits Tab - Happy flow - Every feature',
      (tester) async {
        //Redirect to account summary credit page
        await goToAccountSummaryCreditPage(tester);

        //filter applied
        await applyFilterDateToGetData();

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
        await commonRobot.tapClearSearch();

        //search bar -  valid input with on auto search
        await commonRobot.autoSearch(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
        await commonRobot.tapClearSearch();

        //search bar -  valid input with on search icon
        await commonRobot.searchWithSearchIcon(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
        await commonRobot.tapClearSearch();

        //search bar - combine keyboard done & auto search
        await commonRobot.searchWithKeyboardAction(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();

        //search bar - combine search icon & auto search
        await commonRobot.searchWithSearchIcon(creditId);
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
        );
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
      },
    );

    testWidgets(
      'EZRX-T162 | verify pull to refresh',
      (tester) async {
        //Redirect to account summary credit page
        await goToAccountSummaryCreditPage(tester);

        //filter applied
        await applyFilterDateToGetData();

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(inValidCreditId);
        accountCreditsRobot.verifyNoCreditFound();
        await commonRobot.pullToRefresh();
        accountCreditsRobot.verifyCreditItemsList();
        await accountCreditsRobot.tapFilterTuneIcon();
        await accountCreditsRobot.tapFilterTuneIcon();
        accountCreditsFilterRobot.verifyCreditsFilter();
        accountCreditsFilterRobot.verifyDefaultFilterApplied();
        await accountCreditsFilterRobot.tapCloseButton();
      },
    );

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
      },
    );

    testWidgets(
      'EZRX-T169 | verify Credits Detail Page',
      (tester) async {
        //variables
        const documentType = 'Credit Memo';
        const referenceNumber = '1100001268';
        const returnMaterialNumber1 = '23348057';
        const returnMaterialNumber2 = returnMaterialNumber1;
        const returnQuantity1 = 8;
        const returnQuantity2 = 1;
        const returnUnitPrice1 = '$currency 145.00';
        const returnUnitPrice2 = '$currency 0.00';
        const returnMaterialTotalPrice1 = '$currency 1,160.00';
        const returnMaterialTotalPrice2 = '$currency 0.00';
        const totalReturnQuantity = 2;

        //Redirect to account summary credit page
        await goToAccountSummaryCreditPage(tester);

        //filter applied
        await applyFilterDateToGetData();

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(creditId);

        //verify item
        accountCreditsRobot.verifyCreditItem(
          creditId,
          creditStatus,
          creditPrice,
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
        accountCreditDetailsRobot.verifyCreditItemTotalPrice(creditPrice);
        //return items
        accountCreditDetailsRobot.verifyReturnItems(totalReturnQuantity);
        await accountCreditDetailsRobot.verifyReturnMaterial(
          returnMaterialNumber1,
          returnQuantity1,
          returnUnitPrice1,
          returnMaterialTotalPrice1,
        );
        await accountCreditDetailsRobot.verifyFreeMaterial(
          returnMaterialNumber2,
          returnQuantity2,
          returnUnitPrice2,
          returnMaterialTotalPrice2,
        );
      },
    );

    testWidgets(
      'EZRX-T268 | Verify filter tune icon - Filter by document date',
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
      },
    );

    testWidgets(
      'EZRX-T270 | Verify filter tune icon - Filter by status',
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
        accountCreditsRobot.verifyCreditsItemListWithStatus(creditStatus);
      },
    );

    testWidgets(
      'EZRX-T269 | Verify filter tune icon - Filter by Amount value',
      (tester) async {
        const fromAmount = '1000.0';
        const toAmount = '1200.0';

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
      },
    );

    testWidgets(
      'EZRX-T178 | Verify filter tune icon - all features happy flow',
      (tester) async {
        //variable
        final fromDate = DateTime(2015, 10, 10);
        final toDate = DateTime(2023, 10, 10);
        const clearedStatus = 'Cleared';
        const openStatus = 'Open';
        const fromAmount = '1000.0';
        const toAmount = '1200.0';

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
        await accountCreditsFilterRobot
            .tapToChangeStatusCheckbox(clearedStatus);
        accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
        await accountCreditsFilterRobot.tapApplyButton();
        //verify clear status credit filter list
        accountCreditsRobot.verifyCreditsItemListWithStatus(clearedStatus);

        //Tap on filter icon
        await accountCreditsRobot.tapFilterTuneIcon();
        //Apply status - open
        accountCreditsFilterRobot.verifyStatusFilter(openStatus, false);
        await accountCreditsFilterRobot.tapToChangeStatusCheckbox(openStatus);
        accountCreditsFilterRobot.verifyStatusFilter(openStatus, true);
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(1);

        accountCreditsRobot.verifyCreditsItemListWithStatus(openStatus);

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
        accountCreditsRobot.verifyCreditItemsList();
        //verify filter
        await accountCreditsRobot.tapFilterTuneIcon();
        accountCreditsFilterRobot.verifyDefaultFilterApplied();
        await accountCreditsFilterRobot.tapCloseButton();
      },
    );

    testWidgets(
      'EZRX-T271 | Verify filter tune icon - all features unhappy flow',
      (tester) async {
        //variable
        final fromDate = DateTime(2023, 10, 5);
        final toDate = DateTime(2023, 10, 12);
        const fromAmount = '100.0';
        const toAmount = '90.0';

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

        //invalid document date filter applied - fromDate > toDate
        await accountCreditsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: toDate,
          toDate: fromDate,
        );
        accountCreditsFilterRobot.verifyInvalidDateRangeError();
      },
    );

    testWidgets(
      'EZRX-T561 | Export Button Feature - Download Credits',
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
      },
    );
  });

  group('Account Summary menu - summary tab', () {
    const creditId = '0180000002';
    const creditIdWithReference = '1100001357';
    const referenceList = '#4040000133';
    const emptyReferenceListString = 'NA';
    const creditIdStatus = 'Cleared';

    const debitId = creditId;

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

    testWidgets(
      'EZRX-T566 | Verify Detail Feature - show reference details with reference',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        //search credit Cleared Id
        await commonRobot.searchWithKeyboardAction(creditIdWithReference);

        accountSummaryTabRobot.verifyExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(
          referenceListString: referenceList,
        );
        await accountSummaryTabRobot.tapExpandableDetailsButton();
        accountSummaryTabRobot.displayDetails(isHidden: true);
        await commonRobot.tapClearSearch();
        accountSummaryTabRobot.verifyItems();
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
        await commonRobot.searchWithKeyboardAction(creditId);
        accountSummaryTabRobot.verifyItems();
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
      },
    );

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
      },
    );

    testWidgets(
      'EZRX-T551 | Verify search summary by inputting valid keyword on Summary Tab - Happy flow - Every feature',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(creditId);
        accountSummaryTabRobot.verifyItems();
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await commonRobot.tapClearSearch();

        //search bar -  valid input with on auto search
        await commonRobot.autoSearch(creditId);
        accountSummaryTabRobot.verifyItems();
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await commonRobot.tapClearSearch();

        //search bar -  valid input with on search icon
        await commonRobot.searchWithSearchIcon(creditId);
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await commonRobot.tapClearSearch();

        //search bar - combine keyboard done & auto search
        await commonRobot.searchWithKeyboardAction(creditId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await commonRobot.tapClearSearch();

        //search bar - combine search icon & auto search
        await commonRobot.searchWithSearchIcon(creditId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await commonRobot.tapClearSearch();
      },
    );

    testWidgets(
      'EZRX-T553 | Verify filter tune icon - Filter by document date',
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
      },
    );

    testWidgets(
      'EZRX-T568 | Verify filter tune icon - Filter by due date',
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
      },
    );

    testWidgets(
      'EZRX-T569 | Verify filter tune icon - Filter by status',
      (tester) async {
        final statusList = [
          'Cleared',
        ];
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        //Apply status - Cleared
        for (final status in statusList) {
          await verifySummaryStatusCheck(status);
        }
      },
    );

    testWidgets(
      'EZRX-T570 | Verify filter tune icon - all features',
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
        //filter applied Document Date
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

        accountSummaryTabRobot.verifyFilterApplied(1);

        await verifySummaryStatusCheck(
          creditIdStatus,
          afterVerifyUncheckStatus: false,
        );
        accountSummaryTabRobot.verifyFilterApplied(1);
      },
    );

    testWidgets(
      'EZRX-T571 | Verify filter tune icon - all features unhappy flow',
      (tester) async {
        final invalidFromDate = DateTime(2023, 10, 15);
        final invalidToDate = DateTime(2023, 10, 12);
        final outOfRangeToDate = toDate;
        final outOfRangeFromDate = toDate.add(const Duration(days: 5));
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

        //filter applied - Due Date
        accountSummaryTabRobot.verifyFilterButton();
        await accountSummaryTabRobot.tapFilterButton();
        accountSummaryTabFilterRobot.verifyCreditsFilter();
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
      },
    );

    testWidgets(
      'EZRX-T562 | Export Button Feature - Download Summary',
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
      },
    );

    testWidgets(
      'EZRX-T552 | verify pull to refresh',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(inValidCreditId);
        accountSummaryTabRobot.verifyNoRecordFound();
        await accountSummaryTabRobot.pullToRefresh();
        accountSummaryTabRobot.verifyItems();
        await accountSummaryTabRobot.tapFilterButton();
        accountSummaryTabFilterRobot.verifyCreditsFilter();
        accountSummaryTabFilterRobot.verifyDefaultFilterApplied();
        await accountSummaryTabFilterRobot.tapCloseIcon();
      },
    );

    testWidgets(
      'EZRX-T572 | verify summary detail page - invoice and credits',
      (tester) async {
        //Got to Summary Page
        await goToAccountSummaryPage(tester);
        commonRobot.verifySearchBar();

        //search bar - valid input with on done keyboard button
        await commonRobot.searchWithKeyboardAction(creditId);
        accountSummaryTabRobot.verifyItems();
        accountSummaryTabRobot.verifyItemWithId(
          debitId,
          false,
        );
        await accountSummaryTabRobot.tapItemWithId(debitId, false);
        accountInvoiceDetailRobot.verifyPage();
        await commonRobot.tapToBackScreen();

        accountSummaryTabRobot.verifyItemWithId(
          creditId,
          true,
        );
        await accountSummaryTabRobot.tapItemWithId(creditId, true);
        accountCreditDetailsRobot.verify();
      },
    );
  });

  group('Payment summary menu - ', () {
    const invalidSearchKey = 'invalid-keyword';
    const invalidLengthSearchKey = 'a';
    const validLengthSearchKey = 'qq';
    var paymentId = '';
    final fromDate = DateTime(2000, 1, 1);
    final toDate = DateTime.now();
    const statusFilter = 'In Progress';
    final statusFilterOptions = [
      'In Progress',
      'Failed',
      'Processed',
      'Successful',
    ];

    double totalPrice;

    Future<void> goToPaymentSummaryPage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      //Redirect to payment summary page
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
      await paymentHomeRobot.tapPaymentSummaryMenu();
      paymentSummaryRobot.verifyPageVisible();
    }

    testWidgets(
      'EZRX-T184 | Verify Payment Summary Page',
      (tester) async {
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
      },
    );

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

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        paymentSummaryRobot.verifyNoRecordFoundVisible();
        await commonRobot.tapClearSearch();
      },
    );

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

        await commonRobot.searchWithSearchIcon(validLengthSearchKey);
        paymentSummaryRobot.verifyNoRecordFoundVisible();
        await commonRobot.tapClearSearch();

        paymentId = paymentSummaryRobot.getPaymentId(index);

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
      },
    );

    testWidgets(
      'EZRX-T187 | Verify Download Feature',
      (tester) async {
        //navigate to page
        await goToPaymentSummaryPage(tester);

        //verify
        paymentSummaryRobot.verifyPageVisible();
        paymentSummaryRobot.verifyDownloadButtonVisible();
        await paymentSummaryRobot.tapDownloadButton();
        paymentSummaryRobot.verifyDownloadSuccessSnackbarVisible();
      },
    );

    testWidgets(
      'EZRX-T188 | Verify Filter Tune Icon',
      (tester) async {
        //navigate to page
        await goToPaymentSummaryPage(tester);

        //verify
        paymentSummaryRobot.verifyPageVisible();

        //change filter date
        await paymentSummaryRobot.tapFilterButton();
        paymentSummaryFilterRobot
            .verifyDefaultFilterApplied(statusFilterOptions);
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
      },
    );

    testWidgets(
      'EZRX-T189 | Verify pull to refresh Feature',
      (tester) async {
        //navigate to page
        await goToPaymentSummaryPage(tester);

        //verify
        paymentSummaryRobot.verifyPageVisible();
        await paymentSummaryRobot.pullToRefresh();
        paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      },
    );

    testWidgets(
      'EZRX-563 | Verify Reset Feature',
      (tester) async {
        //navigate to page
        await goToPaymentSummaryPage(tester);
        paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        paymentSummaryRobot.verifyNoRecordFoundVisible();
        await paymentSummaryRobot.tapFilterButton();
        paymentSummaryRobot.verifyResetButton();
        await paymentSummaryRobot.tapResetButton();
        paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
        await paymentSummaryRobot.tapFilterButton();
        paymentSummaryFilterRobot
            .verifyDefaultFilterApplied(statusFilterOptions);
        await accountInvoiceFilterRobot.tapCloseIcon();
        paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      },
    );

    testWidgets(
      'EZRX-T565 | verify Payment Summary Details Page with download invoice',
      (tester) async {
        const downloadMessage = 'Download Successful';
        const index = 0;
        //navigate to page
        await goToPaymentSummaryPage(tester);

        //verify
        paymentSummaryRobot.verifyPageVisible();
        await commonRobot.pullToRefresh();
        paymentId = paymentSummaryRobot.getPaymentId(index);
        totalPrice = paymentSummaryRobot.getPaymentIdPrice(index);

        await commonRobot.searchWithSearchIcon(paymentId);
        paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
        await paymentSummaryRobot.tapFirstItem();

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

        // Download Advice
        paymentSummaryDetailRobot.verifyDownloadAdviceButton();
        await paymentSummaryDetailRobot.tapDownloadAdviceButton();
        await commonRobot.verifyCustomSnackBar(
          message: downloadMessage,
        );
        await commonRobot.dismissSnackbar();
      },
    );
  });

  group('SOA menu - ', () {
    Future<void> goToStatementOfAccountPage(WidgetTester tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      //Redirect to SOA page
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
      await paymentHomeRobot.tapStatementOfAccountTile();
      soaRootRobot.verifySOAPage();
    }

    //TODO: fail because statement cannot enable on MY, will fix later

    // testWidgets('EZRX-T190 | verify Statement of accounts Page',
    //     (tester) async {
    //   await goToStatementOfAccountPage(tester);

    //   soaRootRobot.verifySOAShipToAddress(shipToAddress);
    //   soaRootRobot.verifySOACustomerCode(customerCode);
    //   soaRootRobot.verifySOAFilterButton();
    //   soaRootRobot.verifySOAFilterCount(0);
    //   soaRootRobot.verifySOASearchResults();
    //   soaRootRobot.verifySOANewPaymentButton();
    // });

    testWidgets(
      'EZRX-T191 | Verify Filter by month Feature',
      (tester) async {
        await goToStatementOfAccountPage(tester);

        soaRootRobot.verifySOACustomerCode(customerCode);
        soaRootRobot.verifySOAFilterButton();
        await soaRootRobot.tapSOAFilterButton();
        soaRootRobot.verifySOAFilterBottomSheet();
        await soaRootRobot.enterTextSOAFilterDateField();
        await soaRootRobot.tapSOAApplyButton();
        soaRootRobot.verifySOAFilterBottomSheetNot();
        soaRootRobot.verifySOAItem();
        await soaRootRobot.tapSOAFilterButton();
        soaRootRobot.verifySOAFilterBottomSheet();
        await soaRootRobot.tapSOAResetFilterButton();
      },
    );

    //TODO: fail because statement cannot enable on MY, will fix later

    // testWidgets('EZRX-T192 | Verify Download Feature', (tester) async {
    //   await goToStatementOfAccountPage(tester);

    //   soaRootRobot.verifySOAItem();

    //   await soaRootRobot.verifyAndTapStatementOfAccountDownloadButton();
    // });

    testWidgets(
      'EZRX-T193 | Verify new Payment Feature',
      (tester) async {
        await goToStatementOfAccountPage(tester);

        soaRootRobot.verifySOANewPaymentButton();
        await soaRootRobot.tapSOANewPaymentButton();
        await newPaymentRobot.verifyPage();
      },
    );

    testWidgets(
      'EZRX-T263 | Verify pull to refresh Feature',
      (tester) async {
        await goToStatementOfAccountPage(tester);
        await soaRootRobot.verifyPullToRefresh();
      },
    );
  });

  group('New Payment Button - ', () {
    final toDate = DateTime.now();
    final fromDate = DateTime(2013, 1, 1);
    String invoiceId;
    String creditId;
    var invoiceIdPrice = 0.0;
    var creditIdPrice = 0.0;
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
      final fromDate = DateTime(2014, 1, 1);
      final toDate = DateTime.now();
      const inValidKeyword = '00000000000';
      const validKeyword = '66';

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

          await commonRobot.searchWithSearchIcon('1');
          await commonRobot.verifySnackbarVisible();
          await commonRobot.dismissSnackbar();
          await commonRobot.searchWithKeyboardAction(inValidKeyword);
          newPaymentStep1Robot.verifyNoItemFound();
        },
      );

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
        },
      );

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
          await newPaymentStep1Robot.clickFilter();
          await newPaymentStep1Robot.clickOverDueSelector();
          await newPaymentStep1Robot.tapApplyFilter();
          newPaymentStep1Robot.verifyAtLeast1ItemFound();
          await newPaymentStep1Robot.clickFilter();
          await newPaymentStep1Robot.tapResetFilter();
          await newPaymentStep1Robot.clickFilter();
          newPaymentStep1Robot.verifyDefaultFilter();
        },
      );

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
        },
      );

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
        },
      );

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
        },
      );

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
        },
      );

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
        },
      );

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
        },
      );
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

      testWidgets(
        'EZRX-T224 | verify New Payment Page Step 2 - Initial Fields',
        (tester) async {
          await goToPaymentStep2Page(tester);
        },
      );

      testWidgets(
        'EZRX-T255 | verify New Payment Page Step 2 - Text Field Unhappy flow',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          await commonRobot.searchWithKeyboardAction('0');
          await commonRobot
              .verifyAndDismissInvalidLengthSearchMessageSnackbar();
          await commonRobot.dismissSnackbar();
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
        },
      );

      testWidgets(
        'EZRX-T256 | verify New Payment Page Step 2 - Text Field Textfield search on clear button',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
          await commonRobot.tapClearSearch();
          await newPaymentStep2Robot.clickFilter();
          newPaymentStep2Robot.verifyDefaultFilter();
        },
      );

      testWidgets(
        'EZRX-T257 | verify New Payment Page Step 2 - Text Field search on done keyboard button',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          await commonRobot
              .searchWithKeyboardAction(noResultCreditSearchKeyword);
          newPaymentStep2Robot.verifyNoItemFound();
        },
      );

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
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
        },
      );

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
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          await newPaymentStep2Robot.clickFilter();
          await newPaymentStep2Robot.tapResetFilter();
          await newPaymentStep2Robot.clickFilter();
          newPaymentStep2Robot.verifyDefaultFilter();
        },
      );

      testWidgets(
        'EZRX-T260 | verify New Payment Page Step 2 - All button Feature',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyCheckboxStatus(false);
          await newPaymentStep2Robot.tapAllCheckbox();
          newPaymentStep2Robot.verifyCheckboxStatus(true);
          newPaymentStep2Robot.verifyAtLeast1ItemIsCheck();
          await newPaymentStep2Robot.clickFirstItem();
          newPaymentStep2Robot.verifyCheckboxStatus(false);
          await newPaymentStep2Robot.clickFirstItem();
          newPaymentStep2Robot.verifyCheckboxStatus(true);
        },
      );

      testWidgets(
        'EZRX-T261 | verify New Payment Page Step 2 - pull to refresh features',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
          newPaymentStep2Robot.verifyAtLeastOneItemFound();
          newPaymentStep2Robot.collectTheFirstItem();
          await commonRobot.pullToRefresh();
          await filterTheDateToGetItem();
          newPaymentStep2Robot.verifyTheFirstItemAfterRefresh();
        },
      );

      testWidgets(
        'EZRX-T564 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3 without credit',
        (tester) async {
          const newCreditIdPrice = 0.0;
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
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
        },
      );

      testWidgets(
        'EZRX-T262 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3 with credit',
        (tester) async {
          await goToPaymentStep2Page(tester);

          await filterTheDateToGetItem();
          if (newPaymentStep2Robot.noRecordFound) {
            newPaymentStep2Robot.verifyNoItemFound();
            await commonRobot.pullToRefresh();
            if (newPaymentStep2Robot.noRecordFound) {
              return;
            }
          }
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
        },
      );
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

        newPaymentStep2Robot.verifyStep2InitialField(invoiceIdPrice);
        await filterTheDateToGetItem();
        newPaymentStep2Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          0.0,
        );
        await newPaymentStep2Robot.tapNextButton();
        newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
        newPaymentStep3Robot.verifyOrderAddressVisible(shipToAddress);
        newPaymentStep3Robot.verifyCustomerCode(customerCode);
        newPaymentStep3Robot.verifyShipToCode(shipToCode);
        newPaymentStep3Robot.verifyThePriceAndButton(
          invoiceIdPrice,
          0.0,
        );
      }

      testWidgets(
        'EZRX-T225 | verify New Payment Page Step 3 - Initial Fields',
        (tester) async {
          await goToPaymentStep3PageWithoutCredit(tester);
        },
      );

      testWidgets(
        'EZRX-T226 | verify New Payment Page Step 3 - Pay now Button',
        (tester) async {
          await goToPaymentStep3PageWithoutCredit(tester);

          newPaymentStep3Robot.verifyTotalAmountToPay(
            invoiceIdPrice,
            0.0,
          );
          newPaymentStep3Robot.verifyGeneratePaymentAdviceButton();
        },
      );
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
