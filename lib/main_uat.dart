import 'dart:async';

import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';

Future<void> main() async {
  await initialSetup(flavor: Flavor.uat);
  await runAppWithCrashlyticsAndLocalization();
}
