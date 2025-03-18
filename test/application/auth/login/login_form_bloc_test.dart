import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

class DeviceRepoMock extends Mock implements DeviceRepository {}

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final DeviceRepository deviceRepoMock = DeviceRepoMock();
  final fakeUser = Username('fake-user');
  final fakePassword = Password.login('fake-password');
  final fakeJWT = JWT('fake-success');
  final fakeRefresh = JWT('fake-refresh');
  // const fakeOktaToken = 'fake-okta-token';
  late Login loginMockData;
  // late Login loginWithOktaMockData;
  // late Login proxyLoginWithUsername;

  var loginFormState = LoginFormState.initial();

  const mockDefaultCurrentMarket = 'vn';
  final credMock = Cred(
    username: fakeUser,
    password: fakePassword,
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    loginMockData = await AuthLocalDataSource().loginWithPassword();
    // loginWithOktaMockData = await AuthLocalDataSource().loginWithOktaToken();
    // proxyLoginWithUsername = await AuthLocalDataSource().proxyLoginWithUsername(
    //   username: fakeUser.getValue(),
    // );
  });

  group('Login Form Bloc', () {
    blocTest(
      'Load last saved cred success with not empty default currentMarket',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => deviceRepoMock.getCurrentMarket()).thenAnswer(
          (invocation) async => const Right(mockDefaultCurrentMarket),
        );
        when(() => authRepoMock.loadCredential())
            .thenAnswer((invocation) async => Right(credMock));
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket(mockDefaultCurrentMarket),
          ),
        ).thenAnswer(
          (_) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc.add(
        LoginFormEvent.loadLastSavedCred(
          AppMarket.defaultMarket(),
        ),
      ),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          currentMarket: AppMarket.defaultMarket(),
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          authFailureOrSuccessOption: optionOf(const Right(unit)),
          isSubmitting: false,
          currentMarket: AppMarket.vietnam(),
        ),
      ],
    );

    blocTest(
      'Load last saved cred success with empty default currentMarket',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => deviceRepoMock.getCurrentMarket())
            .thenAnswer((invocation) async => const Right(''));
        when(() => authRepoMock.loadCredential())
            .thenAnswer((invocation) async => Right(credMock));
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket(mockDefaultCurrentMarket),
          ),
        ).thenAnswer(
          (_) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc.add(
        LoginFormEvent.loadLastSavedCred(
          AppMarket.vietnam(),
        ),
      ),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          currentMarket: AppMarket.defaultMarket(),
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          authFailureOrSuccessOption: optionOf(const Right(unit)),
          currentMarket: AppMarket.vietnam(),
        ),
      ],
    );

    blocTest(
      'Load last saved cred success and get currentMarket failure',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => deviceRepoMock.getCurrentMarket())
            .thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
        when(() => authRepoMock.loadCredential())
            .thenAnswer((_) async => Right(credMock));
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(LoginFormEvent.loadLastSavedCred(AppMarket.vietnam())),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
        ),
      ],
    );

    blocTest(
      'Create bloc and load last saved cred success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential())
            .thenAnswer((invocation) async => Right(credMock));
        when(() => deviceRepoMock.getCurrentMarket())
            .thenAnswer((invocation) async => const Right(''));
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket(AppMarket.defaultMarket().getValue()),
          ),
        ).thenAnswer(
          (_) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc.add(
        LoginFormEvent.loadLastSavedCred(
          AppMarket.defaultMarket(),
        ),
      ),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
        ),
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          authFailureOrSuccessOption: optionOf(const Right(unit)),
          currentMarket: AppMarket.defaultMarket(),
        ),
      ],
    );

    blocTest(
      'Create bloc and load last saved cred failure',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(ApiFailure.accountLocked()),
        );
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(false));
      },
      act: (LoginFormBloc bloc) {
        bloc.add(
          LoginFormEvent.loadLastSavedCred(
            AppMarket.defaultMarket(),
          ),
        );
        expect(bloc.state.username, Username(''));
      },
    );

    blocTest(
      'Create bloc and load last saved cred fail',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) => bloc.add(
        LoginFormEvent.loadLastSavedCred(
          AppMarket.defaultMarket(),
        ),
      ),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
        ),
        loginFormState.copyWith(
          isSubmitting: false,
        ),
      ],
    );

    blocTest(
      'Change username',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.usernameChanged('new-username-fake')),
      expect: () => [
        loginFormState.copyWith(
          username: Username('new-username-fake'),
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Change password',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.passwordChanged('new-password-fake')),
      expect: () => [
        loginFormState.copyWith(
          password: Password.login('new-password-fake'),
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Change password visible',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.passwordVisibilityChanged()),
      expect: () => [
        loginFormState.copyWith(
          passwordVisible: !loginFormState.passwordVisible,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Change remember password',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.rememberCheckChanged()),
      expect: () => [
        loginFormState.copyWith(
          rememberPassword: !loginFormState.rememberPassword,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Login with okta button failed',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(() => authRepoMock.loginWithOkta()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.loginWithOktaButtonPressed()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with okta button success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loginWithOkta()).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
        when(() => authRepoMock.getOktaAccessToken()).thenAnswer(
          (invocation) async => Right(
            fakeJWT,
          ),
        );
        when(() => authRepoMock.getEZRXJWT(fakeJWT)).thenAnswer(
          (invocation) async => Right(
            loginMockData,
          ),
        );
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket.defaultMarket(),
          ),
        ).thenAnswer(
          (_) async => const Right(unit),
        );
        when(
          () => authRepoMock.storeJWT(
            access: loginMockData.access,
            refresh: loginMockData.refresh,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.loginWithOktaButtonPressed()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
          showErrorMessages: false,
          authFailureOrSuccessOption: none(),
          currentMarket: AppMarket.defaultMarket(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(Right(loginMockData)),
          currentMarket: AppMarket.defaultMarket(),
        ),
      ],
    );

    blocTest(
      'refreshOktaToken failed',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.getOktaAccessToken()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.refreshOktaToken()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'refreshOktaToken success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.getOktaAccessToken()).thenAnswer(
          (invocation) async => Right(
            fakeJWT,
          ),
        );
        when(() => authRepoMock.getEZRXJWT(fakeJWT)).thenAnswer(
          (invocation) async => Right(
            loginMockData,
          ),
        );
        when(
          () => authRepoMock.storeJWT(
            access: loginMockData.access,
            refresh: loginMockData.refresh,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.refreshOktaToken()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(Right(loginMockData)),
        ),
      ],
    );
    blocTest(
      'exchanhgeEZRXToken success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.getEZRXJWT(fakeJWT)).thenAnswer(
          (invocation) async => Right(
            loginMockData,
          ),
        );
        when(
          () => authRepoMock.storeJWT(
            access: loginMockData.access,
            refresh: loginMockData.refresh,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(LoginFormEvent.exchanhgeEZRXToken(fakeJWT)),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(Right(loginMockData)),
        ),
      ],
    );

    blocTest(
      'exchanhgeEZRXToken failed',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.getEZRXJWT(fakeJWT)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(LoginFormEvent.exchanhgeEZRXToken(fakeJWT)),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with email fail',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.login(username: fakeUser, password: fakePassword),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with email success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        loginFormState = LoginFormState.initial();
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.login(username: fakeUser, password: fakePassword),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(() => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh))
            .thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.deleteCredential()).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          username: Username(''),
          password: Password.login(''),
          authFailureOrSuccessOption: optionOf(
            Right(
              Login(
                access: fakeJWT,
                refresh: fakeRefresh,
                user: User.empty(),
              ),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with email local success',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        loginFormState = LoginFormState.initial();

        when(
          () => authRepoMock.loadCredential(),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.login(
            username: fakeUser,
            password: fakePassword,
          ),
        ).thenAnswer(
          (invocation) async => Right(loginMockData),
        );

        when(
          () => authRepoMock.storeJWT(
            access: loginMockData.access,
            refresh: loginMockData.refresh,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(
          () => authRepoMock.deleteCredential(),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          username: Username(''),
          password: Password.login(''),
          authFailureOrSuccessOption: optionOf(Right(loginMockData)),
        ),
      ],
    );

    blocTest(
      'Login with email success with remember password',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        loginFormState = LoginFormState.initial();
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.login(username: fakeUser, password: fakePassword),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(() => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh))
            .thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.deleteCredential()).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(
          () => authRepoMock.storeCredential(
            username: fakeUser,
            password: fakePassword,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.rememberCheckChanged())
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: false,
          rememberPassword: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          rememberPassword: true,
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          rememberPassword: true,
          username: Username(''),
          password: Password.login(''),
          authFailureOrSuccessOption: optionOf(
            Right(
              Login(
                access: fakeJWT,
                refresh: fakeRefresh,
                user: User.empty(),
              ),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with empty username input',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        loginFormState = LoginFormState.initial();
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.login(
            username: Username(''),
            password: fakePassword,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState.copyWith(
          username: Username(''),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );
    blocTest(
      'fetchCurrentMarket failed test',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => deviceRepoMock.getCurrentMarket(),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc..add(const LoginFormEvent.fetchCurrentMarket()),
      expect: () => [
        loginFormState.copyWith(
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetchCurrentMarket success test',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(
          () => deviceRepoMock.getCurrentMarket(),
        ).thenAnswer(
          (invocation) async => const Right(
            'fake-market',
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc..add(const LoginFormEvent.fetchCurrentMarket()),
      expect: () => [
        loginFormState.copyWith(
          currentMarket: AppMarket('fake-market'),
          authFailureOrSuccessOption: optionOf(
            const Right(
              'fake-market',
            ),
          ),
        ),
      ],
    );
    blocTest(
      'setCurrentMarket success test',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket.vietnam(),
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc..add(LoginFormEvent.setCurrentMarket(AppMarket.vietnam())),
      expect: () => [
        loginFormState.copyWith(
          currentMarket: AppMarket.vietnam(),
          authFailureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ],
    );

    blocTest(
      'setCurrentMarket failure test',
      build: () => LoginFormBloc(
        authRepository: authRepoMock,
        deviceRepository: deviceRepoMock,
      ),
      setUp: () {
        when(
          () => deviceRepoMock.setCurrentMarket(
            currentMarket: AppMarket.vietnam(),
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (LoginFormBloc bloc) =>
          bloc..add(LoginFormEvent.setCurrentMarket(AppMarket.vietnam())),
      expect: () => [
        loginFormState.copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.poorConnection())),
        ),
      ],
    );
  });
}
