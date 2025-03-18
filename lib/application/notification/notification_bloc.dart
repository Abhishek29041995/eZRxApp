import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/repository/i_notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationRepository notificationRepository;
  final Config config;
  NotificationBloc({required this.notificationRepository, required this.config})
      : super(NotificationState.initial()) {
    on<_Initialized>(
      (event, emit) async => emit(NotificationState.initial()),
    );
    on<_Fetch>(
      (_, emit) async {
        emit(
          NotificationState.initial().copyWith(
            isFetching: true,
          ),
        );

        final failureOrSuccess = await notificationRepository.getNotification(
          page: state.nextPageIndex,
          perPage: config.pageSize,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (notificationList) {
            emit(
              state.copyWith(
                notificationList: notificationList,
                isFetching: false,
                nextPageIndex: state.nextPageIndex + 1,
                canLoadMore: notificationList.notificationData.length <
                    notificationList.pagination.totalItem,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_DeleteAllNotifications>(
      (event, emit) async {
        emit(
          state.copyWith(
            notificationFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await notificationRepository.deleteAllNotificationList();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (notificationList) => emit(
            NotificationState.initial().copyWith(
              isDeletedAllSuccess: true,
            ),
          ),
        );
      },
    );
    on<_ReadNotifications>(
      (e, emit) async {
        emit(
          state.copyWith(
            notificationFailureOrSuccessOption: none(),
            isReadNotification: true,
          ),
        );

        final failureOrSuccess = await notificationRepository.readNotification(
          notificationId: e.notificationId,
          previousNotificationDataList: state.notificationList.notificationData,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isReadNotification: false,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (updatedNotificationList) {
            emit(
              state.copyWith(
                notificationList: state.notificationList.copyWith(
                  notificationData: updatedNotificationList,
                ),
                isReadNotification: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>(
      (event, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            notificationFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await notificationRepository.getNotification(
          page: state.nextPageIndex,
          perPage: config.pageSize,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (notificationList) {
            final newNotificationList = [
              ...state.notificationList.notificationData,
              ...notificationList.notificationData,
            ];
            emit(
              state.copyWith(
                notificationList: state.notificationList.copyWith(
                  notificationData: newNotificationList,
                  pagination: notificationList.pagination,
                ),
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: newNotificationList.length <
                    notificationList.pagination.totalItem,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}
