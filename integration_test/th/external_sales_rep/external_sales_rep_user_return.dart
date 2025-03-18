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
  late CustomerSearchRobot customerSearchRobot;
  late ReturnsByRequestRobot returnsByRequestRobot;
  late ReturnsByItemsFilterRobot returnsByItemsFilterRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late HomeRobot homeRobot;
  late ReturnsByRequestFilterRobot returnsByRequestFilterRobot;
  late ReturnsByRequestDetailRobot returnsByRequestDetailRobot;
  late NewReturnStep1Robot newReturnRobot;
  late NewReturnStep2Robot newReturnStep2Robot;
  late NewReturnStep3Robot newReturnStep3Robot;
  late ProfileRobot profileRobot;
  late String language;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const username = 'thexternalsalesrep';
  const password = 'St@ysafe01';
  const shipToCode = '0071168407';
  const marketThailand = 'Thailand';
  const customerCode = '0030250030';
  const shipToAddress = 'คุณ นุชสุรางค์ วีระพันธ์ุ';
  const currency = 'THB';
  const invalidSearchKey = 'auto-testtttttttttttt';
  const invalidLengthSearchKey = 'a';
  const validSearchKey = 'EZ';
  final fromDate = DateTime.now().subtract(const Duration(days: 360));
  final toDate = DateTime.now();
  const fromAmount = '0.0';
  const toAmount = '1000.0';

  //Return detail data
  const returnStatus = 'Pending Approval';
  const returnId = 'EZRE-290224002427';
  const returnReference = '-';
  const specialInstructions = '-';
  const materialNumber = '23263173';
  const materialName = 'ACTRAPID HM 100 IU/ML, 10ML';
  const materialQty = 1;
  const materialTotalPrice = '$currency 400.00';
  const materialPrincipalName = 'Novo Nordisk Pharma (Thailand)';
  const materialPrincipalCode = '0000102538';
  const materialInvoiceNumber = '1310000599';
  const materialReturnReason = 'Wrong Bill-To';
  const materialReturnComments = '-';
  //Material data
  const materialIndex = 0;

  //New Return Request step - 1
  final fromDateForStep1 = DateTime.now().subtract(const Duration(days: 360));
  final toDateForStep1 = DateTime.now().subtract(const Duration(days: 2));

  const validSearchKeyForStep1 = 'ACTRAPID';
  const inValidSearchKey = '1';
  const noResultSearchKey = 'asdasfxzc';

  const exceedReturnQuantity = '100';
  const validReturnQuantity = '1';
  const returnTypeReturn = 'Return';
  const returnTypeExcange = 'Exchange';
  final fromDateToNextForStep2 =
      DateTime.now().subtract(const Duration(days: 360));
  final toDateToNextForStep2 = DateTime.now().subtract(const Duration(days: 2));
  final reason = 'Expired Within Policy'.tr();
  const materialId = '23263173';
  const materialTitle = 'ACTRAPID HM 100 IU/ML, 10ML';
  const materialUUID = '1310000599000010';

  //Return detail data
  const returnRequestStatus = 'Pending Review';
  final returnSubTotal = '$currency ${400.00.priceFormatted}';
  final returnGrandTotal = '$currency ${400.00.priceFormatted}';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
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
    profileRobot = ProfileRobot(tester);
  }

  Future<void> pumpAppWithLogin(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRobot.isLoginPage) {
      await loginRobot.loginToHomeScreen(username, password, marketThailand);
      await customerSearchRobot.waitForCustomerCodePageToLoad();
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();
      language = profileRobot.getLanguage();
      await commonRobot.tapToBackScreen();
      await commonRobot.navigateToScreen(NavigationTab.home);
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();
      language = profileRobot.getLanguage();
      await commonRobot.tapToBackScreen();
      await commonRobot.navigateToScreen(NavigationTab.home);
      await commonRobot.closeAnnouncementAlertDialog();
    }
  }

  Future<String> getDateFormatBasedOnUserLanguage() async {
    return language == 'English' ? 'MM/dd/yyyy' : 'dd/MM/yyyy';
  }

  Future<void> goToReturns({required WidgetTester tester}) async {
    await pumpAppWithLogin(tester);
    //Go returns
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapReturnsTile();
    await commonRobot.closeAnnouncementAlertDialog();
  }

  Future<void> goToNewRequest() async {
    //Go returns
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapReturnsTile();
    await returnsByItemsRobot.tapNewRequestFloatingButton();
  }

  Future<void> goToStep2() async {
    await newReturnRobot.tapFilterIcon();
    await newReturnRobot.tapTheDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateToNextForStep2,
      toDate: toDateToNextForStep2,
      dateStringFormat: await getDateFormatBasedOnUserLanguage(),
    );
    await newReturnRobot.tapApply();
    await newReturnRobot.tapItemAt(index: 0);
    await newReturnRobot.tapNextButton();
  }

  Future<void> fillStep2() async {
    await commonRobot.changeDeliveryAddress(
      shipToCode,
    );
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapReturnsTile();
    await moreRobot.tapNewRequestFloatingButton();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
    await newReturnStep2Robot.enterReturnQuantity(
      validReturnQuantity,
      materialUUID,
    );
    await newReturnStep2Robot.selectReason(reason, materialUUID);
    await newReturnStep2Robot.tapNextButton();
  }

  group('Return by Item section - ', () {
    testWidgets('EZRX-T134 | Verify display items in Returns', (tester) async {
      await pumpAppWithLogin(tester);
      await homeRobot.tapReturnsQuickAccess();
      await commonRobot.closeAnnouncementAlertDialog();

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
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyRootPageVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyFilterButtonVisible();
      returnsByItemsRobot.verifyExportButtonVisible();
      await returnsByItemsRobot.tapExportButton();
      await commonRobot.verifyCustomSnackBar(
        message: 'File downloaded successfully',
      );
    });

    testWidgets(
        'EZRX-T135 | Verify display items in View by items tab with data available',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyFilterButtonVisible();
      returnsByItemsRobot.verifyNewRequestButtonVisible();
      returnsByItemsRobot.verifySearchBarVisible();
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyApplyButtonVisible();
      returnsByItemsFilterRobot.verifyResetButtonVisible();
      await returnsByItemsFilterRobot.tapCloseIcon();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.pullToRefresh();
      returnsByItemsRobot.verifyReturnItemsVisible();
    });

    testWidgets(
        'EZRX-T137 | Verify display items in View by items tab with no data available',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await commonRobot.autoSearch(validSearchKey);
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(validSearchKey);
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
    });

    testWidgets(
        'EZRX-T139 | Verify search Return Item with search icon by inputting keyword contains Product name in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.autoSearch(materialName);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByItemsRobot.verifyReturnsWithProductNameVisible(materialName);
    });

    testWidgets(
        'EZRX-T140 | Verify search my order history by inputting keyword contains Product code in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.searchWithKeyboardAction(materialNumber);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByItemsRobot.verifyReturnsWithProductCodeVisible(materialNumber);
      await commonRobot.tapClearSearch();

      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
    });

    testWidgets(
        'EZRX-T141 | Verify search Return Item by inputting keyword contains Return ID in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      returnsByItemsRobot.verifyReturnsWithIdVisible(returnId);
      returnsByItemsRobot.verifywareHouseStorageConditionTag();
    });

    testWidgets('EZRX-T556 | Verify display items in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      returnsByItemsRobot.verifyReturnsWithIdVisible(returnId);
      returnsByItemsRobot.verifywareHouseStorageConditionTag();
    });
