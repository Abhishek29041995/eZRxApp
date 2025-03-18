import 'package:universal_io/io.dart';

import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // still under experiment
  testWidgets('The custom scheme deeplink example',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle(const Duration(seconds: 3));
    if (Platform.isIOS) {
      await Process.run('xcrun', [
        'simctl',
        'openurl',
        'booted',
        'ezrx://mobile.app',
      ]);
    } else if (Platform.isAndroid) {
      await Process.run('adb', [
        'shell',
        'am',
        'start',
        '-a',
        'android.intent.action.VIEW',
        '-c',
        'android.intent.category.BROWSABLE',
        '-d',
        'ezrx://mobile.app',
      ]);
    }

    await tester.pumpAndSettle();
  });
}
