import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/repository/i_notification_settings_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings_bloc.freezed.dart';
part 'notification_settings_event.dart';
part 'notification_settings_state.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  final INotificationSettingsRepository notificationSettingsRepository;
  NotificationSettingsBloc({required this.notificationSettingsRepository})
      : super(NotificationSettingsState.initial()) {
    on<NotificationSettingsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    NotificationSettingsEvent event,
    Emitter<NotificationSettingsState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(NotificationSettingsState.initial());
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            currentNotificationSettings: NotificationSettings.empty(),
            previousNotificationSettings: NotificationSettings.empty(),
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );
        final failureOrSuccess =
            await notificationSettingsRepository.getNotificationSettings();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (notificationSettings) {
            emit(
              state.copyWith(
                currentNotificationSettings: notificationSettings,
                previousNotificationSettings: notificationSettings,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      updateOrderConfirmation: (e) {
        final newNotificationSettings = state.currentNotificationSettings
            .copyWith(orderConfirmation: NotificationSetting(e.value));
        emit(
          state.copyWith(
            currentNotificationSettings: newNotificationSettings,
          ),
        );
      },
      updatePaymentConfirmation: (e) {
        final newNotificationSettings = state.currentNotificationSettings
            .copyWith(paymentConfirmation: NotificationSetting(e.value));
        emit(
          state.copyWith(
            currentNotificationSettings: newNotificationSettings,
          ),
        );
      },
      updateReturnConfirmation: (e) {
        final newNotificationSettings = state.currentNotificationSettings
            .copyWith(ereturnConfirmation: NotificationSetting(e.value));
        emit(
          state.copyWith(
            currentNotificationSettings: newNotificationSettings,
          ),
        );
      },
      clear: (e) {
        emit(
          state.copyWith(
            currentNotificationSettings: state.previousNotificationSettings,
          ),
        );
      },
      submit: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            submitFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await notificationSettingsRepository.setNotificationSettings(
          notificationSettings: state.currentNotificationSettings,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              submitFailureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (notificationSettings) => emit(
            state.copyWith(
              submitFailureOrSuccessOption: optionOf(failureOrSuccess),
              previousNotificationSettings: state.currentNotificationSettings,
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
