import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class AnnouncementArticleRootRobot {
  final WidgetTester tester;

  AnnouncementArticleRootRobot(this.tester);

  final announcementTab = find.byKey(WidgetKeys.announcementTabBar);
  final articleTab = find.byKey(WidgetKeys.articleTabBar);
  final announcementPage = find.byKey(WidgetKeys.announcementsTab);
  final articlesPage = find.byKey(WidgetKeys.articlesTab);

  void verifyAnnouncementPage({bool isVisible = true}) {
    expect(announcementPage, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyArticlesPage({bool isVisible = true}) {
    expect(articlesPage, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyTabBar() {
    expect(announcementTab, findsOneWidget);
    expect(articleTab, findsOneWidget);
  }

  Future<void> switchToAnnouncementTab() async {
    await tester.tap(announcementTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToArticleTab() async {
    await tester.tap(articleTab);
    await tester.pumpAndSettle();
  }
}
