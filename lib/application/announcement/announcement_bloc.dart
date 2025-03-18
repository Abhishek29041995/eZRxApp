import 'dart:async';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/announcement/repository/i_announcement_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_bloc.freezed.dart';

part 'announcement_event.dart';

part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final IAnnouncementRepository announcementRepository;

  AnnouncementBloc({
    required this.announcementRepository,
  }) : super(AnnouncementState.initial()) {
    on<AnnouncementEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    AnnouncementEvent event,
    Emitter<AnnouncementState> emit,
  ) async {
    await event.map(
      getAnnouncement: (_) async {
        emit(state.copyWith(isLoading: true));
        final failureOrSuccess =
            await announcementRepository.getAnnouncements();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(isLoading: false),
            );
          },
          (newAnnouncement) {
            emit(
              state.copyWith(
                isLoading: false,
                isClosed: false,
                announcement: newAnnouncement,
                preferSalesOrgLanguage: true,
              ),
            );
          },
        );
      },
      getMaintenanceBanners: (e) async {
        emit(state.copyWith(isLoading: true));
        final failureOrSuccess =
            await announcementRepository.getMaintenanceBanners(
          salesOrg: e.salesOrg,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                maintenanceItem: MaintenanceItem.empty(),
              ),
            );
          },
          (maintenanceItem) {
            emit(
              state.copyWith(
                isLoading: false,
                maintenanceItem: maintenanceItem,
              ),
            );
          },
        );
      },
      close: (_) {
        emit(
          state.copyWith(
            isClosed: true,
          ),
        );
      },
      show: (_) {
        emit(
          state.copyWith(
            isClosed: false,
          ),
        );
      },
      changePreferLanguage: (e) {
        emit(
          state.copyWith(preferSalesOrgLanguage: e.preferSalesOrgLanguage),
        );
      },
      setClosedTime: (e) async {
        final result = await announcementRepository.setClosedTime(
          dateTime: e.dateTime,
          storageType: e.storageType,
        );

        result.fold((_) => null, (r) {
          switch (e.storageType) {
            case StorageType.order:
              emit(state.copyWith(lastClosedTimeOrder: e.dateTime));
              break;
            case StorageType.payment:
              emit(state.copyWith(lastClosedTimePayment: e.dateTime));
              break;
            case StorageType.returns:
              emit(state.copyWith(lastClosedTimeReturns: e.dateTime));
              break;
          }
        });
      },
      getClosedTime: (_) async {
        var newState = state;
        await Future.wait([
          announcementRepository.getClosedTimeOrder().then(
                (value) => value
                  ..fold(
                    (_) => null,
                    (dateTime) => {
                      newState =
                          newState.copyWith(lastClosedTimeOrder: dateTime),
                    },
                  ),
              ),
          announcementRepository.getClosedTimePayment().then(
                (value) => value.fold(
                  (_) => null,
                  (dateTime) => {
                    newState =
                        newState.copyWith(lastClosedTimePayment: dateTime),
                  },
                ),
              ),
          announcementRepository.getClosedTimeReturns().then(
                (value) => value.fold(
                  (_) => null,
                  (dateTime) => {
                    newState =
                        newState.copyWith(lastClosedTimeReturns: dateTime),
                  },
                ),
              ),
        ]);
        if (isClosed) return;
        emit(newState);
      },
      closedBannerId: (e) {
        final list = [...state.listBannersIdClosed, e.id];
        emit(state.copyWith(listBannersIdClosed: list));
      },
      clearBannerId: (e) {
        emit(state.copyWith(listBannersIdClosed: []));
      },
      clearClosedTime: (_) {
        announcementRepository.clearClosedTime();
        emit(
          state.copyWith(
            listBannersIdClosed: [],
            lastClosedTimeOrder: DateTimeStringValue(''),
            lastClosedTimePayment: DateTimeStringValue(''),
            lastClosedTimeReturns: DateTimeStringValue(''),
          ),
        );
      },
    );
  }
}
