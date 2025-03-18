import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  final expDateIcon = find.byKey(WidgetKeys.expiryDateInfoIcon);

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  RouteDataScope getScopedWidget({bool showToolTip = true}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
      ],
      child: Material(
        child: StockInfoWidget(
          stockInfo: StockInfo.empty(),
          materialInfo: MaterialInfo.empty(),
          showToolTip: showToolTip,
        ),
      ),
    );
  }

  group('Stock Info Widget Test', () {
    testWidgets('Display Expiry Date When config enabled', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      expect(
        find.textContaining(
          '${'Expires'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );

      expect(expDateIcon, findsOneWidget);
      await tester.tap(expDateIcon);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.expiryDateInstructionSheet),
        findsOneWidget,
      );
      expect(find.text('Expiry date'.tr()), findsOneWidget);
      expect(
        find.text(
          '${'Expiry date displayed is for reference, actual product may vary'.tr()}.',
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.closeButton),
          matching: find.text('Got it'.tr()),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Display Expiry Date without tooltip when showToolTip is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget(showToolTip: false));
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      expect(
        find.textContaining(
          '${'Expires'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );

      expect(expDateIcon, findsNothing);
    });

    testWidgets('Display Batch Number When config enabled', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
            enableBatchNumber: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      expect(
        find.textContaining(
          '${'Batch'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Display Batch Number And Expiry Date When both configs enabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            enableBatchNumber: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      expect(
        find.textContaining(
          '${'Expires'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
      expect(
        find.textContaining(
          ' - ',
          findRichText: true,
        ),
        findsOneWidget,
      );
      expect(
        find.textContaining(
          '${'Batch'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
      expect(expDateIcon, findsOneWidget);
    });
  });
}
