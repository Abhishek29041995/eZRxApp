import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/password_validation.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late ResetPasswordBloc resetPasswordBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AuthBloc authBlocMock;

  final fakeValidPassword =
      Password.confirm('new-password@N9', 'new-password@N9');

  final fakeInValidPassword = Password.confirm('FakeP@55word', 'FakeP@55word');

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
  });
  group('ResetPasswordPage', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
      resetPasswordBlocMock = ResetPasswordBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => autoRouterMock.currentPath).thenReturn('reset_password');
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });

    Widget getWidget({bool isFirstLogin = false}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        routeName: ForgetPasswordPageRoute.name,
        usingLocalization: true,
        providers: [
          BlocProvider<ResetPasswordBloc>(
            create: (context) => resetPasswordBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Scaffold(body: ResetPasswordPage(isFirstLogin: isFirstLogin)),
      );
    }

    testWidgets('Test all widgets visibility for Reset password via deeplink',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(PasswordValidation),
        find.byType(ListView),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();

      final logo = find.byType(Logo);
      final resetPasswordPageHeadingForFirstTimeLogin =
          find.byKey(WidgetKeys.resetPasswordPageHeadingForFirstTimeLogin);
      final newPasswordField = find.byKey(WidgetKeys.newPasswordTextField);
      final newPasswordHintText = find.text('Enter your new password');
      final confirmPasswordField = find.byKey(WidgetKeys.confirmPasswordField);
      final confirmPasswordHintText =
          find.text('Enter your new password again');
      final passwordValidationTitle =
          find.text('Your new password should have :');
      final minTenChars = find.text('Minimum length of 10 characters');
      final oneUpperCase =
          find.text('At least 1 Upper case character (A to Z)');
      final oneLoweCase = find.text('At least 1 Lower case character (a to z)');
      final numericChar = find.text('At least a numeric character (0 to 9)');
      final specialChar = find.text(
        'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
      );
      final twoRepeatingChars = find.text(
        'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
      );
      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      final backToLoginButton = find.byKey(WidgetKeys.loginSubmitButton);

      expect(logo, findsOneWidget);
      expect(resetPasswordPageHeadingForFirstTimeLogin, findsNothing);
      expect(newPasswordField, findsOneWidget);
      expect(newPasswordHintText, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
      expect(confirmPasswordHintText, findsOneWidget);
      expect(passwordValidationTitle, findsOneWidget);
      expect(minTenChars, findsOneWidget);
      expect(oneUpperCase, findsOneWidget);
      expect(oneLoweCase, findsOneWidget);
      expect(numericChar, findsOneWidget);
      expect(specialChar, findsOneWidget);
      expect(twoRepeatingChars, findsOneWidget);
      expect(resetPasswordButton, findsOneWidget);
      expect(
        find.descendant(
          of: resetPasswordButton,
          matching: find.text('Reset password'.tr()),
        ),
        findsOneWidget,
      );
      expect(backToLoginButton, findsOneWidget);
    });

    testWidgets(
        'Test all widgets visibility for Reset password for First time login',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget(isFirstLogin: true));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(PasswordValidation),
        find.byType(ListView),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();

      final logo = find.byType(Logo);
      final resetPasswordPageHeadingForFirstTimeLogin =
          find.byKey(WidgetKeys.resetPasswordPageHeadingForFirstTimeLogin);
      final newPasswordField = find.byKey(WidgetKeys.newPasswordTextField);
      final newPasswordHintText = find.text('Enter your new password');
      final confirmPasswordField = find.byKey(WidgetKeys.confirmPasswordField);
      final confirmPasswordHintText =
          find.text('Enter your new password again');
      final passwordValidationTitle =
          find.text('Your new password should have :');
      final minTenChars = find.text('Minimum length of 10 characters');
      final oneUpperCase =
          find.text('At least 1 Upper case character (A to Z)');
      final oneLoweCase = find.text('At least 1 Lower case character (a to z)');
      final numericChar = find.text('At least a numeric character (0 to 9)');
      final specialChar = find.text(
        'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
      );
      final twoRepeatingChars = find.text(
        'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
      );
      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      final backToLoginButton = find.byKey(WidgetKeys.loginSubmitButton);

      expect(logo, findsNothing);
      expect(resetPasswordPageHeadingForFirstTimeLogin, findsOneWidget);
      expect(newPasswordField, findsOneWidget);
      expect(newPasswordHintText, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
      expect(confirmPasswordHintText, findsOneWidget);
      expect(passwordValidationTitle, findsOneWidget);
      expect(minTenChars, findsOneWidget);
      expect(oneUpperCase, findsOneWidget);
      expect(oneLoweCase, findsOneWidget);
      expect(numericChar, findsOneWidget);
      expect(specialChar, findsOneWidget);
      expect(twoRepeatingChars, findsOneWidget);
      expect(resetPasswordButton, findsOneWidget);
      expect(
        find.descendant(
          of: resetPasswordButton,
          matching: find.text('Reset password'.tr()),
        ),
        findsNothing,
      );

      expect(
        find.descendant(
          of: resetPasswordButton,
          matching: find.text('Update password'.tr()),
        ),
        findsOneWidget,
      );
      expect(backToLoginButton, findsNothing);
    });

    testWidgets(
        'Enter New Password that does not meet the requirements and reset password button disabled',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: Password.resetV2('', '', 'fake-user'),
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.pump();
      final warning = find.byKey(WidgetKeys.errorRequirementsFillAllField);
      final confirmPasswordEmptyWarning =
          find.text('Confirm password cannot be empty.');

      expect(warning, findsOneWidget);
      expect(confirmPasswordEmptyWarning, findsOneWidget);
      await tester.dragUntilVisible(
        find.byType(PasswordValidation),
        find.byType(ListView),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);

      await tester.tap(resetPasswordButton);
      await tester.pumpAndSettle();
      verify(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      ).called(1);
    });

    testWidgets('test confirm password does not match with new password',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: Password.confirm('new-password@N9', 'new-password'),
          confirmPassword: Password.confirm('new-password', 'new-password@N9'),
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(PasswordValidation),
        find.byType(ListView),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();
      final passwordMismatchWarning =
          find.text('Please make sure your passwords match');
      final checkIcon = find.byIcon(Icons.check);

      expect(passwordMismatchWarning, findsOneWidget);
      expect(checkIcon, findsNWidgets(6));

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      expect(resetPasswordButton, findsOneWidget);
      await tester.tap(resetPasswordButton);
      await tester.pumpAndSettle();
      verify(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      ).called(1);
    });

    testWidgets(
        'test new password must not contain more than two consecutive characters of username',
        (WidgetTester tester) async {
      when(() => resetPasswordBlocMock.state).thenReturn(
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          user: User.empty().copyWith(
            username: Username('test-P@5-'),
          ),
          newPassword: fakeInValidPassword,
          confirmPassword: fakeInValidPassword,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final bullets = find.byIcon(Icons.circle);

      final checkIcon = find.byIcon(Icons.check);

      expect(checkIcon, findsNWidgets(5));
      expect(bullets, findsOneWidget);
    });

    testWidgets('test New Password and confirm password meet all requirements',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: fakeValidPassword,
          confirmPassword: fakeValidPassword,
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(PasswordValidation),
        find.byType(ListView),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();
      final passwordMismatchWarning =
          find.text('Please make sure your passwords match');
      final checkIcon = find.byIcon(Icons.check);
      final warning = find.byKey(WidgetKeys.errorRequirementsFillAllField);

      expect(passwordMismatchWarning, findsNothing);
      expect(checkIcon, findsNWidgets(6));
      expect(warning, findsNothing);

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      expect(resetPasswordButton, findsOneWidget);
      await tester.tap(resetPasswordButton);
      await tester.pump();

      verify(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      ).called(1);
    });

    testWidgets(
      'Test reset Password Submit failure',
      (tester) async {
        final expectedState = [
          ResetPasswordState.initial().copyWith(isSubmitting: true),
          ResetPasswordState.initial().copyWith(
            passwordResetFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('mock-error'),
              ),
            ),
          ),
        ];
        whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedState));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'Test reset Password Submit success',
      (tester) async {
        final expectedState = [
          ResetPasswordState.initial().copyWith(isSubmitting: true),
          ResetPasswordState.initial(),
        ];
        when(
          () => autoRouterMock.replace(
            ResetPasswordSuccessRoute(),
          ),
        ).thenAnswer(
          (_) => Future.value(),
        );
        whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedState));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        verify(
          () => autoRouterMock.replace(
            ResetPasswordSuccessRoute(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test reset Password Submit success',
      (tester) async {
        final expectedState = [
          ResetPasswordState.initial().copyWith(isSubmitting: true),
          ResetPasswordState.initial(),
        ];
        when(
          () => autoRouterMock.push(
            ResetPasswordSuccessRoute(isFirstLogin: true),
          ),
        ).thenAnswer(
          (_) => Future.value(),
        );
        whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedState));
        await tester.pumpWidget(getWidget(isFirstLogin: true));
        await tester.pumpAndSettle();
        verify(
          () => autoRouterMock.push(
            ResetPasswordSuccessRoute(isFirstLogin: true),
          ),
        ).called(1);
      },
    );
  });
}
