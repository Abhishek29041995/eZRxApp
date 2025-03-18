import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/customer_code_mock.dart';
import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late ReturnListByItemBloc returnListByItemBloc;
  late EligibilityBloc eligibilityBloc;
  late ViewByItemReturnFilterBloc viewByItemReturnFilterBloc;
  late AppRouter appRouter;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AutoRouteMock());
    returnListByItemBloc = ReturnListByItemBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    viewByItemReturnFilterBloc = ViewByItemReturnFilterBlocMock();
    appRouter = locator<AutoRouteMock>();
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => returnListByItemBloc.state).thenReturn(
      ReturnListByItemState.initial(),
    );
    when(() => viewByItemReturnFilterBloc.state).thenReturn(
      ViewByItemReturnFilterState.initial(),
    );
  });
  Widget getWidgetToTest() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: appRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<ReturnListByItemBloc>(
          create: (context) => returnListByItemBloc,
        ),
        BlocProvider<ViewByItemReturnFilterBloc>(
          create: (context) => viewByItemReturnFilterBloc,
        ),
      ],
      child: const Scaffold(body: ReturnByItemFilterPage()),
    );
  }

  group('Test ReturnByItemFilterPage', () {
    testWidgets('Apply Button Enable', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      final applyButtonFinder = find.byKey(
        WidgetKeys.filterApplyButton,
      );
      expect(applyButtonFinder, findsOneWidget);
      expect(tester.widget<ElevatedButton>(applyButtonFinder).enabled, true);
    });

    testWidgets('Amount text input should allow only 2 digit', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountTextField = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountTextField, findsOneWidget);
      await tester.enterText(amountTextField, '100.9999');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(
        find.text('100.99'),
        findsOneWidget,
      );
    });

    testWidgets('Close Button', (tester) async {
      when(() => appRouter.maybePop())
          .thenAnswer((invocation) => Future.value(true));
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      verify(() => appRouter.maybePop()).called(1);
    });

    testWidgets('Show Value Range Error When Amount Range Invalid',
        (tester) async {
      when(() => viewByItemReturnFilterBloc.state).thenAnswer(
        (invocation) => ViewByItemReturnFilterState.initial().copyWith(
          filter: ReturnFilter.empty().copyWith(
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('0'),
          ),
        ),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      expect(find.byType(ValueRangeError), findsOneWidget);
      expect(find.text('Invalid Amount range!'), findsOneWidget);
    });

    testWidgets('Return Date From Field', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final fieldFinder = find.byKey(WidgetKeys.fromReturnDateField);
      expect(fieldFinder, findsOneWidget);
      await tester.tap(fieldFinder);
      await tester.pumpAndSettle();
      expect(find.byType(DateRangePickerDialog), findsOneWidget);
    });

    testWidgets('Return Date To Field', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final fieldFinder = find.byKey(WidgetKeys.toReturnDateField);
      expect(fieldFinder, findsOneWidget);
      await tester.tap(fieldFinder);
      await tester.pumpAndSettle();
      expect(find.byType(DateRangePickerDialog), findsOneWidget);
    });

    testWidgets('Status List', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final checkBoxFinder = find.byKey(
        WidgetKeys.returnStatusFilter('Pending Approval', false),
      );
      expect(checkBoxFinder, findsOneWidget);
      await tester.tap(checkBoxFinder);
      verify(
        () => viewByItemReturnFilterBloc.add(
          ViewByItemReturnFilterEvent.setReturnStatus(
            status: StatusType('PENDING'),
            value: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('Amount Value To Onchage', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountValueToFinder = find.byKey(
        WidgetKeys.amountValueTo,
      );
      expect(amountValueToFinder, findsOneWidget);
      await tester.enterText(amountValueToFinder, '100');
      verify(
        () => viewByItemReturnFilterBloc.add(
          const ViewByItemReturnFilterEvent.setAmountTo(
            amountTo: '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Amount Value From Onchage', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountValueFromFinder = find.byKey(
        WidgetKeys.amountValueFrom,
      );
      expect(amountValueFromFinder, findsOneWidget);
      await tester.enterText(amountValueFromFinder, '100');
      verify(
        () => viewByItemReturnFilterBloc.add(
          const ViewByItemReturnFilterEvent.setAmountFrom(
            amountFrom: '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Reset Button Tap', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final resetButtonFinder = find.byKey(
        WidgetKeys.filterResetButton,
      );
      expect(resetButtonFinder, findsOneWidget);
      await tester.tap(resetButtonFinder);
      verify(
        () => viewByItemReturnFilterBloc.add(
          const ViewByItemReturnFilterEvent.resetFilters(),
        ),
      ).called(1);
    });
    testWidgets('Apply Button Submit Valid', (tester) async {
      whenListen(
        viewByItemReturnFilterBloc,
        Stream.fromIterable([
          ViewByItemReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(
              amountValueFrom: RangeValue('0'),
              amountValueTo: RangeValue('1'),
              returnDateFrom: DateTimeStringValue('2023-12-22'),
              returnDateTo: DateTimeStringValue('2023-12-25'),
              returnStatusList: <StatusType>[
                StatusType('PENDING'),
              ],
            ),
          ),
        ]),
      );

      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      final applyButtonFinder = find.byKey(
        WidgetKeys.filterApplyButton,
      );
      expect(applyButtonFinder, findsOneWidget);
      await tester.tap(applyButtonFinder);
    });

    testWidgets('Apply Button Submit Invalid', (tester) async {
      when(() => viewByItemReturnFilterBloc.state).thenAnswer(
        (invocation) => ViewByItemReturnFilterState.initial().copyWith(
          filter: ReturnFilter.empty().copyWith(
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('0'),
          ),
        ),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final applyButtonFinder = find.byKey(
        WidgetKeys.filterApplyButton,
      );
      expect(applyButtonFinder, findsOneWidget);
      await tester.tap(applyButtonFinder);
      verify(
        () => viewByItemReturnFilterBloc.add(
          const ViewByItemReturnFilterEvent.setValidationFailure(),
        ),
      ).called(1);
    });

    testWidgets('Should hide return type when user can not access marketplace',
        (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      expect(find.text('Show returns'), findsNothing);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP items', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
        findsNothing,
      );
    });

    testWidgets('Apply return type', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          user: fakeClientUserAccessMarketPlace,
        ),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      expect(find.text('Show returns'), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP items', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
        findsOneWidget,
      );

      await tester.tap(
        find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
      );
      verify(
        () => viewByItemReturnFilterBloc.add(
          ViewByItemReturnFilterEvent.setReturnType(
            type: MaterialOriginFilter.mp(),
          ),
        ),
      ).called(1);
    });
  });
}
