import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class ArticleDetailsRobot {
  final WidgetTester tester;

  ArticleDetailsRobot(this.tester);

  final articleDetailsBackButtonKey =
      find.byKey(WidgetKeys.articleDetailsBackButtonKey);
  final articleDetailsBodyKey = find.byKey(WidgetKeys.articleDetailsBodyKey);
  final articleDetailsPageKey = find.byKey(WidgetKeys.articleDetailsPageKey);
  final articleDetailsImageKey = find.byKey(WidgetKeys.articleDetailsImageKey);
  final articleDetailsTitleKey = find.byKey(WidgetKeys.articleDetailsTitleKey);
  final articleDetailsTimeKey = find.byKey(WidgetKeys.articleDetailsTimeKey);

  void verifyArticleDetailsPage() {
    expect(articleDetailsPageKey, findsAtLeastNWidgets(1));
    expect(articleDetailsBodyKey, findsAtLeastNWidgets(1));
    expect(articleDetailsImageKey, findsAtLeastNWidgets(1));
    expect(articleDetailsTimeKey, findsAtLeastNWidgets(1));
    expect(articleDetailsTitleKey, findsAtLeastNWidgets(1));
  }

  Future<void> tapArticleDetailsBackButton() async {
    expect(
      articleDetailsBackButtonKey,
      findsOneWidget,
    );
    await tester.tap(articleDetailsBackButtonKey);
    await tester.pumpAndSettle();
  }
}
