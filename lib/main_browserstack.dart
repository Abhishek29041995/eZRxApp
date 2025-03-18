import 'dart:async';

import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_driver/driver_extension.dart';

Future<void> main() async {
  enableFlutterDriverExtension();
  await initialSetup(flavor: Flavor.uat);
  await runAppWithCrashlyticsAndLocalization();
}
