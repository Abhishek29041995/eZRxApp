import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ResetPasswordBlocMock
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockResetPassword extends Mock implements ChangePasswordRepository {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  // late ResetPasswordBloc resetPasswordBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  // late UserBloc mockUserBloc;
  // late AppRouter autoRouterMock;
  setUpAll(() async {
    setupLocator();
  });

  group('ChangePassword Test', () {
    setUp(() {
      // resetPasswordBlocMock = ResetPasswordBlocMock();
      // mockUserBloc = MockUserBloc();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      // autoRouterMock = locator<AppRouter>();

      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });

    // Future getScopedWidget(Widget home, WidgetTester tester) {
    //   return TesterUtils.setUpLocalizationWrapper(
    //     tester: tester,
    //     home: home,
    //     locale: const Locale('en'),
    //     isAutoRouteEnabled: true,
    //     autoRouterMock: autoRouterMock,
    //     providers: [
    //       BlocProvider<AuthBloc>(create: (context) => authBlocMock),
    //       BlocProvider<AnnouncementBloc>(
    //           create: (context) => announcementBlocMock),
    //       BlocProvider<UserBloc>(create: (context) => mockUserBloc),
    //       BlocProvider<ResetPasswordBloc>(
    //         create: (context) => resetPasswordBlocMock,
    //       ),
    //     ],
    //   );
    // }

    // TODO: remove the placeholder and fix the test cases
    testWidgets('Placeholder', (tester) async {
      await tester.pump();
    });

    // testWidgets('Change Password Page', (tester) async {
    //   final expectedStates = [ResetPasswordState.initial()];
    //   when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //   when(() => resetPasswordBlocMock.state)
    //       .thenReturn(ResetPasswordState.initial());
    //   whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //   await getScopedWidget(const ChangePasswordPage(), tester);
    //   final changePasswordForm = find.byKey(const Key('changePasswordFrom'));
    //   final resetPasswordValidation =
    //       find.byKey(const Key('resetPasswordValidation'));
    //   final resetPasswordButton = find.byKey(const Key('resetPasswordButton'));
    //   final noteText = find.byKey(const Key('noteText'));
    //   expect(changePasswordForm, findsOneWidget);
    //   expect(resetPasswordValidation, findsOneWidget);
    //   expect(noteText, findsOneWidget);
    //   expect(resetPasswordButton, findsOneWidget);
    //   await tester.pump();
    //   final changePasswordButton =
    //       find.byKey(const Key('changePasswordButton'));
    //   expect(changePasswordButton, findsOneWidget);
    // });

    // testWidgets('Change Password Form Tests', (WidgetTester tester) async {
    //   final expectedStates = [ResetPasswordState.initial()];
    //   when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //   when(() => resetPasswordBlocMock.state)
    //       .thenReturn(ResetPasswordState.initial());
    //   whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));

    //   /// Finders for form fields ///
    //   await getScopedWidget(const ChangePasswordPage(), tester);
    //   final oldPasswordTextField =
    //       find.byKey(const Key('oldPasswordTextField'));
    //   final newPasswordTextField =
    //       find.byKey(const Key('newPasswordTextField'));
    //   final confirmPasswordTextField =
    //       find.byKey(const Key('confirmPasswordTextField'));
    //   expect(oldPasswordTextField, findsOneWidget);
    //   expect(newPasswordTextField, findsOneWidget);
    //   expect(confirmPasswordTextField, findsOneWidget);
    //   await tester.pump();

    //   /// Old Password Validation ///
    //   final oldpasswordvalidationtextFinder = find.text('Old Password');
    //   final oldvalidationMessageFinder = find.descendant(
    //       of: oldPasswordTextField, matching: oldpasswordvalidationtextFinder);
    //   expect(oldvalidationMessageFinder, findsOneWidget);
    //   await tester.pump();

    //   await tester.enterText(oldPasswordTextField, 'Auron@2022');
    //   await tester.pump();

    //   final oldPasswordToggle = find.byKey(const Key('oldPasswordToggle'));
    //   expect(oldPasswordToggle, findsOneWidget);
    //   await tester.tap(oldPasswordToggle);
    //   await tester.pump();

    //   final oldPassHintText = find.text('Auron@2022');
    //   expect(oldPassHintText, findsOneWidget);

    //   //await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   //await tester.pump();

    //   //expect(oldpasswordvalidationtextFinder, findsNWidgets(2));

    //   // ..............New Password Validations..................
    //   final newPasswordvalidationtextFinder = find.text('New Password');
    //   final newPassvalidationMessageFinder = find.descendant(
    //       of: newPasswordTextField, matching: newPasswordvalidationtextFinder);
    //   expect(newPassvalidationMessageFinder, findsOneWidget);
    //   await tester.pump();

    //   await tester.enterText(newPasswordTextField, 'abc');

    //   await tester.pumpAndSettle();
    //   final upperCaseErrorMessage =
    //       find.text('Contain at least 1 Upper case character (A to Z)'.tr());
    //   await tester.pump();
    //   expect(upperCaseErrorMessage, findsOneWidget);

    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);

    //   final newPassErrorMessage = find.text('New Password.'.tr());
    //   await tester.pump();
    //   expect(newPassErrorMessage, findsNWidgets(2));

    //   await tester.enterText(newPasswordTextField, 'ABC');
    //   await tester.pump();
    //   final lowerCaseErrorMessage =
    //       find.text('Contain at least 1 Lower case character (a to z)'.tr());
    //   expect(lowerCaseErrorMessage, findsOneWidget);

    //   await tester.enterText(newPasswordTextField, 'Ab');
    //   await tester.pump();
    //   final numericErrorMessage =
    //       find.text('Contain at least a numeric character (0 to 9)'.tr());
    //   await tester.pump();
    //   expect(numericErrorMessage, findsOneWidget);

    //   await tester.enterText(newPasswordTextField, 'Ab2');
    //   await tester.pump();
    //   final specialCharErrorMessage = find.text(
    //       'Contain at least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )'
    //           .tr());
    //   await tester.pump();
    //   expect(specialCharErrorMessage, findsOneWidget);

    //   await tester.enterText(newPasswordTextField, 'Asdf!2');
    //   await tester.pump();
    //   final minLengthErrorMessage =
    //       find.text('Minimum length of 10 characters'.tr());
    //   await tester.pump();
    //   expect(minLengthErrorMessage, findsOneWidget);

    //   await tester.enterText(newPasswordTextField, 'Auron@2022!');
    //   await tester.pump();

    //   final newPasswordToggle = find.byKey(const Key('newPasswordToggle'));
    //   expect(newPasswordToggle, findsOneWidget);
    //   await tester.tap(newPasswordToggle);
    //   await tester.pump();

    //   final newPassHintText = find.text('Auron@2022!');
    //   expect(newPassHintText, findsOneWidget);

    //   // /// Confirm Password validations ///
    //   final confirmPasswordvalidationtextFinder = find.text('Confirm Password');
    //   final confirmPassvalidationMessageFinder = find.descendant(
    //       of: confirmPasswordTextField,
    //       matching: confirmPasswordvalidationtextFinder);
    //   expect(confirmPassvalidationMessageFinder, findsOneWidget);
    //   await tester.pump();

    //   await tester.enterText(confirmPasswordTextField, 'Auron@2022!');
    //   await tester.pump();

    //   final confirmPasswordToggle =
    //       find.byKey(const Key('confirmPasswordToggle'));
    //   expect(confirmPasswordToggle, findsOneWidget);
    //   await tester.tap(confirmPasswordToggle);
    //   await tester.pump();

    //   final confirmPassHintText = find.text('Auron@2022!');
    //   expect(confirmPassHintText, findsNWidgets(2));
    //   await tester.pump();

    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.pump();
    //   expect(confirmPasswordvalidationtextFinder, findsNWidgets(2));

    //   await tester.enterText(oldPasswordTextField, 'Auron@2022');
    //   await tester.enterText(newPasswordTextField, 'Auron@2022!');
    //   await tester.enterText(confirmPasswordTextField, 'Auron@2023!');
    //   final oldPasswordText = find.text('Auron@2022');
    //   final newPasswordText = find.text('Auron@2022!');
    //   final confirmPasswordText = find.text('Auron@2022!');
    //   expect(oldPasswordText, findsOneWidget);
    //   expect(newPasswordText, findsWidgets);
    //   expect(confirmPasswordText, findsWidgets);

    //   final mismatchErrorMessage = find.text('Please make sure your passwords match'.tr());
    //   final validationMessageFinder = find.descendant(
    //       of: confirmPasswordTextField, matching: mismatchErrorMessage);
    //   expect(validationMessageFinder, findsNothing);
    // });

    // /**/

    // testWidgets(
    //   'validate confirm password isRight',
    //   (tester) async {
    //     final expectedStates2 = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2012!'),
    //         newPassword: Password.login('Auron@2023!'),
    //         oldPassword: Password.login('Auron@2022!'),
    //       )
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2022!'),
    //         newPassword: Password.login('Auron@2023!'),
    //         oldPassword: Password.login('Auron@2022!'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates2));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump();

    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2012!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate confirm password mustMatchNewPassword',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2022!', 'Auron@2012!'),
    //         newPassword: Password.login('Auron@2023!'),
    //         oldPassword: Password.login('Auron@2022!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2012!'),
    //         newPassword: Password.login('Auron@2023!'),
    //         oldPassword: Password.login('Auron@2022!'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'Auron@2012!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate confirm/old password orElse',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.reset('abc'),
    //         newPassword: Password.login('Auron@2023!'),
    //         oldPassword: Password.reset('abc'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'Auron@2012!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password orElse',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.reset(
    //           'abc',
    //         ),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustNotMatchOldPassword',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2(
    //           'Auron@2023!',
    //           'Auron@2023!',
    //           User.empty().copyWith(
    //             username: Username('ezrxtest05'),
    //             fullName: FullName.empty().copyWith(
    //               firstName: 'Steve',
    //               lastName: 'Gerrard',
    //             ),
    //           ),
    //         ),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustNotContainUserName',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2('Ezrxtest@05', 'Auron@2023!',
    //             User.empty().copyWith(username: Username('Ezrxtest@05'))),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustOneSpecialCharacter',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2('Aur9', 'Auron@2023!', User.empty()),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustOneNumericCharacter',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2('Aur', 'Auron@2023!', User.empty()),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustOneLowerCaseCharacter',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2('ABC', 'Auron@2023!', User.empty()),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password mustOneUpperCaseCharacter',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword: Password.resetV2('abc', 'Auron@2023!', User.empty()),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets(
    //   'validate new password subceedLength',
    //   (tester) async {
    //     final expectedStates = [
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.login('Auron@2023!'),
    //         newPassword:
    //             Password.resetV2('Auron@20', 'Auron@2023!', User.empty()),
    //         oldPassword: Password.login('Auron@2023!'),
    //       ),
    //     ];
    //     when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //     when(() => resetPasswordBlocMock.state).thenReturn(
    //       ResetPasswordState.initial().copyWith(
    //         confirmPassword: Password.comfirm('Auron@2021!', 'Auron@2022!'),
    //         newPassword: Password.login('abc'),
    //       ),
    //     );
    //     whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
    //     await getScopedWidget(const ChangePasswordPage(), tester);
    //     final oldPasswordTextField =
    //         find.byKey(const Key('oldPasswordTextField'));
    //     final newPasswordTextField =
    //         find.byKey(const Key('newPasswordTextField'));
    //     final confirmPasswordTextField =
    //         find.byKey(const Key('confirmPasswordTextField'));
    //     expect(oldPasswordTextField, findsOneWidget);
    //     expect(newPasswordTextField, findsOneWidget);
    //     expect(confirmPasswordTextField, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('oldPasswordTextField')), 'Auron@2021!');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('newPasswordTextField')), 'abc');
    //     await tester.pump(const Duration(seconds: 2));
    //     await tester.enterText(
    //         find.byKey(const Key('confirmPasswordTextField')), 'Auron@2022!');
    //     await tester.pump(const Duration(seconds: 2));
    //   },
    // );

    // testWidgets('Failure Change Password Button', (tester) async {
    //   final expectedfailureStates = [
    //     ResetPasswordState.initial().copyWith(
    //         passwordResetFailureOrSuccessOption: optionOf(
    //       const Left(ApiFailure.authenticationFailed()),
    //     ))
    //   ];
    //   when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //   when(() => resetPasswordBlocMock.state)
    //       .thenReturn(ResetPasswordState.initial());
    //   whenListen(
    //       resetPasswordBlocMock, Stream.fromIterable(expectedfailureStates));
    //   await getScopedWidget(const ChangePasswordPage(), tester);
    //   await tester.pump();
    //   final changePasswordButton =
    //       find.byKey(const Key('changePasswordButton'));
    //   final errorMessage = find.byKey(const Key('snackBarMessage'));
    //   expect(changePasswordButton, findsOneWidget);
    //   expect(errorMessage, findsOneWidget);
    //   await tester.tap(changePasswordButton);
    // });

    // testWidgets('Success Change Password Button', (tester) async {
    //   final expectedSuccessStates = [
    //     ResetPasswordState.initial().copyWith(
    //         passwordResetFailureOrSuccessOption: optionOf(
    //             const Right(ResetPassword(success: true, status: 'Success'))))
    //   ];
    //   when(() => mockUserBloc.state).thenReturn(UserState.initial());
    //   when(() => resetPasswordBlocMock.state)
    //       .thenReturn(ResetPasswordState.initial());
    //   whenListen(
    //       resetPasswordBlocMock, Stream.fromIterable(expectedSuccessStates));
    //   await getScopedWidget(const ChangePasswordPage(), tester);
    //   await tester.pump();
    //   final changePasswordButton =
    //       find.byKey(const Key('changePasswordButton'));
    //   final errorMessage = find.byKey(const Key('snackBarMessage'));
    //   expect(changePasswordButton, findsOneWidget);
    //   await tester.tap(changePasswordButton);
    //   expect(errorMessage, findsOneWidget);
    // });
  });
}
