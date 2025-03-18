import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final salesOrgConfig =
      SalesOrganisationConfigs.empty().copyWith(currency: Currency('myr'));
  late String price;
  late String label;
  late bool obscured;
  late PriceStyle type;

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      label = '';
      price = '0';
      obscured = false;
      type = PriceStyle.commonPrice;
    },
  );

  group('Price Component', () {
    Widget getWidget() {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: price,
              title: label,
              obscured: obscured,
              type: type,
            ),
          ),
        ),
      );
    }

    testWidgets('PriceComponent displays positive price',
        (WidgetTester tester) async {
      price = '50.99';
      await tester.pumpWidget(getWidget());

      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} 50.99',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent displays negative price',
        (WidgetTester tester) async {
      price = '-25.50';
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      await tester.pumpWidget(getWidget());
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} -25.50',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent displays obscured price',
        (WidgetTester tester) async {
      price = '1234.56';
      obscured = true;
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} *,***.**',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent displays price with title',
        (WidgetTester tester) async {
      price = '75.00';
      label = 'Total Price: ';
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '$label${salesOrgConfig.currency.code} 75.00',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent displays negative price correctly',
        (WidgetTester tester) async {
      price = '-50.00';
      label = 'Total Price: ';
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '$label${salesOrgConfig.currency.code} -50.00',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent obscures negative price when obscured is true',
        (WidgetTester tester) async {
      price = '-50.00';
      obscured = true;
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} **.**',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent with creditSummaryPrice style',
        (WidgetTester tester) async {
      price = '50.00';
      type = PriceStyle.creditSummaryPrice;
      await tester.pumpWidget(
        getWidget(),
      );
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} (50.00)',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('PriceComponent with tenderPrice style',
        (WidgetTester tester) async {
      price = '50.00';
      type = PriceStyle.tenderPrice;
      await tester.pumpWidget(
        getWidget(),
      );
      await tester.pump();
      final priceComponentWidget = find.byKey(
        WidgetKeys.priceComponent,
      );
      expect(priceComponentWidget, findsOneWidget);
      expect(
        find.text(
          '${salesOrgConfig.currency.code} 50.00',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });
  });
}
