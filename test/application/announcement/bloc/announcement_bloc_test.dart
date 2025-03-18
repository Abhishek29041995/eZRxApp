import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class AnnouncementMockRepo extends Mock implements AnnouncementRepository {}

void main() {
  late AnnouncementRepository repository;
  late Announcement announcementMock;
  final announcementState = AnnouncementState.initial();
  final fakeNowDateTimeString = DateTimeStringValue('${DateTime.now()}');
  final fakePastDateTimeString = DateTimeStringValue(
    DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
  );
  final fakeFutureDateTimeString = DateTimeStringValue(
    DateTime.now().add(const Duration(days: 1)).toIso8601String(),
  );
  final fakeEmptyDateTimeString = DateTimeStringValue('');
  late MaintenanceItem maintenanceItemMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AnnouncementMockRepo();

    announcementMock = await AnnouncementLocalDataSource().getAnnouncements();
    maintenanceItemMock =
        await AnnouncementLocalDataSource().getMaintenanceBanners();
  });

  group('Announcement Bloc', () {
    blocTest(
      'Get announcement fail',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AnnouncementBloc bloc) =>
          bloc..add(const AnnouncementEvent.getAnnouncement()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: Announcement.empty(),
        ),
      ],
    );

    blocTest(
      'Get announcement success',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => Right(
            announcementMock,
          ),
        );
      },
      act: (AnnouncementBloc bloc) =>
          bloc..add(const AnnouncementEvent.getAnnouncement()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: announcementMock,
          isClosed: false,
        ),
      ],
      verify: (AnnouncementBloc bloc) => expect(
        bloc.state.announcement,
        announcementMock,
      ),
    );

    blocTest(
      'Get announcement success then close announcement',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getAnnouncements()).thenAnswer(
          (invocation) async => Right(
            announcementMock,
          ),
        );
      },
      act: (AnnouncementBloc bloc) => bloc
        ..add(const AnnouncementEvent.getAnnouncement())
        ..add(const AnnouncementEvent.close()),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          announcement: announcementMock,
          isClosed: false,
        ),
        announcementState.copyWith(
          isClosed: true,
          announcement: announcementMock,
        ),
      ],
    );

    blocTest(
      'Show announcement',
      build: () => AnnouncementBloc(announcementRepository: repository),
      seed: () => announcementState.copyWith(isClosed: true),
      act: (AnnouncementBloc bloc) => bloc.add(const AnnouncementEvent.show()),
      expect: () => [
        announcementState.copyWith(isClosed: false),
      ],
    );

    blocTest(
      'Change prefer language',
      build: () => AnnouncementBloc(announcementRepository: repository),
      seed: () => announcementState.copyWith(preferSalesOrgLanguage: true),
      act: (AnnouncementBloc bloc) => bloc.add(
        const AnnouncementEvent.changePreferLanguage(
          preferSalesOrgLanguage: false,
        ),
      ),
      expect: () => [
        announcementState.copyWith(
          preferSalesOrgLanguage: false,
        ),
      ],
    );

    blocTest(
      'Get maintenance banners success',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getMaintenanceBanners(salesOrg: fakeSalesOrg))
            .thenAnswer(
          (_) async => Right(maintenanceItemMock),
        );
      },
      act: (bloc) => bloc
          .add(AnnouncementEvent.getMaintenanceBanners(salesOrg: fakeSalesOrg)),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          maintenanceItem: maintenanceItemMock,
        ),
      ],
    );

    blocTest(
      'Get maintenance banners fail',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getMaintenanceBanners(salesOrg: fakeSalesOrg))
            .thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (bloc) => bloc
          .add(AnnouncementEvent.getMaintenanceBanners(salesOrg: fakeSalesOrg)),
      expect: () => [
        announcementState.copyWith(isLoading: true),
        announcementState.copyWith(
          isLoading: false,
          maintenanceItem: MaintenanceItem.empty(),
        ),
      ],
    );

    blocTest(
      'Set closed time success for order storage',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(
          () => repository.setClosedTime(
            dateTime: fakeNowDateTimeString,
            storageType: StorageType.order,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      act: (bloc) => bloc.add(
        AnnouncementEvent.setClosedTime(
          dateTime: fakeNowDateTimeString,
          storageType: StorageType.order,
        ),
      ),
      expect: () => [
        announcementState.copyWith(
          isLoading: false,
          lastClosedTimeOrder: fakeNowDateTimeString,
        ),
      ],
    );

    blocTest(
      'Set closed time success for payment storage',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(
          () => repository.setClosedTime(
            dateTime: fakeNowDateTimeString,
            storageType: StorageType.payment,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      act: (bloc) => bloc.add(
        AnnouncementEvent.setClosedTime(
          dateTime: fakeNowDateTimeString,
          storageType: StorageType.payment,
        ),
      ),
      expect: () => [
        announcementState.copyWith(
          isLoading: false,
          lastClosedTimePayment: fakeNowDateTimeString,
        ),
      ],
    );

    blocTest(
      'Set closed time success for returns storage',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(
          () => repository.setClosedTime(
            dateTime: fakeNowDateTimeString,
            storageType: StorageType.returns,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      act: (bloc) => bloc.add(
        AnnouncementEvent.setClosedTime(
          dateTime: fakeNowDateTimeString,
          storageType: StorageType.returns,
        ),
      ),
      expect: () => [
        announcementState.copyWith(
          isLoading: false,
          lastClosedTimeReturns: fakeNowDateTimeString,
        ),
      ],
    );

    blocTest(
      'Set closed time failed',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(
          () => repository.setClosedTime(
            dateTime: fakeNowDateTimeString,
            storageType: StorageType.returns,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.other('fake-error')));
      },
      act: (bloc) => bloc.add(
        AnnouncementEvent.setClosedTime(
          dateTime: fakeNowDateTimeString,
          storageType: StorageType.returns,
        ),
      ),
      expect: () => [],
    );

    blocTest(
      'Get closed time success',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getClosedTimeOrder()).thenAnswer(
          (_) async => Right(fakeNowDateTimeString),
        );
        when(() => repository.getClosedTimePayment()).thenAnswer(
          (_) async => Right(fakeNowDateTimeString),
        );
        when(() => repository.getClosedTimeReturns()).thenAnswer(
          (_) async => Right(fakeNowDateTimeString),
        );
      },
      act: (bloc) => bloc.add(const AnnouncementEvent.getClosedTime()),
      expect: () => [
        announcementState.copyWith(
          lastClosedTimeOrder: fakeNowDateTimeString,
          lastClosedTimePayment: fakeNowDateTimeString,
          lastClosedTimeReturns: fakeNowDateTimeString,
        ),
      ],
    );

    blocTest(
      'Get closed oder time failed',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getClosedTimeOrder()).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => announcementState.copyWith(
        lastClosedTimeOrder: fakeNowDateTimeString,
        lastClosedTimePayment: fakeNowDateTimeString,
        lastClosedTimeReturns: fakeNowDateTimeString,
      ),
      act: (bloc) => bloc.add(const AnnouncementEvent.getClosedTime()),
      expect: () => [],
    );

    blocTest(
      'Get closed payment time failed',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getClosedTimePayment()).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => announcementState.copyWith(
        lastClosedTimeOrder: fakeNowDateTimeString,
        lastClosedTimePayment: fakeNowDateTimeString,
        lastClosedTimeReturns: fakeNowDateTimeString,
      ),
      act: (bloc) => bloc.add(const AnnouncementEvent.getClosedTime()),
      expect: () => [],
    );

    blocTest(
      'Get closed returns time failed',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.getClosedTimeReturns()).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => announcementState.copyWith(
        lastClosedTimeOrder: fakeNowDateTimeString,
        lastClosedTimePayment: fakeNowDateTimeString,
        lastClosedTimeReturns: fakeNowDateTimeString,
      ),
      act: (bloc) => bloc.add(const AnnouncementEvent.getClosedTime()),
      expect: () => [],
    );

    blocTest(
      'Closed banner ID',
      build: () => AnnouncementBloc(announcementRepository: repository),
      seed: () => announcementState.copyWith(listBannersIdClosed: []),
      act: (bloc) => bloc
          .add(const AnnouncementEvent.closedBannerId(id: 'fake_banner_id')),
      expect: () => [
        announcementState.copyWith(listBannersIdClosed: ['fake_banner_id']),
      ],
    );

    blocTest(
      'Clear banner ID',
      build: () => AnnouncementBloc(announcementRepository: repository),
      seed: () =>
          announcementState.copyWith(listBannersIdClosed: ['fake_banner_id']),
      act: (bloc) => bloc.add(const AnnouncementEvent.clearBannerId()),
      expect: () => [
        announcementState.copyWith(listBannersIdClosed: []),
      ],
    );

    blocTest(
      'Clear closed time success',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.clearClosedTime()).thenAnswer(
          (_) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(const AnnouncementEvent.clearClosedTime()),
      expect: () => [
        announcementState.copyWith(
          listBannersIdClosed: [],
          lastClosedTimeOrder: fakeEmptyDateTimeString,
          lastClosedTimePayment: fakeEmptyDateTimeString,
          lastClosedTimeReturns: fakeEmptyDateTimeString,
        ),
      ],
    );

    blocTest(
      'Clear closed time failed',
      build: () => AnnouncementBloc(announcementRepository: repository),
      setUp: () {
        when(() => repository.clearClosedTime()).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (bloc) => bloc.add(const AnnouncementEvent.clearClosedTime()),
      expect: () => [
        announcementState.copyWith(
          listBannersIdClosed: [],
          lastClosedTimeOrder: fakeEmptyDateTimeString,
          lastClosedTimePayment: fakeEmptyDateTimeString,
          lastClosedTimeReturns: fakeEmptyDateTimeString,
        ),
      ],
    );
  });

  group('AnnouncementState', () {
    test('initial state is correctly initialized', () {
      final state = AnnouncementState.initial();

      expect(state.isClosed, isTrue);
      expect(state.isLoading, isFalse);
      expect(state.preferSalesOrgLanguage, isTrue);
      expect(state.listBannersIdClosed, isEmpty);
      expect(state.announcement, Announcement.empty());
      expect(state.maintenanceItem, MaintenanceItem.empty());
      expect(state.lastClosedTimeReturns, fakeEmptyDateTimeString);
      expect(state.lastClosedTimeOrder, fakeEmptyDateTimeString);
      expect(state.lastClosedTimePayment, fakeEmptyDateTimeString);
    });

    test('isClosedTimeOrder returns true for empty lastClosedTimeOrder', () {
      final state = AnnouncementState.initial()
          .copyWith(lastClosedTimeOrder: fakeEmptyDateTimeString);

      expect(state.isClosedTimeOrder, isTrue);
    });

    test('isClosedTimeOrder returns true for inValid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimeOrder: fakePastDateTimeString,
      );

      expect(state.isClosedTimeOrder, isTrue);
    });

    test('isClosedTimeOrder returns false for Valid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimeOrder: fakeFutureDateTimeString,
      );

      expect(state.isClosedTimeOrder, isFalse);
    });

    test('isClosedTimePayment returns true for empty lastClosedTimePayment',
        () {
      final state = AnnouncementState.initial()
          .copyWith(lastClosedTimePayment: fakeEmptyDateTimeString);

      expect(state.isClosedTimePayment, isTrue);
    });

    test('isClosedTimePayment returns true for inValid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimePayment: fakePastDateTimeString,
      );

      expect(state.isClosedTimePayment, isTrue);
    });

    test('isClosedTimePayment returns false for Valid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimePayment: fakeFutureDateTimeString,
      );

      expect(state.isClosedTimePayment, isFalse);
    });

    test('isClosedTimeReturn returns true for empty lastClosedTimeReturn', () {
      final state = AnnouncementState.initial()
          .copyWith(lastClosedTimeReturns: fakeEmptyDateTimeString);

      expect(state.isClosedTimeReturns, isTrue);
    });

    test('isClosedTimeReturn returns true for inValid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimeReturns: fakePastDateTimeString,
      );

      expect(state.isClosedTimeReturns, isTrue);
    });

    test('isClosedTimeReturn returns false for Valid future date', () {
      final state = AnnouncementState.initial().copyWith(
        lastClosedTimeReturns: fakeFutureDateTimeString,
      );

      expect(state.isClosedTimeReturns, isFalse);
    });

    test('canShowSheetHome returns false when maintenanceItem is empty', () {
      final state = AnnouncementState.initial()
          .copyWith(maintenanceItem: MaintenanceItem.empty());

      expect(state.canShowSheetHome, isFalse);
    });

    test('canShowSheetHome returns false when isClosedTimeOrder false', () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimeOrder: fakeFutureDateTimeString,
      );

      expect(state.canShowSheetHome, isFalse);
    });

    test(
        'canShowSheetHome returns false when order list of list maintenance banner is empty',
        () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock.copyWith(banners: []),
      );

      expect(state.canShowSheetHome, isFalse);
    });

    test('canShowSheetHome returns true when all check pass', () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimeOrder: fakePastDateTimeString,
      );

      expect(state.canShowSheetHome, isTrue);
    });

    test('canShowSheetPayment returns false when maintenanceItem is empty', () {
      final state = AnnouncementState.initial()
          .copyWith(maintenanceItem: MaintenanceItem.empty());

      expect(state.canShowSheetPayment, isFalse);
    });

    test('canShowSheetPayment returns false when isClosedTimePayment false',
        () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimePayment: fakeFutureDateTimeString,
      );

      expect(state.canShowSheetPayment, isFalse);
    });

    test(
        'canShowSheetPayment returns false when order list of list maintenance banner is empty',
        () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock.copyWith(banners: []),
      );

      expect(state.canShowSheetHome, isFalse);
    });

    test('canShowSheetHome returns true when all check pass', () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimePayment: fakePastDateTimeString,
      );

      expect(state.canShowSheetPayment, isTrue);
    });

    test('canShowSheetReturns returns false when maintenanceItem is empty', () {
      final state = AnnouncementState.initial()
          .copyWith(maintenanceItem: MaintenanceItem.empty());

      expect(state.canShowSheetReturn, isFalse);
    });

    test('canShowSheetReturns returns false when lastClosedTimeReturns false',
        () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimeReturns: fakeFutureDateTimeString,
      );

      expect(state.canShowSheetReturn, isFalse);
    });

    test(
        'canShowSheetReturns returns false when order list of list maintenance banner is empty',
        () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock.copyWith(banners: []),
      );

      expect(state.canShowSheetReturn, isFalse);
    });

    test('canShowSheetReturns returns true when all check pass', () {
      final state = AnnouncementState.initial().copyWith(
        maintenanceItem: maintenanceItemMock,
        lastClosedTimeReturns: fakePastDateTimeString,
      );

      expect(state.canShowSheetReturn, isTrue);
    });
  });
}
