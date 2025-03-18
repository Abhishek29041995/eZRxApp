import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class ProductDetailRobot extends CommonRobot {
  ProductDetailRobot(super.tester);

  final materialDetailsMaterialDescription =
      find.byKey(WidgetKeys.materialDetailsMaterialDescription);
  final addToCartButton = find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final materialDetailsInfoTile =
      find.byKey(WidgetKeys.materialDetailsInfoTile);
  final favoritesIcon = find.byKey(WidgetKeys.favoritesIcon);
  final relatedMaterialCard = find.byKey(WidgetKeys.materialCard);
  final addToCartSuccessMessage =
      find.byKey(WidgetKeys.materialDetailsAddToCartSnackBar);
  final body = find.byKey(WidgetKeys.bodyContentProductDetail);
  final imageSection = find.byKey(WidgetKeys.imageSectionProductDetail);
  final offerBottomSheetCloseButton = find.byKey(WidgetKeys.closeButton);
  final closeMaterialInformationDialog =
      find.byKey(WidgetKeys.closeMaterialInformationDialog);
  final materialDetailsStock = find.byKey(WidgetKeys.materialDetailsStock);
  final govtMaterialListPrice = find.byKey(WidgetKeys.govtMaterialListPrice);
  final expandIcon = find.byKey(WidgetKeys.expandIcon);
  final expiryDateIcon = find.byKey(WidgetKeys.expiryDateInfoIcon);
  final similarProduct =
      find.byKey(WidgetKeys.materialDetailsSimilarProductsSection);
  final tenderContractSection =
      find.byKey(WidgetKeys.materialUseTenderContract);
  final tenderContractToggle =
      find.byKey(WidgetKeys.materialUseTenderContractToggle);

  final materialTenderContracts =
      find.byKey(WidgetKeys.materialTenderContracts);

  void verifyPage() {
    expect(find.byType(ProductDetailsPage), findsOneWidget);
  }

  String getMaterialDetailsMaterialDescription() {
    return tester
            .widget<Text>(
              materialDetailsMaterialDescription,
            )
            .data ??
        '';
  }

  void verifyFavorite(bool value) => expect(
        find.descendant(
          of: body,
          matching: find.byKey(WidgetKeys.statusFavoriteIcon(value)),
        ),
        findsOneWidget,
      );

  void verifyOnOfferLabel() => expect(
        find.descendant(
          of: body,
          matching: find.byKey(WidgetKeys.offerTag),
        ),
        findsOneWidget,
      );

  void verifyTenderAvailableLabel() => expect(
        find.descendant(
          of: imageSection,
          matching: find.byKey(WidgetKeys.tenderTag),
        ),
        findsOneWidget,
      );

  Future<void> setProductToFavoriteList(bool isFavorite) async {
    final statusFavorite = find.descendant(
      of: body,
      matching: find.byKey(WidgetKeys.statusFavoriteIcon(isFavorite)),
    );
    if (statusFavorite.evaluate().isEmpty) {
      await _tapToFavoriteIcon();
    } else {
      await _tapToFavoriteIcon();
      await _tapToFavoriteIcon();
    }
  }

  Future<void> _tapToFavoriteIcon() async {
    await tester.tap(favoritesIcon.first);
    await tester.pumpUntilVisible(customSnackBar);
    await dismissSnackbar();
    await tester.pumpAndSettle();
  }

  Future<void> openMaterialInformation() async {
    await scrollEnsureFinderVisible(materialDetailsInfoTile);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(materialDetailsInfoTile);
    await tester.pumpAndSettle();
  }

  bool get isSeeMoreOptionNotVisible => expandIcon.evaluate().isEmpty;

  void verifySeeMoreOption({bool isVisible = true}) {
    expect(expandIcon, isVisible ? findsOneWidget : findsNothing);
  }

  Future<void> tapToSeeMore() async {
    await tester.pumpUntilVisible(expandIcon);
    await tester.tap(expandIcon);
  }

  void verifyCountryOfOriginDisplayed(String country) {
    expect(find.text(country), findsOneWidget);
  }

  void verifyProductDetailsInfoTileDisplayed(String country) {
    expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
  }

  void verifyProductImageDisplayed() {
    expect(find.byKey(WidgetKeys.productImage).first, findsOneWidget);
  }

  void verifyProductFavoriteIconDisplayed() {
    expect(find.byKey(WidgetKeys.favoritesIcon).first, findsOneWidget);
  }

  void verifyMarketPlaceLogo() =>
      expect(find.byType(MarketPlaceRectangleLogo), findsOneWidget);

  void verifyProductNameDisplayed() {
    expect(
      materialDetailsMaterialDescription.first,
      findsOneWidget,
    );
  }

  void verifyExpiryDate(String expiryDate) {
    expect(materialDetailsStock, findsOneWidget);
    final richTextChildren =
        (tester.widget<RichText>(materialDetailsStock).text as TextSpan)
            .children;
    final result = richTextChildren!.any(
      (element) =>
          element.toPlainText().contains('${'Expires'.tr()}: $expiryDate'),
    );
    expect(result, true);
  }

  void verifyBatch(String batch) {
    expect(materialDetailsStock, findsOneWidget);
    final richTextChildren =
        (tester.widget<RichText>(materialDetailsStock).text as TextSpan)
            .children;
    final result = richTextChildren!.any(
      (element) => element.toPlainText().contains('${'Batch'.tr()}: $batch'),
    );
    expect(result, true);
  }

  Future<void> tapExpiryDateInfoIcon() async {
    expect(expiryDateIcon, findsOneWidget);
    await tester.tap(expiryDateIcon);
    await tester.pumpAndSettle();
  }

  Future<void> verifyExpiryDateBottomSheetAndTapClose() async {
    final expiryDateBottomSheet =
        find.byKey(WidgetKeys.expiryDateInstructionSheet);
    final expiryDateBottomSheetCloseButton = find.descendant(
      of: expiryDateBottomSheet,
      matching: find.byKey(WidgetKeys.closeButton),
    );
    expect(expiryDateBottomSheet, findsOneWidget);
    expect(
      find.descendant(
        of: expiryDateBottomSheet,
        matching: find.text('Expiry date'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: expiryDateBottomSheet,
        matching: find.text(
          '${'Expiry date displayed is for reference, actual product may vary'.tr()}.',
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: expiryDateBottomSheetCloseButton,
        matching: find.text('Got it'.tr()),
      ),
      findsOneWidget,
    );
    await tester.tap(
      find.descendant(
        of: expiryDateBottomSheet,
        matching: expiryDateBottomSheetCloseButton,
      ),
    );
    await tester.pumpAndSettle();
    expect(expiryDateBottomSheet, findsNothing);
  }

  void verifyProductPriceDisplayed() {
    expect(find.byKey(WidgetKeys.priceComponent).first, findsOneWidget);
  }

  void verifyListPriceStrikeThroughComponent(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.bodyContentProductDetail),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.listPriceStrikeThroughComponent),
          matching: find.textContaining(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyCurrentProductPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.bodyContentProductDetail),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.currentPrice),
          matching: find.text(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyGovtMaterialListPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.bodyContentProductDetail),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.govtMaterialListPrice),
          matching:
              find.text('${'List price'.tr()}: $price', findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyGovtMaterialListPriceDisplayed() {
    expect(govtMaterialListPrice.first, findsOneWidget);
  }

  void verifyMaterialDetailsInfoTileDisplayed() {
    expect(materialDetailsInfoTile, findsOneWidget);
  }

  void verifyProductDetailsQuantityInputPriceDisplayed() {
    expect(find.byKey(WidgetKeys.materialDetailsQuantityInput), findsOneWidget);
  }

  void verifyCartButtonDisplayed() {
    expect(find.byKey(WidgetKeys.cartButton), findsOneWidget);
  }

  void verifyAddToCartCartButtonDisplayed() {
    expect(
      find.byKey(WidgetKeys.materialDetailsAddToCartButton),
      findsOneWidget,
    );
  }

  void verifyAddToCarButtonDisabled() {
    expect(
      (tester.widget<ElevatedButton>(find.byType(ElevatedButton))).enabled,
      false,
    );
  }

  void verifyMaterialDosageDisplayed() {
    expect(find.byKey(WidgetKeys.materialDosage).first, findsOneWidget);
  }

  void verifyMaterialHowToUseDisplayed() {
    expect(find.byKey(WidgetKeys.materialHowToUse).first, findsOneWidget);
  }

  void verifyMaterialCompositionDisplayed() {
    expect(find.byKey(WidgetKeys.materialComposition).first, findsOneWidget);
  }

  void verifyMaterialDeliveryInstructionsDisplayed() {
    expect(
      find.byKey(WidgetKeys.materialDeliveryInstructions).first,
      findsOneWidget,
    );
  }

  void verifyMateriaNumberDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Material number'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyManufacturerDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Manufacturer'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifySellerDisplayed(String value) => expect(
        find.byKey(WidgetKeys.balanceTextRow('Sold by seller'.tr(), value)),
        findsOneWidget,
      );

  void verifyUnitOfMeasurementLabelDisplayed(String value) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Unit of measurement'.tr(), value),
      ),
      findsOneWidget,
    );
  }

  void verifyBatchDisplayed({String value = '', bool isVisible = true}) {
    if (!isVisible) {
      expect(find.text('Batch'.tr()), findsNothing);
      return;
    }
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Batch'.tr(), value),
      ),
      findsOneWidget,
    );
  }

  void verifyExpiryDateLabelDisplayed({
    String value = '',
    bool isVisible = true,
  }) {
    if (!isVisible) {
      expect(find.text('Expiry date'.tr()), findsNothing);
      return;
    }
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Expiry date'.tr(), value),
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'Expiry date displayed is for reference, actual product may vary'.tr(),
      ),
      findsOneWidget,
    );
  }

  void verifyCountryOfOriginLabelDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Country of origin'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyGovermentMaterialCode(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Govt material number'.tr(), value)),
      findsOneWidget,
    );
  }

  Future<void> changeQty(int value) async {
    final input = find.byKey(WidgetKeys.materialDetailsQuantityInput);
    await tester.tap(input);
    await tester.enterText(input, value.toString());
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> increaseMaterialQty() async {
    await tester.tap(
      find.descendant(
        of: find.byKey(WidgetKeys.materialDetailsQuantityInput),
        matching: find.byKey(WidgetKeys.productDetailQuantityAddKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> decreaseMaterialQty() async {
    await tester.tap(
      find.descendant(
        of: find.byKey(WidgetKeys.materialDetailsQuantityInput),
        matching: find.byKey(WidgetKeys.productDetailQuantityDeleteKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapAddToCart() async {
    await tester.pumpUntilVisible(
      find.descendant(
        of: addToCartButton,
        matching: find.text('Add to cart'),
      ),
      maxIteration: 2,
    );
    await tester.tap(addToCartButton);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.customSnackBar));
  }

  bool get isOosPreOrderMaterial => find
      .descendant(
        of: find.byType(StatusLabel),
        matching: find.text('OOS-Preorder'.tr()),
      )
      .evaluate()
      .isNotEmpty;

  bool get isOutOfStockMaterial => find
      .descendant(
        of: find.byType(StatusLabel),
        matching: find.text('Out of stock'.tr()),
      )
      .evaluate()
      .isNotEmpty;

  void verifyAddToCartButtonDisable() {
    final addToCartElevatedButton = tester.widget<ElevatedButton>(
      find.descendant(
        of: addToCartButton,
        matching: find.byType(ElevatedButton),
      ),
    );
    expect(addToCartElevatedButton.onPressed, null);
  }

  void verifyAddToCartSuccessMessage({bool isVisible = true}) => expect(
        addToCartSuccessMessage,
        isVisible ? findsOneWidget : findsNothing,
      );

  void verifyAddToCartFailureMessage() {
    verifyAddToCartSuccessMessage(isVisible: false);
    expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
  }

  Future<void> tapBackButton() async {
    await tester.tap(find.byKey(WidgetKeys.materialDetailsPageBack));
    await tester.pumpAndSettle();
  }

  Future<bool> verifyMultipleImages() async {
    await tester.pumpUntilVisible(_productImage(0, false));
    final image = find.byKey(WidgetKeys.materialDetailsCarouselImage);

    return image.evaluate().length >= 2;
  }

  void verifyImageMaterialSelected(int index, bool selected) =>
      _productImage(index, selected);

  Future<void> tapToImageMaterial(int index, bool selected) async {
    await tester.tap(_productImage(index, selected));
    await tester.pumpAndSettle();
  }

  Future<void> openAvailableOffers({bool scrollRequired = true}) async {
    final availableOffer = find.byKey(WidgetKeys.availableOffersTile);
    if (scrollRequired) await scrollEnsureFinderVisible(availableOffer);
    await tester.tap(availableOffer);
    await tester.pumpAndSettle();
  }

  void verifyNameProductOffer(String nameProduct) {
    final productOfferWidget = tester.widgetList<Text>(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblNameProductOffers),
      ),
    );
    for (final widget in productOfferWidget) {
      expect(widget.data, contains(nameProduct));
    }
  }

  void verifyCodeProductOffer(String codeProduct) {
    final productOfferWidget = tester.widgetList<Text>(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblCodeProductOffers),
      ),
    );
    for (final widget in productOfferWidget) {
      expect(widget.data, contains(codeProduct));
    }
  }

  void verifyQuantityProductDisplayed() {
    expect(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblQuantityProductOffers),
      ),
      findsWidgets,
    );
  }

  void verifyOfferBottomSheetCloseButton() {
    expect(offerBottomSheetCloseButton, findsOneWidget);
  }

  Future<void> tapOfferBottomSheetCloseButton() async {
    await tester.tap(offerBottomSheetCloseButton);
    await tester.pumpAndSettle();
  }

  void verifyCloseButtonMaterialInformationDialog() {
    expect(closeMaterialInformationDialog, findsOneWidget);
  }

  Future<void> tapCloseButtonMaterialInformationDialog() async {
    await tester.tap(closeMaterialInformationDialog);
    await tester.pumpAndSettle();
  }

  void verifyProductPriceOfferTitle({required bool isVisible}) {
    expect(
      find.byKey(WidgetKeys.productPriceOfferTitle),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifyQuantityProductDisplayedForTirePriceOffer() {
    expect(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblQuantityProductTireOffers),
      ),
      findsWidgets,
    );
  }

  void verifyButtonCloseDisplayed() {
    expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);
  }

  bool checkHasRelateProduct() {
    return similarProduct.evaluate().isNotEmpty;
  }

  Future<void> verifyRelateProductDisplayed() async {
    await scrollEnsureFinderVisible(similarProduct);
    expect(relatedMaterialCard, findsWidgets);
  }

  void verifyRelatedProductMPLogo() => expect(
        find.descendant(
          of: relatedMaterialCard,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsNWidgets(relatedMaterialCard.evaluate().length),
      );

  Future<void> dragMaterialDetailsInfoTileDisplayed() async {
    await tester.dragUntilVisible(
      similarProduct,
      materialDetailsInfoTile,
      const Offset(0, -100),
    );
    await tester.pumpAndSettle();
  }

  bool get relatedProductExist => relatedMaterialCard.evaluate().isNotEmpty;

  Future<void> tapFirstRelateProduct() async {
    await tester.tap(relatedMaterialCard.first);
    await tester.pumpAndSettle();
  }

  void verifySuspendedBanner() =>
      expect(find.byKey(WidgetKeys.productDetailSuspended), findsOneWidget);

  Finder _productImage(int index, bool isSelected) =>
      find.byKey(WidgetKeys.genericKey(key: 'selected$index$isSelected'));

  void verifyComboOfferLabel() => expect(
        find.descendant(
          of: body,
          matching: find.byKey(WidgetKeys.comboOfferTag),
        ),
        findsOneWidget,
      );

  Future<void> verifyAndTapGetComboDeal() async {
    await scrollEnsureFinderVisible(find.byKey(WidgetKeys.getComboDealButton));
    expect(find.byKey(WidgetKeys.comboOfferSection), findsOneWidget);
    await tester.tap(find.byKey(WidgetKeys.getComboDealButton));
    await tester.pumpAndSettle(Durations.long2);
  }

  double get getMaterialUnitPrice {
    final priceWidgetFinder = find.descendant(
      of: body,
      matching: find.byKey(WidgetKeys.currentPrice),
    );
    final priceString = tester.widget<PriceComponent>(priceWidgetFinder).price;
    return priceString.extractDouble;
  }
}
