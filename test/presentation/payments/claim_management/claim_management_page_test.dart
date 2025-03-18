import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/filter/claim_management_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late ClaimManagementBloc claimManagementBloc;
  late EligibilityBloc eligibilityBloc;
  late ClaimManagementFilterBloc claimManagementFilterBloc;
  late List<ClaimItem> itemList;
  late Config config;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AutoRouteMock());
    locator.registerLazySingleton(() => Config());
    config = locator<Config>();
    autoRouterMock = locator<AutoRouteMock>();
    claimManagementBloc = ClaimManagementBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    claimManagementFilterBloc = ClaimManagementFilterBlocMock();
    itemList = await ClaimManagementLocalDataSource().getClaimSubmissions();
  });
  setUp(() {
    when(() => claimManagementBloc.state)
        .thenReturn(ClaimManagementState.initial());
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakePHSalesOrgConfigs,
      ),
    );
    when(() => claimManagementFilterBloc.state).thenReturn(
      ClaimManagementFilterState.initial(),
    );
  });

  Future getScopedWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ClaimManagementBloc>(
            create: (context) => claimManagementBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<ClaimManagementFilterBloc>(
            create: (context) => claimManagementFilterBloc,
          ),
        ],
        child: const ClaimManagementPage(),
      ),
    );
  }

  group('Claim Management Screen Test', () {
    testWidgets('=> Display No Record When Fetch List Failure Test',
        (tester) async {
      whenListen(
        claimManagementBloc,
        Stream.fromIterable([
          ClaimManagementState.initial(),
          ClaimManagementState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-error')),
            ),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      expect(find.text('fake-error'.tr()), findsOneWidget);
      expect(find.text('Claim Management'.tr()), findsOneWidget);
      expect(find.byType(NoRecordFound), findsOneWidget);
    });

    testWidgets('=> Display Items When Fetch List Success Test',
        (tester) async {
      whenListen(
        claimManagementBloc,
        Stream.fromIterable([
          ClaimManagementState.initial(),
          ClaimManagementState.initial().copyWith(
            items: itemList,
            failureOrSuccessOption: optionOf(const Right(true)),
          ),
        ]),
      );
      final itemFinder = find.byKey(WidgetKeys.claimManagementItem);

      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byType(NoRecordFound), findsNothing);
      expect(itemFinder, findsNWidgets(5));
      expect(
        find.descendant(
          of: itemFinder.first,
          matching: find.text('100415|ALLERGAN  BOTOX'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemFinder.first,
          matching: find.text('P7 - Opening Support'.tr()),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemFinder.first,
          matching: find.text('eczs#66618'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemFinder.first,
          matching: find.text('${'Submit date'.tr()}: 18 Jul 2024'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemFinder.first,
          matching: find.text('PHP 100.00', findRichText: true),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Refresh Page Test', (tester) async {
      when(
        () => claimManagementBloc.state,
      ).thenReturn(
        ClaimManagementState.initial().copyWith(items: itemList),
      );

      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, 1000.0),
      );
      await tester.pumpAndSettle();
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.fetch(
            appliedFilter: ClaimManagementFilter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Tap Create Button Test', (tester) async {
      when(
        () => claimManagementBloc.state,
      ).thenReturn(
        ClaimManagementState.initial().copyWith(items: itemList),
      );
      when(() => autoRouterMock.push(const NewClaimSubmissionPageRoute()))
          .thenAnswer((invocation) => Future.value());
      final createButton = find.byType(ScaleButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      expect(createButton, findsOneWidget);
      await tester.tap(createButton);
      verify(
        () => autoRouterMock.push(const NewClaimSubmissionPageRoute()),
      ).called(1);
    });

    testWidgets('Tap Filter Icon Test', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      final filterIcon = find.byKey(WidgetKeys.claimManagementFilterIcon);
      final closeButton = find.byKey(WidgetKeys.closeButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      expect(filterIcon, findsOneWidget);
      await tester.tap(filterIcon);
      await tester.pumpAndSettle();
      verify(
        () => claimManagementFilterBloc.add(
          ClaimManagementFilterEvent.openFilterBottomSheet(
            appliedFilter: ClaimManagementFilter.empty(),
          ),
        ),
      ).called(1);
      expect(
        find.byKey(WidgetKeys.claimManagementFilterBottomsheet),
        findsOneWidget,
      );
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.claimManagementFilterBottomsheet),
        findsNothing,
      );
    });

    testWidgets('Search Bar Test', (tester) async {
      final searchBar = find.byKey(WidgetKeys.searchBar);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      expect(searchBar, findsOneWidget);
      await tester.enterText(searchBar, '1');
      await tester.pump(Duration(milliseconds: config.autoSearchTimeout));
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.applyFilter(
            appliedFilter: ClaimManagementFilter.empty().copyWith(
              searchKey: SearchKey.search('1'),
            ),
          ),
        ),
      ).called(1);
    });
  });
}
