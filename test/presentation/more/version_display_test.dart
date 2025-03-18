import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/version_display.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class PackageInfoServiceMock extends Mock implements PackageInfoService {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => PackageInfoService());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: const VersionDisplay(),
    );
  }

  group('Test "Version Display"', () {
    testWidgets('Version Display text test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.versionDisplay), findsOneWidget);
      final versionDisplayFinder = find.textContaining(
        'eZRx+ Ver.',
      );
      expect(versionDisplayFinder, findsOneWidget);
    });
  });
}
