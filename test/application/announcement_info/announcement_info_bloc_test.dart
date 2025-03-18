import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../common_mock_data/sales_organsiation_mock.dart';

class AnnouncementInfoRepositoryRepo extends Mock
    implements AnnouncementInfoRepository {}

void main() {
  late AnnouncementInfoRepositoryRepo repository;
  late AnnouncementArticleInfo announcementInfoMock;
  final announcementInfoState = AnnouncementInfoState.initial();
  final salesOrg = SalesOrg('');
  final user = User.empty();
  late Config config;
  late List<String> announcementArticleTag;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementInfoRepositoryRepo();
    config = Config()..appFlavor = Flavor.mock;
    announcementInfoMock =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
    announcementArticleTag = await AnnouncementArticleTagLocalDataSource()
        .getAnnouncementArticleTags();
  });

  group('Announcement Info Bloc', () {
    blocTest(
      'Get announcement info Initialize',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoMock,
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc.add(
        AnnouncementInfoEvent.initialize(user: user, salesOrg: salesOrg),
      ),
      expect: () => [
        announcementInfoState.copyWith(user: user, salesOrg: salesOrg),
        announcementInfoState.copyWith(
          isLoading: true,
          user: user,
          salesOrg: salesOrg,
        ),
        announcementInfoState.copyWith(
          canLoadMore: false,
          announcementInfo: announcementInfoMock,
          user: user,
          salesOrg: salesOrg,
        ),
      ],
    );
    blocTest(
      'Get announcement info fail',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          const AnnouncementInfoEvent.fetch(),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          canLoadMore: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get announcement info Success',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoMock,
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          const AnnouncementInfoEvent.fetch(),
        ),
      expect: () => [
        announcementInfoState.copyWith(isLoading: true),
        announcementInfoState.copyWith(
          canLoadMore: false,
          announcementInfo: announcementInfoMock,
        ),
      ],
    );
    blocTest(
      'Get announcement info loadmore Success',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      seed: () => announcementInfoState.copyWith(
        announcementInfo: announcementInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: announcementInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementInfoMock,
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          const AnnouncementInfoEvent.loadMore(),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          isLoading: true,
          announcementInfo: announcementInfoMock,
          canLoadMore: true,
        ),
        announcementInfoState.copyWith(
          canLoadMore: false,
          announcementInfo: announcementInfoMock.copyWith(
            announcementList: [
              ...announcementInfoMock.announcementList,
              ...announcementInfoMock.announcementList,
            ],
          ),
        ),
      ],
    );
    blocTest(
      'Get announcement info loadmore fail',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      seed: () => announcementInfoState.copyWith(
        announcementInfo: announcementInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncement(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: announcementInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          const AnnouncementInfoEvent.loadMore(),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          isLoading: true,
          announcementInfo: announcementInfoMock,
          canLoadMore: true,
        ),
        announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );
    blocTest(
      'Get announcement info updateSearchKey',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      act: (AnnouncementInfoBloc bloc) => bloc
        ..add(
          AnnouncementInfoEvent.updateSearchKey(
            searchKey: SearchKey.search('fake_searchKey'),
          ),
        ),
      expect: () => [
        announcementInfoState.copyWith(
          searchKey: SearchKey.search('fake_searchKey'),
        ),
      ],
    );

    blocTest(
      'Get announcement info setCategoryKey',
      build: () => AnnouncementInfoBloc(
        announcementInfoRepository: repository,
        config: config,
      ),
      seed: () => announcementInfoState.copyWith(
        announcementInfo: announcementInfoMock,
        user: user,
        salesOrg: fakeMYSalesOrg,
      ),
      act: (AnnouncementInfoBloc bloc) => bloc.add(
        AnnouncementInfoEvent.setCategoryKey(
          categoryKeyList: announcementArticleTag,
        ),
      ),
      expect: () => [
        announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock,
          user: user,
          salesOrg: fakeMYSalesOrg,
          categoryKeyList: announcementArticleTag,
        ),
      ],
    );

    test(
      'AnnouncementInfo State searchedAnnouncementList',
      () {
        final announcementInfo = announcementInfoState.copyWith(
          announcementInfo: announcementInfoMock,
          searchKey: SearchKey.search(
            announcementInfoMock.announcementList.first.title.toLowerCase(),
          ),
        );
        expect(
          announcementInfo.searchedAnnouncementList,
          announcementInfoMock.announcementList.where(
            (element) => element.title.contains(
              announcementInfoMock.announcementList.first.title,
            ),
          ),
        );
      },
    );
  });
}
