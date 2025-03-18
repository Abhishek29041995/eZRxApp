import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/home/aup_tc_robot.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
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
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late AupTCRobot aupTCRobot;

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsRobot returnsByItemsRobot;
  late ReturnsByItemsFilterRobot returnsByItemsFilterRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late ReturnsByRequestRobot returnsByRequestRobot;
  late ReturnsByRequestFilterRobot returnsByRequestFilterRobot;
  late ReturnsByRequestDetailRobot returnsByRequestDetailRobot;

  late NewReturnStep1Robot newReturnStep1Robot;
  late NewReturnStep2Robot newReturnStep2Robot;
  late NewReturnStep3Robot newReturnStep3Robot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    aupTCRobot = AupTCRobot(tester);

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsRobot = ReturnsByItemsRobot(tester);
    returnsByItemsFilterRobot = ReturnsByItemsFilterRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
    returnsByRequestRobot = ReturnsByRequestRobot(tester);
    returnsByRequestFilterRobot = ReturnsByRequestFilterRobot(tester);
    returnsByRequestDetailRobot = ReturnsByRequestDetailRobot(tester);

    newReturnStep1Robot = NewReturnStep1Robot(tester);
    newReturnStep2Robot = NewReturnStep2Robot(tester);
    newReturnStep3Robot = NewReturnStep3Robot(tester);
  }

  const market = 'Malaysia';
  const username = 'mpmyclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030082707';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const nonMPShipToCode = '0000002012';
  const currency = 'MYR';

  final requestDate = DateTime(2024, 5, 31);
  final requestFromDate = requestDate.subtract(const Duration(days: 2));
  final requestToDate = requestDate.add(const Duration(days: 2));

  const mpMaterialNumber = '23357259';
  const mpMaterialName = 'DROP SHIPMENT TEST MATERIAL 20NB';
  const mpMaterialSeller = 'Actavis Hong Kong Ltd';
  const mpMaterialReturnQty = 3;
  const mpMaterialPrice = 200.0;
  const mpMaterialReturnStatus = 'Rejected';
  const returnId = 'EZRE-200124006063';
  const returnTotalAmount = 800.0;

  const differentMPMaterialSeller = 'ABBOTT LABORATORIES (M)';

  const returnFailedStatusId = 'EZRE-200124006059';
  const returnFailedStatus = 'Failed';
  const returnFailedStatusTotalAmount = 600.0;

  final returnBonusInvoiceDate = DateTime(2024, 5, 31);
  const returnBonusMaterialNumber = '23357260';

  Future<void> pumpAppWithReturnScreen(WidgetTester tester) async {
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
    await homeRobot.tapReturnsQuickAccess();
  }

  group('Return by item -', () {
    testWidgets('EZRX-T2019 | Verify search and filter in view by item',
        (tester) async {
      final returnAmount =
          (mpMaterialReturnQty * mpMaterialPrice).toStringAsFixed(2);

      await pumpAppWithReturnScreen(tester);

      returnsRootRobot.verifyViewByItemsPageVisible();
      returnsByItemsRobot.verifyFilterApplied(0);
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyDefaultFilterApplied();
      returnsByItemsFilterRobot.verifyReturnTypeFilter();
      // Verify filter ZP return
      await returnsByItemsFilterRobot.tapReturnTypeFilter('ZP items');
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyMarketPlaceLogo(isVisible: false);
      // Verify search for MP while filter by ZP
      await commonRobot.searchWithSearchIcon(mpMaterialNumber);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.autoSearch(mpMaterialName);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.searchWithKeyboardAction(returnId);
      returnsByItemsRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      // Verify filter MP return
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapReturnTypeFilter('MP items');
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyMarketPlaceLogo(isVisible: true);
      returnsByItemsRobot.verifyBatchExpiryDate(
        index: 0,
        stockInfo: StockInfo.empty(),
      );
      // Verify search for MP while filter by MP
      await commonRobot.searchWithSearchIcon(mpMaterialNumber);
      returnsByItemsRobot.verifyReturnsWithProductCodeVisible(mpMaterialNumber);
      await commonRobot.autoSearch(mpMaterialName);
      returnsByItemsRobot.verifyReturnsWithProductNameVisible(mpMaterialName);
      await commonRobot.searchWithKeyboardAction(returnId);
      returnsByItemsRobot.verifyReturnsWithIdVisible(returnId);
      await commonRobot.tapClearSearch();
      // Verify other filters for MP
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: requestFromDate,
        toDate: requestToDate,
      );
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(1);
      returnsByItemsRobot.verifyReturnGroupInDateRangeVisible(
        fromDate: requestFromDate,
        toDate: requestToDate,
      );
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.enterFromAmount(returnAmount);
      await returnsByItemsFilterRobot.enterToAmount(returnAmount);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(2);
      returnsByItemsRobot.verifyReturnItemsVisible();
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapStatusCheckbox(mpMaterialReturnStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      returnsByItemsRobot.verifyFilterApplied(3);
      returnsByItemsRobot
          .verifyReturnsWithStatusVisible(mpMaterialReturnStatus.tr());
      // Verify filter not visible in non-marketplace
      await commonRobot.tapToBackScreen();
      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      await homeRobot.tapReturnsQuickAccess();
      await returnsByItemsRobot.tapFilterButton();
      returnsByItemsFilterRobot.verifyReturnTypeFilter(isVisible: false);
    });

    testWidgets('EZRX-T2020 | Verify return item detail', (tester) async {
      await pumpAppWithReturnScreen(tester);

      await commonRobot.autoSearch(returnId);
      await returnsByItemsRobot.tapFilterButton();
      await returnsByItemsFilterRobot.tapStatusCheckbox(mpMaterialReturnStatus);
      await returnsByItemsFilterRobot.tapApplyButton();
      await returnsByItemsRobot.tapReturnWithMaterialNumber(mpMaterialNumber);
      returnsByItemsDetailRobot
          .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
      returnsByItemsDetailRobot.verifyMaterialVisible(
        mpMaterialNumber,
        mpMaterialReturnQty,
        (mpMaterialReturnQty * mpMaterialPrice).priceDisplay(currency),
      );
      returnsByItemsDetailRobot.verifyMarketPlaceLogo();
      returnsByItemsDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
    });
  });

  group('Return by request -', () {
    testWidgets('EZRX-T2018 | Verify search and filter in view by request',
        (tester) async {
      await pumpAppWithReturnScreen(tester);

      await returnsRootRobot.switchToViewByRequestPage();
      returnsRootRobot.verifyViewByRequestPageVisible();
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyDefaultFilterApplied();
      returnsByRequestFilterRobot.verifyReturnTypeFilter();
      // Verify filter ZP return
      await returnsByRequestFilterRobot.tapReturnTypeFilter('ZP items');
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyMarketPlaceLogo(isVisible: false);
      // Verify search for MP while filter by ZP
      await commonRobot.searchWithSearchIcon(returnId);
      returnsByRequestRobot.verifyNoRecordFoundVisible();
      await commonRobot.tapClearSearch();
      // Verify filter MP return
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapReturnTypeFilter('MP items');
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyMarketPlaceLogo(isVisible: true);
      // Verify search for MP while filter by MP
      await commonRobot.searchWithSearchIcon(returnId);
      returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
      await commonRobot.tapClearSearch();
      // Verify other filters for MP
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapFromDateField();
      await commonRobot.setDateRangePickerValue(
        fromDate: requestFromDate,
        toDate: requestToDate,
      );
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(1);
      returnsByRequestRobot.verifyReturnGroupInDateRangeVisible(
        fromDate: requestFromDate,
        toDate: requestToDate,
      );
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot
          .enterFromAmount(returnFailedStatusTotalAmount.toStringAsFixed(2));
      await returnsByRequestFilterRobot
          .enterToAmount(returnFailedStatusTotalAmount.toStringAsFixed(2));
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(2);
      returnsByRequestRobot.verifyReturnGroupInAmountRangeVisible(
        fromAmount: returnFailedStatusTotalAmount,
        toAmount: returnFailedStatusTotalAmount,
        currency: currency,
      );
      await returnsByRequestRobot.tapFilterButton();
      await returnsByRequestFilterRobot.tapStatusCheckbox(returnFailedStatus);
      await returnsByRequestFilterRobot.tapApplyButton();
      returnsByRequestRobot.verifyFilterApplied(3);
      returnsByRequestRobot
          .verifyReturnsWithStatusVisible([returnFailedStatus.tr()]);
      // Verify filter not visible in non-marketplace
      await commonRobot.tapToBackScreen();
      await commonRobot.changeDeliveryAddress(nonMPShipToCode);
      await homeRobot.tapReturnsQuickAccess();
      await returnsRootRobot.switchToViewByRequestPage();
      await returnsByRequestRobot.tapFilterButton();
      returnsByRequestFilterRobot.verifyReturnTypeFilter(isVisible: false);
    });

    testWidgets(
        'EZRX-T2022 | Verify RO creation failed message displayed in failed request',
        (tester) async {
      await pumpAppWithReturnScreen(tester);

      await returnsRootRobot.switchToViewByRequestPage();
      await commonRobot.autoSearch(returnFailedStatusId);
      await returnsByRequestRobot.tapFirstReturnVisible();
      returnsByRequestDetailRobot
          .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      returnsByRequestDetailRobot
          .verifyStatusTrackerVisible(returnFailedStatus);
      returnsByRequestDetailRobot.verifyReturnAddressVisible(shipToAddress);
      returnsByRequestDetailRobot.verifyCustomerCodeVisible(customerCode);
      returnsByRequestDetailRobot.verifyDeliveryToVisible(shipToCode);
      returnsByRequestDetailRobot.verifyROCreationFailedMessage();
    });

    testWidgets('EZRX-T2021 | Verify return request detail', (tester) async {
      await pumpAppWithReturnScreen(tester);

      await returnsRootRobot.switchToViewByRequestPage();
      await commonRobot.autoSearch(returnId);
      await returnsByRequestRobot.tapFirstReturnVisible();
      returnsByRequestDetailRobot
          .verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      returnsByRequestDetailRobot
          .verifySubTotalVisible(returnTotalAmount.priceDisplay(currency));
      returnsByRequestDetailRobot
          .verifyGrandTotalVisible(returnTotalAmount.priceDisplay(currency));
      await returnsByRequestDetailRobot.startVerifyMaterial(
        qty: mpMaterialReturnQty,
        price: (mpMaterialReturnQty * mpMaterialPrice).priceDisplay(currency),
        materialNumber: mpMaterialNumber,
      );
      returnsByRequestDetailRobot.verifyMarketPlaceLogo();
      returnsByRequestDetailRobot.verifyBatchExpiryDate(StockInfo.empty());
    });
  });

  group('New return request -', () {
    const returnQty = '1';
    final returnReason = 'Slow Moving'.tr();

    Future<void> pumpAppWithNewReturnScreen(WidgetTester tester) async {
      await pumpAppWithReturnScreen(tester);
      await returnsByItemsRobot.tapNewRequestFloatingButton();
    }

    testWidgets(
        'EZRX-T2014 | Verify can not place new return request with MP materials from different seller',
        (tester) async {
      await pumpAppWithNewReturnScreen(tester);
      await commonRobot.searchWithKeyboardAction(mpMaterialSeller);
      await newReturnStep1Robot.tapItemAt(index: 0);
      await commonRobot.searchWithKeyboardAction(differentMPMaterialSeller);
      await newReturnStep1Robot.tapItemAt(index: 0);
      await newReturnStep1Robot.tapNextButton();
      newReturnStep1Robot.verifyNewReturnStep1Display(shipToAddress);
      newReturnStep1Robot.verifyMaterialCannotFromSameSellerErrorMessage();
      await newReturnStep1Robot.tapNextButton();
      newReturnStep1Robot.verifyNewReturnStep1Display(shipToAddress);
      await newReturnStep1Robot.tapItemAt(index: 0);
      newReturnStep1Robot.verifyMaterialCannotFromSameSellerErrorMessage(
        isVisible: false,
      );
      await newReturnStep1Robot.tapNextButton();
      newReturnStep1Robot.verifyStep2Visible();
    });

    testWidgets(
        'EZRX-T2010 | Verify place a new return request with 1 MP material',
        (tester) async {
      const index = 0;

      await pumpAppWithNewReturnScreen(tester);

      await commonRobot.searchWithKeyboardAction(mpMaterialName);
      newReturnStep1Robot.verifyReturnItemVisible();
      newReturnStep1Robot.verifyItemMarketPlaceLogo(index: index);
      newReturnStep1Robot.verifyItemBatchExpiryDate(
        StockInfo.empty(),
        index: index,
      );
      final itemUUID = newReturnStep1Robot.getItemUUID(index: index);
      await newReturnStep1Robot.tapItemAt(index: index);
      await newReturnStep1Robot.tapNextButton();
      newReturnStep1Robot.verifyStep2Visible();
      newReturnStep2Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await newReturnStep2Robot.startVerifyItem(itemUUID);
      newReturnStep2Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
      await newReturnStep2Robot.tapNextButton();
      newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
      newReturnStep2Robot.verifyCannotMoveWithoutReason();
      await newReturnStep2Robot.enterReturnQuantity('9999', itemUUID);
      newReturnStep2Robot.verifyReturnQuantityCannotExceedBalanceQuantity();
      await newReturnStep2Robot.enterReturnQuantity(returnQty, itemUUID);
      await newReturnStep2Robot.selectReason(returnReason, itemUUID);
      await newReturnStep2Robot.tapNextButton();
      newReturnStep3Robot.verifyStep3Visible();
      newReturnStep3Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await newReturnStep3Robot.startVerifyItem(itemUUID);
      newReturnStep3Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
    });

    testWidgets(
        'EZRX-T2012 | Verify place a new return request with MP materials from same seller',
        (tester) async {
      await pumpAppWithNewReturnScreen(tester);

      await commonRobot.searchWithKeyboardAction(mpMaterialSeller);
      newReturnStep1Robot.verifyReturnItemVisible();
      newReturnStep1Robot.verifyItemMarketPlaceLogo(index: 0);
      newReturnStep1Robot.verifyItemBatchExpiryDate(
        StockInfo.empty(),
        index: 0,
      );
      final firstItemUUID = newReturnStep1Robot.getItemUUID(index: 0);
      await newReturnStep1Robot.tapItemAt(index: 0);
      newReturnStep1Robot.verifyItemMarketPlaceLogo(index: 1);
      newReturnStep1Robot.verifyItemBatchExpiryDate(
        StockInfo.empty(),
        index: 1,
      );
      final secondItemUUID = newReturnStep1Robot.getItemUUID(index: 1);
      await newReturnStep1Robot.tapItemAt(index: 1);
      await newReturnStep1Robot.tapNextButton();
      newReturnStep1Robot.verifyStep2Visible();
      newReturnStep2Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await newReturnStep2Robot.startVerifyItem(firstItemUUID);
      newReturnStep2Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
      await newReturnStep2Robot.enterReturnQuantity(returnQty, firstItemUUID);
      await newReturnStep2Robot.selectReason(returnReason, firstItemUUID);
      await newReturnStep2Robot.tapNextButton();
      await newReturnStep2Robot.startVerifyItem(secondItemUUID);
      newReturnStep2Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
      newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
      newReturnStep2Robot.verifyCannotMoveWithoutReason();
      await newReturnStep2Robot.enterReturnQuantity(returnQty, secondItemUUID);
      await newReturnStep2Robot.selectReason(returnReason, secondItemUUID);
      await newReturnStep2Robot.tapNextButton();
      newReturnStep3Robot.verifyStep3Visible();
      newReturnStep3Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
      await newReturnStep3Robot.startVerifyItem(firstItemUUID);
      newReturnStep3Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
      await newReturnStep3Robot.startVerifyItem(secondItemUUID);
      newReturnStep3Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
    });

    testWidgets(
      'EZRX-T2017 | Verify place a new return request with MP bonus material',
      (tester) async {
        const index = 0;
        await pumpAppWithNewReturnScreen(tester);

        await commonRobot.searchWithKeyboardAction(returnBonusMaterialNumber);
        await newReturnStep1Robot.tapFilterIcon();
        await newReturnStep1Robot.tapTheDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: returnBonusInvoiceDate.subtract(const Duration(days: 1)),
          toDate: returnBonusInvoiceDate.add(const Duration(days: 1)),
        );
        await newReturnStep1Robot.tapApply();
        newReturnStep1Robot.verifyItemMarketPlaceLogo(index: index);
        newReturnStep1Robot.verifyItemBatchExpiryDate(
          StockInfo.empty(),
          index: index,
        );
        newReturnStep1Robot.verifyItemBonusBatchExpiryDate(
          StockInfo.empty(),
          index: index,
        );
        final materialUUID = newReturnStep1Robot.getItemUUID(index: index);
        await newReturnStep1Robot.tapItemAt(index: 0);
        await newReturnStep1Robot.tapNextButton();
        newReturnStep1Robot.verifyStep2Visible();
        newReturnStep2Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await newReturnStep2Robot.enterReturnQuantity(returnQty, materialUUID);
        await newReturnStep2Robot.selectReason(returnReason, materialUUID);
        await newReturnStep2Robot.startVerifyItem(materialUUID);
        newReturnStep2Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
        final bonusUUIDs = newReturnStep2Robot.getBonusUUIDList(materialUUID);
        for (final bonusUUID in bonusUUIDs) {
          await newReturnStep2Robot.startVerifyBonusItem(bonusUUID);
          newReturnStep2Robot.verifyBonusBatchExpiryDate(StockInfo.empty());
          await newReturnStep2Robot.tapIncludeBonus();
        }
        await newReturnStep2Robot.startVerifyItem(materialUUID, reversed: true);
        await newReturnStep2Robot.tapNextButton();
        await newReturnStep2Robot.startVerifyBonusItem(bonusUUIDs.first);
        newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
        newReturnStep2Robot.verifyCannotMoveWithoutReason();
        for (final bonusUUID in bonusUUIDs) {
          await newReturnStep2Robot.enterReturnQuantity(returnQty, bonusUUID);
          await newReturnStep2Robot.selectReason(returnReason, bonusUUID);
        }
        await newReturnStep2Robot.tapNextButton();
        newReturnStep3Robot.verifyStep3Visible();
        newReturnStep3Robot.verifyMarketPlaceLogoWithSeller(mpMaterialSeller);
        await newReturnStep3Robot.startVerifyItem(materialUUID);
        newReturnStep3Robot.verifyMaterialBatchExpiryDate(StockInfo.empty());
        for (final bonusUUID in bonusUUIDs) {
          await newReturnStep3Robot.startVerifyBonusItem(bonusUUID);
          newReturnStep3Robot.verifyBonusBatchExpiryDate(StockInfo.empty());
        }
      },
    );
  });
}
