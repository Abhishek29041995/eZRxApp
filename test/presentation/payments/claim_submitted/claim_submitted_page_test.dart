import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/claim_submitted/claim_submitted_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../../common_mock_data/mock_bloc.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;

  setUpAll(() async {
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
    eligibilityBloc = EligibilityBlocMock();
  });

  setUp(() {
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakePHSalesOrgConfigs,
        user: fakeClientUser,
      ),
    );
  });

  Future getScopedWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
        ],
        child: const ClaimSubmittedPage(),
      ),
    );
  }

  group('Claim Submitted page Test', () {
    testWidgets('=> Display Page Test', (tester) async {
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(find.text('Claim submitted'.tr()), findsOneWidget);
      expect(
        find.text(
          '${'Thank you'.tr()} ${fakeClientUser.username.getOrDefaultValue('')}! \n${'Your Claim has been submitted'.tr()}.',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'eZCS ticket will be automatically created in a few seconds.',
        ),
        findsOneWidget,
      );
    });
    testWidgets('=> Tap Close Button Test', (tester) async {
      when(() => autoRouterMock.maybePop())
          .thenAnswer((invocation) => Future.value(true));
      final closeButton = find.byKey(WidgetKeys.closeButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      verify(() => autoRouterMock.maybePop()).called(1);
    });

    testWidgets('=> Tap View List Test', (tester) async {
      final viewListButton =
          find.byKey(WidgetKeys.claimSubmittedViewClaimListButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(viewListButton, findsOneWidget);
      await tester.tap(viewListButton);

      verify(
        () =>
            autoRouterMock.popUntilRouteWithName(ClaimManagementPageRoute.name),
      ).called(1);
    });

    testWidgets('=> Tap View List Test', (tester) async {
      when(() => autoRouterMock.replace(const NewClaimSubmissionPageRoute()))
          .thenAnswer((invocation) => Future.value());
      final createButton =
          find.byKey(WidgetKeys.claimSubmittedCreateNewClaimButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(createButton, findsOneWidget);
      await tester.tap(createButton);

      verify(
        () => autoRouterMock.replace(const NewClaimSubmissionPageRoute()),
      ).called(1);
    });
  });
}
