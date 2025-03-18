import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

final locator = GetIt.instance;

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeJWT = JWT('fake-success');
  final fakeRefresh = JWT('fake-refresh');
  group('Auth Bloc ', () {
    setUpAll(() {
      locator.registerLazySingleton(() => LocalAuthentication());
    });
    blocTest(
      'Unauthenticated On Auth Check Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.tokenExpired()),
        );
        when(() => authRepoMock.getRefreshToken()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.getAccessToken(fakeRefresh)).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.unauthenticated()],
    );
    blocTest(
      'Authenticated On Auth Check Test ',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenReturn(const Right(false));
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable()).thenAnswer(
          (invocation) async =>
              const Left(ApiFailure.deviceNotSupportBiometric()),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.authenticated()],
    );

    blocTest(
      'BioCheck canBeAuthenticatedAndBioAvailable error Test ',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenReturn(const Right(false));
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable()).thenAnswer(
          (invocation) async =>
              const Left(ApiFailure.deviceNotSupportBiometric()),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.bioCheck()),
      expect: () => [const AuthState.authenticated()],
    );
    blocTest(
      'init',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenReturn(const Right(true));
        when(() => authRepoMock.logout())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.checkBiometricPermission())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.invalidBiometric()),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.init()),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );

    blocTest(
      'Authenticated On Auth Check Test With Biometric Failure ',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.checkBiometricPermission())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.invalidBiometric()),
        );
        when(() => authRepoMock.logout())
            .thenAnswer((invocation) async => const Right(unit));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );
    blocTest(
      'Authenticated On Auth Check Test With Biometric Eligibility Failure ',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.initCredStorage())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.initOkta())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.isBiometricEnabled())
            .thenReturn(const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication())
            .thenAnswer((invocation) async => const Right(true));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [
        const AuthState.authenticated(),
      ],
    );
    blocTest(
      'Unauthenticated On Refresh Token Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.tokenExpired()),
        );
        when(() => authRepoMock.getRefreshToken()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );
    blocTest(
      'Authenticated On when biometric eligibility check is on error',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.initCredStorage())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.initOkta())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Error')),
        );
        when(() => authRepoMock.getRefreshToken())
            .thenAnswer((invocation) async => Right(JWT('refresh')));
        when(() => authRepoMock.getAccessToken(JWT('refresh'))).thenAnswer(
          (invocation) async => Right(
            Login(
              access: JWT('token'),
              refresh: JWT('refresh'),
              user: User.empty(),
            ),
          ),
        );
        when(
          () => authRepoMock.storeJWT(
            access: JWT('token'),
            refresh: JWT('refresh'),
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.isBiometricEnabled())
            .thenReturn(const Left(ApiFailure.other('Error')));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [
        const AuthState.authenticated(),
      ],
    );
    blocTest(
      'Unauthenticated On EZRX JWT Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.tokenExpired()),
        );
        when(() => authRepoMock.getRefreshToken())
            .thenAnswer((invocation) async => Right(fakeRefresh));
        when(() => authRepoMock.getAccessToken(fakeRefresh)).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.unauthenticated()],
    );
    blocTest(
      'Authenticated On EZRX JWT Test isEnabled is true',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.tokenExpired()),
        );
        when(() => authRepoMock.getRefreshToken())
            .thenAnswer((invocation) async => Right(fakeRefresh));
        when(() => authRepoMock.getAccessToken(fakeRefresh)).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );
        when(
          () => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication())
            .thenAnswer((invocation) async => const Right(true));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.authenticated()],
    );

    blocTest(
      'Authenticated On EZRX JWT Test isEnabled is false',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid()).thenAnswer(
          (invocation) async => const Left(ApiFailure.tokenExpired()),
        );
        when(() => authRepoMock.getRefreshToken())
            .thenAnswer((invocation) async => Right(fakeRefresh));
        when(() => authRepoMock.getAccessToken(fakeRefresh)).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );
        when(
          () => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(false));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.authenticated()],
    );

    blocTest(
      'Logout Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable()).thenAnswer(
          (invocation) async =>
              const Left(ApiFailure.deviceNotSupportBiometric()),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(false));
        when(() => authRepoMock.logout())
            .thenAnswer((invocation) async => const Right(unit));
      },
      act: (AuthBloc bloc) async {
        bloc.add(const AuthEvent.authCheck());
        await Future.delayed(const Duration(milliseconds: 0));
        bloc.add(const AuthEvent.logout());
      },
      expect: () =>
          [const AuthState.authenticated(), const AuthState.unauthenticated()],
    );
    blocTest(
      'visitedAppSettings Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable()).thenAnswer(
          (invocation) async =>
              const Left(ApiFailure.deviceNotSupportBiometric()),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(false));
        when(() => authRepoMock.logout())
            .thenAnswer((invocation) async => const Right(unit));
      },
      act: (AuthBloc bloc) async {
        bloc.add(const AuthEvent.visitedAppSettings());
      },
      expect: () => [const AuthState.visitedAppSettings()],
    );
    blocTest(
      'checkIfBiometricDenied Test failed',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initCredStorage()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.initOkta()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.checkBiometricPermission()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => authRepoMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.invalidBiometric()),
        );
        when(() => authRepoMock.logout())
            .thenAnswer((invocation) async => const Right(unit));
      },
      act: (AuthBloc bloc) async {
        bloc.add(const AuthEvent.checkIfBiometricDenied());
      },
      expect: () => [const AuthState.biometricDenied()],
    );
  });
}
