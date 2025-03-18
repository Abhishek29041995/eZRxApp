import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class BundleDetailRobot extends CommonRobot {
  BundleDetailRobot(super.tester);

  final addToCartButton = find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final sheetAddToCart = find.byKey(WidgetKeys.bundleAddToCartSheet);
  final sheetAddToCartButton =
      find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
  final sheetInvalidQtyWarning =
      find.byKey(WidgetKeys.addBundleInvalidQtyWarning);

  void verifyPage() {
    final bundlesDetail = find.byKey(WidgetKeys.bundleDetailPage);
    expect(bundlesDetail, findsOneWidget);
  }

  Future<void> tapCancelBundleMaterialAddToCartButton() async {
    await tester.tap(find.byKey(WidgetKeys.cancelBundleMaterialAddToCart));
    await tester.pumpAndSettle();
  }

  Future<void> tapAddToCartButton() async {
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapSheetAddToCartButton() async {
    await tester.tap(sheetAddToCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> enterMaterialQty(String materialNumber, int qty) async {
    final textField = find.descendant(
      of: find.byKey(WidgetKeys.bundleMaterialDetails(materialNumber)),
      matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
    );
    await scrollEnsureFinderVisible(textField);
    await tester.tap(textField);
    await tester.enterText(textField, qty.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tester.pageBack();
    await tester.pumpAndSettle();
  }

  void verifyAllInformationBundleOfferDisplayed() {
    expect(find.byKey(WidgetKeys.productImage), findsWidgets);
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.productTag),
        matching: find.text('Bundle offer'.tr()),
      ),
      findsOneWidget,
    );
    expect(find.byKey(WidgetKeys.bundleOfferCode), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferName), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferPrice), findsOneWidget);
    expect(find.byKey(WidgetKeys.favoritesIcon), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferSummary), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleInformation), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferMaterialInfo), findsOneWidget);
    expect(addToCartButton, findsOneWidget);
  }

  void verifyFavoriteStatus(bool isFavorite) => expect(
        find.byKey(WidgetKeys.statusFavoriteIcon(isFavorite)),
        findsOneWidget,
      );

  Future<void> setFavoriteStatus(bool isFavorite) async {
    final favoriteIcon = find.byKey(WidgetKeys.favoritesIcon);
    final statusFavorite =
        find.byKey(WidgetKeys.statusFavoriteIcon(isFavorite));
    if (statusFavorite.evaluate().isEmpty) {
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();
    } else {
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();
    }

    await tester.pumpUntilVisible(statusFavorite);
  }

  void verifyAddBundleBottomSheet({bool isVisible = true}) =>
      expect(sheetAddToCart, isVisible ? findsOneWidget : findsNothing);

  @override
  Future<void> scrollEnsureFinderVisible(
    Finder finder, {
    int maxIteration = 50,
    reversed = false,
  }) async {
    await tester.dragUntilVisible(
      finder,
      find.descendant(
        of: find.byKey(WidgetKeys.bundleDetailPage),
        matching: find.byKey(WidgetKeys.scrollList),
      ),
      Offset(0.0, reversed ? 200 : -200),
    );
    await tester.pump();
  }

  Future<void> verifyBundleMaterialExpiryDateAndBatchNo({
    List<StockInfo> stockInfoList = const <StockInfo>[],
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) async {
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsNothing);
      return;
    }
    for (final stockInfo in stockInfoList) {
      final materialNumber = stockInfo.materialNumber.displayMatNo;
      final expiryDate = stockInfo.expiryDate.dateOrNaString;
      final batchNumber = stockInfo.batch.displayNAIfEmpty;
      final itemTile = find.byKey(
        WidgetKeys.bundleMaterialDetails(materialNumber),
      );
      final texts = <String>[];
      if (isBatchNumberVisible) texts.add('${'Batch'.tr()}: $batchNumber');
      if (isExpiryDateVisible) texts.add('${'Expires'.tr()}: $expiryDate');
      final stockText = texts.join(' - ');
      await scrollEnsureFinderVisible(itemTile);
      expect(
        find.descendant(
          of: itemTile,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.materialDetailsStock &&
                widget is RichText &&
                widget.text.toPlainText().contains(stockText),
          ),
        ),
        findsOneWidget,
      );
    }
  }

  void verifyAddBundleMinimumQty(int value) => _findWidgetContainText(
        find.byKey(WidgetKeys.addBundleMinimumQty),
        value.toString(),
      );

  void verifyAddBundleTotalQty(int value) => _findWidgetContainText(
        find.byKey(WidgetKeys.addBundleTotalQty),
        value.toString(),
      );

  void verifyAddBundleRate(String value) => _findWidgetContainText(
        find.byKey(WidgetKeys.addBundleRate),
        value,
      );

  void verifyAddBundleInvalidQtyWarning(int value, {bool isVisible = true}) =>
      isVisible
          ? _findWidgetContainText(sheetInvalidQtyWarning, value.toString())
          : expect(sheetInvalidQtyWarning, findsNothing);

  void _findWidgetContainText(Finder finder, String text) => expect(
        find.descendant(
          of: finder,
          matching: find.textContaining(text, findRichText: true),
        ),
        findsOneWidget,
      );
}
