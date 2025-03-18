import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/returns/new_return/step1/new_return_step1_robot.dart';
import '../../robots/returns/new_return/step2/new_return_step2_robot.dart';
import '../../robots/returns/new_return/step3/new_return_step3_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_filter_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_robot.dart';
import '../../robots/returns/returns_by_request/returns_by_request_detail_robot.dart';
import '../../robots/returns/returns_by_request/returns_by_request_filter_robot.dart';
import '../../robots/returns/returns_by_request/returns_by_request_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsRobot returnsByItemsRobot;
  late ReturnsByRequestRobot returnsByRequestRobot;
  late ReturnsByItemsFilterRobot returnsByItemsFilterRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late ReturnsByRequestFilterRobot returnsByRequestFilterRobot;
  late ReturnsByRequestDetailRobot returnsByRequestDetailRobot;
  late NewReturnStep1Robot newReturnRobot;
  late NewReturnStep2Robot newReturnStep2Robot;
  late NewReturnStep3Robot newReturnStep3Robot;
  late CustomerSearchRobot customerSearchRobot;
  late HomeRobot homeRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const market = 'Singapore';
  const username = 'sgclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030032324';
  const shipToCode = '0070042789';
  const shipToAddress = 'Cambridge Clinic - Dr Ng Khin Seng';
  const currency = 'SGD';
  const invalidSearchKey = 'auto-testtttttttttttt';
  const invalidLengthSearchKey = 'a';
  final fromDate = DateTime.now().subtract(const Duration(days: 360));
  final toDate = DateTime.now();
  const fromAmount = '0.0';
  const toAmount = '100000000.0';

  //Return material data
  const materialIndex = 0;
  const materialNumber = '23350889';
  const materialName = 'Vocabria + Recambys Bundle';
  const materialQty = 1;
  const materialPrice = 1200.0;
  const materialPrincipalName = 'GlaxoSmithKline Pte Ltd';
  const materialPrincipalCode = '0000105086';
  const materialInvoiceNumber = '1080010476';
  const materialReturnReason = 'Product Recall';
  const materialReturnComments = '-';

  //Return by item, request data
  const returnItemStatus = 'Pending Approval';
  const returnId = 'EZRE-260124001408';
  // const returnIdWithBonus = 'EZRE-200123003529';
  const returnRequestStatus = 'Pending Review';
  const returnSubTotal = materialPrice * materialQty;
  const returnGrandTotal = materialPrice * materialQty;
  const returnReference = 'sg-return';
  const specialInstructions = 'sg-instructions';

  //New Return Request
  final newReturnFromDate = DateTime(2023, 11, 5);
  final newReturnToDate = DateTime(2023, 11, 7);
  const exceedReturnQuantity = '100';
  const validReturnQuantity = '1';
  const newReturnMaterialId = '23350889';
  const newReturnMaterialName = 'VOCABRIA + RECAMBYS BUNDLE';
  const newReturnMaterialUUID = '1080010476000010';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsRobot = ReturnsByItemsRobot(tester);
    returnsByRequestRobot = ReturnsByRequestRobot(tester);
    returnsByItemsFilterRobot = ReturnsByItemsFilterRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
    returnsByRequestFilterRobot = ReturnsByRequestFilterRobot(tester);
    returnsByRequestDetailRobot = ReturnsByRequestDetailRobot(tester);
    newReturnRobot = NewReturnStep1Robot(tester);
    newReturnStep2Robot = NewReturnStep2Robot(tester);
    newReturnStep3Robot = NewReturnStep3Robot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    homeRobot = HomeRobot(tester);
  }

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

  Future<void> goToReturns(WidgetTester tester) async {
    await pumpAppWithHomeScreen(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();
  }

  Future<void> goToNewReturnStep2() async {
    await newReturnRobot.tapFilterIcon();
    await newReturnRobot.tapTheDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: newReturnFromDate,
      toDate: newReturnToDate,
    );
    await newReturnRobot.tapApply();
    await newReturnRobot.tapItemAt(index: 0);
    await newReturnRobot.tapNextButton();
  }

  Future<void> goToNewReturnStep3(WidgetTester tester) async {
    await goToReturns(tester);
    await moreRobot.tapNewRequestFloatingButton();
    await goToNewReturnStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(
      newReturnMaterialId,
      newReturnMaterialName,
    );
    await newReturnStep2Robot.enterReturnQuantity(
      validReturnQuantity,
      newReturnMaterialUUID,
    );
    await newReturnStep2Robot.selectReason(
      materialReturnReason.tr(),
      newReturnMaterialUUID,
    );
    await newReturnStep2Robot.tapNextButton();
  }

  group('Return by Item section - ', () {
    testWidgets('EZRX-T134 | Verify return by item with default components',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyRootPageVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsByRequestRobot.verifyFilterButtonVisible();
      returnsByRequestRobot.verifyNewRequestButtonVisible();
      returnsByRequestRobot.verifySearchBarVisible();
      await returnsRootRobot.switchToViewByItemPage();
      returnsByItemsRobot.verifyFilterButtonVisible();
      returnsByItemsRobot.verifyNewRequestButtonVisible();
      returnsByItemsRobot.verifySearchBarVisible();
      returnsByItemsRobot.verifyExportButtonVisible();
    });

    testWidgets('EZRX-T554 | Verify Return By Item Export button',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify
      returnsByItemsRobot.verifyExportButtonVisible();
      await returnsByItemsRobot.tapExportButton();
      await commonRobot.verifyCustomSnackBar(
        message: 'File downloaded successfully'.tr(),
      );
    });

    testWidgets(
        'EZRX-T135 | Verify display items in View by items tab with data/ no data',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify data
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyApplyButtonVisible();
      returnsByItemsFilterRobot.verifyResetButtonVisible();
      await returnsByItemsFilterRobot.tapCloseIcon();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.pullToRefresh();
      returnsByItemsRobot.verifyReturnItemsVisible();

      //verify no data
      await commonRobot.autoSearch(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.pullToRefresh();
      returnsByItemsRobot.verifyReturnItemsVisible();
    });

    testWidgets(
        'EZRX-T139 | Verify search with return id/material number/product name in return by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify search with return id
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.tapClearSearch();
      await commonRobot.searchWithSearchIcon(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      commonRobot.verifySearchBarText('');
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.searchWithKeyboardAction(returnId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByItemsRobot.verifyReturnsWithIdVisible(returnId);
      await commonRobot.pullToRefresh();
      commonRobot.verifySearchBarText('');

      //verify search with material number
      await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.tapClearSearch();
      await commonRobot.searchWithSearchIcon(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.searchWithSearchIcon(materialNumber);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByItemsRobot.verifyReturnsWithProductCodeVisible(materialNumber);

      //verify search with material name
      await commonRobot.autoSearch(invalidLengthSearchKey);
      await commonRobot.waitAutoSearchDuration();
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(materialName);
      returnsByItemsRobot.verifyReturnsWithProductNameVisible(materialName);
    });

    // testWidgets(
    //     'EZRX-T557 | Verify display items with bonus in View by items tab',
    //     (tester) async {
    //   await goToReturns(tester);

    //   //verify
    //   returnsRootRobot.verifyViewByItemsPageVisible();
    //   returnsByItemsRobot.verifyReturnItemsVisible();
    //   await commonRobot.searchWithKeyboardAction(returnIdWithBonus);
    //   returnsByItemsRobot.verifyReturnsWithIdVisible(returnIdWithBonus);
    //   returnsByItemsRobot.verifyReturnItemWithBonusVisible();
    //   await returnsByItemsRobot.tapFirstReturn();
    //   returnsByItemsDetailRobot.verifyDeliveryToVisible(shipToCode);
    //   returnsByItemsDetailRobot.verifyCustomerCodeVisible(customerCode);
    //   returnsByItemsDetailRobot.verifyReturnAddressVisible(shipToAddress);
    //   await returnsByItemsDetailRobot.dragToVerifyBonusSectionVisible();
    //   returnsByItemsDetailRobot.verifyMaterialVisibleWithBonus(
    //     materialNumber,
    //     materialQty,
    //     materialPrice,
    //   );
    //   returnsByItemsDetailRobot.verifyBonusDetailCollapsed(false);
    //   await returnsByItemsDetailRobot.tapShowDetailButtonForBonus();
    //   returnsByItemsDetailRobot.verifyBonusDetailCollapsed(true);
    // });

    testWidgets(
        'EZRX-T145 | Verify Filter by Items date when having result found in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      returnsByItemsRobot.verifyReturnGroupInDateRangeVisible(
        fromDate: fromDate,
        toDate: toDate,
      );
    });

    testWidgets(
        'EZRX-T146 | Verify Filter by Request amount when no having result found in View by items tab',
        (tester) async {
      const fromAmount = '100.123400';
      const toAmount = '200.20';
      const invalidToAmount = '1';
      const formattedFromAmount = '100.12';
      const formattedToAmount = '200.2';
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
      await returnsByItemsFilterRobot.enterToAmount(invalidToAmount);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsFilterRobot.verifyInvalidAmountErrorVisible();
      await returnsByItemsFilterRobot.enterToAmount(toAmount);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: formattedFromAmount,
        toAmount: formattedToAmount,
      );
    });

    testWidgets(
        'EZRX-T147 | Verify Filter by Status when selecting 1 checkbox in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnItemStatus);
      returnsByItemsFilterRobot.verifyStatusFilterValue(returnItemStatus, true);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnItemStatus);
      returnsByItemsFilterRobot.verifyStatusFilterValue(
        returnItemStatus,
        false,
      );
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnItemStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      returnsByItemsRobot.verifyReturnsWithStatusVisible(returnItemStatus.tr());
    });

    testWidgets(
        'EZRX-T154 | Verify combining filter together in return by item',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyDefaultFilterApplied();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate.displayDate,
        toDate: toDate.displayDate,
      );

      await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
      await returnsByItemsFilterRobot.enterToAmount(toAmount);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(2);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: fromAmount,
        toAmount: toAmount,
      );

      await returnsByItemsFilterRobot.tapStatusCheckbox(returnItemStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(3);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyStatusFilterValue(returnItemStatus, true);

      await returnsByItemsFilterRobot.tapCloseIcon();
      returnsByItemsRobot.verifyReturnsWithStatusVisible(returnItemStatus.tr());
    });

    testWidgets('EZRX-T219 | Verify click on reset button in filter',
        (tester) async {
      final fromDate = DateTime.now().subtract(const Duration(days: 60));
      final toDate = DateTime.now().subtract(const Duration(days: 59));
      const index = 0;
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      final returnId = returnsByItemsRobot.getReturnIdText(index: index);
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
      await returnsByItemsFilterRobot.enterToAmount(toAmount);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnItemStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(3);
      returnsByItemsRobot.verifyReturnIdTextNotVisible(returnId, index: index);
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapResetButton();
      returnsByItemsRobot.verifyFilterApplied(0);
      returnsByItemsRobot.verifyReturnItemsVisible();
      returnsByItemsRobot.verifyReturnIdTextVisible(returnId, index: index);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    });

    testWidgets('EZRX-T151 | Verify Return detail via View by items tab',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      await returnsByItemsRobot.tapFirstReturn();
      returnsByItemsDetailRobot.verifyReturnIdVisible(returnId);
      returnsByItemsDetailRobot.verifyRequestDateVisible();
      returnsByItemsDetailRobot.verifyReturnReferenceVisible(returnReference);
      returnsByItemsDetailRobot
          .verifySpecialInstructionsVisible(specialInstructions);
      returnsByItemsDetailRobot.verifyStatusTrackerVisible(returnItemStatus);
      returnsByItemsDetailRobot.verifyDeliveryToVisible(shipToCode);
      returnsByItemsDetailRobot.verifyCustomerCodeVisible(customerCode);
      returnsByItemsDetailRobot.verifyReturnAddressVisible(shipToAddress);
      await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
      returnsByItemsDetailRobot.verifyMaterialVisible(
        materialNumber,
        materialQty,
        materialPrice.priceDisplay(currency),
      );
      returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
    });

    testWidgets(
        'EZRX-T152 | Verify extend information of Return Item detail via View by items tab',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      await returnsByItemsRobot.tapFirstReturn();
      returnsByItemsDetailRobot.verifyCopyTextVisible();
      await returnsByItemsDetailRobot.tapCopyButton();
      returnsByItemsDetailRobot.verifyCopiedTextVisible();
      await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
      returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
      await returnsByItemsDetailRobot.tapShowDetailButton();
      returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(false);
      returnsByItemsDetailRobot
          .verifyMaterialPrincipalCode(materialPrincipalCode);
      returnsByItemsDetailRobot
          .verifyMaterialPrincipalName(materialPrincipalName);
      returnsByItemsDetailRobot
          .verifyMaterialInvoiceNumber(materialInvoiceNumber);
      returnsByItemsDetailRobot.verifyMaterialInvoiceDate();
      returnsByItemsDetailRobot
          .verifyMaterialReturnReason(materialReturnReason);
      returnsByItemsDetailRobot
          .verifyMaterialReturnComments(materialReturnComments);
      await returnsByItemsDetailRobot.tapShowDetailButton();
      returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
    });
  });

  group('Return by Request section - ', () {
    testWidgets(
        'EZRX-T136 | Verify display items in View by return requests tab with data/ no data',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyResetButtonVisible();
      returnsByRequestFilterRobot.verifyApplyButtonVisible();
      await returnsByRequestFilterRobot.tapCloseIcon();
      returnsByRequestRobot.verifyReturnRequestVisible();

      await commonRobot.autoSearch(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.pullToRefresh();
      returnsByRequestRobot.verifyReturnRequestVisible();
    });

    testWidgets('EZRX-T555 | Verify Return By Request Export button',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      returnsByRequestRobot.verifyFilterButtonVisible();
      returnsByRequestRobot.verifyExportButtonVisible();
      await returnsByRequestRobot.tapExportButton();
      await commonRobot.verifyCustomSnackBar(
        message: 'File downloaded successfully'.tr(),
      );
    });

    testWidgets(
        'EZRX-T143 | Verify search with return id in return by request tab',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();

      //verify search with keyboard
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar();
      await commonRobot.searchWithSearchIcon(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      commonRobot.verifySearchBarText('');
      returnsByRequestRobot.verifyReturnRequestVisible();
      await commonRobot.searchWithKeyboardAction(returnId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
      await commonRobot.pullToRefresh();
      commonRobot.verifySearchBarText('');

      //verify search with icon
      await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.tapClearSearch();
      await commonRobot.searchWithSearchIcon(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.searchWithSearchIcon(returnId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
      await commonRobot.tapClearSearch();

      //verify auto search
      await commonRobot.autoSearch(invalidLengthSearchKey);
      await commonRobot.waitAutoSearchDuration();
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(returnId);
      returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
    });

    testWidgets(
        'EZRX-T148 | Verify Filter by Request date when having result found in View by return requests tab',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyReturnGroupInDateRangeVisible(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate.displayDate,
        toDate: toDate.displayDate,
      );
    });

    testWidgets(
        'EZRX-T149 | Verify Filter by Request amount when having result found in View by return requests tab',
        (tester) async {
      const fromAmount = '10.123400';
      const toAmount = '500.20';
      const invalidToAmount = '1';
      const formattedFromAmount = '10.12';
      const formattedToAmount = '500.2';
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByRequestFilterRobot.enterFromAmount(fromAmount);
      await returnsByRequestFilterRobot.enterToAmount(invalidToAmount);
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestFilterRobot.verifyInvalidAmountErrorVisible();
      await returnsByRequestFilterRobot.enterToAmount(toAmount);
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(2);
      returnsByRequestRobot.verifyReturnGroupInAmountRangeVisible(
        currency: currency,
        fromAmount: double.parse(fromAmount),
        toAmount: double.parse(toAmount),
      );
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: formattedFromAmount,
        toAmount: formattedToAmount,
      );
    });

    testWidgets(
        'EZRX-T150 | Verify Filter by Status when selecting 2 checkboxes in View by return requests tab',
        (tester) async {
      const filterStatus1 = 'Pending Review';
      const filterStatus2 = 'Reviewed';
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus1);
      returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus1, true);
      await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
      returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, true);
      await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
      returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, false);
      await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(1);
      returnsByRequestRobot.verifyReturnsWithStatusVisible([
        filterStatus1.tr(),
        filterStatus2.tr(),
      ]);
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus1, true);
      returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, true);
      await returnsByRequestFilterRobot.tapCloseIcon();
      await commonRobot.pullToRefresh();
      await returnsByRequestRobot.tapFilterButton();
    });

    testWidgets('EZRX-T220 | Verify click on reset button in filter',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByRequestFilterRobot.tapStatusCheckbox(returnRequestStatus);
      await returnsByRequestFilterRobot.enterFromAmount(fromAmount);
      await returnsByRequestFilterRobot.enterToAmount(toAmount);
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(3);
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate.displayDate,
        toDate: toDate.displayDate,
      );
      returnsByRequestFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: fromAmount,
        toAmount: toAmount,
      );
      returnsByRequestFilterRobot.verifyStatusFilterValue(
        returnRequestStatus,
        true,
      );
      await returnsByRequestFilterRobot.tapResetButton();
      returnsByRequestRobot.verifyFilterApplied(0);
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyDefaultFilterApplied();
    });

    testWidgets(
        'EZRX-T153 | Verify Return detail via View by return requests tab',
        (tester) async {
      await goToReturns(tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
      );
      await returnsByRequestFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      await returnsByRequestRobot.tapFirstReturnVisible();
      returnsByRequestDetailRobot.verifyReturnIdVisible(
        returnId,
      );
      returnsByRequestDetailRobot.verifyRequestDateVisible();
      returnsByRequestDetailRobot.verifyReturnReferenceVisible(returnReference);
      returnsByRequestDetailRobot
          .verifySpecialInstructionsVisible(specialInstructions);
      returnsByRequestDetailRobot
          .verifyStatusTrackerVisible(returnRequestStatus);
      returnsByRequestDetailRobot.verifyReturnAddressVisible(shipToAddress);
      returnsByRequestDetailRobot.verifyCustomerCodeVisible(customerCode);
      returnsByRequestDetailRobot.verifyDeliveryToVisible(shipToCode);
      returnsByRequestDetailRobot
          .verifySubTotalVisible(returnSubTotal.priceDisplay(currency));
      returnsByRequestDetailRobot
          .verifyGrandTotalVisible(returnGrandTotal.priceDisplay(currency));
      await returnsByRequestDetailRobot.verifyMaterialVisible(
        index: materialIndex,
        materialNumber: materialNumber,
      );
      await returnsByRequestDetailRobot.verifyMaterialDetailCollapsed(
        materialIndex,
        true,
      );
      await returnsByRequestDetailRobot.tapShowDetailButton(materialIndex);
      await returnsByRequestDetailRobot.verifyMaterialDetailCollapsed(
        materialIndex,
        false,
      );
    });
  });

  group('New Return Request - step - 1 - ', () {
    testWidgets('EZRX-T155 | Verify display new return request screen',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      newReturnRobot.verifyNewReturnStep1Display(shipToAddress);
    });

    testWidgets(
        'EZRX-T156 | Verify the customer code & deliver to in Order for [Selected address] in New return request page',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();

      await newReturnRobot.tapReturnFor();
      newReturnRobot.verifyDetailBottomSheetVisible();
      await newReturnRobot.closeBottomSheetDetail();
      newReturnRobot.verifyDetailBottomSheetIsHide();
      await newReturnRobot.pressCloseButtonToolbar();
      returnsByItemsRobot.verifyFilterButtonVisible();
      returnsByItemsRobot.verifyNewRequestButtonVisible();
      returnsByItemsRobot.verifySearchBarVisible();
    });

    testWidgets(
        'EZRX-T157 | Verify New return request page Step 1 : Filter with reset',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      newReturnRobot.collectTheFirstItemTitleWithoutFilter();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: newReturnFromDate,
        toDate: newReturnToDate,
      );
      await newReturnRobot.tapApply();
      await newReturnRobot.verifyTheReturnListBaseOnFilter(
        fromDate: newReturnFromDate,
        toDate: newReturnToDate,
      );
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      newReturnRobot.verifyTheFirstItemAfterReset();
    });

    testWidgets(
        'EZRX-T234 | Verify new return request Step 1 of 3: Text fields - Happy flow - done button',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: newReturnFromDate,
        toDate: newReturnToDate,
      );
      await newReturnRobot.tapApply();
      newReturnRobot.collectTheFirstItemTitleWithoutFilter();
      await commonRobot.searchWithKeyboardAction(newReturnMaterialName);
      newReturnRobot.verifyTheFirstItemAfterSearch(newReturnMaterialName);
      await commonRobot.tapClearSearch();
      await newReturnRobot.verifyTheFirstItemAfterClearSearch();
    });

    testWidgets(
        'EZRX-T234 | Verify new return request Step 1 of 3: Text fields - Happy flow - done button',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      await commonRobot.searchWithKeyboardAction(newReturnMaterialId);
      newReturnRobot.verifyReturnItemVisible();
      newReturnRobot.verifyDetailCollapsed(true);
      await newReturnRobot.tapShowDetailButton();
      newReturnRobot.verifyDetailCollapsed(false);
      // newReturnRobot.verifyReturnItemWithBonusVisible();
    });

    testWidgets(
        'EZRX-T235 | Verify new return request Step 1 of 3: Text fields - Happy flow - search icon button',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: newReturnFromDate,
        toDate: newReturnToDate,
      );
      await newReturnRobot.tapApply();
      await newReturnRobot.tapItemAt(index: 0);
      await newReturnRobot.tapNextButton();
      newReturnRobot.verifyStep2Visible();
    });

    testWidgets(
        'EZRX-T233 | Verify new return request Step 1 of 3: Text fields - UnHappy flow',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await commonRobot.searchWithSearchIcon('a');
      await newReturnRobot.verifySnackbarVisible();
      await commonRobot.dismissSnackbar();
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await newReturnRobot.verifySnackbarVisible();
      await commonRobot.dismissSnackbar();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      newReturnRobot.verifyNoItemFound();
    });

    testWidgets(
        'EZRX-T109 | Verify next step screen Step 1 of 3: select item(s) to return without select item',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapNextButton();
      newReturnRobot.verifyCannotMoveToNextScreen();
    });
  });

  group('New Return Request - step - 2 - ', () {
    testWidgets(
        'EZRX-T228 | Verify new return request step 2 of 3: Fill in return details displayed',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await goToNewReturnStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        newReturnMaterialId,
        newReturnMaterialName,
      );
    });

    testWidgets(
        'EZRX-T232 | Verify new return request step 2 of 3: Fill in return details with quantity out of balance quantity',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await goToNewReturnStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        newReturnMaterialId,
        newReturnMaterialName,
      );
      await newReturnStep2Robot.enterReturnQuantity(
        exceedReturnQuantity,
        newReturnMaterialUUID,
      );
      await newReturnStep2Robot.selectReason(
        materialReturnReason.tr(),
        newReturnMaterialUUID,
      );
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyReturnQuantityCannotExceedBalanceQuantity();
    });

    testWidgets(
        'EZRX-T231 | Verify new return request step 2 of 3: Fill in return details without all fields require',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await goToNewReturnStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        newReturnMaterialId,
        newReturnMaterialName,
      );
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
      newReturnStep2Robot.verifyCannotMoveWithoutReason();
    });

    testWidgets(
        'EZRX-T236 | Verify new return request step 2 of 3: Next button clicked with all valid fields',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await goToNewReturnStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        newReturnMaterialId,
        newReturnMaterialName,
      );
      await newReturnStep2Robot.enterReturnQuantity(
        validReturnQuantity,
        newReturnMaterialUUID,
      );
      await newReturnStep2Robot.selectReason(
        materialReturnReason.tr(),
        newReturnMaterialUUID,
      );
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyNextToStep3(
        newReturnMaterialId,
        newReturnMaterialName,
      );
      newReturnStep3Robot.verifyStep3Visible();
    });

    testWidgets(
        'EZRX-T229 | Verify new return request step 2 of 3: review return details - delete item again',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await goToNewReturnStep2();
      await newReturnStep2Robot.deleteItem();
      newReturnRobot.verifyNewReturnStep1Display(shipToAddress);
      await goToNewReturnStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        newReturnMaterialId,
        newReturnMaterialName,
      );
    });

    testWidgets(
        'EZRX-T559 | Verify return step 2 of 3 Fill in return detail when include bonus',
        (tester) async {
      await goToReturns(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      await commonRobot.searchWithKeyboardAction(newReturnMaterialId);
      await newReturnRobot.tapItemAt(index: 0);
      await newReturnRobot.tapNextButton();
      // newReturnStep2Robot.verifyReturnDetailDisplayedWithBonus();
    });
  });

  group('New Return Request - step - 3 - ', () {
    testWidgets(
        'EZRX-T237 | Verify new return request Step 3 of 3: all initial fields',
        (tester) async {
      await goToNewReturnStep3(tester);
      await newReturnRobot.tapReturnFor();
      newReturnRobot.verifyDetailBottomSheetVisible();
      await newReturnRobot.closeBottomSheetDetail();
      newReturnRobot.verifyDetailBottomSheetIsHide();
      newReturnStep3Robot.verifyStep3Visible();
    });

    testWidgets(
        'EZRX-T230 | Verify new return request step 3 : submit successful',
        (tester) async {
      await goToNewReturnStep3(tester);
      newReturnStep3Robot.verifyStep3Visible();
      await newReturnRobot.tapReturnFor();
      newReturnRobot.verifyDetailBottomSheetVisible();
      await newReturnRobot.closeBottomSheetDetail();
      newReturnRobot.verifyDetailBottomSheetIsHide();
      newReturnStep3Robot.collectInfoBeforeSubmit();
      //no need to submit as returns get used, so for next integration test run it break
      // await newReturnStep3Robot.tapSubmit();
      // newReturnStep3Robot.verifySubmitSuccessFully(shipToAddress);
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
