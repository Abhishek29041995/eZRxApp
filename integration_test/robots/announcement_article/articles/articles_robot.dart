import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ArticleRobot {
  final WidgetTester tester;

  ArticleRobot(this.tester);

  final firstArticleItemKey =
      find.byKey(WidgetKeys.genericKey(key: 'articleItem0'));
  final notFoundDataKey = find.byKey(WidgetKeys.noArticleToShowKey);
  final articleTitle = find.byKey(WidgetKeys.articleTitleKey);

  void verifySearchBar() {
    expect(find.byType(CustomSearchBar), findsOneWidget);
  }

  bool get noArticleFound => firstArticleItemKey.evaluate().isEmpty;

  void verifyNotFoundData() {
    expect(firstArticleItemKey, findsNothing);
    expect(notFoundDataKey, findsOneWidget);
  }

  void verifyArticleItemsVisible() {
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleImageKey),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: articleTitle,
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleTimeKey),
      ),
      findsOneWidget,
    );
  }

  void verifyArticleItemWithSearchKey({required String searchKey}) {
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.textContaining(searchKey),
      ),
      findsOneWidget,
    );
  }

  String getFirstTitle() =>
      tester.widgetList<Text>(articleTitle).map((e) => e.data).first ?? '';

  Future<void> tapArticleItem() async {
    expect(
      firstArticleItemKey,
      findsOneWidget,
    );
    await tester.tap(firstArticleItemKey);
    await tester.pumpAndSettle();
  }

  void verifyFilterIcon() {
    //TODO: Revisit to write test cases for filter articles
  }
}
