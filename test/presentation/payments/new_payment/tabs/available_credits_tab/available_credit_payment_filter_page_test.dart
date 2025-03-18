import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credit_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../../utils/widget_utils.dart';
import '../../../../../common_mock_data/mock_bloc.dart';

void main() {
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBlocMock = AvailableCreditFilterBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBlocMock.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: AvailableCreditPaymentFilterPage(),
      ),
    );
  }

  group('Available credit filter test', () {
    testWidgets('Filter title show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterTitle = find.text('Filter');
      expect(filterTitle, findsOneWidget);
    });
    testWidgets('Close button show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);
    });

    testWidgets('Payment filter', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textDocumentDate = find.text('Document date');
      expect(textDocumentDate, findsOneWidget);

      final fromDateFilter = find.byKey(WidgetKeys.fromDocumentDateField);
      expect(fromDateFilter, findsOneWidget);

      final toDateFilter = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDateFilter, findsOneWidget);

      final amountRangeText = find.text('Amount range (MYR)');
      expect(amountRangeText, findsOneWidget);

      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      expect(filterResetButton, findsOneWidget);

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('apply button click');
    });

    testWidgets('Edit amountFrom test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      await tester.enterText(amountValueFrom, '26');
      await tester.pump();
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.setAmountFrom(
            amountFrom: '26',
          ),
        ),
      );
    });

    testWidgets('Edit amountTo test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final amountValue = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValue, findsOneWidget);

      await tester.enterText(amountValue, '100');
      await tester.pump();
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.setAmountTo(
            amountTo: '100',
          ),
        ),
      );
    });

    testWidgets('amount filter Invalid Amount range', (tester) async {
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.defaultFilter().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
          ),
          showErrorMessage: true,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      await tester.pump();
      expect(find.byType(ValueRangeError), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ValueRangeError),
          matching: find.text('Invalid Amount range!'),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'amount filter should hide error message when showErrorMessage is false',
        (tester) async {
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.defaultFilter().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
          ),
          showErrorMessage: false,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.amountValueFrom), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ValueRangeError),
          matching: find.text('Invalid Amount range!'),
        ),
        findsNothing,
      );
    });
  });
}
