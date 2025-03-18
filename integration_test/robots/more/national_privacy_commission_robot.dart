import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class NationalPrivacyCommissionRobot extends CommonRobot {
  NationalPrivacyCommissionRobot(super.tester);

  final closeButton = find.byKey(WidgetKeys.closeButton);
  final saveImagesButton = find.byKey(WidgetKeys.saveSealImages);
  final seal25Jul2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal25Jul2024));
  final seal27Jul2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal27Jul2024));
  final seal24Aug2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal24Aug2024));
  final seal6Dec2024 = find.byKey(WidgetKeys.sealImage(PngImage.seal6Dec2024));
  final nationalPrivacyCommissionPage =
      find.byKey(WidgetKeys.nationalPrivacyCommissionPage);

  void verify() {
    expect(nationalPrivacyCommissionPage, findsOneWidget);
  }

  void verifyCloseButton() {
    expect(closeButton, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(closeButton);
    await tester.pumpAndSettle();
  }

  void verifyDescriptionText() {
    expect(
      find.text('Save the images and scan for more details'.tr()),
      findsOneWidget,
    );
  }

  void verifySaveImagesButton() {
    expect(saveImagesButton, findsOneWidget);
  }

  Future<void> verifyImages() async {
    expect(seal25Jul2024, findsOneWidget);
    await scrollEnsureFinderVisible(seal27Jul2024);
    expect(seal27Jul2024, findsOneWidget);
    await scrollEnsureFinderVisible(seal24Aug2024);
    expect(seal24Aug2024, findsOneWidget);
    await scrollEnsureFinderVisible(seal6Dec2024);
    expect(seal6Dec2024, findsOneWidget);
  }
}
