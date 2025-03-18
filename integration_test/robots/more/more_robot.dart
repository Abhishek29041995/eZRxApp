import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class MoreRobot extends CommonRobot {
  MoreRobot(super.tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  final profileTile = find.byKey(WidgetKeys.profileTile);
  final contactUsTile = find.byKey(WidgetKeys.contactUsTile);
  final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
  final marketplacePaymentTile = find.byKey(WidgetKeys.mpPaymentsTile);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final paymentTile = find.byKey(WidgetKeys.paymentsTile);
  final loginOnBehalf = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
  final securityTile = find.byKey(WidgetKeys.securityTile);
  final logout = find.byKey(WidgetKeys.logOutTile);
  final announcementArticleTile =
      find.byKey(WidgetKeys.announcementArticleTile);
  final nationalPrivacyCommissionTile =
      find.byKey(WidgetKeys.nationalPrivacyCommissionTile);

  void findReturnsTile({bool isVisible = true}) {
    expect(returnsTile, isVisible ? findsOneWidget : findsNothing);
  }

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
    await closeAnnouncementAlertDialog();
  }

  Future<void> scrollToProfileName() => tester.dragUntilVisible(
        find.byKey(WidgetKeys.profileTileSection),
        scrollList,
        const Offset(0.0, 200),
      );

  bool isCorrectUser(String firstName, String lastName) {
    return find
        .textContaining(
          '${'Hello'.tr()}, ${FullName(firstName: firstName, lastName: lastName).toTitleCase}',
        )
        .evaluate()
        .isNotEmpty;
  }

  void verifyProfileName(String firstName, String lastName) {
    expect(
      isCorrectUser(firstName, lastName),
      true,
    );
  }

  Future<void> tapContactUsTile() async {
    await tester.dragUntilVisible(
      contactUsTile,
      scrollList,
      const Offset(0.0, -200),
    );
    await tester.pump();
    await tester.tap(contactUsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapProfileTile() async {
    final profileTile = find.byKey(WidgetKeys.profileTile);
    expect(profileTile, findsOneWidget);
    await tester.tap(profileTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapPaymentTile() async {
    await tester.tap(paymentsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapSecurityTile() async {
    await tester.tap(securityTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapPrivacyConsentTitle() async {
    final privacyConsentTile = find.byKey(WidgetKeys.privacyConsentTile);
    expect(privacyConsentTile, findsOneWidget);
    await tester.tap(privacyConsentTile);
    await tester.pumpAndSettle();
  }

  void verifyMoreScreenVisible() {
    expect(find.byKey(WidgetKeys.moreScreen), findsOneWidget);
  }

  Future<void> verifyLoginOnBehalfTile() =>
      scrollEnsureFinderVisible(loginOnBehalf);

  Future<void> tapLoginOnBehalfTile() async {
    await tester.tap(loginOnBehalf);
    await tester.pumpAndSettle();
  }

  Future<void> verifyAnnouncementArticleTile() =>
      scrollEnsureFinderVisible(announcementArticleTile);

  Future<void> verifyNationalPrivacyCommissionTile() =>
      scrollEnsureFinderVisible(nationalPrivacyCommissionTile);

  Future<void> tapNationalPrivacyCommissionTile() async {
    await tester.tap(nationalPrivacyCommissionTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapAnnouncementArticleTile() async {
    await tester.tap(announcementArticleTile);
    await tester.pumpAndSettle();
  }

  Future<void> findLogout() => scrollEnsureFinderVisible(logout);

  Future<void> tapLogout() async {
    await tester.tap(logout);
    await tester.pumpAndSettle();
  }

  void verifyMarketPlacePaymentTile({bool isVisible = true}) => expect(
        marketplacePaymentTile,
        isVisible ? findsOne : findsNothing,
      );

  Future<void> tapMarketPlacePaymentTile() async {
    await tester.tap(marketplacePaymentTile);
    await tester.pumpAndSettle();
  }
}
