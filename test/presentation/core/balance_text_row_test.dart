import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late String keyText;
  late String valueText;
  late TextStyle textStyle;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AppRouter>();
      keyText = 'fake-text'.tr();
      valueText = 'fake-value'.tr();
      textStyle = const TextStyle(color: ZPColors.white);
    },
  );
  group(
    'Balance Text Row Widget',
    () {
      Widget getWidget({bool isStatus = false, bool valueTextLoading = false}) {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          child: BalanceTextRow(
            isStatus: isStatus,
            valueTextLoading: valueTextLoading,
            keyText: keyText,
            valueText: valueText,
            keyTextStyle: textStyle,
            valueTextStyle: textStyle,
          ),
        );
      }

      testWidgets(
        'Found key text and value text in Balance Text Row',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final keyAndValueTextWidget = find.byKey(
            WidgetKeys.balanceTextRow(keyText, valueText),
          );
          expect(keyAndValueTextWidget, findsOneWidget);
        },
      );
      testWidgets(
        'Found StatusLabel in Balance Text Row',
        (tester) async {
          await tester.pumpWidget(getWidget(isStatus: true));
          await tester.pump();
          final statusWidget = find.byType(StatusLabel);
          expect(statusWidget, findsOneWidget);
        },
      );
      testWidgets(
        'Found value Text Loading in Balance Text Row',
        (tester) async {
          await tester.pumpWidget(getWidget(valueTextLoading: true));

          await tester.pump();
          final valueTextLoading = find.byType(LoadingShimmer);
          expect(valueTextLoading, findsOneWidget);
        },
      );

      testWidgets(
        'Found widgets while isStatus is true in Balance Text Row',
        (tester) async {
          await tester.pumpWidget(getWidget(isStatus: true));

          await tester.pump();
          final keyTextWidget = find.byKey(
            WidgetKeys.balanceTextRow(keyText, valueText),
          );
          final semicolon = find.text(
            ': ',
          );
          final statusWidget = find.byType(StatusLabel);
          expect(keyTextWidget, findsOneWidget);
          expect(semicolon, findsNothing);
          expect(statusWidget, findsOneWidget);
        },
      );
    },
  );
}
