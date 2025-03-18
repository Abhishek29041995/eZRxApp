import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late ZPAllInvoicesBloc allInvoicesBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late EligibilityBloc eligibilityBlocMock;

  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now().subtract(
        const Duration(days: 29),
      ),
    ),
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    allInvoicesBlocMock = ZPAllInvoicesBlocMock();
    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<AllInvoicesFilterBloc>(
            create: (context) => allInvoicesFilterBlocMock,
          ),
          BlocProvider<ZPAllInvoicesBloc>(
            create: (context) => allInvoicesBlocMock,
          ),
          BlocProvider<AllInvoicesFilterBloc>(
            create: (context) => allInvoicesFilterBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const Scaffold(
          body: SingleChildScrollView(
            child: AllInvoicesFilterBottomSheet(isMarketPlace: false),
          ),
        ),
      ),
    );
  }

  group('All Invoices Filter Bottom Sheet Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        AllInvoicesFilterState.initial(),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pumpAndSettle();
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findFilterAllInvoicesText = find.text('Filter'.tr());
      expect(findFilterAllInvoicesText, findsOneWidget);

      final findIconKey = find.byKey(WidgetKeys.closeButton);
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('=> _DocumentDateFilterState Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      );

      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final toDocumentDateField = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDocumentDateField, findsOneWidget);
      await tester.tap(toDocumentDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDocumentDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);

      final fromDocumentDateField =
          find.byKey(WidgetKeys.fromDocumentDateField);
      expect(fromDocumentDateField, findsOneWidget);
      await tester.tap(fromDocumentDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDocumentDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _DueDateFilterState Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      );

      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final toDueDateField = find.byKey(WidgetKeys.toDueDateField);
      expect(toDueDateField, findsOneWidget);
      await tester.tap(toDueDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDueDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);

      final fromDueDateField = find.byKey(WidgetKeys.fromDueDateField);
      expect(fromDueDateField, findsOneWidget);
      await tester.tap(fromDueDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDueDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _AmountValueToFilter Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            amountValueTo: RangeValue('12'),
          ),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);
      await tester.tap(amountValueTo);
      await tester.pumpAndSettle();
      await tester.enterText(amountValueTo, '123456');
      await tester.pump();
      verify(
        () => allInvoicesFilterBlocMock.add(
          const AllInvoicesFilterEvent.amountValueToChanged(
            '123456',
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _AmountValueFromFilter Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            amountValueFrom: RangeValue('12'),
          ),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);
      await tester.tap(amountValueFrom);
      await tester.pumpAndSettle();
      await tester.enterText(amountValueFrom, '12');
      await tester.pump();
      verify(
        () => allInvoicesFilterBlocMock.add(
          const AllInvoicesFilterEvent.amountValueFromChanged(
            '12',
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _ApplyButton Button Click Test', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pump();
      verify(
        () => allInvoicesFilterBlocMock.add(
          const AllInvoicesFilterEvent.validateFilters(),
        ),
      ).called(1);
    });

    testWidgets('=> _ResetButton Test', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: AllInvoicesFilter.defaultFilter()
              .copyWith(filterStatuses: ['Cleared']),
        ),
      );
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          filter: AllInvoicesFilter.defaultFilter()
              .copyWith(filterStatuses: ['Cleared']),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Reset'.tr());
      expect(findText, findsOneWidget);
      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      await tester.tap(filterResetButton);
      await tester.pump();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '=> AmountValueError Test when amountValueTo greater than amountValueFrom',
        (tester) async {
      when(() => allInvoicesFilterBlocMock.state).thenReturn(
        AllInvoicesFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: AllInvoicesFilter.defaultFilter().copyWith(
            amountValueFrom: RangeValue('15'),
            amountValueTo: RangeValue('12'),
          ),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pumpAndSettle();

      final findInvalidText = find.text('Invalid Amount range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
