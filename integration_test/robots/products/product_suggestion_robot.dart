import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/clear_product_search_suggestion_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class ProductSuggestionRobot extends CommonRobot {
  ProductSuggestionRobot(super.tester);

  final suggestedProductsTile = find.byKey(WidgetKeys.suggestedProductsTile);
  final searchHistory = find.byKey(WidgetKeys.searchProductHistory);
  final confirmBottomSheet = find.byType(ClearProductSearchSuggestionHistory);
  final noSearchHistory = find.byKey(WidgetKeys.noProductHistory);

  void verifyPage() =>
      expect(find.byKey(WidgetKeys.productSearchPage), findsOneWidget);

  Future<void> tapSearchResult(String materialNumber) async {
    await tester.tap(find.byKey(WidgetKeys.searchedProduct(materialNumber)));
    await tester.pumpAndSettle();
  }

  void verifySearchResults(String textSearch) {
    final productList = find.textContaining(textSearch);
    expect(productList, findsWidgets);
  }

  void verifyNoSuggestedProduct() {
    expect(suggestedProductsTile, findsNothing);
  }

  void verifyNoRecordFound({bool isVisible = true}) {
    expect(
      find.text("That didn't match anything".tr()),
      isVisible ? findsOneWidget : findsNothing,
    );
    expect(
      find.text(
        noRecordFoundDefaultSubTitle,
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifySuggestProductsSearch(String keyword) {
    final listSuggestTile =
        tester.widgetList<Text>(suggestedProductsTile).map((e) => e.data);

    for (final e in listSuggestTile) {
      expect(e, contains(keyword));
    }
  }

  void verifySearchHistory({bool isVisible = true}) =>
      expect(searchHistory, isVisible ? findsAtLeastNWidgets(1) : findsNothing);

  void verifyNoSearchHistory() => expect(noSearchHistory, findsOneWidget);

  void verifySearchHistoryItem(String text) => expect(
        find.descendant(of: searchHistory, matching: find.text(text)),
        findsAtLeastNWidgets(1),
      );

  Future<void> tapSearchHistoryItem(String text) async {
    await tester.tap(
      find.descendant(of: searchHistory, matching: find.text(text)).first,
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapDeleteSearchHistory() async {
    await tester.tap(find.byKey(WidgetKeys.deleteProductHistory));
    await tester.pumpAndSettle();
  }

  void verifyClearHistoryBottomSheet({bool isVisible = true}) {
    expect(
      confirmBottomSheet,
      isVisible ? findsOneWidget : findsNothing,
    );
    if (isVisible) {
      expect(
        find.descendant(
          of: confirmBottomSheet,
          matching: find.byKey(WidgetKeys.cancelButton),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: confirmBottomSheet,
          matching: find.byKey(WidgetKeys.confirmButton),
        ),
        findsOneWidget,
      );
    }
  }

  Future<void> tapConfirmClearHistory() async {
    await tester.tap(
      find.descendant(
        of: confirmBottomSheet,
        matching: find.byKey(WidgetKeys.confirmButton),
      ),
    );
    await tester.pumpUntilVisible(noSearchHistory);
  }

  void verifyMarketPlaceLogo(String materialNumber) => expect(
        find.descendant(
          of: find.byKey(WidgetKeys.searchedProduct(materialNumber)),
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOneWidget,
      );
}