//TODO Need to revisit this test as we do not have data for now
    // testWidgets(
    //     'EZRX-T557 | Verify display items with bonus in View by items tab',
    //     (tester) async {
    //   await goToReturns(tester: tester);

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
        'EZRX-T142 | Verify search Return Item by inputting keyword not contain Product name/code/Return ID in View by items tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
    });

    testWidgets(
        'EZRX-T145 | Verify Filter by Items date when having result found in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
      const fromAmount = '40.123400';
      const toAmount = '200.20';
      const invalidToAmount = '1';
      const formattedFromAmount = '40.12';
      const formattedToAmount = '200.2';
      await goToReturns(tester: tester);

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
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
      returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, true);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
      returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, false);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      returnsByItemsRobot.verifyReturnsWithStatusVisible(returnStatus.tr());
    });

    testWidgets(
        'EZRX-T154 | Verify Filter by Request amount when having result found in View by items tab',
        (tester) async {
      //initialize necessary robots
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
      await returnsByItemsFilterRobot.enterToAmount(toAmount);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(3);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyAmountRangeFilterApplied(
        fromAmount: fromAmount,
        toAmount: toAmount,
      );
      returnsByItemsFilterRobot.verifyDateRangeFilterApplied(
        fromDate: fromDate.displayDate,
        toDate: toDate.displayDate,
      );
      returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, true);
      await returnsByItemsFilterRobot.tapCloseIcon();
      returnsByItemsRobot.verifyReturnsWithStatusVisible(returnStatus.tr());
    });

    testWidgets('EZRX-T219 | Verify click on reset button in filter',
        (tester) async {
      final fromDate = DateTime.now().subtract(const Duration(days: 60));
      final toDate = DateTime.now().subtract(const Duration(days: 59));
      const index = 0;
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyReturnItemsVisible();
      final returnId = returnsByItemsRobot.getReturnIdText(index: index);
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
      await returnsByItemsFilterRobot.enterToAmount(toAmount);
      await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(3);
      returnsByItemsRobot.verifyReturnIdTextNotVisible(returnId, index: index);
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapResetButton();
      returnsByItemsRobot.verifyReturnItemsVisible();
      returnsByItemsRobot.verifyReturnIdTextVisible(returnId, index: index);
      await returnsByItemsRobot.tapFilterButton();
    });

    testWidgets('EZRX-T151 | Verify Return detail via View by items tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      await returnsByItemsRobot.tapFirstReturn();
      returnsByItemsDetailRobot.verifyReturnIdVisible(returnId);
      returnsByItemsDetailRobot.verifyRequestDateVisible();
      returnsByItemsDetailRobot.verifyReturnReferenceVisible(returnReference);
      returnsByItemsDetailRobot
          .verifySpecialInstructionsVisible(specialInstructions);
      returnsByItemsDetailRobot.verifyStatusTrackerVisible(returnStatus);
      returnsByItemsDetailRobot.verifyDeliveryToVisible(shipToCode);
      returnsByItemsDetailRobot.verifyCustomerCodeVisible(customerCode);
      // returnsByItemsDetailRobot.verifyReturnAddressVisible(shipToAddress);
      await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
      returnsByItemsDetailRobot.verifyMaterialVisible(
        materialNumber,
        materialQty,
        materialTotalPrice,
      );
      returnsByItemsDetailRobot.verifywareHouseStorageConditionTag();
      returnsByItemsDetailRobot.verifywareHouseStorageConditionTag();
      returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
    });

    testWidgets(
        'EZRX-T152 | Verify extend information of Return Item detail via View by items tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
        'EZRX-T136 | Verify display items in View by return requests tab with data available',
        (tester) async {
      await goToReturns(tester: tester);

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
    });

    testWidgets('EZRX-T555 | Verify Return By Request Export button',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      returnsRootRobot.verifyViewByItemsPageVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      returnsByRequestRobot.verifyFilterButtonVisible();
      returnsByRequestRobot.verifyExportButtonVisible();
      await returnsByRequestRobot.tapExportButton();
      await commonRobot.verifyCustomSnackBar(
        message: 'File downloaded successfully',
      );
    });

    testWidgets(
        'EZRX-T138 | Verify display items in View by return requests tab with no data available with auto search',
        (tester) async {
      //initialize necessary robots
      initializeRobot(tester);

      //init app
      await runAppForTesting(tester);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await homeRobot.tapReturnsQuickAccess();

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      await commonRobot.autoSearch(validSearchKey);
      returnsByRequestRobot.verifyReturnRequestVisible();
      await commonRobot.tapClearSearch();
      await commonRobot.autoSearch(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(validSearchKey);
      returnsByRequestRobot.verifyReturnRequestVisible();
      await commonRobot.tapClearSearch();

      await commonRobot.autoSearch(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
        isVisible: false,
      );
    });

    testWidgets(
        'EZRX-T143 | Verify search Return Request by inputting keyword contains Return ID in View by return requests tab with search icon',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await returnsByRequestFilterRobot.tapApplyButton();
      await commonRobot.searchWithKeyboardAction(returnId);
      await commonRobot.waitAutoSearchDuration();
      commonRobot.verifyLoadingImage(isVisible: false);
      returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
    });

    testWidgets(
        'EZRX-T144 | Verify search Return Request by inputting keyword not contain Return ID in View by return requests tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      returnsByRequestRobot.verifyReturnRequestVisible();
      await commonRobot.searchWithKeyboardAction(invalidSearchKey);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.pullToRefresh();
      returnsByRequestRobot.verifyReturnRequestVisible();
      await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
      await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
    });

    testWidgets(
        'EZRX-T148 | Verify Filter by Request date when having result found in View by return requests tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
      const fromAmount = '40.123400';
      const toAmount = '500.20';
      const invalidToAmount = '1';
      const formattedFromAmount = '40.12';
      const formattedToAmount = '500.2';
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
      await goToReturns(tester: tester);

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
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
      await returnsByRequestRobot.tapFilterButton();
    });

    testWidgets(
        'EZRX-T153 | Verify Return detail via View by return requests tab',
        (tester) async {
      await goToReturns(tester: tester);

      //verify
      returnsRootRobot.verifyTabBarVisible();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapToDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDate,
        toDate: toDate,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
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
      // returnsByRequestDetailRobot.verifyReturnAddressVisible(shipToAddress);
      returnsByRequestDetailRobot.verifyCustomerCodeVisible(customerCode);
      returnsByRequestDetailRobot.verifyDeliveryToVisible(shipToCode);
      returnsByRequestDetailRobot.verifySubTotalVisible(returnSubTotal);
      returnsByRequestDetailRobot.verifyGrandTotalVisible(returnGrandTotal);
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
      await pumpAppWithLogin(tester);
      await goToNewRequest();
      newReturnRobot.verifyNewReturnStep1Display(shipToAddress);
    });

    testWidgets(
        'EZRX-T156 | Verify the customer code & deliver to in Order for [Selected address] in New return request page',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

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
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      newReturnRobot.collectTheFirstItemTitleWithoutFilter();
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDateForStep1,
        toDate: toDateForStep1,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await newReturnRobot.tapApply();
      await newReturnRobot.verifyTheReturnListBaseOnFilter(
        fromDate: fromDateForStep1,
        toDate: toDateForStep1,
      );
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      newReturnRobot.verifyTheFirstItemAfterReset();
    });

    testWidgets(
        'EZRX-T234 | Verify new return request Step 1 of 3: Text fields - Happy flow - done button',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDateForStep1,
        toDate: toDateForStep1,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await newReturnRobot.tapApply();
      newReturnRobot.collectTheFirstItemTitleWithoutFilter();
      await commonRobot.searchWithKeyboardAction(validSearchKeyForStep1);
      newReturnRobot
          .verifyTheFirstItemAfterSearch(validSearchKeyForStep1.toUpperCase());
      await commonRobot.tapClearSearch();
      await newReturnRobot.verifyTheFirstItemAfterClearSearch();
    });
    testWidgets(
        'EZRX-T234 | Verify new return request Step 1 of 3: Text fields - Happy flow - done button',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapReset();
      await commonRobot.searchWithKeyboardAction(validSearchKeyForStep1);
      newReturnRobot.verifyReturnItemVisible();
      newReturnRobot.verifyDetailCollapsed(true);
      await newReturnRobot.tapShowDetailButton();
      newReturnRobot.verifyDetailCollapsed(false);
    });

    testWidgets(
        'EZRX-T235 | Verify new return request Step 1 of 3: Text fields - Happy flow - search icon button',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDateToNextForStep2,
        toDate: toDateToNextForStep2,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await newReturnRobot.tapApply();
      await newReturnRobot.tapItemAt(index: 0);
      await newReturnRobot.tapNextButton();
      newReturnRobot.verifyStep2Visible();
    });
    testWidgets(
        'EZRX-T233 | Verify new return request Step 1 of 3: Text fields - UnHappy flow',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await commonRobot.searchWithKeyboardAction('a');
      await newReturnRobot.verifySnackbarVisible();
      await commonRobot.dismissSnackbar();
      await commonRobot.searchWithKeyboardAction(inValidSearchKey);
      await newReturnRobot.verifySnackbarVisible();
      await commonRobot.dismissSnackbar();
      await commonRobot.searchWithKeyboardAction(noResultSearchKey);
      newReturnRobot.verifyNoItemFound();
    });
    testWidgets(
        'EZRX-T109 | Verify next step screen Step 1 of 3: select item(s) to return without select item',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await newReturnRobot.tapNextButton();
      newReturnRobot.verifyCannotMoveToNextScreen();
    });
  });

  group('New Return Request - step - 2 - ', () {
    testWidgets(
        'EZRX-T228 | Verify new return request step 2 of 3: Fill in return details displayed',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();
      await goToStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayedWithBonus(
        materialId,
        materialTitle,
      );
    });

    testWidgets(
        'EZRX-T232 | Verify new return request step 2 of 3: Fill in return details with quantity out of balance quantity',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await goToStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        materialId,
        materialTitle,
      );
      await newReturnStep2Robot.enterReturnQuantity(
        exceedReturnQuantity,
        materialUUID,
      );
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyReturnQuantityCannotExceedBalanceQuantity();
    });
    testWidgets(
        'EZRX-T231 | Verify new return request step 2 of 3: Fill in return details without all fields require',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await goToStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        materialId,
        materialTitle,
      );
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
      newReturnStep2Robot.verifyCannotMoveWithoutReason();
    });

    testWidgets(
        'EZRX-T236 | Verify new return request step 2 of 3: Next button clicked with all valid fields selecting return Type as Return',
        (tester) async {
      await pumpAppWithLogin(tester);

      await goToNewRequest();
      await goToStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        materialId,
        materialTitle,
      );
      await newReturnStep2Robot.selectReturnType(
        returnTypeReturn,
        materialUUID,
      );
      await newReturnStep2Robot.enterReturnQuantity(
        validReturnQuantity,
        materialUUID,
      );
      newReturnStep2Robot.verifyReturnCounterOfferField(
        isVisible: true,
        uuid: materialUUID,
      );
      await newReturnStep2Robot.selectReason(reason, materialUUID);
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyNextToStep3(materialId, materialTitle);
      newReturnStep3Robot.verifyStep3Visible();
    });
    testWidgets(
        'EZRX-T236 | Verify new return request step 2 of 3: Next button clicked with all valid fields selecting return Type as Exchange',
        (tester) async {
      await pumpAppWithLogin(tester);

      await goToNewRequest();
      await goToStep2();
      newReturnStep2Robot.verifyReturnDetailDisplayed(
        materialId,
        materialTitle,
      );
      await newReturnStep2Robot.selectReturnType(
        returnTypeExcange,
        materialUUID,
      );
      await newReturnStep2Robot.enterReturnQuantity(
        validReturnQuantity,
        materialUUID,
      );
      newReturnStep2Robot.verifyReturnCounterOfferField(
        isVisible: false,
        uuid: materialUUID,
      );
      await newReturnStep2Robot.selectReason(reason, materialUUID);
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyNextToStep3(materialId, materialTitle);
      newReturnStep3Robot.verifyStep3Visible();
    });

    testWidgets(
        'EZRX-T229 | Verify new return request step 2 of 3: review return details - delete item again',
        (tester) async {
      await pumpAppWithLogin(tester);
      await goToNewRequest();

      await goToStep2();
      await newReturnStep2Robot.deleteItem();
      newReturnRobot.verifyNewReturnStep1Display(shipToAddress);
      await newReturnRobot.tapFilterIcon();
      await newReturnRobot.tapTheDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: fromDateToNextForStep2,
        toDate: toDateToNextForStep2,
        dateStringFormat: await getDateFormatBasedOnUserLanguage(),
      );
      await newReturnRobot.tapApply();
      await tester.pump(const Duration(seconds: 1));
      await newReturnRobot.tapItemAt(index: 0);
      await newReturnRobot.tapNextButton();
      newReturnStep2Robot.verifyReturnDetailDisplayedWithBonus(
        materialId,
        materialTitle,
      );
    });

