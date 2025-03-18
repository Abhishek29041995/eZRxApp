import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/infrastructure/notification/repository/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class MockNotificationRepository extends Mock
    implements NotificationRepository {}

void main() {
  late NotificationRepository repository;
  late Notifications notifications;
  late Config config;
  final notificationState = NotificationState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = MockNotificationRepository();
    config = Config()..appFlavor = Flavor.mock;
    notifications = await NotificationLocalDataSource().getNotificationList();
  });

  group('Notification Bloc', () {
    blocTest(
      'Initialize',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      act: (NotificationBloc bloc) => bloc.add(
        const NotificationEvent.initialized(),
      ),
      expect: () => [notificationState],
    );
    blocTest(
      'Get notification success',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getNotification(
            page: 1,
            perPage: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            notifications,
          ),
        );
      },
      act: (NotificationBloc bloc) => bloc.add(const NotificationEvent.fetch()),
      expect: () => [
        notificationState.copyWith(isFetching: true),
        notificationState.copyWith(
          nextPageIndex: 2,
          isFetching: false,
          notificationList: notifications,
          canLoadMore: true,
          notificationFailureOrSuccessOption: optionOf(Right(notifications)),
        ),
      ],
      verify: (NotificationBloc bloc) => expect(
        bloc.state.notificationList,
        notifications,
      ),
    );
    blocTest(
      'Get notification fail',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getNotification(page: 1, perPage: config.pageSize),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (NotificationBloc bloc) => bloc.add(
        const NotificationEvent.fetch(),
      ),
      expect: () => [
        NotificationState.initial().copyWith(
          isFetching: true,
          notificationFailureOrSuccessOption: none(),
        ),
        NotificationState.initial().copyWith(
          notificationFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
        ),
      ],
    );

    blocTest<NotificationBloc, NotificationState>(
      'notification loadMore',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      seed: () => NotificationState.initial().copyWith(
        notificationList: notifications,
        isFetching: false,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getNotification(
            page: 1,
            perPage: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            notifications,
          ),
        );
      },
      act: (bloc) => bloc.add(
        const NotificationEvent.loadMore(),
      ),
      expect: () => [
        NotificationState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 1,
          canLoadMore: true,
          notificationList: notifications,
          notificationFailureOrSuccessOption: none(),
        ),
        NotificationState.initial().copyWith(
          notificationFailureOrSuccessOption: optionOf(
            Right(
              notifications,
            ),
          ),
          isFetching: false,
          nextPageIndex: 2,
          canLoadMore: true,
          notificationList: notifications.copyWith(
            notificationData: [
              ...notifications.notificationData,
              ...notifications.notificationData,
            ],
          ),
        ),
      ],
    );

    blocTest<NotificationBloc, NotificationState>(
      'notification loadMore fail',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      seed: () => NotificationState.initial().copyWith(
        isFetching: false,
        canLoadMore: true,
      ),
      setUp: () {
        when(
          () => repository.getNotification(
            page: 1,
            perPage: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        const NotificationEvent.loadMore(),
      ),
      expect: () => [
        NotificationState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 1,
          canLoadMore: true,
          notificationFailureOrSuccessOption: none(),
        ),
        NotificationState.initial().copyWith(
          notificationFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      ],
    );
    blocTest(
      'Read notification success',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      seed: () => NotificationState.initial().copyWith(
        isFetching: false,
        notificationList: notifications,
      ),
      setUp: () {
        when(
          () => repository.readNotification(
            notificationId: 13160,
            previousNotificationDataList: notifications.notificationData,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            notifications.notificationData,
          ),
        );
      },
      act: (NotificationBloc bloc) => bloc
        ..add(const NotificationEvent.readNotifications(notificationId: 13160)),
      expect: () => [
        notificationState.copyWith(
          isFetching: false,
          isReadNotification: true,
          notificationList: notifications,
        ),
        notificationState.copyWith(
          isFetching: false,
          notificationList: notifications,
          notificationFailureOrSuccessOption: none(),
          isReadNotification: false,
        ),
      ],
    );
    blocTest(
      'Read notification fail',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      seed: () => NotificationState.initial().copyWith(
        isFetching: false,
        notificationList: notifications,
      ),
      setUp: () {
        when(
          () => repository.readNotification(
            notificationId: 13160,
            previousNotificationDataList: notifications.notificationData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (NotificationBloc bloc) => bloc
        ..add(const NotificationEvent.readNotifications(notificationId: 13160)),
      expect: () => [
        notificationState.copyWith(
          isFetching: false,
          isReadNotification: true,
          notificationList: notifications,
        ),
        notificationState.copyWith(
          isFetching: false,
          notificationList: notifications,
          notificationFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isReadNotification: false,
        ),
      ],
    );
    blocTest(
      'Delete notification success',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.deleteAllNotificationList(),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (NotificationBloc bloc) =>
          bloc..add(const NotificationEvent.deleteAllNotifications()),
      expect: () => [
        notificationState.copyWith(
          isFetching: true,
        ),
        notificationState.copyWith(isDeletedAllSuccess: true),
      ],
    );
    blocTest(
      'Delete notification failure',
      build: () => NotificationBloc(
        notificationRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.deleteAllNotificationList(),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (NotificationBloc bloc) =>
          bloc..add(const NotificationEvent.deleteAllNotifications()),
      expect: () => [
        notificationState.copyWith(
          isFetching: true,
        ),
        notificationState.copyWith(
          notificationFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );
  });
}
