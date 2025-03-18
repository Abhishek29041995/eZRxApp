import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/customer_code_mock.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class ViewByRequestReturnFilterBlocMock extends MockBloc<
    ViewByRequestReturnFilterEvent,
    ViewByRequestReturnFilterState> implements ViewByRequestReturnFilterBloc {}

class AppRouterMock extends Mock implements AppRouter {}

void main() {
  late ReturnListByRequestBloc returnListByRequestBloc;
  late EligibilityBloc eligibilityBloc;
  late ViewByRequestReturnFilterBloc viewByRequestReturnFilterBloc;
  late AppRouter appRouter;
  final locator = GetIt.instance;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouterMock());
    returnListByRequestBloc = ReturnListByRequestBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    viewByRequestReturnFilterBloc = ViewByRequestReturnFilterBlocMock();
    appRouter = locator<AppRouterMock>();
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => returnListByRequestBloc.state).thenReturn(
      ReturnListByRequestState.initial(),
    );
    when(() => viewByRequestReturnFilterBloc.state).thenReturn(
      ViewByRequestReturnFilterState.initial(),
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
        BlocProvider<ReturnListByRequestBloc>(
          create: (context) => returnListByRequestBloc,
        ),
        BlocProvider<ViewByRequestReturnFilterBloc>(
          create: (context) => viewByRequestReturnFilterBloc,
        ),
      ],
      child: const Scaffold(body: ReturnByRequestFilterPage()),
    );
  }

  group('Test Return By Request Filter Page', () {
    testWidgets('Apply Button Enable', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      final applyButtonFinder = find.byKey(
        WidgetKeys.filterApplyButton,
      );
      expect(applyButtonFinder, findsOneWidget);
      expect(tester.widget<ElevatedButton>(applyButtonFinder).enabled, true);
    });

    testWidgets(
        'Amount text input field should allow input only up to 2 decimal places',
        (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountFromTextField = find.byKey(WidgetKeys.amountValueFrom);
      final amountToTextField = find.byKey(WidgetKeys.amountValueTo);
      expect(amountFromTextField, findsOneWidget);
      expect(amountToTextField, findsOneWidget);
      await tester.enterText(amountFromTextField, '100.9999');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(amountToTextField, '100.1234');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(
        find.text('100.99'),
        findsOneWidget,
      );
      expect(
        find.text('100.12'),
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
      when(() => viewByRequestReturnFilterBloc.state).thenAnswer(
        (invocation) => ViewByRequestReturnFilterState.initial().copyWith(
          filter: ReturnFilter.empty().copyWith(
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('0'),
          ),
        ),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      expect(find.byType(ValueRangeError), findsOneWidget);
      expect(find.text('Invalid Amount range!'.tr()), findsOneWidget);
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
        WidgetKeys.returnStatusFilter('Pending Review', false),
      );
      expect(checkBoxFinder, findsOneWidget);
      await tester.tap(checkBoxFinder);
      verify(
        () => viewByRequestReturnFilterBloc.add(
          ViewByRequestReturnFilterEvent.setReturnStatus(
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
        () => viewByRequestReturnFilterBloc.add(
          const ViewByRequestReturnFilterEvent.setAmountTo(
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
        () => viewByRequestReturnFilterBloc.add(
          const ViewByRequestReturnFilterEvent.setAmountFrom(
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
        () => viewByRequestReturnFilterBloc.add(
          const ViewByRequestReturnFilterEvent.resetFilters(),
        ),
      ).called(1);
    });
    testWidgets('Apply Button Submit Valid', (tester) async {
      whenListen(
        viewByRequestReturnFilterBloc,
        Stream.fromIterable([
          ViewByRequestReturnFilterState.initial().copyWith(
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
      when(() => viewByRequestReturnFilterBloc.state).thenAnswer(
        (invocation) => ViewByRequestReturnFilterState.initial().copyWith(
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
        () => viewByRequestReturnFilterBloc.add(
          const ViewByRequestReturnFilterEvent.setValidationFailure(),
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
        () => viewByRequestReturnFilterBloc.add(
          ViewByRequestReturnFilterEvent.setReturnType(
            type: MaterialOriginFilter.mp(),
          ),
        ),
      ).called(1);
    });
  });
}
