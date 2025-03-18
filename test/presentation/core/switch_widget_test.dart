import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/switch_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
      autoRouterMock = locator<AppRouter>();
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: Material(
        child: SwitchWidget(
          onChanged: (value) => null,
        ),
      ),
    );
  }

  group('Switch widget test', () {
    testWidgets('Display switch', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final swicheFinder = find.byType(Switch);
      expect(swicheFinder, findsOneWidget);
      final swicheWidget = tester.widget<Switch>(swicheFinder);
      expect(swicheWidget.activeTrackColor, ZPColors.textButtonColor);
      expect(swicheWidget.inactiveTrackColor, ZPColors.lightGrey);
    });
  });
}
