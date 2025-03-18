import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late ReturnItemsFilterBloc returnItemsFilterBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => Config());
    autoRouterMock = locator<AppRouter>();
    returnItemsBlocMock = ReturnItemsBlocMock();
    returnItemsFilterBlocMock = ReturnItemsFilterBlocMock();
    when(() => returnItemsBlocMock.state).thenReturn(
      ReturnItemsState.initial(),
    );
    when(() => returnItemsFilterBlocMock.state).thenReturn(
      ReturnItemsFilterState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ReturnItemsBloc>(
          create: (context) => returnItemsBlocMock,
        ),
        BlocProvider<ReturnItemsFilterBloc>(
          create: (context) => returnItemsFilterBlocMock,
        ),
      ],
      child: const Material(
        child: ReturnItemsFilterBottomSheet(),
      ),
    );
  }

  group('Return Items Filter Bottom Sheet Test', () {
    testWidgets('From Invoice Date Filter Test', (tester) async {
      final expectStates = [
        ReturnItemsFilterState.initial().copyWith(
          filter: ReturnItemsFilter.empty().copyWith(
            invoiceDateFrom: DateTimeStringValue('2023-12-24'),
          ),
        ),
      ];
      whenListen(returnItemsFilterBlocMock, Stream.fromIterable(expectStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final dateFromField = find.byKey(WidgetKeys.fromInvoiceDateField);
      await tester.tap(dateFromField);
      await tester.pumpAndSettle();
      expect(find.byType(DateRangePickerDialog), findsOneWidget);
    });

    testWidgets('To Invoice Date Filter Test', (tester) async {
      final expectStates = [
        ReturnItemsFilterState.initial().copyWith(
          filter: ReturnItemsFilter.empty().copyWith(
            invoiceDateFrom: DateTimeStringValue('2023-12-24'),
            invoiceDateTo: DateTimeStringValue('2023-12-25'),
          ),
        ),
      ];
      whenListen(returnItemsFilterBlocMock, Stream.fromIterable(expectStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final dateToField = find.byKey(WidgetKeys.toInvoiceDateField);
      await tester.tap(dateToField);
      await tester.pumpAndSettle();
      expect(find.byType(DateRangePickerDialog), findsOneWidget);
    });

    testWidgets('Reset Button Test', (tester) async {
      when(() => returnItemsFilterBlocMock.state).thenAnswer(
        (invocation) => ReturnItemsFilterState.initial().copyWith(
          filter: ReturnItemsFilter.empty().copyWith(
            invoiceDateFrom: DateTimeStringValue('2023-12-24'),
            invoiceDateTo: DateTimeStringValue('2023-12-25'),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final resetButton = find.byKey(WidgetKeys.filterResetButton);

      expect(resetButton, findsOneWidget);
      await tester.pumpAndSettle();
      await tester.tap(resetButton);
      verify(
        () => returnItemsBlocMock.add(
          ReturnItemsEvent.fetch(
            appliedFilter: ReturnItemsFilter.init(),
            searchKey: SearchKey.search(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Apply Button Test', (tester) async {
      final fakeFilter = ReturnItemsFilter.empty().copyWith(
        invoiceDateFrom: DateTimeStringValue('2023-12-24'),
        invoiceDateTo: DateTimeStringValue('2023-12-25'),
      );
      when(() => returnItemsFilterBlocMock.state).thenAnswer(
        (invocation) => ReturnItemsFilterState.initial().copyWith(
          filter: fakeFilter,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final applyButton = find.byKey(WidgetKeys.filterApplyButton);

      expect(applyButton, findsOneWidget);
      await tester.pumpAndSettle();
      await tester.tap(applyButton);
      verify(
        () => returnItemsBlocMock
          ..add(
            ReturnItemsEvent.fetch(
              appliedFilter: fakeFilter,
              searchKey: SearchKey.search(''),
            ),
          ),
      ).called(1);
    });
  });
}
