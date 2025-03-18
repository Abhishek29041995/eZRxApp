import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
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
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AppRouter>();
    },
  );
  Widget getProductTagWidget() {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        child: Center(
          child: Column(
            children: [
              ProductTag.bundleOffer(),
              ProductTag.preOrderTag(
                label: 'OOS-Preorder',
                labelColor: ZPColors.extraLightGrey4,
                backgroundColor: ZPColors.lightYellowColor,
              ),
              ProductTag.covidTag(),
              ProductTag.onOfferTag(),
              ProductTag.tenderTag(),
            ],
          ),
        ),
      ),
    );
  }

  group('Tag Product', () {
    testWidgets('Display tag bundle offer', (tester) async {
      await tester.pumpWidget(getProductTagWidget());
      await tester.pumpAndSettle();

      final titleTag = find.textContaining('Bundle offer');
      final backgroundColorTag =
          ((tester.widget(find.byType(Container).at(0)) as Container).decoration
                  as BoxDecoration)
              .color;

      expect(titleTag, findsOneWidget);
      expect(backgroundColorTag, ZPColors.skyBlueColor);
    });

    testWidgets('Display tag Pre-Order', (tester) async {
      await tester.pumpWidget(getProductTagWidget());
      await tester.pumpAndSettle();

      final titleTag = find.textContaining('OOS-Preorder');
      final backgroundColorTag =
          ((tester.widget(find.byType(Container).at(1)) as Container).decoration
                  as BoxDecoration)
              .color;

      expect(titleTag, findsOneWidget);
      expect(backgroundColorTag, ZPColors.lightYellowColor);
    });

    testWidgets('Display tag Covid', (tester) async {
      await tester.pumpWidget(getProductTagWidget());
      await tester.pumpAndSettle();

      final titleTag = find.text('Covid-19');
      final backgroundColorTag =
          ((tester.widget(find.byType(Container).at(2)) as Container).decoration
                  as BoxDecoration)
              .color;

      expect(titleTag, findsOneWidget);
      expect(backgroundColorTag, ZPColors.invoiceStatusBlue);
    });

    testWidgets('Display tag on offer', (tester) async {
      await tester.pumpWidget(getProductTagWidget());
      await tester.pumpAndSettle();

      final titleTag = find.text('On offer');
      final backgroundColorTag =
          ((tester.widget(find.byType(Container).at(3)) as Container).decoration
                  as BoxDecoration)
              .color;

      expect(titleTag, findsOneWidget);
      expect(backgroundColorTag, ZPColors.orange);
    });

    testWidgets('Display tender tag', (tester) async {
      await tester.pumpWidget(getProductTagWidget());
      await tester.pumpAndSettle();

      final titleTag = find.text('Tender Available'.tr());
      final backgroundColorTag =
          ((tester.widget(find.byType(Container).at(4)) as Container).decoration
                  as BoxDecoration)
              .color;

      expect(titleTag, findsOneWidget);
      expect(backgroundColorTag, ZPColors.skyBlueColor);
    });
  });
}
