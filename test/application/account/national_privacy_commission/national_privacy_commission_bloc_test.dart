import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/national_privacy_commission/national_privacy_commission_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PoAttachmentRepositoryMock extends Mock
    implements PoAttachmentRepository {}

void main() {
  late PoAttachmentRepository repository;
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = PoAttachmentRepositoryMock();
  });

  group(
    'National Privacy Commission Bloc',
    () {
      blocTest(
        'Initialize event',
        build: () =>
            NationalPrivacyCommissionBloc(poAttachmentRepository: repository),
        act: (bloc) =>
            bloc.add(const NationalPrivacyCommissionEvent.initialized()),
        expect: () => [NationalPrivacyCommissionState.initial()],
      );

      blocTest(
        'Save Images event failure',
        build: () =>
            NationalPrivacyCommissionBloc(poAttachmentRepository: repository),
        act: (bloc) => bloc.add(
          const NationalPrivacyCommissionEvent.saveImages(
            images: <String>[],
          ),
        ),
        setUp: () {
          when(
            () => repository.saveAssetImagesToGallery(
              fileList: <String>[],
            ),
          ).thenAnswer((_) async => const Left(fakeError));
        },
        expect: () => [
          NationalPrivacyCommissionState.initial().copyWith(isSaving: true),
          NationalPrivacyCommissionState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );

      blocTest(
        'Save Images event success',
        build: () =>
            NationalPrivacyCommissionBloc(poAttachmentRepository: repository),
        act: (bloc) => bloc.add(
          const NationalPrivacyCommissionEvent.saveImages(
            images: <String>[],
          ),
        ),
        setUp: () {
          when(
            () => repository.saveAssetImagesToGallery(
              fileList: <String>[],
            ),
          ).thenAnswer((_) async => const Right(true));
        },
        expect: () => [
          NationalPrivacyCommissionState.initial().copyWith(isSaving: true),
          NationalPrivacyCommissionState.initial(),
        ],
      );
    },
  );
}
