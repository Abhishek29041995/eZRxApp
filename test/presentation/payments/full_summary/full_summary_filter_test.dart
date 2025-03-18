import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/widgets/filter_bottom_sheet.dart';
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
  late ZPFullSummaryBloc fullSummaryBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late FullSummaryFilterBloc fullSummaryFilterBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late EligibilityBloc eligibilityBlocMock;
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
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    fullSummaryBlocMock = ZPFullSummaryBlocMock();
    when(() => fullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    fullSummaryFilterBlocMock = FullSummaryFilterBlocMock();
    when(() => fullSummaryFilterBlocMock.state)
        .thenReturn(FullSummaryFilterState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
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
          BlocProvider<FullSummaryFilterBloc>(
            create: (context) => fullSummaryFilterBlocMock,
          ),
          BlocProvider<ZPFullSummaryBloc>(
            create: (context) => fullSummaryBlocMock,
          ),
          BlocProvider<FullSummaryFilterBloc>(
            create: (context) => fullSummaryFilterBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const Scaffold(
          body: SingleChildScrollView(
            child: FullSummaryFilterBottomSheet(isMarketPlace: false),
          ),
        ),
      ),
    );
  }

  group('All Credits Filter Bottom Sheet Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        FullSummaryFilterState.initial(),
      ];
      whenListen(fullSummaryFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pumpAndSettle();
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findFilterFullSummaryText = find.text('Filter'.tr());
      expect(findFilterFullSummaryText, findsOneWidget);

      final findIconKey = find.byKey(WidgetKeys.closeButton);
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('=> _DocumentDateFilterState Test', (tester) async {
      when(() => fullSummaryFilterBlocMock.state).thenReturn(
        FullSummaryFilterState.initial().copyWith(
          filter: FullSummaryFilter.defaultFilter().copyWith(
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
        FullSummaryFilterState.initial().copyWith(
          filter: FullSummaryFilter.defaultFilter().copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(fullSummaryFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final toDocumentDateField = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDocumentDateField, findsOneWidget);
      await tester.tap(toDocumentDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      verify(
        () => fullSummaryFilterBlocMock.add(
          FullSummaryFilterEvent.setDocumentDate(
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
        () => fullSummaryFilterBlocMock.add(
          FullSummaryFilterEvent.setDocumentDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _ApplyButton Button Click Test', (tester) async {
      final appliedFilter = FullSummaryFilter.defaultFilter().copyWith(
        filterStatuses: ['fake-status'],
      );
      when(() => fullSummaryFilterBlocMock.state).thenReturn(
        FullSummaryFilterState.initial().copyWith(
          filter: appliedFilter,
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pump();
      verify(
        () => fullSummaryFilterBlocMock.add(
          const FullSummaryFilterEvent.validateFilters(),
        ),
      ).called(1);

      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: appliedFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> _ResetButton Test', (tester) async {
      when(() => fullSummaryFilterBlocMock.state).thenReturn(
        FullSummaryFilterState.initial().copyWith(
          filter: FullSummaryFilter.defaultFilter()
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
        () {
          fullSummaryBlocMock.add(
            FullSummaryEvent.fetch(
              appliedFilter: FullSummaryFilter.defaultFilter(),
            ),
          );
        },
      ).called(1);
    });
  });
}
