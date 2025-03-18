import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/aup_tc_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late MoreRobot moreRobot;
  late CustomerSearchRobot customerSearchRobot;
  late AupTCRobot aupTCRobot;

  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryRobot paymentSummaryRobot;
  late PaymentSummaryFilterRobot paymentSummaryFilterRobot;
  late PaymentSummaryDetailRobot paymentSummaryDetailRobot;

  late AccountSummaryRootRobot accountSummaryRootRobot;
  late AccountSummaryTabRobot accountSummaryTabRobot;
  late AccountSummaryTabFilterRobot accountSummaryTabFilterRobot;
  late AccountCreditsRobot accountCreditsRobot;
  late AccountCreditDetailsRobot accountCreditsDetailRobot;
  late AccountCreditsFilterRobot accountCreditsFilterRobot;
  late AccountInvoiceRobot accountInvoiceRobot;
  late AccountInvoiceFilterRobot accountInvoiceFilterRobot;
  late AccountInvoiceDetailRobot accountInvoiceDetailRobot;

  late NewPaymentRobot newPaymentRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    moreRobot = MoreRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    aupTCRobot = AupTCRobot(tester);

    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);

    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentSummaryRobot = PaymentSummaryRobot(tester);
    paymentSummaryFilterRobot = PaymentSummaryFilterRobot(tester);
    paymentSummaryDetailRobot = PaymentSummaryDetailRobot(tester);

    accountSummaryRootRobot = AccountSummaryRootRobot(tester);
    accountSummaryTabRobot = AccountSummaryTabRobot(tester);
    accountSummaryTabFilterRobot = AccountSummaryTabFilterRobot(tester);
    accountCreditsRobot = AccountCreditsRobot(tester);
    accountCreditsFilterRobot = AccountCreditsFilterRobot(tester);
    accountCreditsDetailRobot = AccountCreditDetailsRobot(tester);
    accountInvoiceRobot = AccountInvoiceRobot(tester);
    accountInvoiceFilterRobot = AccountInvoiceFilterRobot(tester);
    accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);

    newPaymentRobot = NewPaymentRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
  }

  const market = 'Malaysia';
  const username = 'mpmyclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030082707';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const nonMPShipToCode = '0000002012';
  const currency = 'MYR';

  const invoiceId = '1550000028';
  const invoiceMaterialNumber = '23357257';
  const invoiceMaterialSeller = 'Thai Meiji Pharmaceutical Co.,Ltd.';
  const invoiceMaterialPrice = 200.0;
  const invoiceMaterialQty = 2;
  const invoiceTotalPrice = invoiceMaterialQty * invoiceMaterialPrice;
  final invoiceDocumentDate = DateTime(2024, 4, 11);
  final invoiceDueOn = DateTime(2024, 5);
  const invoiceStatus = 'In Progress';
  const invoiceStatusFilter = 'In progress';
  const zpInvoiceId = '1100001435';
  const clearedInvoiceId = '1550000039';

  const creditId = '4550000041';
  const creditMaterialNumber = '23357277';
  const creditMaterialSeller = 'ABBOTT LABORATORIES (M) SDN';
  const creditMaterialPrice = 5000.0;
  const creditMaterialQty = 1;
  const creditTotalPrice = creditMaterialQty * creditMaterialPrice;
  final creditDocumentDate = DateTime(2024, 5, 29);
  const creditStatus = 'Cleared';
  const zpCreditId = '4040002472';

  const paymentAdviseId = '09EZ240002228401';
  final paymentAdviseCreatedDate = DateTime(2024, 4, 26);
  const paymentAdviseStatus = 'Processed';
  const paymentAdviseInvoiceId = '1550000022';
  const paymentAdviseInvoicePrice = 400.0;
  const paymentAdviseTotalPrice = paymentAdviseInvoicePrice;
  const zpPaymentAdviseId = '09EZ240002377401';

  Future<void> pumpAppWithMarketPlacePaymentScreen(WidgetTester tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, market);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await aupTCRobot.acceptTnC();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
      await commonRobot.changeDeliveryAddress(shipToCode);
    }
    await homeRobot.tapMarketPlacePaymentQuickAccess();
    await commonRobot.closeAnnouncementAlertDialog();
  }

  group('Payment Home -', () {
    testWidgets(
        'Verify marketplace payment quick access visiblity & navigation',
        (tester) async {
      await pumpAppWithMarketPlacePaymentScreen(tester);

      paymentHomeRobot.verifyPage();
      paymentHomeRobot.verifyPaymentHomeOptionMenu();
      await paymentHomeRobot.navigateToPaymentSummaryScreen(
        isMarketPlace: true,
      );
      paymentSummaryRobot.verifyPageVisible();
      await commonRobot.tapToBackScreen();
      await paymentHomeRobot.tapNewPayment();
      await newPaymentRobot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      await newPaymentRobot.tapCloseButton();
      await paymentHomeRobot.tapToBackScreen();
      homeRobot.verifyMarketPlacePaymentQuickAccess();
      await homeRobot.navigateToScreen(NavigationTab.more);
      moreRobot.verifyMarketPlacePaymentTile();
      await moreRobot.tapMarketPlacePaymentTile();
      paymentHomeRobot.verifyPage();
      await paymentHomeRobot.tapToBackScreen();
      await moreRobot.navigateToScreen(NavigationTab.home);
      await homeRobot.changeDeliveryAddress(nonMPShipToCode);
      homeRobot.verifyMarketPlacePaymentQuickAccess(isVisible: false);
      await homeRobot.navigateToScreen(NavigationTab.more);
      moreRobot.verifyMarketPlacePaymentTile(isVisible: false);
    });
  });

  group('Account summary -', () {
    group('Invoice tab -', () {
      testWidgets('EZRX-T2006 | Verify search/filter invoice', (tester) async {
        final fromDocumentDate =
            invoiceDocumentDate.subtract(const Duration(days: 2));
        final toDocumentDate = invoiceDocumentDate.add(const Duration(days: 2));
        final fromDueDate = invoiceDueOn.subtract(const Duration(days: 30));
        final toDueDate = invoiceDueOn.add(const Duration(days: 30));

        await pumpAppWithMarketPlacePaymentScreen(tester);
        await paymentHomeRobot.tapAccountSummaryMenu();
        accountSummaryRootRobot.verifyInvoicesPage();
        accountInvoiceRobot.verifyFilterApplied(1);
        //Verify navigate new payment
        await accountInvoiceRobot.tapNewPaymentButton();
        await newPaymentRobot.verifyPage();
        newPaymentRobot.verifyMarketPlaceLogo();
        await newPaymentRobot.tapCloseButton();
        //Verify search
        await accountInvoiceRobot.searchWithKeyboardAction(zpInvoiceId);
        accountInvoiceRobot.verifyFilterApplied(0);
        accountInvoiceRobot.verifyNoRecordFound();
        await accountInvoiceRobot.searchWithKeyboardAction(invoiceId);
        accountInvoiceRobot.verifyItemsWithSearchKey(invoiceId);
        accountInvoiceRobot.verifyMarketPlaceLogo();
        //Verify filter
        await accountInvoiceRobot.tapClearSearch();
        accountInvoiceRobot.verifyFilterApplied(1);
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot.tapDocumentDateField();
        await accountInvoiceFilterRobot.setDateRangePickerValue(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        await accountInvoiceFilterRobot.tapApplyButton();
        accountInvoiceRobot.verifyFilterApplied(1);
        accountInvoiceRobot.verifyItemsInDocumentDateRange(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        accountInvoiceRobot.verifyMarketPlaceLogo();
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot.tapDueDateField();
        await accountInvoiceFilterRobot.setDateRangePickerValue(
          fromDate: fromDueDate,
          toDate: toDueDate,
        );
        await accountInvoiceFilterRobot.tapApplyButton();
        accountInvoiceRobot.verifyFilterApplied(1);
        accountInvoiceRobot.verifyItems();
        accountInvoiceRobot.verifyMarketPlaceLogo();
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot
            .enterFromAmount(invoiceTotalPrice.toString());
        await accountInvoiceFilterRobot.tapApplyButton();
        await accountInvoiceFilterRobot
            .enterToAmount(invoiceTotalPrice.toString());
        await accountInvoiceFilterRobot.tapApplyButton();
        accountInvoiceRobot.verifyFilterApplied(1);
        accountInvoiceRobot.verifyItemsInAmountRange(
          fromAmount: invoiceTotalPrice,
          toAmount: invoiceTotalPrice,
          currency: currency,
        );
        accountInvoiceRobot.verifyMarketPlaceLogo();
        await accountInvoiceRobot.tapFilterButton();
        await accountInvoiceFilterRobot.tapStatusCheckbox(invoiceStatusFilter);
        await accountInvoiceFilterRobot.tapApplyButton();
        accountInvoiceRobot.verifyFilterApplied(1);
        accountInvoiceRobot.verifyItemsWithStatus(invoiceStatus.tr());
        accountInvoiceRobot.verifyMarketPlaceLogo();
      });

      testWidgets('EZRX-T2006 | Verify invoice detail', (tester) async {
        await pumpAppWithMarketPlacePaymentScreen(tester);

        await paymentHomeRobot.tapAccountSummaryMenu();
        await accountInvoiceRobot.autoSearch(invoiceId);
        await accountInvoiceRobot.tapFirstItem();
        await accountInvoiceDetailRobot.dismissSnackbar();
        // Verify navigate to order
        await accountInvoiceDetailRobot.redirectToOrderDetails();
        viewByOrdersDetailRobot
            .verifyMarketPlaceLogoWithSeller(invoiceMaterialSeller);
        await viewByOrdersDetailRobot.tapToBackScreen();
        // Verify componenets
        accountInvoiceDetailRobot.verifyInvoiceId(invoiceId);
        accountInvoiceDetailRobot.verifyOrderAddress(shipToAddress);
        accountInvoiceDetailRobot.verifyCustomerCode(customerCode);
        accountInvoiceDetailRobot.verifyDeliveryTo(shipToCode);
        accountInvoiceDetailRobot
            .verifySubTotal(invoiceTotalPrice.priceDisplay(currency));
        accountInvoiceDetailRobot
            .verifyGrandTotal(invoiceTotalPrice.priceDisplay(currency));
        await accountInvoiceDetailRobot.verifyMarketPlaceSection();
        await accountInvoiceDetailRobot
            .verifyMarketPlaceSeller(invoiceMaterialSeller);
        await accountInvoiceDetailRobot.verifyMaterial(0, 0);
        accountInvoiceDetailRobot.verifyMaterialNumber(invoiceMaterialNumber);
        accountInvoiceDetailRobot
            .verifyMaterialBatchExpiryDate(StockInfo.empty());
        accountInvoiceDetailRobot.verifyMaterialUnitPrice(
          invoiceMaterialPrice.priceDisplay(currency),
        );
        await accountInvoiceDetailRobot.verifyMaterialQty(invoiceMaterialQty);
      });
    });

    group('Credit tab -', () {
      testWidgets('EZRX-T2007 | Verify search/filter credit', (tester) async {
        final fromDocumentDate =
            creditDocumentDate.subtract(const Duration(days: 2));
        final toDocumentDate = creditDocumentDate.add(const Duration(days: 2));

        await pumpAppWithMarketPlacePaymentScreen(tester);
        await paymentHomeRobot.tapAccountSummaryMenu();
        await accountSummaryRootRobot.switchToCreditPage();
        accountSummaryRootRobot.verifyCreditsPage();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        //Verify navigate new payment
        await accountCreditsRobot.tapPaymentButton();
        await newPaymentRobot.verifyPage();
        newPaymentRobot.verifyMarketPlaceLogo();
        await newPaymentRobot.tapCloseButton();
        //Verify search
        await accountCreditsRobot.searchWithKeyboardAction(zpCreditId);
        accountCreditsRobot.verifyFilterAppliedCount(0);
        accountCreditsRobot.verifyNoCreditFound();
        await accountCreditsRobot.searchWithKeyboardAction(creditId);
        accountCreditsRobot.verifyCreditItemId(creditId);
        accountCreditsRobot.verifyMarketPlaceLogo();
        //Verify filter
        await accountCreditsRobot.tapClearSearch();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        await accountCreditsRobot.tapFilterTuneIcon();
        await accountCreditsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        accountCreditsRobot.verifyMarketPlaceLogo();
        await accountCreditsRobot.tapFilterTuneIcon();
        await accountCreditsFilterRobot
            .enterFromAmount(creditTotalPrice.toString());
        await accountCreditsFilterRobot.tapApplyButton();
        await accountCreditsFilterRobot
            .enterToAmount(creditTotalPrice.toString());
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        accountCreditsRobot.verifyCreditsInAmountRange(
          fromAmount: creditTotalPrice,
          toAmount: creditTotalPrice,
          currency: currency,
        );
        accountCreditsRobot.verifyMarketPlaceLogo();
        await accountCreditsRobot.tapFilterTuneIcon();
        await accountCreditsFilterRobot.tapToChangeStatusCheckbox(creditStatus);
        await accountCreditsFilterRobot.tapApplyButton();
        accountCreditsRobot.verifyFilterAppliedCount(1);
        accountCreditsRobot.verifyCreditsItemListWithStatus(creditStatus);
        accountCreditsRobot.verifyMarketPlaceLogo();
      });

      testWidgets('EZRX-T2007 | Verify credit detail', (tester) async {
        await pumpAppWithMarketPlacePaymentScreen(tester);

        await paymentHomeRobot.tapAccountSummaryMenu();
        await accountSummaryRootRobot.switchToCreditPage();
        await accountCreditsRobot.autoSearch(creditId);
        await accountCreditsRobot.tapFirstCreditItem();
        await accountCreditsDetailRobot.dismissSnackbar();
        // Verify componenets
        accountCreditsDetailRobot.verifyCreditDetailId(creditId);
        accountCreditsDetailRobot.verifyOrderAddress(shipToAddress);
        accountCreditsDetailRobot.verifyCustomerCode(customerCode);
        accountCreditsDetailRobot.verifyDeliveryTo(shipToCode);
        accountCreditsDetailRobot.verifyCreditItemSubtotalTotalPrice(
          creditTotalPrice.priceDisplay(currency),
        );
        accountCreditsDetailRobot.verifyCreditItemTotalPrice(
          creditTotalPrice.priceDisplay(currency),
        );
        await accountCreditsDetailRobot.verifyMarketPlaceSection();
        await accountCreditsDetailRobot
            .verifyMarketPlaceSeller(creditMaterialSeller);
        await accountCreditsDetailRobot.verifyReturnMaterial(
          creditMaterialNumber,
          creditMaterialQty,
          creditMaterialPrice.priceDisplay(currency),
          creditTotalPrice.priceDisplay(currency),
          stockInfo: StockInfo.empty(),
        );
      });
    });

    group('Full summary tab -', () {
      testWidgets('EZRX-T2008 | verify search/filter invoice & credit',
          (tester) async {
        final fromDocumentDate =
            invoiceDocumentDate.subtract(const Duration(days: 2));
        final toDocumentDate = invoiceDocumentDate.add(const Duration(days: 2));
        final fromDueDate = invoiceDueOn.subtract(const Duration(days: 30));
        final toDueDate = invoiceDueOn.add(const Duration(days: 30));

        await pumpAppWithMarketPlacePaymentScreen(tester);

        await paymentHomeRobot.tapAccountSummaryMenu();
        await accountSummaryRootRobot.switchToSummaryPage();
        accountSummaryTabRobot.verifyPage();
        accountSummaryTabRobot.verifyFilterApplied(1);
        //Verify navigate new payment
        await accountSummaryTabRobot.tapNewPaymentButton();
        await newPaymentRobot.verifyPage();
        newPaymentRobot.verifyMarketPlaceLogo();
        await newPaymentRobot.tapCloseButton();
        //Verify search
        await accountSummaryTabRobot.autoSearch(zpInvoiceId);
        accountSummaryTabRobot.verifyFilterApplied(0);
        accountSummaryTabRobot.verifyNoRecordFound();
        await accountSummaryTabRobot.autoSearch(zpCreditId);
        accountSummaryTabRobot.verifyNoRecordFound();
        await accountSummaryTabRobot.autoSearch(invoiceId);
        accountSummaryTabRobot.verifyItemWithId(invoiceId, false);
        await accountSummaryTabRobot.autoSearch(creditId);
        accountSummaryTabRobot.verifyItemWithId(creditId, true);
        //Verify filter
        await accountSummaryTabRobot.tapClearSearch();
        accountSummaryTabRobot.verifyFilterApplied(1);
        await accountSummaryTabRobot.tapFilterButton();
        await accountSummaryTabFilterRobot.tapDocumentDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        await accountSummaryTabFilterRobot.tapApplyButton();
        accountSummaryTabRobot.verifyFilterApplied(1);
        accountSummaryTabRobot.verifySummaryItemsDate(
          fromDate: fromDocumentDate,
          toDate: toDocumentDate,
        );
        accountSummaryTabRobot.verifyMarketPlaceLogo();
        await accountSummaryTabRobot.tapFilterButton();
        await accountSummaryTabFilterRobot.tapDueDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDueDate,
          toDate: toDueDate,
        );
        await accountSummaryTabFilterRobot.tapApplyButton();
        accountSummaryTabRobot.verifyFilterApplied(1);
        accountSummaryTabRobot.verifyItems();
        accountSummaryTabRobot.verifyMarketPlaceLogo();
        await accountSummaryTabRobot.tapFilterButton();
        await accountSummaryTabFilterRobot
            .tapStatusCheckbox(invoiceStatusFilter);
        await accountSummaryTabFilterRobot.tapApplyButton();
        accountSummaryTabRobot.verifyFilterApplied(1);
        accountSummaryTabRobot.verifyCreditsItemListWithStatus(invoiceStatus);
      });

      testWidgets('EZRX-T2008 | verify summary detail', (tester) async {
        await pumpAppWithMarketPlacePaymentScreen(tester);

        await paymentHomeRobot.tapAccountSummaryMenu();
        await accountSummaryRootRobot.switchToSummaryPage();
        await accountSummaryTabRobot.autoSearch(invoiceId);
        await accountSummaryTabRobot.tapFirstSummaryItem();
        accountInvoiceDetailRobot.verifyPage();
        await accountInvoiceDetailRobot.dismissSnackbar();
        accountInvoiceDetailRobot.verifyInvoiceId(invoiceId);
        await accountInvoiceDetailRobot.verifyMarketPlaceSection();
        await accountInvoiceDetailRobot.tapToBackScreen();
        await accountSummaryTabRobot.autoSearch(creditId);
        await accountSummaryTabRobot.tapFirstSummaryItem();
        accountCreditsDetailRobot.verify();
        await accountCreditsDetailRobot.dismissSnackbar();
        accountCreditsDetailRobot.verifyCreditDetailId(creditId);
        await accountCreditsDetailRobot.verifyMarketPlaceSection();
      });
    });
  });

  group('Payment summary -', () {
    testWidgets('EZRX-T2009 | Verify search/filter payment summary',
        (tester) async {
      final fromCreateDate =
          paymentAdviseCreatedDate.subtract(const Duration(days: 2));
      final toCreateDate =
          paymentAdviseCreatedDate.add(const Duration(days: 2));

      await pumpAppWithMarketPlacePaymentScreen(tester);

      await paymentHomeRobot.tapPaymentSummaryMenu();
      paymentSummaryRobot.verifyPageVisible();
      paymentSummaryRobot.verifyFilterApplied(1);
      //Verify navigate new payment
      await paymentSummaryRobot.tapNewPaymentButton();
      await newPaymentRobot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      await newPaymentRobot.tapCloseButton();
      //Verify search
      await commonRobot.autoSearch(zpPaymentAdviseId);
      paymentSummaryRobot.verifyFilterApplied(0);
      paymentSummaryRobot.verifyNoRecordFoundVisible();
      await commonRobot.autoSearch(paymentAdviseId);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      paymentSummaryRobot.verifyMarketPlaceLogo();
      //Verify filter
      await commonRobot.tapClearSearch();
      paymentSummaryRobot.verifyFilterApplied(1);
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromCreateDate,
        toDate: toCreateDate,
      );
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      paymentSummaryRobot.verifyMarketPlaceLogo();
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot
          .enterFromAmount(paymentAdviseTotalPrice.toString());
      await paymentSummaryFilterRobot.tapApplyButton();
      await paymentSummaryFilterRobot
          .enterToAmount(paymentAdviseTotalPrice.toString());
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      paymentSummaryRobot.verifyMarketPlaceLogo();
      await paymentSummaryRobot.tapFilterButton();
      await paymentSummaryFilterRobot.tapStatusCheckbox(paymentAdviseStatus);
      await paymentSummaryFilterRobot.tapApplyButton();
      paymentSummaryRobot.verifyFilterApplied(1);
      paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
      paymentSummaryRobot.verifyStatusValue(paymentAdviseStatus.tr());
      paymentSummaryRobot.verifyMarketPlaceLogo();
    });

    testWidgets('EZRX-T2009 | Verify payment summary detail', (tester) async {
      await pumpAppWithMarketPlacePaymentScreen(tester);

      await paymentHomeRobot.tapPaymentSummaryMenu();
      await commonRobot.autoSearch(paymentAdviseId);
      await paymentSummaryRobot.tapFirstItem();
      await paymentSummaryDetailRobot.dismissSnackbar();
      paymentSummaryDetailRobot.verifyPaymentDetail(paymentAdviseId);
      paymentSummaryDetailRobot.verifyMarketPlaceLogo();
      paymentSummaryDetailRobot.verifyOrderAddressVisible(shipToAddress);
      paymentSummaryDetailRobot.verifyCustomerCode(customerCode);
      paymentSummaryDetailRobot.verifyShipToCode(shipToCode);
      await paymentSummaryDetailRobot.verifyPaymentSummaryInvoiceCredit();
      await paymentSummaryDetailRobot.verifyPaymentSummaryTotalPrice(
        paymentAdviseTotalPrice.priceDisplay(currency),
      );
      await paymentSummaryDetailRobot.verifyPaymentItems(
        'Invoice',
        paymentAdviseInvoiceId,
        paymentAdviseInvoicePrice,
        currency,
      );
      paymentSummaryDetailRobot.verifyDownloadAdviceButton();
    });
  });

  group('New payment -', () {
    final toDate = DateTime.now().subtract(const Duration(days: 2));
    final fromDate = DateTime(2010);

    testWidgets('Verify search/filter outstanding invoice/credit',
        (tester) async {
      await pumpAppWithMarketPlacePaymentScreen(tester);

      await paymentHomeRobot.tapNewPayment();
      await newPaymentRobot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      //Filter invoice
      newPaymentStep1Robot.verifyFilterApplied(1);
      await newPaymentStep1Robot.clickFilter();
      newPaymentStep1Robot.verifyDefaultFilter();
      await newPaymentStep1Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep1Robot.tapApplyFilter();
      newPaymentStep1Robot.verifyFilterApplied(1);
      newPaymentStep1Robot.verifyAtLeast1ItemFound();
      //Get first visible invoice data
      newPaymentStep1Robot.collectTheFirstItem();
      final invoiceId = newPaymentStep1Robot.getFirstInvoiceId;
      //Continue verify filtering
      await newPaymentStep1Robot.clickFilter();
      await newPaymentStep1Robot.clickDueDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep1Robot.tapApplyFilter();
      newPaymentStep1Robot.verifyFilterApplied(1);
      newPaymentStep1Robot.verifyAtLeast1ItemFound();
      await newPaymentStep1Robot.clickFilter();
      await newPaymentStep1Robot.clickOverDueSelector();
      await newPaymentStep1Robot.tapApplyFilter();
      newPaymentStep1Robot.verifyFilterApplied(1);
      newPaymentStep1Robot.verifyAtLeast1ItemFound();
      //Search invoice
      await commonRobot.autoSearch(clearedInvoiceId);
      newPaymentStep1Robot.verifyFilterApplied(0);
      newPaymentStep1Robot.verifyNoItemFound();
      await commonRobot.autoSearch(invoiceId);
      newPaymentStep1Robot.verifyFilterApplied(0);
      newPaymentStep1Robot.verifyAtLeast1ItemFound();
      //Filter credit
      await newPaymentStep1Robot.clickFirstItem();
      await newPaymentStep1Robot.tapNextButton();
      newPaymentStep2Robot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      newPaymentStep2Robot.verifyFilterApplied(1);
      await newPaymentStep2Robot.clickFilter();
      newPaymentStep2Robot.verifyDefaultFilter();
      await newPaymentStep2Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep2Robot.tapApplyFilter();
      //Get first visible credit data
      final creditId = newPaymentStep2Robot.getCreditId(0);
      newPaymentStep2Robot.verifyFilterApplied(1);
      newPaymentStep2Robot.verifyAtLeastOneItemFound();
      //Search credit
      await commonRobot.autoSearch(zpCreditId);
      newPaymentStep2Robot.verifyFilterApplied(0);
      newPaymentStep2Robot.verifyNoItemFound();
      await commonRobot.autoSearch(creditId);
      newPaymentStep2Robot.verifyFilterApplied(0);
      newPaymentStep2Robot.verifyAtLeastOneItemFound();
    });

    testWidgets('Verify create new payment request', (tester) async {
      final defaultPaymentMethod = 'Payment Gateway'.tr();
      await pumpAppWithMarketPlacePaymentScreen(tester);

      await paymentHomeRobot.tapNewPayment();
      await newPaymentRobot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      //Filter to get invoice
      await newPaymentStep1Robot.clickFilter();
      await newPaymentStep1Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep1Robot.tapApplyFilter();
      //Select invoice
      await newPaymentStep1Robot.tapNextButton();
      await newPaymentStep1Robot.verifyPage();
      newPaymentStep1Robot.verifyCheckboxStatus(false);
      await newPaymentStep1Robot.clickFirstItem();
      newPaymentStep1Robot.collectTheFirstItem();
      final invoiceTotalPrice = newPaymentStep1Robot.getFirstInvoiceIdPrice;
      newPaymentStep1Robot.verifyAtLeast1ItemIsCheck();

      //Verify proceed without credit
      await newPaymentStep1Robot.tapNextButton();
      newPaymentStep2Robot.verifyPage();
      newPaymentRobot.verifyMarketPlaceLogo();
      newPaymentStep2Robot.verifyCheckboxStatus(false);
      newPaymentStep2Robot.verifyThePriceAndButton(invoiceTotalPrice, 0);
      await newPaymentStep2Robot.tapNextButton();
      newPaymentStep3Robot.verifyThePriceAndButton(invoiceTotalPrice, 0);
      newPaymentStep3Robot.verifyTotalAmountToPay(invoiceTotalPrice, 0);
      await newPaymentRobot.tapBackButton();
      newPaymentStep2Robot.verifyPage();
      //Filter to get credit
      await newPaymentStep2Robot.clickFilter();
      await newPaymentStep2Robot.clickDocumentDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await newPaymentStep2Robot.tapApplyFilter();
      //Select credit
      await newPaymentStep2Robot.clickFirstItem();
      final creditTotalPrice = newPaymentStep2Robot.getCreditPrice(0);
      newPaymentStep2Robot.verifyAtLeast1ItemIsCheck();
      newPaymentStep2Robot.verifyThePriceAndButton(
        invoiceTotalPrice,
        creditTotalPrice,
        verifyButtonEnabled: false,
      );
      //Verify credit amount > invoice amount
      await newPaymentRobot.tapBackButton();
      await newPaymentStep1Robot.clickFirstItem();
      newPaymentRobot.verifyCreditAmountGreaterInvoiceAmount();
      await newPaymentStep1Robot.tapNextButton();
      await newPaymentStep1Robot.verifyPage();
      await newPaymentStep1Robot.tapAllCheckbox();
      newPaymentRobot.verifyCreditAmountGreaterInvoiceAmount(isVisible: false);
      await newPaymentStep1Robot.tapAllCheckbox();
      await newPaymentStep1Robot.clickFirstItem();
      //Verify select payment method
      await newPaymentStep1Robot.tapNextButton();
      await newPaymentStep2Robot.clickFirstItem();
      await newPaymentStep2Robot.tapNextButton();
      newPaymentRobot.verifyMarketPlaceLogo();
      newPaymentStep3Robot.verifyStep3InitialField(defaultPaymentMethod);
      newPaymentStep3Robot.verifyGeneratePaymentAdviceButton();
      newPaymentStep3Robot.verifyOrderAddressVisible(shipToAddress);
      newPaymentStep3Robot.verifyCustomerCode(customerCode);
      newPaymentStep3Robot.verifyShipToCode(shipToCode);
      newPaymentStep3Robot.verifyThePriceAndButton(
        invoiceTotalPrice,
        0,
      );
      newPaymentStep3Robot.verifyTotalAmountToPay(
        invoiceTotalPrice,
        0,
      );
    });
  });
}
