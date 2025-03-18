import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoice_payment_filter_page.dart';
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
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late OutstandingInvoiceFilterBloc outstandingInvoiceFilterBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;

  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(DateTime.now()),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(const Duration(days: 28)),
    ),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    outstandingInvoiceFilterBlocMock = OutstandingInvoiceFilterBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoiceFilterBlocMock.state)
        .thenReturn(OutstandingInvoiceFilterState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<OutstandingInvoiceFilterBloc>(
          create: (context) => outstandingInvoiceFilterBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: OutstandingInvoicePaymentFilterPage(),
      ),
    );
  }

  group('Outstanding invoice filter test', () {
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
      await tester.tap(closeButton);
      expect(find.byKey(WidgetKeys.outstandingInvoiceFilterPage), findsNothing);
    });

    testWidgets('Invoice filter', (tester) async {
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

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);

      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      expect(filterResetButton, findsOneWidget);

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('apply button click');
    });

    testWidgets(
      'FromDocumentDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField = find.byKey(
          WidgetKeys.fromDocumentDateField,
        );
        expect(filterFromDateField, findsOneWidget);
        await tester.tap(filterFromDateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('Save');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDocumentDate(
              documentDateRange:
                  DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ToDocumentDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.toDocumentDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('Save');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDocumentDate(
              documentDateRange:
                  DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'FromDueDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
              dueDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dueDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.fromDueDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('Save');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDueDate(
              dueDateRange: DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ToDueDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
              dueDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dueDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.toDueDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('Save');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDueDate(
              dueDateRange: DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('Edit amount filter test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial(),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      await tester.enterText(amountValueFrom, '26');
      await tester.pump();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          const OutstandingInvoiceFilterEvent.setAmountFrom(
            amountFrom: '26',
          ),
        ),
      );

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);

      await tester.enterText(amountValueTo, '100');
      await tester.pump();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          const OutstandingInvoiceFilterEvent.setAmountTo(
            amountTo: '100',
          ),
        ),
      );
    });

    testWidgets('Status filter test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial(),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final checkBoxOpen = find.byType(CheckboxListTile).first;

      await tester.tap(checkBoxOpen);
      await tester.pumpAndSettle();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(
            status: outstandingInvoiceFilterBlocMock.state.statusList.first,
            value: true,
          ),
        ),
      );
    });

    testWidgets('amount filter Invalid Amount range', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial().copyWith(
          filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
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
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial().copyWith(
          filter: OutstandingInvoiceFilter.defaultFilter().copyWith(
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
