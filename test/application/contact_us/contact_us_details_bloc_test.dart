import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/contact_us/contact_us_details_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/repository/contact_us_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ContactUsDetailsRepositoryMock extends Mock
    implements ContactUsDetailsRepository {}

void main() {
  late ContactUsDetailsRepositoryMock repository;
  late ContactUsDetails contactUsDetails;
  final contactUsDetailsState = ContactUsDetailsState.initial();
  final fakeMarket = AppMarket('KH');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ContactUsDetailsRepositoryMock();
    contactUsDetails = await ContactUsDetailsLocalDataSource()
        .getContactUsDetails(fakeMarket.country);
  });

  group('Contact Us Details Bloc', () {
    blocTest(
      'Get Contact Us Details fail',
      build: () => ContactUsDetailsBloc(
        contactUsRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getContactUsDetails(
            market: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ContactUsDetailsBloc bloc) => bloc
        ..add(
          ContactUsDetailsEvent.fetch(
            market: fakeMarket,
          ),
        ),
      expect: () => [
        contactUsDetailsState.copyWith(isLoading: true),
        contactUsDetailsState,
      ],
    );

    blocTest(
      'Get Contact Us Details Success',
      build: () => ContactUsDetailsBloc(
        contactUsRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getContactUsDetails(
            market: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            contactUsDetails,
          ),
        );
      },
      act: (ContactUsDetailsBloc bloc) => bloc
        ..add(
          ContactUsDetailsEvent.fetch(
            market: fakeMarket,
          ),
        ),
      expect: () => [
        contactUsDetailsState.copyWith(isLoading: true),
        contactUsDetailsState.copyWith(
          contactUsDetails: contactUsDetails,
        ),
      ],
    );
  });
}
