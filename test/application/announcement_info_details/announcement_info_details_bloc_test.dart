import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementInfoRepositoryRepo extends Mock
    implements AnnouncementInfoRepository {}

void main() {
  late AnnouncementInfoRepositoryRepo repository;
  late AnnouncementArticleInfo announcementInfoMock;
  late AnnouncementInfoDetails announcementInfoDetailsMock;
  final announcementInfoState = AnnouncementInfoDetailsState.initial();
  final salesOrg = SalesOrg('');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementInfoRepositoryRepo();
    announcementInfoMock =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
    announcementInfoDetailsMock =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfoDetails();
  });

  group('Announcement Info Details Bloc', () {
    blocTest(
      'Get announcement info Details fail',
      build: () => AnnouncementInfoDetailsBloc(
        announcementInfoRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementDetails(
            salesOrg: salesOrg,
            announcementId: announcementInfoMock.announcementList.first.id,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementInfoDetailsBloc bloc) => bloc
        ..add(
          AnnouncementInfoDetailsEvent.fetch(
            salesOrg: salesOrg,
            itemId: announcementInfoMock.announcementList.first.id,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get announcement info Details Success',
      build: () => AnnouncementInfoDetailsBloc(
        announcementInfoRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementDetails(
            salesOrg: salesOrg,
            announcementId: announcementInfoMock.announcementList.first.id,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoDetailsMock,
          ),
        );
      },
      act: (AnnouncementInfoDetailsBloc bloc) => bloc
        ..add(
          AnnouncementInfoDetailsEvent.fetch(
            salesOrg: salesOrg,
            itemId: announcementInfoMock.announcementList.first.id,
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          announcementInfoDetails: announcementInfoDetailsMock,
        ),
      ],
    );
  });
}
