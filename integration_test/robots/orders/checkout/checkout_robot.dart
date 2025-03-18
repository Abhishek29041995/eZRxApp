import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class CheckoutRobot extends CommonRobot {
  CheckoutRobot(super.tester);

  final page = find.byKey(WidgetKeys.checkoutPage);
  final placeOrderButton = find.byKey(WidgetKeys.checkoutButton);
  final poReferenceField =
      find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));
  final deliveryDateField = find.byKey(WidgetKeys.deliveryDate);
  final referenceNoteField =
      find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
  final paymentTermField = find.byKey(WidgetKeys.paymentTermDropdownKey);
  final contactPersonField =
      find.byKey(WidgetKeys.genericKey(key: 'contactPersonKey'));
  final mobileNumberField =
      find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
  final deliveryInstructionField =
      find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
  final poAttachmentSection = find.byType(PoAttachmentUpload);
  final stickyGrandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
  final principalLabel = find.byKey(WidgetKeys.cartPrincipalLabel);
  final materialQtyLabel = find.byKey(WidgetKeys.cartItemProductQty);
  final materialDescriptionLabel =
      find.byKey(WidgetKeys.cartItemProductMaterialDescription);
  final materialPrincipalLabel =
      find.byKey(WidgetKeys.cartItemProductPrincipalName);
  final materialImage = find.byType(CustomImage);
  final materialDetailsStock = find.byKey(WidgetKeys.materialDetailsStock);

  void verifyPage() {
    expect(page, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapDeliveryInformationArrowButton() async {
    final button = find.byKey(WidgetKeys.checkoutDeliveryArrowButton);
    await scrollEnsureFinderVisible(button, reversed: true);
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  void verifyAddressSection() {
    expect(find.byType(AddressInfoSection), findsOneWidget);
  }

  void verifyCustomerCode(String customerCode) {
    final label = find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel);
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).data, contains(customerCode));
  }

  void verifyDeliveryTo(String deliveryTo) {
    final label = find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel);
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).data, contains(deliveryTo));
  }

  Future<void> verifyPoReferenceField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        poReferenceField,
        isVisible,
        reversed,
      );

  Future<void> enterPoReference(String text) async {
    await tester.tap(poReferenceField);
    await tester.pump();
    await tester.enterText(poReferenceField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterContactPerson(String text) async {
    await tester.tap(contactPersonField);
    await tester.pump();
    await tester.enterText(contactPersonField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyEmptyPoReferenceMessage({required bool isVisible}) {
    expect(
      find.descendant(
        of: poReferenceField,
        matching: find.text('PO reference is a required field.'.tr()),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> enterReferenceNote(String text) async {
    await tester.tap(referenceNoteField);
    await tester.enterText(referenceNoteField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyEmptyContactPersonErrorMessage({required bool isVisible}) {
    expect(
      find.descendant(
        of: contactPersonField,
        matching: find.text('Contact person is a required field'.tr()),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> enterContactNumber(String text) async {
    await tester.tap(mobileNumberField);
    await tester.pump();
    await tester.enterText(mobileNumberField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyEmptyContactNumberErrorMessage({required bool isVisible}) {
    expect(
      find.descendant(
        of: mobileNumberField,
        matching: find.text('Contact number is a required field'.tr()),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> verifyDeliveryDateField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        deliveryDateField,
        isVisible,
        reversed,
      );

  Future<void> verifyReferenceNoteField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        referenceNoteField,
        isVisible,
        reversed,
      );

  Future<void> verifyPaymentTermField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        paymentTermField,
        isVisible,
        reversed,
      );

  Future<void> verifyContactPersonField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        contactPersonField,
        isVisible,
        reversed,
      );

  Future<void> verifyMobileNumberField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        mobileNumberField,
        isVisible,
        reversed,
      );

  Future<void> verifyDeliveryInstructionField({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        deliveryInstructionField,
        isVisible,
        reversed,
      );

  void verifyContactNumberFieldHasText(String text) {
    expect(
      tester.widget<TextFormField>(mobileNumberField).controller?.text,
      text,
    );
  }

  Future<void> enterDeliveryInstruction(String text) async {
    await tester.tap(deliveryInstructionField);
    await tester.enterText(deliveryInstructionField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterPaymentTerm(String text) async {
    await tester.tap(paymentTermField);
    await tester.pumpAndSettle();
    await tester.tap(
      find.text(text),
    );
    await tester.pumpAndSettle();
  }

  Future<void> verifyPoAttachmentSection({
    required bool isVisible,
    bool reversed = false,
  }) =>
      _verifyDeliveryInformationComponent(
        poAttachmentSection,
        isVisible,
        reversed,
      );

  Future<void> _verifyDeliveryInformationComponent(
    Finder finder,
    bool isVisible,
    bool reversed,
  ) async {
    if (isVisible) {
      await scrollEnsureFinderVisible(finder, reversed: reversed);
    } else {
      expect(finder, findsNothing);
    }
  }

  Future<void> verifyMarketPlaceDeliveryInfo(List<String> sellers) async {
    final widget = find.byType(MarketPlaceDeliveryExpansionTile);
    await scrollEnsureFinderVisible(widget);
    expect(widget, findsOne);
    for (final text in sellers) {
      await verifySellerNameText(text, widget);
    }
  }

  Future<void> verifyYoursItemLabel(int qty) async {
    final label = find.byKey(WidgetKeys.checkoutItemsTotalQty);
    await scrollEnsureFinderVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  Future<void> verifyMarketPlaceSection() async {
    final sectionTitle = find.byKey(WidgetKeys.cartMPProductSectionLabel);
    await scrollEnsureFinderVisible(sectionTitle);
    expect(sectionTitle, findsOne);
  }

  void verifyStickyTotalQty(int qty) {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.priceSummaryTotalQty)).data,
      contains(qty.toString()),
    );
  }

  void verifyStickyGrandTotal(String price) {
    expect(
      find.descendant(
        of: stickyGrandTotal,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapStickyGrandTotal() async {
    await tester.tap(stickyGrandTotal);
    await tester.pumpAndSettle();
  }

  void verifyPlaceOrderButton() {
    expect(placeOrderButton, findsOneWidget);
  }

  Future<void> tapPlaceOrderButton() async {
    await tester.tap(placeOrderButton);
    await tester.pumpAndSettle();
  }

  Future<void> verifySubTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummarySubTotal),
        price,
      );

  Future<void> verifyMPSubTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryMPSubTotal),
        price,
      );

  Future<void> verifyZPSubTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryZPSubTotal),
        price,
      );

  Future<void> verifySmallOrderFeeLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.smallOrderFeeSection),
        price,
      );

  Future<void> verifyGrandTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        price,
      );
  Future<void> verifyTaxLabel(String price) => _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryTax),
        price,
      );

  Future<void> verifyTotalSavingLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryTotalSaving),
        price,
      );

  Future<void> _verifyOrderSummaryComponent(Finder label, String price) async {
    await scrollEnsureFinderVisible(label);
    expect(
      find.descendant(
        of: label,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  //============================================================
  //  Material
  //============================================================

  Future<void> verifyMaterialPrincipal(String principalName) =>
      scrollEnsureFinderVisible(
        find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartPrincipalLabel &&
              widget is Text &&
              widget.data == principalName,
        ),
      );

  Future<void> verifySellerName(String text) => verifySellerNameText(
        text,
        find.byKey(WidgetKeys.checkoutMaterialWithBonusItem),
      );

  Future<void> verifyMaterial(String materialNumber) =>
      scrollEnsureFinderVisible(_material(materialNumber));

  void verifyMaterialQty(String materialNumber, int qty) {
    final qtyLabel = find.descendant(
      of: _material(materialNumber),
      matching: materialQtyLabel,
    );
    expect(tester.widget<Text>(qtyLabel).data, contains(qty.toString()));
  }

  void verifyMaterialDescription(String materialNumber, String text) {
    final qtyLabel = find.descendant(
      of: _material(materialNumber),
      matching: materialDescriptionLabel,
    );
    expect(tester.widget<Text>(qtyLabel).data, equals(text));
  }

  void verifyMaterialImage(String materialNumber) {
    expect(
      find.descendant(of: _material(materialNumber), matching: materialImage),
      findsOneWidget,
    );
  }

  void verifyMaterialUnitPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _material(materialNumber),
          matching: find.byKey(WidgetKeys.cartItemProductUnitPrice),
        ),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGovtMaterialListPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _material(materialNumber),
          matching: find.byKey(WidgetKeys.govtMaterialListPrice),
        ),
        matching: find.text(
          '${'List price'.tr()}: $price',
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _material(materialNumber),
          matching: find.byKey(WidgetKeys.cartItemProductTotalPrice),
        ),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialCounterOfferLabel(
    String materialNumber, {
    required bool isVisible,
  }) {
    expect(
      find.descendant(
        of: _material(materialNumber),
        matching: find.byKey(WidgetKeys.cartItemProductCounterOfferLabel),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Finder _material(String materialNumber) =>
      find.byKey(WidgetKeys.cartItemProductTile(materialNumber));

  //============================================================
  //  Bundle
  //============================================================

  Future<void> verifyBundle(String bundleNumber) =>
      scrollEnsureFinderVisible(_bundle(bundleNumber));

  void verifyBundleName(String bundleNumber, String bundleName) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleName),
    );
    expect(
      tester.widget<RichText>(label).text.toPlainText(),
      contains(bundleName),
    );
  }

  void verifyBundleMarketPlaceLogo(String bundleNumber) {
    expect(
      find.descendant(
        of: _bundle(bundleNumber),
        matching: find.byType(MarketPlaceLogo),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleRate(String bundleNumber, int qty, String rate) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleRate),
    );
    expect(
      tester.widget<Text>(label).data,
      equals(
        '${'Purchase'.tr()} $qty ${'or more for'.tr()} $rate ${'per item'.tr()}',
      ),
    );
  }

  Future<void> verifyBundleItem(String bundleNumber, String materialNumber) =>
      scrollEnsureFinderVisible(_bundleItem(bundleNumber, materialNumber));

  void verifyBundleItemQty(
    String bundleNumber,
    String materialNumber,
    int text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialQtyLabel,
    );
    expect(tester.widget<Text>(label).data, contains(text.toString()));
  }

  void verifyBundleItemImage(
    String bundleNumber,
    String materialNumber,
  ) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber, materialNumber),
        matching: materialImage,
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemDescription(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialDescriptionLabel,
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyBundleItemPrincipal(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialPrincipalLabel,
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyBundleTotalQty(String bundleNumber, int qty) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyBundleTotalPrice(String bundleNumber, String price) {
    final widget = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleTotalPrice),
    );
    expect(
      find.descendant(
        of: widget,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Finder _bundleItem(String bundleNumber, String materialNumber) =>
      find.descendant(
        of: _bundle(bundleNumber),
        matching: _material(materialNumber),
      );

  Finder _bundle(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  //============================================================
  //  Bonus
  //============================================================

  Future<void> verifyBonusMaterial(
    String materialNumber,
    String bonusMaterialNumber,
  ) =>
      scrollEnsureFinderVisible(
        _bonusItem(materialNumber, bonusMaterialNumber),
      );

  void verifyBonusMaterialDescription(
    String materialNumber,
    String bonusMaterialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBonusMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialImage(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialQty(
    String materialNumber,
    String bonusMaterialNumber,
    int qty,
  ) {
    final qtyLabel = find.descendant(
      of: _bonusItem(materialNumber, bonusMaterialNumber),
      matching: find.byKey(WidgetKeys.cartItemBonusQty),
    );
    expect(tester.widget<Text>(qtyLabel).data, contains(qty.toString()));
  }

  void verifyBonusMaterialFreeLabel(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.cartItemBonusFreeLabel),
      ),
      findsWidgets,
    );
  }

  void verifyBonusMaterialTag(
    String materialNumber,
    String bonusMaterialNumber, {
    bool isVisible = true,
  }) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(BonusTag),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Finder _bonusItem(String materialNumber, String bonusMaterialNumber) =>
      find.byKey(WidgetKeys.cartItemBonus(materialNumber, bonusMaterialNumber));

  void verifyPriceNotAvailableForAtLeastOneItem() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.priceNotAvailableMessageWidget),
        matching: find.text(
          'Price is not available for at least one item. Grand total reflected may not be accurate.'
              .tr(),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialExpiryDateAndBatch(
    String materialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _material(materialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch'.tr()}: ${stockInfo.batch.displayNAIfEmpty}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'Expires'.tr()}: ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  void verifyBundleItemExpiryDateAndBatch(
    String bundleNumber,
    String materialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch'.tr()}: ${stockInfo.batch.displayNAIfEmpty}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'Expires'.tr()}: ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  void verifyBonusMaterialExpiryDateAndBatch(
    String materialNumber,
    String bonusMaterialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _bonusItem(materialNumber, bonusMaterialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch'.tr()}: ${stockInfo.batch.displayNAIfEmpty}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'Expires'.tr()}: ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  Future<void> tapToSeePriceBreakDown() async {
    expect(
      find.byKey(WidgetKeys.priceSummaryListTile),
      findsOneWidget,
    );
    await tester.tap(find.byKey(WidgetKeys.priceSummaryListTile));
    await tester.pumpAndSettle(Durations.medium1);
  }

  String get getSmallOrderFeeValue {
    final smallOrderFeeFinder = find.byKey(WidgetKeys.smallOrderFeePrice);
    return tester.widget<PriceComponent>(smallOrderFeeFinder.at(0)).price;
  }

  Future<void> tapToClosePriceBreakDown() async {
    await tester.tap(
      find.descendant(
        of: find.byKey(WidgetKeys.closeButton),
        matching: find.text('Close'.tr()),
      ),
    );
    await tester.pumpAndSettle(Durations.medium1);
  }

  //============================================================
  //  Promotion For ID
  //============================================================
  void verifyAplPromotionLabelForItem({
    required String materialNumber,
  }) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key ==
                WidgetKeys.promotionLabel(
                  materialNumber,
                ) &&
            widget is Text &&
            widget.data!.contains('offer applied'.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyMobileNumberFieldLessOrEqualTo16() {
    expect(
      tester.widget<TextFormField>(mobileNumberField).controller!.text.length <=
          16,
      true,
    );
  }

  void verifyTaxDescription() {
    expect(
      find.text('Applies to materials with full tax'.tr()),
      findsOneWidget,
    );
  }

  void verifyMaterialCutOffPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: _material(materialNumber),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.materialListPriceStrikeThrough),
          matching: find.text(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  double getMaterialUnitPrice(String materialNumber) {
    final priceWidgetFinder = find.descendant(
      of: _material(materialNumber),
      matching: find.byKey(WidgetKeys.checkoutItemProductUnitPrice),
    );
    final priceString = tester.widget<PriceComponent>(priceWidgetFinder).price;
    return priceString.extractDouble;
  }

  Future<bool> isErrorSnackBarAppears(String containedMessage) async {
    final finder = find.descendant(
      of: customSnackBar,
      matching: find.textContaining(containedMessage),
    );
    await tester.pumpUntilVisible(finder, maxIteration: 3);
    return finder.evaluate().isNotEmpty;
  }
}
