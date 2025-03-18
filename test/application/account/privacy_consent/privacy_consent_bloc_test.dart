import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/privacy_consent/privacy_consent_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/user_mock.dart';

class _UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  late UserRepository repository;
  const fakeError = ApiFailure.other('fake-error');
  late PrivacyControl previousPrivacyControl;
  late PrivacyControl newPrivacyControl;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = _UserRepositoryMock();
    previousPrivacyControl = PrivacyControl.empty().copyWith(
      automatedPersonalisation: false,
      viaEmails: true,
      viaPushNotification: false,
      viaSMS: true,
    );
    newPrivacyControl = PrivacyControl.empty().copyWith(
      automatedPersonalisation: true,
      viaEmails: false,
      viaPushNotification: true,
      viaSMS: false,
    );
  });

  group(
    'Privacy Consent Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.initialized(),
        ),
        expect: () => [PrivacyConsentState.initial()],
      );

      blocTest(
        'Fetch Privacy Control Failure',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        setUp: () {
          when(() => repository.getUser()).thenAnswer(
            (_) async => const Left(fakeError),
          );
        },
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.fetch(),
        ),
        expect: () => [
          PrivacyConsentState.initial().copyWith(
            isLoading: true,
          ),
          PrivacyConsentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                fakeError,
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Fetch Privacy Control Success',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.getUser(),
          ).thenAnswer(
            (_) async => Right(
              fakeUserWithPrivacyControl,
            ),
          );
        },
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.fetch(),
        ),
        expect: () => [
          PrivacyConsentState.initial().copyWith(
            isLoading: true,
          ),
          PrivacyConsentState.initial().copyWith(
            currentPrivacyControl: fakeUserWithPrivacyControl.privacyControl,
            previousPrivacyControl: fakeUserWithPrivacyControl.privacyControl,
          ),
        ],
      );

      blocTest(
        'Update Automated Personalisation',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial(),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.updateAutomatedPersonalisation(
            value: true,
          ),
        ),
        expect: () {
          final newPrivacyControl = PrivacyControl.empty().copyWith(
            automatedPersonalisation: true,
          );
          return [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Update Via Emails',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial(),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.updateViaEmail(
            value: true,
          ),
        ),
        expect: () {
          final newPrivacyControl = PrivacyControl.empty().copyWith(
            viaEmails: true,
          );
          return [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Update Via Notifications',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial(),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.updateViaPushNotification(
            value: true,
          ),
        ),
        expect: () {
          final newPrivacyControl = PrivacyControl.empty().copyWith(
            viaPushNotification: true,
          );
          return [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Update Via SMS',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial(),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.updateViaSMS(
            value: true,
          ),
        ),
        expect: () {
          final newPrivacyControl = PrivacyControl.empty().copyWith(
            viaSMS: true,
          );
          return [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Clear Changes',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial().copyWith(
          currentPrivacyControl: newPrivacyControl,
          previousPrivacyControl: previousPrivacyControl,
        ),
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.clear(),
        ),
        expect: () {
          return [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: previousPrivacyControl,
              previousPrivacyControl: previousPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Submit Success',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial().copyWith(
          currentPrivacyControl: newPrivacyControl,
          previousPrivacyControl: previousPrivacyControl,
        ),
        setUp: () {
          when(
            () => repository.updatePrivacyControl(
              automatedPersonalisation:
                  newPrivacyControl.automatedPersonalisation,
              viaEmails: newPrivacyControl.viaEmails,
              viaPushNotification: newPrivacyControl.viaPushNotification,
              viaSMS: newPrivacyControl.viaSMS,
            ),
          ).thenAnswer(
            (_) async => const Right(
              true,
            ),
          );
        },
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.submit(),
        ),
        expect: () {
          return [
            PrivacyConsentState.initial().copyWith(
              isLoading: true,
              submitFailureOrSuccessOption: none(),
              currentPrivacyControl: newPrivacyControl,
              previousPrivacyControl: previousPrivacyControl,
            ),
            PrivacyConsentState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Right(true),
              ),
              currentPrivacyControl: newPrivacyControl,
              previousPrivacyControl: newPrivacyControl,
            ),
          ];
        },
      );

      blocTest(
        'Submit Failure',
        build: () => PrivacyConsentBloc(
          userRepository: repository,
        ),
        seed: () => PrivacyConsentState.initial().copyWith(
          currentPrivacyControl: newPrivacyControl,
          previousPrivacyControl: previousPrivacyControl,
        ),
        setUp: () {
          when(
            () => repository.updatePrivacyControl(
              automatedPersonalisation:
                  newPrivacyControl.automatedPersonalisation,
              viaEmails: newPrivacyControl.viaEmails,
              viaPushNotification: newPrivacyControl.viaPushNotification,
              viaSMS: newPrivacyControl.viaSMS,
            ),
          ).thenAnswer(
            (_) async => const Left(
              fakeError,
            ),
          );
        },
        act: (PrivacyConsentBloc bloc) => bloc.add(
          const PrivacyConsentEvent.submit(),
        ),
        expect: () {
          return [
            PrivacyConsentState.initial().copyWith(
              isLoading: true,
              submitFailureOrSuccessOption: none(),
              currentPrivacyControl: newPrivacyControl,
              previousPrivacyControl: previousPrivacyControl,
            ),
            PrivacyConsentState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Left(fakeError),
              ),
              currentPrivacyControl: newPrivacyControl,
              previousPrivacyControl: previousPrivacyControl,
            ),
          ];
        },
      );

      test('Test enableSubmit', () {
        final state = PrivacyConsentState.initial().copyWith(
          currentPrivacyControl: previousPrivacyControl,
          previousPrivacyControl: previousPrivacyControl,
        );
        final enableSubmit = state.enableSubmit;
        expect(enableSubmit, false);
      });
    },
  );
}
