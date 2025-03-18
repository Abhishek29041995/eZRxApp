import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_article_tag_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/sales_organsiation_mock.dart';

class AnnouncementArticleTagRepositoryMock extends Mock
    implements AnnouncementArticleTagRepository {}

void main() {
  late AnnouncementArticleTagRepository repository;
  final announcementFilterState = AnnouncementFilterState.initial();
  late List<String> announcementArticleTags;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementArticleTagRepositoryMock();
    announcementArticleTags = await AnnouncementArticleTagLocalDataSource()
        .getAnnouncementArticleTags();
  });

  group('Announcement Filter Bloc', () {
    blocTest(
      'categoryChanged add',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => announcementFilterState.copyWith(
        filterCategoryKeyList: [announcementArticleTags.first],
      ),
      act: (AnnouncementFilterBloc bloc) => bloc.add(
        AnnouncementFilterEvent.categoryChanged(
          announcementArticleTags.last,
          true,
        ),
      ),
      expect: () => [
        announcementFilterState.copyWith(
          filterCategoryKeyList: [
            announcementArticleTags.first,
            announcementArticleTags.last,
          ],
        ),
      ],
    );

    blocTest(
      'categoryChanged remove',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => announcementFilterState.copyWith(
        filterCategoryKeyList: announcementArticleTags,
      ),
      act: (AnnouncementFilterBloc bloc) => bloc.add(
        AnnouncementFilterEvent.categoryChanged(
          announcementArticleTags.last,
          false,
        ),
      ),
      expect: () => [
        announcementFilterState.copyWith(
          filterCategoryKeyList: announcementArticleTags.sublist(
            0,
            announcementArticleTags.length - 1,
          ),
        ),
      ],
    );

    blocTest(
      'setCategoryWhileOpenBottomSheet',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      act: (AnnouncementFilterBloc bloc) => bloc.add(
        AnnouncementFilterEvent.setCategoryWhileOpenBottomSheet(
          announcementArticleTags,
        ),
      ),
      expect: () => [
        announcementFilterState.copyWith(
          filterCategoryKeyList: announcementArticleTags,
        ),
      ],
    );

    blocTest(
      'resetCategory',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => announcementFilterState.copyWith(
        filterCategoryKeyList: announcementArticleTags,
      ),
      act: (AnnouncementFilterBloc bloc) => bloc.add(
        const AnnouncementFilterEvent.resetCategory(),
      ),
      expect: () => [
        announcementFilterState,
      ],
    );

    blocTest(
      'fetchCategory success',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementArticleTag(
            salesOrg: fakeMYSalesOrg,
            variablePath: fakeMYSalesOrg.announcementTagVariablePath,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementArticleTags,
          ),
        );
      },
      act: (AnnouncementFilterBloc bloc) => bloc
          .add(AnnouncementFilterEvent.fetchCategory(salesOrg: fakeMYSalesOrg)),
      expect: () => [
        announcementFilterState.copyWith(isLoading: true),
        announcementFilterState.copyWith(
          categoryKeyList: announcementArticleTags,
        ),
      ],
    );

    blocTest(
      'fetchCategory fail',
      build: () => AnnouncementFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementArticleTag(
            salesOrg: fakeMYSalesOrg,
            variablePath: fakeMYSalesOrg.announcementTagVariablePath,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (AnnouncementFilterBloc bloc) => bloc
          .add(AnnouncementFilterEvent.fetchCategory(salesOrg: fakeMYSalesOrg)),
      expect: () => [
        announcementFilterState.copyWith(isLoading: true),
        announcementFilterState,
      ],
    );
  });
}
