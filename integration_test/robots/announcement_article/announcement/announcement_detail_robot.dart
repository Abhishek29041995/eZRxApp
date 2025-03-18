import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class AnnouncementDetailRobot {
  final WidgetTester tester;

  AnnouncementDetailRobot(this.tester);

  final backButton = find.byKey(WidgetKeys.announcementDetailsBackButton);

  void verifyPage({bool isVisible = true}) {
    expect(
      find.byKey(WidgetKeys.announcementDetailsPageKey),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifyAnnouncementDate() {
    expect(find.byKey(WidgetKeys.announcementDetailDateKey), findsOneWidget);
  }

  void verifyAnnouncementImage() {
    expect(find.byKey(WidgetKeys.announcementDetailImageKey), findsOneWidget);
  }

  void verifyOtherAnnouncementSection() {
    expect(
      find.byKey(WidgetKeys.announcementDetailOtherSection),
      findsOneWidget,
    );
  }

  void verifyBackButton() {
    expect(backButton, findsOneWidget);
  }

  Future<void> tapBackButton() async {
    await tester.tap(backButton);
    await tester.pumpAndSettle();
  }
}
