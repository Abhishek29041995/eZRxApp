import 'dart:async';

import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      init: (e) {
        add(const AuthEvent.authCheck());
      },
      bioCheck: (e) async {
        final isBiometricPossibleResult =
            await authRepository.canBeAuthenticatedAndBioAvailable();
        await isBiometricPossibleResult.fold(
          (error) async {
            if (isClosed) return;
            emit(const AuthState.authenticated());
          },
          (response) async {
            final authResultEither =
                await authRepository.doBiometricAuthentication();
            if (isClosed) return;
            authResultEither.fold(
              (error) => add(const AuthEvent.logout()),
              (response) => emit(const AuthState.authenticated()),
            );
          },
        );
      },
      authCheck: (e) async {
        final result = await authRepository.tokenValid();
        if (isClosed) return;
        result.fold(
          (invalid) => add(const AuthEvent.refreshEZRXToken()),
          (valid) {
            final isBiometricEnabledResult =
                authRepository.isBiometricEnabled();

            isBiometricEnabledResult.fold(
              (error) => emit(const AuthState.authenticated()),
              (isEnable) {
                isEnable
                    ? add(const AuthEvent.checkIfBiometricDenied())
                    : emit(const AuthState.authenticated());
              },
            );
          },
        );
      },
      refreshEZRXToken: (e) async {
        final refreshResult = await authRepository.getRefreshToken();
        await refreshResult.fold(
          (failure) async {
            if (isClosed) return;
            emit(const AuthState.unauthenticated());
          },
          (refreshToken) async {
            final ezrxResult =
                await authRepository.getAccessToken(refreshToken);
            await ezrxResult.fold(
              (failure) async {
                if (isClosed) return;
                emit(const AuthState.unauthenticated());
              },
              (login) async {
                await authRepository.storeJWT(
                  access: login.access,
                  refresh: login.refresh,
                );
                final isBiometricEnabledResult =
                    authRepository.isBiometricEnabled();
                if (isClosed) return;
                isBiometricEnabledResult.fold(
                  (error) => emit(const AuthState.authenticated()),
                  (isEnable) {
                    isEnable
                        ? add(const AuthEvent.bioCheck())
                        : emit(const AuthState.authenticated());
                  },
                );
              },
            );
          },
        );
      },
      logout: (e) async {
        await authRepository.logout();
        if (isClosed) return;
        emit(const AuthState.unauthenticated());
      },
      checkIfBiometricDenied: (e) async {
        final failureOrSuccess =
            await authRepository.checkBiometricPermission();
        failureOrSuccess.fold(
          (failure) {
            emit(const AuthState.biometricDenied());
          },
          (isBiometricPossible) {
            add(const AuthEvent.bioCheck());
          },
        );
      },
      visitedAppSettings: (e) {
        emit(const AuthState.visitedAppSettings());
      },
    );
  }
}
