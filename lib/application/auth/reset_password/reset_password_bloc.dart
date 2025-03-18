import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/repository/i_change_password_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  IChangePasswordRepository changePasswordRepository;
  ResetPasswordBloc({
    required this.changePasswordRepository,
  }) : super(ResetPasswordState.initial()) {
    on<ResetPasswordEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    await event.map(
      togglePasswordVisibility: (e) {
        switch (e.fieldType) {
          case PasswordFieldType.oldPassword:
            emit(
              state.copyWith(
                isOldPasswordObscure: e.toggleValue,
              ),
            );
            break;
          case PasswordFieldType.newPassword:
            emit(
              state.copyWith(
                isNewPasswordObscure: e.toggleValue,
              ),
            );
            break;
          case PasswordFieldType.confirmPassword:
            emit(
              state.copyWith(
                isConfirmPasswordObscure: e.toggleValue,
              ),
            );
            break;
        }
      },
      onTextChange: (e) {
        switch (e.fieldType) {
          case PasswordFieldType.oldPassword:
            emit(
              state.copyWith(
                oldPassword: Password.login(e.newValue),
              ),
            );
            break;
          case PasswordFieldType.newPassword:
            emit(
              state.copyWith(
                newPassword: Password.resetV2(
                  e.newValue,
                  state.oldPassword.getValue(),
                  state.user.username.getValue(),
                ),
                confirmPassword: Password.confirm(
                  state.confirmPassword.getValue(),
                  e.newValue,
                ),
              ),
            );
            break;
          case PasswordFieldType.confirmPassword:
            emit(
              state.copyWith(
                confirmPassword: Password.confirm(
                  e.newValue,
                  state.newPassword.getValue(),
                ),
              ),
            );
            break;
        }
      },
      changePassword: (e) async {
        final isFormValidated = state.oldPassword.isValid() &&
            state.newPassword.isValid() &&
            state.confirmPassword.isValid();

        if (!isFormValidated) {
          emit(
            state.copyWith(showErrorMessages: true),
          );

          return;
        }

        emit(
          state.copyWith(
            isSubmitting: true,
            passwordResetFailureOrSuccessOption: none(),
            showErrorMessages: false,
          ),
        );

        final failureOrSuccess = await changePasswordRepository.changePassword(
          newPassword: state.newPassword,
          oldPassword: state.oldPassword,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                passwordResetFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
              ),
            );
          },
          (success) => add(const _Clear()),
        );
      },
      clear: (e) {
        emit(
          ResetPasswordState.initial().copyWith(
            user: state.user,
          ),
        );
      },
      resetPassword: (e) async {
        final isFormValidated =
            state.newPassword.isValid() && state.confirmPassword.isValid();

        if (!isFormValidated) {
          emit(
            state.copyWith(showErrorMessages: true),
          );

          return;
        }
        emit(
          state.copyWith(
            isSubmitting: true,
            passwordResetFailureOrSuccessOption: none(),
            showErrorMessages: false,
          ),
        );

        final failureOrSuccess = await changePasswordRepository.resetPassword(
          newPassword: state.newPassword,
          token: state.resetPasswordKey,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                passwordResetFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
              ),
            );
          },
          (resetPassword) => add(const _Clear()),
        );
      },
      changePasswordForFirstTime: (e) async {
        final isFormValidated =
            state.newPassword.isValid() && state.confirmPassword.isValid();

        if (!isFormValidated) {
          emit(
            state.copyWith(showErrorMessages: true),
          );

          return;
        }
        emit(
          state.copyWith(
            isSubmitting: true,
            passwordResetFailureOrSuccessOption: none(),
            showErrorMessages: false,
          ),
        );

        final failureOrSuccess =
            await changePasswordRepository.changePasswordForFirstTime(
          newPassword: state.newPassword,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                passwordResetFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
              ),
            );
          },
          (resetPassword) => add(const _Clear()),
        );
      },
      initialize: (e) {
        emit(
          ResetPasswordState.initial().copyWith(
            resetPasswordKey: e.resetPasswordKey,
            user: e.user,
          ),
        );
      },
    );
  }
}
