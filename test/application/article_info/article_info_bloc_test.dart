import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/repository/article_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../common_mock_data/sales_organsiation_mock.dart';

class ArticleInfoRepo extends Mock implements ArticleInfoRepository {}

void main() {
  late ArticleInfoRepo repository;
  late AnnouncementArticleInfo articleInfoMock;
  final articlesInfoState = ArticlesInfoState.initial();
  final salesOrg = SalesOrg('');
  final user = User.empty();
  late Config config;
  late List<String> announcementArticleTags;
  final shipToInfo = ShipToInfo.empty().copyWith(
    plant: '1920',
    targetCustomerType: 'RT1PH2AP',
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ArticleInfoRepo();
    config = Config()..appFlavor = Flavor.mock;
    articleInfoMock = await ArticleInfoLocalDataSource().getArticles();
    announcementArticleTags = await AnnouncementArticleTagLocalDataSource()
        .getAnnouncementArticleTags();
  });

  group('Articles Info Bloc', () {
    blocTest(
      'Get Articles info Initialize',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: fakeMYSalesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock,
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        ArticlesInfoEvent.initialize(
          salesOrg: fakeMYSalesOrg,
          shipToInfo: shipToInfo,
          user: user,
        ),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          salesOrg: fakeMYSalesOrg,
          shipToInfo: shipToInfo,
          user: user,
        ),
        articlesInfoState.copyWith(
          isFetching: true,
          salesOrg: fakeMYSalesOrg,
          shipToInfo: shipToInfo,
          user: user,
        ),
        articlesInfoState.copyWith(
          salesOrg: fakeMYSalesOrg,
          shipToInfo: shipToInfo,
          user: user,
          canLoadMore: false,
          articleInfo: articleInfoMock,
          apiFailureOrSuccessOption: optionOf(Right(articleInfoMock)),
        ),
      ],
    );
    blocTest(
      'Get Articles info fail',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
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
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.getArticles(),
      ),
      expect: () => [
        articlesInfoState.copyWith(isFetching: true),
        articlesInfoState.copyWith(
          canLoadMore: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get Articles info Success',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => ArticlesInfoState.initial().copyWith(
        shipToInfo: shipToInfo,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock,
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.getArticles(),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          isFetching: true,
          shipToInfo: shipToInfo,
        ),
        articlesInfoState.copyWith(
          canLoadMore: false,
          shipToInfo: shipToInfo,
          articleInfo: articleInfoMock,
          apiFailureOrSuccessOption: optionOf(Right(articleInfoMock)),
        ),
      ],
    );

    blocTest(
      'Get Articles info Success of Id market',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => ArticlesInfoState.initial().copyWith(
        shipToInfo: shipToInfo,
        salesOrg: fakeIDSalesOrg,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: fakeIDSalesOrg,
            pageSize: config.articlePageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock.copyWith(
              announcementList: articleInfoMock.announcementList
                  .map(
                    (element) => element.copyWith(
                      branchInfo: [
                        BranchAndIc4Info.empty().copyWith(
                          name: shipToInfo.plant,
                        ),
                      ],
                      iC4Info: [
                        BranchAndIc4Info.empty().copyWith(
                          name: shipToInfo.targetCustomerType,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.getArticles(),
      ),
      expect: () {
        final mockArticleInfo = articleInfoMock.copyWith(
          announcementList: articleInfoMock.announcementList
              .map(
                (element) => element.copyWith(
                  branchInfo: [
                    BranchAndIc4Info.empty().copyWith(
                      name: shipToInfo.plant,
                    ),
                  ],
                  iC4Info: [
                    BranchAndIc4Info.empty().copyWith(
                      name: shipToInfo.targetCustomerType,
                    ),
                  ],
                ),
              )
              .toList(),
        );
        return [
          articlesInfoState.copyWith(
            isFetching: true,
            shipToInfo: shipToInfo,
            salesOrg: fakeIDSalesOrg,
          ),
          articlesInfoState.copyWith(
            shipToInfo: shipToInfo,
            salesOrg: fakeIDSalesOrg,
            articleInfo: mockArticleInfo,
            canLoadMore: false,
            apiFailureOrSuccessOption: optionOf(
              Right(
                articleInfoMock.copyWith(
                  announcementList: articleInfoMock.announcementList
                      .map(
                        (element) => element.copyWith(
                          branchInfo: [
                            BranchAndIc4Info.empty().copyWith(
                              name: shipToInfo.plant,
                            ),
                          ],
                          iC4Info: [
                            BranchAndIc4Info.empty().copyWith(
                              name: shipToInfo.targetCustomerType,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ];
      },
    );

    blocTest(
      'Get Articles info load more Success',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        articleInfo: articleInfoMock,
        canLoadMore: true,
        shipToInfo: shipToInfo,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: articleInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock,
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.loadMoreArticles(),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          isFetching: true,
          articleInfo: articleInfoMock,
          canLoadMore: true,
          shipToInfo: shipToInfo,
        ),
        articlesInfoState.copyWith(
          articleInfo: articleInfoMock.copyWith(
            announcementList: [
              ...articleInfoMock.announcementList,
              ...articleInfoMock.announcementList,
            ],
          ),
          canLoadMore: false,
          apiFailureOrSuccessOption: optionOf(Right(articleInfoMock)),
          shipToInfo: shipToInfo,
        ),
      ],
    );

    blocTest(
      'Get Articles info load more Success Id',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        articleInfo: articleInfoMock,
        shipToInfo: shipToInfo,
        salesOrg: fakeIDSalesOrg,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: fakeIDSalesOrg,
            pageSize: config.articlePageSize,
            after: articleInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            articleInfoMock.copyWith(
              announcementList: articleInfoMock.announcementList
                  .map(
                    (element) => element.copyWith(
                      branchInfo: [
                        BranchAndIc4Info.empty().copyWith(
                          name: shipToInfo.plant,
                        ),
                      ],
                      iC4Info: [
                        BranchAndIc4Info.empty().copyWith(
                          name: shipToInfo.targetCustomerType,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.loadMoreArticles(),
      ),
      expect: () {
        final loadedMockArticlesInfoState = articleInfoMock.copyWith(
          announcementList: articleInfoMock.announcementList
              .map(
                (element) => element.copyWith(
                  branchInfo: [
                    BranchAndIc4Info.empty().copyWith(
                      name: shipToInfo.plant,
                    ),
                  ],
                  iC4Info: [
                    BranchAndIc4Info.empty().copyWith(
                      name: shipToInfo.targetCustomerType,
                    ),
                  ],
                ),
              )
              .toList(),
        );
        return [
          articlesInfoState.copyWith(
            isFetching: true,
            articleInfo: articleInfoMock,
            shipToInfo: shipToInfo,
            salesOrg: fakeIDSalesOrg,
          ),
          articlesInfoState.copyWith(
            articleInfo: loadedMockArticlesInfoState,
            salesOrg: fakeIDSalesOrg,
            canLoadMore: false,
            apiFailureOrSuccessOption: optionOf(
              Right(loadedMockArticlesInfoState),
            ),
            shipToInfo: shipToInfo,
          ),
        ];
      },
    );

    blocTest(
      'Get Articles info load more fail',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        articleInfo: articleInfoMock,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getArticles(
            user: user,
            salesOrg: salesOrg,
            pageSize: config.articlePageSize,
            after: articleInfoMock.endCursor,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ArticlesInfoBloc bloc) => bloc.add(
        const ArticlesInfoEvent.loadMoreArticles(),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          isFetching: true,
          articleInfo: articleInfoMock,
          canLoadMore: true,
        ),
        articlesInfoState.copyWith(
          articleInfo: articleInfoMock,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'Get Articles info setSearchKey',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      act: (ArticlesInfoBloc bloc) => bloc.add(
        ArticlesInfoEvent.setSearchKey(
          searchKey: SearchKey.search('fake_searchKey'),
        ),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          searchKey: SearchKey.search('fake_searchKey'),
        ),
      ],
    );

    blocTest(
      'Get Articles info SetCategoryKey',
      build: () => ArticlesInfoBloc(
        articleInfoRepository: repository,
        config: config,
      ),
      seed: () => articlesInfoState.copyWith(
        shipToInfo: shipToInfo,
        salesOrg: fakeMYSalesOrg,
        user: user,
        articleInfo: articleInfoMock,
      ),
      act: (ArticlesInfoBloc bloc) => bloc.add(
        ArticlesInfoEvent.setCategoryKey(
          categoryKeyList: announcementArticleTags,
        ),
      ),
      expect: () => [
        articlesInfoState.copyWith(
          shipToInfo: shipToInfo,
          salesOrg: fakeMYSalesOrg,
          user: user,
          articleInfo: articleInfoMock,
          categoryKeyList: announcementArticleTags,
        ),
      ],
    );
    test(
      'ArticlesInfo State filterAnnouncementListBySearchKey',
      () {
        final articlesInfo = articlesInfoState.copyWith(
          articleInfo: articleInfoMock,
          searchKey: SearchKey.search(
            articleInfoMock.announcementList.first.title.toLowerCase(),
          ),
        );
        expect(
          articlesInfo.filterAnnouncementListBySearchKey,
          articleInfoMock.announcementList.where(
            (element) => element.title.contains(
              articleInfoMock.announcementList.first.title,
            ),
          ),
        );
      },
    );
  });
}
