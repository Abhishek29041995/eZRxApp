import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../utils/widget_utils.dart';

final locator = GetIt.instance;
void main() {
  late AppRouter autoRouterMock;
  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [],
      child: const Scaffold(
        body: OutsideReturnPolicyTag(),
      ),
    );
  }

  group(
    'Outside Return Policy Tag Test',
    () {
      testWidgets(
        ' => check display',
        (WidgetTester tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byIcon(Icons.info), findsOneWidget);
          expect(find.text('Outside return policy'.tr()), findsOneWidget);
        },
      );
    },
  );
}