//TODO: Need bonus item added for return
    // testWidgets(
    //     'EZRX-T559 | Verify return step 2 of 3 Fill in return detail when include bonus',
    //     (tester) async {
    //   await pumpAppWithLogin(tester);
    //   await goToNewRequest();

    //   await newReturnRobot.tapFilterIcon();
    //   await newReturnRobot.tapReset();
    //   await commonRobot.searchWithKeyboardAction(validSearchKeyForStep1);
    //   await newReturnRobot.tapFirstItem();
    //   await newReturnRobot.tapNextButton();
    //   newReturnStep2Robot.verifyReturnDetailDisplayedWithBonus(
    //     materialNumber,
    //     materialName,
    //   );
    // });
  });

  group('New Return Request - step - 3 - ', () {
    testWidgets(
        'EZRX-T237 | Verify new return request Step 3 of 3: all initial fields',
        (tester) async {
      await pumpAppWithLogin(tester);

      await fillStep2();
      await newReturnRobot.tapReturnFor();
      newReturnRobot.verifyDetailBottomSheetVisible();
      await newReturnRobot.closeBottomSheetDetail();
      newReturnRobot.verifyDetailBottomSheetIsHide();
      newReturnStep3Robot.verifyStep3Visible();
    });

    testWidgets(
        'EZRX-T230 | Verify new return request step 3 : submit successful',
        (tester) async {
      await pumpAppWithLogin(tester);
      await fillStep2();
      newReturnStep3Robot.verifyStep3Visible();
      await newReturnRobot.tapReturnFor();
      newReturnRobot.verifyDetailBottomSheetVisible();
      await newReturnRobot.closeBottomSheetDetail();
      newReturnRobot.verifyDetailBottomSheetIsHide();
      newReturnStep3Robot.collectInfoBeforeSubmit();
      // no need to submit because it change the maintained data
      // await newReturnStep3Robot.tapSubmit();
      // newReturnStep3Robot.verifySubmitSuccessFully(shipToAddress);
    });
  });

  // tearDown(() async {
  //   locator<ZephyrService>().setNameAndStatus();
  //   await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  // });
}
