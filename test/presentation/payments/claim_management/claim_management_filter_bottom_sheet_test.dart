import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/filter/claim_management_filter_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
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

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
    claimManagementBloc = ClaimManagementBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    claimManagementFilterBloc = ClaimManagementFilterBlocMock();
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
    await tester.binding.setSurfaceSize(const Size(480, 900));
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
        child: const Material(
          child: ClaimManagementFilterBottomSheet(),
        ),
      ),
    );
  }

  group('Claim Management Filter Bottom Sheet Test', () {
    testWidgets('=> Display Items Test', (tester) async {
      final item = find.text('P1 - Principal Deals'.tr());
      whenListen(
        claimManagementFilterBloc,
        Stream.fromIterable([
          ClaimManagementFilterState.initial(),
          ClaimManagementFilterState.initial().copyWith(
            filter: ClaimManagementFilter.empty()
                .copyWith(claimTypes: [ClaimType(1)]),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(item, findsOneWidget);
      await tester.tap(item);
      verify(
        () => claimManagementFilterBloc.add(
          ClaimManagementFilterEvent.claimTypeChange(
            claimType: ClaimType(1),
            selected: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Tap Reset Button', (tester) async {
      when(() => claimManagementFilterBloc.state).thenReturn(
        ClaimManagementFilterState.initial().copyWith(
          filter: ClaimManagementFilter.empty()
              .copyWith(claimTypes: [ClaimType(1)]),
        ),
      );

      final resetButton = find.byKey(WidgetKeys.filterResetButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(resetButton, findsOneWidget);
      await tester.tap(resetButton);
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.applyFilter(
            appliedFilter: ClaimManagementFilter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Tap Apply Button', (tester) async {
      when(() => claimManagementFilterBloc.state).thenReturn(
        ClaimManagementFilterState.initial().copyWith(
          filter: ClaimManagementFilter.empty()
              .copyWith(claimTypes: [ClaimType(1)]),
        ),
      );
      when(() => claimManagementBloc.state).thenReturn(
        ClaimManagementState.initial().copyWith(
          appliedFilter: ClaimManagementFilter.empty(),
        ),
      );

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(filterApplyButton, findsOneWidget);
      await tester.tap(filterApplyButton);
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.applyFilter(
            appliedFilter: ClaimManagementFilter.empty()
                .copyWith(claimTypes: [ClaimType(1)]),
          ),
        ),
      ).called(1);
    });
  });
}
