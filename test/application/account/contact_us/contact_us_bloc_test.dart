import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/contact_us_repository.dart';

class ContactUsRepositoryMock extends Mock implements ContactUsRepository {}

void main() {
  late ContactUsRepositoryMock repositoryMock;

  const fakeUserName = 'fake-user-name';
  const fakeEmail = 'fake-email@a.com';
  const fakeContactNumber = '0123456';
  const fakeMessage = 'fake-message';
  final fakeMarket = AppMarket('fake');
  final contactUs = ContactUs.empty();
  final contactUsStateWithMarket =
      ContactUsState.initial().copyWith(appMarket: fakeMarket);

  final fullDataContactUs = contactUs.copyWith(
    username: Username(fakeUserName),
    email: EmailAddress(fakeEmail),
    contactNumber: PhoneNumber(fakeContactNumber),
    message: StringValue(fakeMessage),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repositoryMock = ContactUsRepositoryMock();
  });

  group('Contact Us Bloc', () {
    blocTest(
      'initalize test',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      act: (ContactUsBloc bloc) => bloc.add(
        ContactUsEvent.initialized(market: fakeMarket),
      ),
      expect: () => [
        contactUsStateWithMarket,
      ],
    );

    blocTest(
      'onUsernameChange test',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.onUsernameChange(
          newValue: fakeUserName,
        ),
      ),
      expect: () => [
        ContactUsState.initial().copyWith(
          contactUs: contactUs.copyWith(
            username: Username(fakeUserName),
          ),
        ),
      ],
    );

    blocTest(
      'onEmailChange test',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.onEmailChange(
          newValue: fakeEmail,
        ),
      ),
      expect: () => [
        ContactUsState.initial().copyWith(
          contactUs: contactUs.copyWith(
            email: EmailAddress(fakeEmail),
          ),
        ),
      ],
    );

    blocTest(
      'onContactNumberChange test',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.onContactNumberChange(
          newValue: fakeContactNumber,
        ),
      ),
      expect: () => [
        ContactUsState.initial().copyWith(
          contactUs: contactUs.copyWith(
            contactNumber: PhoneNumber(fakeContactNumber),
          ),
        ),
      ],
    );

    blocTest(
      'onMessageChange test',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.onMessageChange(
          newValue: fakeMessage,
        ),
      ),
      expect: () => [
        ContactUsState.initial().copyWith(
          contactUs: contactUs.copyWith(
            message: StringValue(fakeMessage),
          ),
        ),
      ],
    );

    blocTest(
      'Submit contact us with invalid data',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      seed: () => contactUsStateWithMarket.copyWith(
        contactUs: contactUs,
      ),
      setUp: () {
        when(
          () => repositoryMock.submit(
            contactUs: contactUs,
            appMarket: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.submit(),
      ),
      expect: () => [
        contactUsStateWithMarket.copyWith(
          showErrorMessage: true,
        ),
      ],
    );

    blocTest(
      'Submit contact us fail',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      seed: () => contactUsStateWithMarket.copyWith(
        contactUs: fullDataContactUs,
      ),
      setUp: () {
        when(
          () => repositoryMock.submit(
            contactUs: fullDataContactUs,
            appMarket: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.submit(),
      ),
      expect: () => [
        contactUsStateWithMarket.copyWith(
          contactUs: fullDataContactUs,
          isSubmitting: true,
        ),
        contactUsStateWithMarket.copyWith(
          contactUs: fullDataContactUs,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Submit contact us Success',
      build: () => ContactUsBloc(
        contactUsRepository: repositoryMock,
      ),
      seed: () => contactUsStateWithMarket.copyWith(
        contactUs: fullDataContactUs,
      ),
      setUp: () {
        when(
          () => repositoryMock.submit(
            contactUs: fullDataContactUs,
            appMarket: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            true,
          ),
        );
      },
      act: (ContactUsBloc bloc) => bloc.add(
        const ContactUsEvent.submit(),
      ),
      expect: () => [
        contactUsStateWithMarket.copyWith(
          contactUs: fullDataContactUs,
          isSubmitting: true,
        ),
        contactUsStateWithMarket.copyWith(
          responseFlag: true,
          contactUs: fullDataContactUs.copyWith(
            contactNumber: PhoneNumber(''),
            message: StringValue(''),
          ),
          isSubmitting: false,
          apiFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
}
