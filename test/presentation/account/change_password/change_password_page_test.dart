import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/password_validation.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockResetPasswordBloc
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late ResetPasswordBloc mockResetPasswordBloc;
  late EligibilityBloc mockEligibilityBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late AuthBloc mockAuthBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockResetPasswordBloc);
    locator.registerLazySingleton(() => mockEligibilityBloc);
    locator.registerLazySingleton(() => mockAnnouncementBloc);
    locator.registerLazySingleton(() => mockAuthBloc);
  });
  setUp(() async {
    mockResetPasswordBloc = MockResetPasswordBloc();
    autoRouterMock = locator<AppRouter>();
    mockEligibilityBloc = MockEligibilityBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockAuthBloc = MockAuthBloc();

    when(() => mockResetPasswordBloc.state)
        .thenReturn(ResetPasswordState.initial());
    when(() => mockEligibilityBloc.state)
        .thenReturn(EligibilityState.initial());
    when(() => mockAnnouncementBloc.state)
        .thenReturn(AnnouncementState.initial());
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ResetPasswordBloc>(
          create: (context) => mockResetPasswordBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => mockEligibilityBloc,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => mockAnnouncementBloc,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
        ),
      ],
      child: const Scaffold(
        body: ChangePasswordPage(),
      ),
    );
  }

  group(
    'Change Password Page',
    () {
      testWidgets(
        'Test base page display',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final titleFinder = find.text('Security'.tr());
          expect(titleFinder, findsOneWidget);
          final backButtonFinder = find.byIcon(Icons.arrow_back_ios_sharp);
          expect(backButtonFinder, findsOneWidget);
          expect(find.byType(AnnouncementBanner), findsOneWidget);
          expect(find.text('Change Password'.tr()), findsOneWidget);
          expect(
            find.text(
              'We recommend you to change your password every 3 months'.tr(),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Test tap on back button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final backButtonFinder = find.byIcon(Icons.arrow_back_ios_sharp);
          await tester.tap(backButtonFinder);
          verify(
            () => mockResetPasswordBloc.add(
              const ResetPasswordEvent.clear(),
            ),
          ).called(1);
          expect(autoRouterMock.current.path != 'change_password', true);
        },
      );

      testWidgets(
        'Test Bottom Navigation Bar',
        (tester) async {
          when(() => mockResetPasswordBloc.state).thenReturn(
            ResetPasswordState.initial().copyWith(
              isSubmitting: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final clearButtonFinder = find.byKey(WidgetKeys.cancelButton);
          expect(clearButtonFinder, findsOneWidget);
          expect(find.text('Clear Changes'.tr()), findsOneWidget);

          final submitButtonFinder =
              find.byKey(WidgetKeys.changePasswordButton);
          expect(submitButtonFinder, findsOneWidget);
          final buttonTextFinder = find.text('Save'.tr());
          expect(buttonTextFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test On Tap Clear Button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final clearButtonFinder = find.byKey(WidgetKeys.cancelButton);
          await tester.tap(clearButtonFinder);
          verify(() {
            mockResetPasswordBloc.add(const ResetPasswordEvent.clear());
          }).called(1);
        },
      );

      testWidgets(
        'Test On Tap Submit Button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final submitButtonFinder =
              find.byKey(WidgetKeys.changePasswordButton);
          await tester.tap(submitButtonFinder);
          verify(() {
            mockResetPasswordBloc.add(
              const ResetPasswordEvent.changePassword(),
            );
          });
        },
      );

      testWidgets(
        'Test Change Password Form',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(Form), findsOneWidget);
          final textFieldOldPasswordFinder = find.widgetWithText(
            TextFieldWithLabel,
            'Your current password'.tr(),
          );
          expect(textFieldOldPasswordFinder, findsOneWidget);
          final textFieldNewPasswordFinder = find.widgetWithText(
            TextFieldWithLabel,
            'Follow instruction below'.tr(),
          );
          expect(textFieldNewPasswordFinder, findsOneWidget);
          final textFieldConfirmPasswordFinder = find.widgetWithText(
            TextFieldWithLabel,
            'Enter new password again'.tr(),
          );
          expect(textFieldConfirmPasswordFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test Change Password Submit failure',
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
          whenListen(mockResetPasswordBloc, Stream.fromIterable(expectedState));
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        },
      );

      testWidgets(
        'Test Change Password Submit success',
        (tester) async {
          final expectedState = [
            ResetPasswordState.initial().copyWith(isSubmitting: true),
            ResetPasswordState.initial(),
          ];
          whenListen(mockResetPasswordBloc, Stream.fromIterable(expectedState));
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          expect(
            find.text('Password changed successfully'.tr()),
            findsOneWidget,
          );
          expect(autoRouterMock.current.path != 'change_password', true);
        },
      );

      testWidgets(
        'Test Reset Password Validation',
        (tester) async {
          final expectedState = [
            ResetPasswordState.initial().copyWith(
              newPassword: Password.reset(''),
              showErrorMessages: false,
            ),
            ResetPasswordState.initial().copyWith(
              newPassword: Password.reset('mock-new-password'),
              showErrorMessages: true,
            ),
          ];
          whenListen(mockResetPasswordBloc, Stream.fromIterable(expectedState));
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byType(PasswordValidation),
            find.byType(ListView),
            const Offset(0.0, -500),
          );
          await tester.pumpAndSettle();
          expect(
            find.text('Your new password should have :'.tr()),
            findsOneWidget,
          );
          expect(
            find.text('Minimum length of 10 characters'.tr()),
            findsOneWidget,
          );
          expect(
            find.text(
              'At least 1 Upper case character (A to Z)'.tr(),
            ),
            findsOneWidget,
          );
          expect(
            find.text(
              'At least 1 Lower case character (a to z)'.tr(),
            ),
            findsOneWidget,
          );
          expect(
            find.text('At least a numeric character (0 to 9)'.tr()),
            findsOneWidget,
          );
          expect(
            find.text(
              'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )'
                  .tr(),
            ),
            findsOneWidget,
          );
          expect(
            find.text(
              'New password cannot contain more than 2 consecutive characters from username and/or name of the user'
                  .tr(),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Test On Change Text Field',
        (tester) async {
          const fakePassword = 't';
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final textFieldOldPasswordFinder = find.widgetWithText(
            TextFieldWithLabel,
            'Your current password'.tr(),
          );
          await tester.enterText(textFieldOldPasswordFinder, fakePassword);
          verify(
            () => mockResetPasswordBloc.add(
              const ResetPasswordEvent.onTextChange(
                PasswordFieldType.oldPassword,
                fakePassword,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test Text Field On Tap Show Password ',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final textFieldOldPasswordFinder = find.widgetWithText(
            TextFieldWithLabel,
            'Your current password'.tr(),
          );
          final showPasswordButtonFinder = find.descendant(
            of: textFieldOldPasswordFinder,
            matching: find.byType(IconButton),
          );
          await tester.tap(showPasswordButtonFinder);
          await tester.pumpAndSettle();
          verify(
            () => mockResetPasswordBloc.add(
              const ResetPasswordEvent.togglePasswordVisibility(
                PasswordFieldType.oldPassword,
                false,
              ),
            ),
          ).called(1);
        },
      );
    },
  );
}
