import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_bloc.freezed.dart';

part 'announcement_info_event.dart';

part 'announcement_info_state.dart';

class AnnouncementInfoBloc
    extends Bloc<AnnouncementInfoEvent, AnnouncementInfoState> {
  final IAnnouncementInfoRepository announcementInfoRepository;
  final Config config;

  AnnouncementInfoBloc({
    required this.announcementInfoRepository,
    required this.config,
  }) : super(AnnouncementInfoState.initial()) {
    on<AnnouncementInfoEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    AnnouncementInfoEvent event,
    Emitter<AnnouncementInfoState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          AnnouncementInfoState.initial().copyWith(
            user: e.user,
            salesOrg: e.salesOrg,
          ),
        );
        add(const AnnouncementInfoEvent.fetch());
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            apiFailureOrSuccessOption: none(),
            announcementInfo: AnnouncementArticleInfo.empty(),
            searchKey: SearchKey.empty(),
          ),
        );
        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
          user: state.user,
          salesOrg: state.salesOrg,
          pageSize: config.articlePageSize,
          after: '',
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                canLoadMore: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (announcementInfo) {
            emit(
              state.copyWith(
                isLoading: false,
                announcementInfo: announcementInfo,
                canLoadMore: announcementInfo.total > config.articlePageSize,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isLoading || !state.canLoadMore) {
          return;
        }

        emit(
          state.copyWith(
            isLoading: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
          user: state.user,
          salesOrg: state.salesOrg,
          pageSize: config.articlePageSize,
          after: state.announcementInfo.endCursor,
        );

        if (isClosed) return;

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (announcement) {
            final newList = <AnnouncementArticleItem>[
              ...state.announcementInfo.announcementList,
              ...announcement.announcementList,
            ];

            emit(
              state.copyWith(
                announcementInfo: state.announcementInfo.copyWith(
                  endCursor: announcement.endCursor,
                  announcementList: newList,
                ),
                apiFailureOrSuccessOption: none(),
                isLoading: false,
                canLoadMore: announcement.announcementList.length >=
                    config.articlePageSize,
              ),
            );
          },
        );
      },
      updateSearchKey: (_UpdateSearchKey e) {
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
}
