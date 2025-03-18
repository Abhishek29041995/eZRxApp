import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final IAuthRepository authRepository;
  SettingBloc({
    required this.authRepository,
  }) : super(SettingState.initial()) {
    on<SettingEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SettingEvent event,
    Emitter<SettingState> emit,
  ) async {
    await event.map(
      fetchBiometricFlag: (e) {
        final failureOrSuccess = authRepository.isBiometricEnabled();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isBiometricPossible: true,
                isBiometricEnable: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
          (isBiometricEnable) => emit(
            state.copyWith(
              isBiometricPossible: true,
              isBiometricEnable: isBiometricEnable,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      toggleBiometric: (e) async {
        if (!state.isBiometricEnable) {
          emit(
            state.copyWith(
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await authRepository.doBiometricAuthentication();
          await failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (isBiometricGranted) async {
              if (isBiometricGranted) {
                await authRepository.putBiometricEnabledState(
                  isBiometricEnable: e.isBiometricEnabled,
                );
                if (isClosed) return;
                add(const SettingEvent.fetchBiometricFlag());
              } else {
                if (isClosed) return;
                emit(
                  state.copyWith(
                    failureOrSuccessOption: none(),
                  ),
                );
              }
            },
          );
        } else {
          await authRepository.putBiometricEnabledState(
            isBiometricEnable: e.isBiometricEnabled,
          );
          if (isClosed) return;
          add(const SettingEvent.fetchBiometricFlag());
        }
      },
      checkIfBiometricPossible: (e) async {
        final failureOrSuccess = await authRepository.canShowBiometricToggle();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isBiometricPossible: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
          (isBiometricPossible) {
            if (isBiometricPossible) {
              add(const SettingEvent.fetchBiometricFlag());
            } else {
              emit(
                state.copyWith(
                  isBiometricPossible: false,
                  failureOrSuccessOption: none(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
