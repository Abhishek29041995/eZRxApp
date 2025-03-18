import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/more_tab.dart';
import 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ProxyLoginFormBlocMock
    extends MockBloc<ProxyLoginFormEvent, ProxyLoginFormState>
    implements ProxyLoginFormBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockUsername extends Mock implements Username {
  @override
  String getOrDefaultValue(defaultValue) {
    return value.fold((f) => defaultValue, id);
  }
}

final locator = GetIt.instance;

void main() {
  late UserBloc userBlocMock;
  late ProxyLoginFormBloc proxyLoginFormBlocMock;
  late SalesOrgBlocMock salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late AuthBloc authBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = AutoRouteMock();
    userBlocMock = UserBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    proxyLoginFormBlocMock = ProxyLoginFormBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => proxyLoginFormBlocMock.state)
        .thenReturn(ProxyLoginFormState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => proxyLoginFormBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
      ],
      child: const LoginOnBehalf(),
    );
  }

  group('Test "Log in on Behalf"', () {
    testWidgets('Content Display When User Can Login Behalf', (tester) async {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('root_admin')),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.loginOnBehalfButtonKey), findsOneWidget);
      final loginOnBehalfTextFinder = find.text(
        'Log in on behalf',
      );
      expect(loginOnBehalfTextFinder, findsOneWidget);
    });

    testWidgets('Content Display When User Cannot Login Behalf',
        (tester) async {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('')),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.loginOnBehalfButtonKey), findsNothing);
    });

    testWidgets('On Press Log in on behalf and show bottomsheet',
        (tester) async {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('zp_admin')),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final textButtonFinder = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
      await tester.tap(textButtonFinder);
      verify(
        () =>
            proxyLoginFormBlocMock.add(const ProxyLoginFormEvent.initialized()),
      ).called(1);
      await tester.pumpAndSettle();
      expect(find.byType(LoginOnBehalfSheet), findsOneWidget);
      expect(find.byKey(WidgetKeys.proxyLoginUserNameField), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.loginOnBehalfCancelButtonKey),
        findsOneWidget,
      );
      // verify button tap event
      when(() => autoRouterMock.maybePop())
          .thenAnswer((invocation) async => true);
      await tester.tap(find.byKey(WidgetKeys.loginOnBehalfCancelButtonKey));
      await tester.pumpAndSettle();
      verify(() => autoRouterMock.maybePop()).called(1);
    });
    testWidgets('Proxy Login User Name Field test', (tester) async {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('zp_admin')),
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final textButtonFinder = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
      await tester.tap(textButtonFinder);
      verify(
        () =>
            proxyLoginFormBlocMock.add(const ProxyLoginFormEvent.initialized()),
      ).called(1);
      await tester.pumpAndSettle();
      expect(find.byType(LoginOnBehalfSheet), findsOneWidget);
      final proxyLoginUserNameField =
          find.byKey(WidgetKeys.proxyLoginUserNameField);
      expect(find.byKey(WidgetKeys.proxyLoginUserNameField), findsOneWidget);
      await tester.enterText(proxyLoginUserNameField, 'fake_name');
      await tester.pump();
      verify(
        () => proxyLoginFormBlocMock.add(
          const ProxyLoginFormEvent.usernameChanged('fake_name'),
        ),
      ).called(1);
    });

    testWidgets(
      'Login Validation - Username is empty',
      (tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final textButtonFinder = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
        await tester.tap(textButtonFinder);
        final expectedStates = [
          ProxyLoginFormState.initial(),
          ProxyLoginFormState.initial().copyWith(
            username: Username(''),
            showErrorMessages: true,
          ),
        ];

        whenListen(proxyLoginFormBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpAndSettle();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        final loginButtonFinder =
            find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey);
        await tester.tap(loginButtonFinder);

        verify(
          () => proxyLoginFormBlocMock.add(
            ProxyLoginFormEvent.loginWithADButtonPressed(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(type: RoleType('zp_admin')),
              ),
            ),
          ),
        ).called(1);

        await tester.pumpAndSettle();

        final usernameErrorText =
            find.textContaining('Username cannot be empty.'.tr());
        expect(usernameErrorText, findsOneWidget);
      },
    );

    testWidgets(
      'Login Validation - Username is validated without error',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final textButtonFinder = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
        await tester.tap(textButtonFinder);
        await tester.pumpAndSettle();
        final proxyLoginUserNameField =
            find.byKey(WidgetKeys.proxyLoginUserNameField);
        expect(find.byKey(WidgetKeys.proxyLoginUserNameField), findsOneWidget);
        await tester.enterText(proxyLoginUserNameField, 'fake_name');

        final loginButtonFinder =
            find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey);
        await tester.tap(loginButtonFinder);
        await tester.pumpAndSettle();

        final usernameErrorText =
            find.textContaining('Username cannot be empty.'.tr());
        expect(usernameErrorText, findsNothing);
      },
    );

    testWidgets(
      ' -> Test Setting tile buildWhen isLoginOnBehalf',
      (WidgetTester tester) async {
        final expectedState = [
          UserState.initial(),
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
          ),
        ];

        whenListen(userBlocMock, Stream.fromIterable(expectedState));

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final textButtonFinder = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
        await tester.tap(textButtonFinder);
      },
    );
  });
}
