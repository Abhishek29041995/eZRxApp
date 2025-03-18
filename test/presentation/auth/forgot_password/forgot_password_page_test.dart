import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../account/customer_search_test.dart';

class ForgotPasswordBlocMock
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

class AppRouterMock extends Mock implements AppRouter {}

void main() {
  late AppRouter autoRouterMock;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(ForgetPasswordPageRoute.name),
      ),
      stringMatch: 'forgot_password',
      key: const ValueKey('ForgetPasswordPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouterMock());
  });
  group('ForgetPasswordPage', () {
    late ForgotPasswordBloc forgotPasswordBlocMock;

    setUp(() {
      autoRouterMock = locator<AppRouterMock>();
      forgotPasswordBlocMock = ForgotPasswordBlocMock();
      when(() => forgotPasswordBlocMock.state)
          .thenReturn(ForgotPasswordState.initial());
      when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => autoRouterMock.pushNamed(any()))
          .thenAnswer((invocation) async => null);
    });

    tearDown(() {
      forgotPasswordBlocMock.close();
    });

    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        routeName: ForgetPasswordPageRoute.name,
        usingLocalization: true,
        providers: [
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => forgotPasswordBlocMock,
          ),
        ],
        child: const ForgetPasswordPage(),
      );
    }

    group(' -> renders UI', () {
      testWidgets(' -> renders UI elements', (WidgetTester tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byType(Logo), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(
          find.text(
            'Let us know your eZRx+ username and we`ll send you a verification email.',
          ),
          findsOneWidget,
        );
        expect(find.byType(TextFormField), findsOneWidget);
        expect(find.text('Next'), findsOneWidget);
        expect(find.byType(BackToLogin), findsOneWidget);
      });
    });

    group(' -> Username', () {
      testWidgets(' -> Username is invalid', (tester) async {
        final expectedStates = [
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
          ),
          ForgotPasswordState.initial().copyWith(
            username: Username(''),
            showErrorMessages: true,
          ),
        ];
        when(() => forgotPasswordBlocMock.state).thenReturn(
          ForgotPasswordState.initial().copyWith(
            username: Username(''),
            showErrorMessages: true,
          ),
        );
        whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.enterText(find.byKey(WidgetKeys.forgotUsernameField), '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(find.text('Username cannot be empty.'), findsOneWidget);
      });

      testWidgets(' -> Username is Valid', (tester) async {
        final expectedStates = [
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
            showErrorMessages: true,
          ),
        ];
        whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));

        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.enterText(
          find.byKey(WidgetKeys.forgotUsernameField),
          'fake.username',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(find.text('Username cannot be empty.'), findsNothing);
      });
      testWidgets('Username should not contain Capital letters',
          (tester) async {
        final expectedStates = [
          ForgotPasswordState.initial().copyWith(
            username: Username('ezrxtest05'),
            showErrorMessages: false,
            isSubmitting: false,
          ),
        ];
        when(() => forgotPasswordBlocMock.state).thenReturn(
          ForgotPasswordState.initial().copyWith(
            username: Username('ezrxtest05'),
            showErrorMessages: true,
            isSubmitting: true,
          ),
        );
        whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final usernameFinder = find.byKey(WidgetKeys.forgotUsernameField);
        expect(usernameFinder, findsOneWidget);
        await tester.enterText(usernameFinder, 'EZRXtest05');
        await tester.pumpAndSettle();
        expect(find.text('ezrxtest05'), findsOneWidget);
      });
    });

    group(' -> navigates to forgot password confirmation page', () {
      testWidgets(
          ' -> not navigates if resetPasswordFailureOrSuccessOption is error',
          (WidgetTester tester) async {
        final expectedStates = [
          ForgotPasswordState.initial(),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
          ),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
            isSubmitting: true,
          ),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
            resetPasswordFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
          ),
        ];
        whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));

        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.tap(find.text('Next'));
        await tester.pumpAndSettle();

        verifyNever(
          () =>
              autoRouterMock.push(const ForgetPasswordConfirmationPageRoute()),
        );
      });

      testWidgets(
          ' -> not navigates if resetPasswordFailureOrSuccessOption is none()',
          (WidgetTester tester) async {
        final expectedStates = [
          ForgotPasswordState.initial(),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
          ),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
            isSubmitting: true,
          ),
          ForgotPasswordState.initial().copyWith(
            username: Username('fake.username'),
            resetPasswordFailureOrSuccessOption: none(),
          ),
        ];
        whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.tap(find.text('Next'));
        await tester.pumpAndSettle();

        verifyNever(
          () =>
              autoRouterMock.push(const ForgetPasswordConfirmationPageRoute()),
        );
      });

      group(' -> BackToLogin', () {
        testWidgets(' -> navigates back to login page',
            (WidgetTester tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          await tester.tap(find.byKey(WidgetKeys.loginSubmitButton));
          await tester.pumpAndSettle();

          verify(
            () => autoRouterMock.popUntilRouteWithName(LoginPageRoute.name),
          ).called(1);
        });
      });
    });
  });
}
