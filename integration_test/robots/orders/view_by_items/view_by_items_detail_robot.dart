import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_common_tile.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ViewByItemsDetailRobot extends CommonRobot {
  ViewByItemsDetailRobot(super.tester);

  final statusTrackerSection = find.byType(StatusTrackerSection);
  final addressSection = find.byType(AddressInfoSection);
  final itemDetailSection = find.byType(ItemDetailsSection);
  final otherItemDetailSection = find.byType(OtherItemDetailsSection);
  final otherItem =
      find.byKey(WidgetKeys.viewByItemDetailOtherItemExpandSection);
  final orderItem = find.byType(OrderItemCommonTile);
  final offerTag = find.byKey(WidgetKeys.offerTag);
  final bundleTag = find.byKey(WidgetKeys.bundleTag);
  final bonusTag = find.byKey(WidgetKeys.commonTileItemStatusLabel);
  Finder get freePrice => find.descendant(
        of: find.byKey(WidgetKeys.cartItemProductTotalPrice),
        matching: find.text('FREE'.tr(), findRichText: true),
      );
  final buyAgainButton = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
  final expandButton = find.byKey(WidgetKeys.viewByItemDetailExpandButton);
  final qtyLabel = find.byKey(WidgetKeys.cartItemProductQty);
  final contactNumber =
      find.byKey(WidgetKeys.viewByItemsOrderDetailsContactNumber);

  void verifyPage() {
    expect(find.byType(ViewByItemDetailsPage), findsOneWidget);
  }

  void verifyHeader() {
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderCode),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderDate),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailInvoiceNumber),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailPoReference),
      findsOneWidget,
    );
  }

  Future<void> tapOrderNumber() async {
    await tester.tap(find.byKey(WidgetKeys.viewByOrderOrderNumberButton));
    await tester.pumpUntilVisible(find.byType(ViewByOrderDetailsPage));
  }

  String getInvoiceNumber() {
    final invoiceWidget = tester.widget<InvoiceNumberSection>(
      find.byKey(WidgetKeys.viewByItemsOrderDetailInvoiceNumber),
    );

    return invoiceWidget.invoiceNumber;
  }

  Future<void> tapInvoiceNumber() async {
    await tester
        .tap(find.byKey(WidgetKeys.viewByItemsOrderDetailsInvoiceNumberButton));
    await tester.pumpUntilVisible(find.byType(InvoiceDetailsPage));
  }

  void verifyStatusTracker() {
    expect(statusTrackerSection, findsOneWidget);
  }

  void verifyAddress() {
    expect(
      find.byKey(WidgetKeys.addressInfoSectionActionLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
      findsOneWidget,
    );
  }

  Future<void> scrollToExpandButton() =>
      scrollEnsureFinderVisible(expandButton);

  void verifyExpandButton({bool isVisible = true}) =>
      expect(expandButton, isVisible ? findsOneWidget : findsNothing);

  Future<void> tapExpandButton() async {
    await tester.tap(expandButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapBuyAgainButton() async {
    await tester.tap(buyAgainButton);
    await tester.pumpAndSettle();
  }

  void verifyBuyAgainButton({required bool isVisible}) {
    expect(buyAgainButton, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyBuyAgainButtonDisabled() {
    expect(
      (tester.widget<OutlinedButton>(buyAgainButton)).enabled,
      false,
    );
  }

  int _getMaterialIndex({required bool isBonus}) {
    for (var i = 0; i < orderItem.evaluate().length; i++) {
      final isBonusMaterialPresent = find
          .descendant(
            of: orderItem.at(i),
            matching: find.byWidgetPredicate(
              (w) => w.key == WidgetKeys.commonTileItemStatusLabel,
            ),
          )
          .evaluate()
          .isNotEmpty;

      if ((isBonus && isBonusMaterialPresent) ||
          (!isBonus && !isBonusMaterialPresent)) {
        return i;
      }
    }

    return -1;
  }

  Future<void> scrollToItemDetailSection() async {
    await scrollEnsureFinderVisible(find.byType(ItemDetailsSection));
    await tester.pump();
  }
  
  Future<void> verifyItemComponent({bool isBonus = false}) async {
    await scrollToItemDetailSection();
    final item = orderItem.at(_getMaterialIndex(isBonus: isBonus));
    await scrollEnsureFinderVisible(item);
    _verifyItemComponent(item);
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemTitle),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byType(ProductImage),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.orderItemStatusKey),
      ),
    );
    _verifyItemComponent(
      find.descendant(
        of: item,
        matching: qtyLabel,
      ),
    );
    if (isBonus) {
      _verifyItemComponent(
        find.descendant(
          of: item,
          matching: freePrice,
        ),
      );
    }
  }

  Future<void> verifyItemComponentWithBonus() async {
    await scrollEnsureFinderVisible(orderItem.first);
    _verifyItemComponent(orderItem, isMoreThanOne: true);
    _verifyItemComponent(
      find.byKey(WidgetKeys.commonTileItemTitle),
      isMoreThanOne: true,
    );
    _verifyItemComponent(
      find.byKey(WidgetKeys.commonTileItemLabel),
      isMoreThanOne: true,
    );
    _verifyItemComponent(find.byType(ProductImage), isMoreThanOne: true);
    _verifyItemComponent(
      find.byKey(WidgetKeys.orderItemStatusKey),
      isMoreThanOne: true,
    );
    _verifyItemComponent(qtyLabel, isMoreThanOne: true);
  }

  Future<void> verifyManufacturerName(
    String manufacturerName, {
    bool isVisible = true,
  }) async {
    await scrollEnsureFinderVisible(addressSection);
    final manufacturerFinder = find.byKey(WidgetKeys.manufacturerMaterials);
    if (!isVisible) {
      expect(manufacturerFinder, findsNothing);
    } else {
      await scrollEnsureFinderVisible(manufacturerFinder.first);
      expect(
        tester.widget<Text>(manufacturerFinder.first).data,
        manufacturerName,
      );
    }
  }

  void verifyMaterialNumber(String materialNumber, {bool isBonus = false}) =>
      _verifyItemComponent(
        find.descendant(
          of: orderItem.at(_getMaterialIndex(isBonus: isBonus)),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.commonTileItemLabel &&
                widget is Text &&
                (widget.data ?? '').contains(materialNumber),
          ),
        ),
      );

  void verifyQty(int qty, {bool isBonus = false}) => _verifyItemComponent(
        find.descendant(
          of: orderItem.at(_getMaterialIndex(isBonus: isBonus)),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.cartItemProductQty &&
                widget is Text &&
                (widget.data ?? '').contains(qty.toString()),
          ),
        ),
      );

  void verifyBonusLabel() => _verifyItemComponent(bonusTag);

  void verifyOfferTag() => _verifyItemComponent(offerTag);

  void verifyBundleTag() => _verifyItemComponent(bundleTag);

  void verifyFreePrice() => _verifyItemComponent(freePrice);

  void verifyBatchExpiryDate(StockInfo stockInfo) =>
      verifyStockInfo(stockInfo, itemDetailSection);

  void _verifyItemComponent(Finder finder, {bool isMoreThanOne = false}) =>
      expect(
        find.descendant(of: itemDetailSection, matching: finder),
        isMoreThanOne ? findsWidgets : findsOneWidget,
      );

  Future<void> verifyOtherItemsComponent({bool isVisible = true}) async {
    if (isVisible) await scrollEnsureFinderVisible(otherItemDetailSection);
    expect(
      find.descendant(of: otherItemDetailSection, matching: otherItem),
      isVisible ? findsWidgets : findsNothing,
    );
  }

  late Finder _verifyingItem;

  Future<void> startVerifyOtherItem(int index) async {
    final item = find.descendant(
      of: otherItemDetailSection,
      matching: find.byKey(WidgetKeys.genericKey(key: index.toString())),
    );
    await scrollEnsureFinderVisible(
      find.descendant(of: item, matching: qtyLabel),
    );
    _verifyingItem = item;
  }

  void verifyOtherItemQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(of: _verifyingItem, matching: qtyLabel),
    );
    expect(widget.data ?? '', contains(qty.toString()));
  }

  void verifyOtherItemBonusLabel() => expect(
        find.descendant(of: _verifyingItem, matching: bonusTag),
        findsOneWidget,
      );

  void verifyOtherItemOfferTag() => expect(
        find.descendant(of: _verifyingItem, matching: offerTag),
        findsOneWidget,
      );

  void verifyOtherItemBundleTag() => expect(
        find.descendant(of: _verifyingItem, matching: bundleTag),
        findsOneWidget,
      );

  void verifyOtherItemFreePrice() => expect(
        find.descendant(of: _verifyingItem, matching: freePrice),
        findsOneWidget,
      );

  void verifyCovidMaterialLabel() {
    expect(find.byKey(WidgetKeys.covidLabel), findsWidgets);
  }

  String getOrderContactNumber() {
    final contactNumberText =
        tester.widget<BalanceTextRow>(contactNumber).valueText;
    if (contactNumberText == '-') {
      return '';
    }
    return contactNumberText;
  }

  late Finder _verifyingSelectedItem;
  Future<void> startVerifyItem(int index) async {
    final item = find.descendant(
      of: itemDetailSection,
      matching: find.byKey(WidgetKeys.genericKey(key: index.toString())),
    );
    await scrollEnsureFinderVisible(
      find.descendant(of: item, matching: qtyLabel),
    );
    _verifyingSelectedItem = item;
  }

  void verifySelectedItemQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(of: _verifyingSelectedItem, matching: qtyLabel),
    );
    expect(widget.data ?? '', contains(qty.toString()));
  }

  void verifySelectedItemOfferTag() => expect(
        find.descendant(of: _verifyingSelectedItem, matching: offerTag),
        findsOneWidget,
      );
  void verifySelectedItemMaterialNo(String materialNumber) {
    final widget = tester.widget<Text>(
      find.descendant(
        of: _verifyingSelectedItem,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
    );
    expect(widget.data ?? '', contains(materialNumber));
  }

  void verifySelectedItemFreePrice() => expect(
        find.descendant(of: _verifyingSelectedItem, matching: freePrice),
        findsOneWidget,
      );

  void verifySelectedItemBonusLabel() => expect(
        find.descendant(of: _verifyingSelectedItem, matching: bonusTag),
        findsOneWidget,
      );
}
