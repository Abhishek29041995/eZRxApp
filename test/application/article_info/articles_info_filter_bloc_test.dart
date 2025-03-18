import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
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
  final articlesInfoFilterState = ArticlesInfoFilterState.initial();
  late List<String> announcementArticleTags;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementArticleTagRepositoryMock();
    announcementArticleTags = await AnnouncementArticleTagLocalDataSource()
        .getAnnouncementArticleTags();
  });

  group('Articles Filter Bloc', () {
    blocTest(
      'categoryChanged add',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => articlesInfoFilterState.copyWith(
        filterCategoryKeyList: [announcementArticleTags.first],
      ),
      act: (ArticlesInfoFilterBloc bloc) => bloc
        .add(
          ArticlesInfoFilterEvent.categoryChanged(
            announcementArticleTags.last,
            true,
          ),
        ),
      expect: () => [
        articlesInfoFilterState.copyWith(
          filterCategoryKeyList: [
            announcementArticleTags.first,
            announcementArticleTags.last,
          ],
        ),
      ],
    );

    blocTest(
      'categoryChanged remove',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => articlesInfoFilterState.copyWith(
        filterCategoryKeyList: announcementArticleTags,
      ),
      act: (ArticlesInfoFilterBloc bloc) => bloc
        .add(
          ArticlesInfoFilterEvent.categoryChanged(
            announcementArticleTags.last,
            false,
          ),
        ),
      expect: () => [
        articlesInfoFilterState.copyWith(
          filterCategoryKeyList: announcementArticleTags.sublist(
            0,
            announcementArticleTags.length - 1,
          ),
        ),
      ],
    );

    blocTest(
      'setCategoryWhileOpenBottomSheet',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      act: (ArticlesInfoFilterBloc bloc) => bloc
        .add(
          ArticlesInfoFilterEvent.setCategoryWhileOpenBottomSheet(
            announcementArticleTags,
          ),
        ),
      expect: () => [
        articlesInfoFilterState.copyWith(
          filterCategoryKeyList: announcementArticleTags,
        ),
      ],
    );

    blocTest(
      'resetCategory',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      seed: () => articlesInfoFilterState.copyWith(
        filterCategoryKeyList: announcementArticleTags,
      ),
      act: (ArticlesInfoFilterBloc bloc) => bloc
        .add(
          const ArticlesInfoFilterEvent.resetCategory(),
        ),
      expect: () => [
        articlesInfoFilterState,
      ],
    );

    blocTest(
      'fetchCategory success',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementArticleTag(
            salesOrg: fakeMYSalesOrg,
            variablePath: fakeMYSalesOrg.articleTagVariablePath,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            announcementArticleTags,
          ),
        );
      },
      act: (ArticlesInfoFilterBloc bloc) => bloc
          .add(ArticlesInfoFilterEvent.fetchCategory(salesOrg: fakeMYSalesOrg)),
      expect: () => [
        articlesInfoFilterState.copyWith(isLoading: true),
        articlesInfoFilterState.copyWith(
          categoryKeyList: announcementArticleTags,
        ),
      ],
    );

    blocTest(
      'fetchCategory fail',
      build: () => ArticlesInfoFilterBloc(
        announcementArticleTagRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.getAnnouncementArticleTag(
            salesOrg: fakeMYSalesOrg,
            variablePath: fakeMYSalesOrg.articleTagVariablePath,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (ArticlesInfoFilterBloc bloc) => bloc
          .add(ArticlesInfoFilterEvent.fetchCategory(salesOrg: fakeMYSalesOrg)),
      expect: () => [
        articlesInfoFilterState.copyWith(isLoading: true),
        articlesInfoFilterState,
      ],
    );
  });
}
