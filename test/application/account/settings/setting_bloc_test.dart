import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepositoryMock;

  group('Sales Rep Bloc Testing', () {
    setUp(() {
      authRepositoryMock = AuthRepositoryMock();
    });
    blocTest<SettingBloc, SettingState>(
      'For "fetchBiometricFlag" Event when Biometric is Enabled',
      setUp: () => when(() => authRepositoryMock.isBiometricEnabled())
          .thenReturn(const Right(true)),
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.fetchBiometricFlag()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricEnable: true,
          isBiometricPossible: true,
        ),
      ],
    );
    blocTest<SettingBloc, SettingState>(
      'For "fetchBiometricFlag" Event when Biometric is Disabled',
      setUp: () => when(() => authRepositoryMock.isBiometricEnabled())
          .thenReturn(const Right(false)),
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.fetchBiometricFlag()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricEnable: false,
          isBiometricPossible: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "fetchBiometricFlag" Event when Fetching Biometric is having error',
      setUp: () => when(() => authRepositoryMock.isBiometricEnabled())
          .thenReturn(const Left(ApiFailure.other('Fake Error'))),
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.fetchBiometricFlag()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricEnable: false,
          isBiometricPossible: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event when putting Biometric as true',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication())
            .thenAnswer((invocation) async => const Right(true));
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: true,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(true));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: true,
        ),
      ),
      expect: () => [
        SettingState.initial(),
        SettingState.initial().copyWith(
          isBiometricEnable: true,
          isBiometricPossible: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event when putting Biometric as false',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication())
            .thenAnswer((invocation) async => const Right(true));
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: false,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: false,
        ),
      ),
      expect: () => [
        SettingState.initial(),
        SettingState.initial().copyWith(
          isBiometricEnable: false,
          isBiometricPossible: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event when putting Biometric as false and doBiometricAuthentication return false',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication())
            .thenAnswer((invocation) async => const Right(false));
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: false,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: false,
        ),
      ),
      expect: () => [
        SettingState.initial(),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event failure when putting Biometric as true',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake_error')),
        );
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: true,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(true));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: true,
        ),
      ),
      expect: () => [
        SettingState.initial(),
        SettingState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake_error'))),
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event failure when putting Biometric as false',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake_error')),
        );
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: false,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: false,
        ),
      ),
      expect: () => [
        SettingState.initial(),
        SettingState.initial().copyWith(
          isBiometricEnable: false,
          isBiometricPossible: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake_error'))),
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "toggleBiometric" Event failure when isBiometricEnable as true',
      setUp: () {
        when(() => authRepositoryMock.doBiometricAuthentication()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake_error')),
        );
        when(
          () => authRepositoryMock.putBiometricEnabledState(
            isBiometricEnable: false,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(false));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(true));
      },
      seed: () => SettingState.initial().copyWith(
        isBiometricEnable: true,
      ),
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(
        const SettingEvent.toggleBiometric(
          isBiometricEnabled: false,
        ),
      ),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricEnable: true,
          isBiometricPossible: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "checkIfBiometricPossible" Event when canBeAuthenticatedAndBioAvailable is Error',
      setUp: () {
        when(() => authRepositoryMock.canShowBiometricToggle())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepositoryMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Error')),
        );
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.checkIfBiometricPossible()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricPossible: true,
          isBiometricEnable: true,
        ),
      ],
    );
    blocTest<SettingBloc, SettingState>(
      'For "checkIfBiometricPossible" Event when canBeAuthenticatedAndBioAvailable is true',
      setUp: () {
        when(() => authRepositoryMock.canShowBiometricToggle())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepositoryMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenReturn(const Right(true));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.checkIfBiometricPossible()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricPossible: true,
          isBiometricEnable: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "checkIfBiometricPossible" Event when canBeAuthenticatedAndBioAvailable is false',
      setUp: () {
        when(() => authRepositoryMock.canShowBiometricToggle())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepositoryMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.checkIfBiometricPossible()),
      expect: () => [
        SettingState.initial().copyWith(
          isBiometricPossible: true,
          isBiometricEnable: true,
        ),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "checkIfBiometricPossible" Event when canBeAuthenticatedAndBioAvailable is false',
      setUp: () {
        when(() => authRepositoryMock.canShowBiometricToggle())
            .thenAnswer((invocation) async => const Right(false));
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepositoryMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.checkIfBiometricPossible()),
      expect: () => [
        SettingState.initial(),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'For "checkIfBiometricPossible" Event failure when canBeAuthenticatedAndBioAvailable is false',
      setUp: () {
        when(() => authRepositoryMock.canShowBiometricToggle()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake_error')),
        );
        when(() => authRepositoryMock.isBiometricEnabled())
            .thenAnswer((invocation) => const Right(true));
        when(() => authRepositoryMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(false));
      },
      build: () => SettingBloc(authRepository: authRepositoryMock),
      act: (bloc) => bloc.add(const SettingEvent.checkIfBiometricPossible()),
      expect: () => [
        SettingState.initial(),
      ],
    );
  });
}
