import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_step.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AupTcBloc aupTcBlocMock;
  final introSkipButton = find.byKey(WidgetKeys.introSkipButton);
  final introGetStartedButton = find.byKey(WidgetKeys.introGetStartedButton);
  late AnnouncementBloc announcementBlocMock;
  late UserBloc userBlocMock;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AutoRouteMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AutoRouteMock>();
    eligibilityBlocMock = EligibilityBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    aupTcBlocMock = AupTcBlocMock();
    userBlocMock = UserBlocMock();

    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => salesOrgBlocMock.state).thenReturn(
      SalesOrgState.initial().copyWith(
        configs: SalesOrganisationConfigs.empty().copyWith(hideCustomer: true),
      ),
    );
    when(() => aupTcBlocMock.state).thenReturn(AupTcState.initial());
    announcementBlocMock = AnnouncementBlocMock();
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
  });

  Widget getIntroPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<SalesOrgBloc>(
          create: ((context) => salesOrgBlocMock),
        ),
        BlocProvider<AupTcBloc>(
          create: ((context) => aupTcBlocMock),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
      ],
      child: const IntroPage(),
    );
  }

  group('Test "Intro Page"', () {
    testWidgets('Content Display', (tester) async {
      await tester.pumpWidget(getIntroPage());
      await tester.pump();
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(IntroStep), findsAtLeastNWidgets(1));
      final haveHeaderTextFinder = find.text('Order and track easily');
      expect(haveHeaderTextFinder, findsOneWidget);
      final haveDescriptionTextFinder = find.text(
        'With the new and improved eZRx+ mobile app, you can order your prescription drugs, view order history and track delivery statuses easily.',
      );
      expect(haveDescriptionTextFinder, findsOneWidget);
      final introGetStatedButtonFinder =
          find.byKey(WidgetKeys.introGetStartedButton);
      expect(introGetStatedButtonFinder, findsOneWidget);
      final haveButtonTextFinder = find.text(
        'Next',
      );
      expect(haveButtonTextFinder, findsOneWidget);
    });

    testWidgets('Get Started Button On Tap', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeClientUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeClientUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );

      await tester.pumpWidget(getIntroPage());
      await tester.pump();

      await tester.tap(introSkipButton);
      verify(
        () => userBlocMock.add(
          const UserEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.popUntilRouteWithName(
          HomeNavigationTabbarRoute.name,
        ),
      ).called(1);
    });

    testWidgets('User disable Payment & Return - Get started button only',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          user: fakeClientUser.copyWith(
            disablePaymentAccess: true,
            disableReturns: true,
          ),
        ),
      );

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeClientUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );

      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => userBlocMock.add(
          const UserEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.popUntilRouteWithName(
          HomeNavigationTabbarRoute.name,
        ),
      ).called(1);
    });

    testWidgets('SaleOrg disable Payment & Return - Get started button only',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          //Due to this ticket https://zuelligpharma.atlassian.net/browse/EZRX-16961?focusedCommentId=118024
          //we need to create TWSalesOrgConfigs disable return and payment of client_user, but the fakeTWSalesOrgConfigs wont' match
          //so it will need copyWith in here
          salesOrgConfigs: fakeTWSalesOrgConfigs.copyWith(
            disableReturnsAccess: true,
            disablePayment: true,
          ),
          user: fakeClientUser.copyWith(
            disablePaymentAccess: false,
            disableReturns: false,
          ),
        ),
      );

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeClientUser.copyWith(
            disablePaymentAccess: false,
            disableReturns: false,
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );

      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => userBlocMock.add(
          const UserEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.popUntilRouteWithName(
          HomeNavigationTabbarRoute.name,
        ),
      ).called(1);
    });

    testWidgets('Root admin - SaleOrg return disable & payment enable',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
          user: fakeRootAdminUser,
        ),
      );

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeRootAdminUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );

      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsOneWidget);
      expect(find.text('Order and track easily'), findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Payments on the go'), findsOneWidget);
      expect(introSkipButton, findsOneWidget);

      await tester.tap(introSkipButton);
      await tester.pumpAndSettle();

      verify(
        () => userBlocMock.add(
          const UserEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.popUntilRouteWithName(
          HomeNavigationTabbarRoute.name,
        ),
      ).called(1);
    });

    testWidgets('Client user - MY SaleOrg & Return & Payment enable',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser,
        ),
      );

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeRootAdminUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsOneWidget);
      expect(find.text('Order and track easily'), findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Payments on the go'), findsOneWidget);
      expect(introSkipButton, findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Hassle-free returns'), findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => userBlocMock.add(
          const UserEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.popUntilRouteWithName(
          HomeNavigationTabbarRoute.name,
        ),
      ).called(1);
    });
  });
}
