import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ClaimSubmittedRobot extends CommonRobot {
  final _claimSubmittedPage = find.byKey(WidgetKeys.claimSubmittedPage);
  final _closeButton = find.byKey(WidgetKeys.closeButton);
  final _viewClaimListButton = find.byKey(
    WidgetKeys.claimSubmittedViewClaimListButton,
  );
  final _createNewClaimButton =
      find.byKey(WidgetKeys.claimSubmittedCreateNewClaimButton);

  ClaimSubmittedRobot(super.tester);

  void verifyPage() {
    expect(_claimSubmittedPage, findsOneWidget);
  }

  void verifyThankYouText(String username) {
    expect(
      find.text(
        '${'Thank you'.tr()} $username! \n${'Your Claim has been submitted'.tr()}.',
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'eZCS ticket will be automatically created in a few seconds.'.tr(),
      ),
      findsOneWidget,
    );
  }

  void verifyCloseButton() {
    expect(_closeButton, findsOneWidget);
  }

  void verifyViewClaimListButton() {
    expect(_viewClaimListButton, findsOneWidget);
  }

  void verifyCreateNewClaimButton() {
    expect(_createNewClaimButton, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(_closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapViewClaimListButton() async {
    await tester.tap(_viewClaimListButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapCreateClaimButton() async {
    await tester.tap(_createNewClaimButton);
    await tester.pumpAndSettle();
  }
}
