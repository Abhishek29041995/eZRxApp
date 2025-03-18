import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/article_info/repository/i_article_info_repository.dart';

part 'articles_info_event.dart';

part 'articles_info_state.dart';

part 'articles_info_bloc.freezed.dart';

class ArticlesInfoBloc extends Bloc<ArticlesInfoEvent, ArticlesInfoState> {
  final IArticleInfoRepository articleInfoRepository;
  final Config config;

  ArticlesInfoBloc({required this.articleInfoRepository, required this.config})
      : super(ArticlesInfoState.initial()) {
    on<ArticlesInfoEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    ArticlesInfoEvent event,
    Emitter<ArticlesInfoState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          ArticlesInfoState.initial().copyWith(
            shipToInfo: e.shipToInfo,
            salesOrg: e.salesOrg,
            user: e.user,
          ),
        );
        add(const ArticlesInfoEvent.getArticles());
      },
      getArticles: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            canLoadMore: true,
            searchKey: SearchKey.empty(),
            articleInfo: AnnouncementArticleInfo.empty(),
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccessOption = await articleInfoRepository.getArticles(
          user: state.user,
          salesOrg: state.salesOrg,
          pageSize: config.articlePageSize,
          after: state.articleInfo.endCursor,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              canLoadMore: false,
            ),
          ),
          (articles) {
            emit(
              state.copyWith(
                articleInfo: state.salesOrg.isID
                    ? articles.copyWith(
                        announcementList:
                            _getFilteredArticleInfo(articles.announcementList),
                      )
                    : articles,
                canLoadMore:
                    articles.announcementList.length >= config.articlePageSize,
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              ),
            );
          },
        );
      },
      loadMoreArticles: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccessOption = await articleInfoRepository.getArticles(
          user: state.user,
          salesOrg: state.salesOrg,
          pageSize: config.articlePageSize,
          after: state.articleInfo.endCursor,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (articles) {
            final newArticlesList = List<AnnouncementArticleItem>.from(
              state.articleInfo.announcementList,
            )..addAll(articles.announcementList);

            emit(
              state.copyWith(
                articleInfo: articles.copyWith(
                  announcementList: state.salesOrg.isID
                      ? _getFilteredArticleInfo(newArticlesList)
                      : newArticlesList,
                ),
                canLoadMore:
                    articles.announcementList.length >= config.articlePageSize,
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              ),
            );
          },
        );
      },
      setSearchKey: (e) {
        if (e.searchKey.isValid()) {
          emit(
            state.copyWith(
              searchKey: e.searchKey,
            ),
          );
        }
      },
      setCategoryKey: (e) {
        emit(
          state.copyWith(
            categoryKeyList: e.categoryKeyList,
          ),
        );
      },
    );
  }

  List<AnnouncementArticleItem> _getFilteredArticleInfo(
    List<AnnouncementArticleItem> articleList,
  ) =>
      articleList
          .where(
            (e) =>
                e.branchInfo
                    .any((element) => state.shipToInfo.plant == element.name) &&
                e.iC4Info.any(
                  (element) =>
                      state.shipToInfo.targetCustomerType == element.name,
                ),
          )
          .toList();
}
