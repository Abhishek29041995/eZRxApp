import 'package:universal_io/io.dart';

import 'package:integration_test/integration_test_driver.dart';
// import 'package:flutter_driver/driver_extension.dart';

Future<void> main() {
  // enableFlutterDriverExtension();
  // Allow all eZRx app permission
  const packageName = 'com.zuelligpharma.ezrxplus.uat';
  if (Platform.isIOS) {
    Process.run('xcrun', [
      'simctl',
      'privacy',
      'booted',
      'grant',
      'all',
      packageName,
    ]);
  } else if (Platform.isAndroid) {
    Process.run('adb', [
      'shell',
      'pm',
      'grant',
      '-g',
      packageName,
    ]);
  }
  return integrationDriver();
}
