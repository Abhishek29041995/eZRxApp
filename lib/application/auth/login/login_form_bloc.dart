import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_bloc.freezed.dart';

part 'login_form_event.dart';

part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthRepository authRepository;
  final IDeviceRepository deviceRepository;

  LoginFormBloc({
    required this.authRepository,
    required this.deviceRepository,
  }) : super(LoginFormState.initial()) {
    on<LoginFormEvent>(_onEvent);
  }

  Future<void> _onEvent(
    LoginFormEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    await event.map(
      loadLastSavedCred: (e) async {
        emit(state.copyWith(isSubmitting: true));
        final failureOrSuccess = await authRepository.loadCredential();
        final currentMarket = await deviceRepository.getCurrentMarket();
        if (isClosed) return;
        failureOrSuccess.fold(
          (_) => emit(state.copyWith(isSubmitting: false)),
          (cred) {
            var newState = state;
            if (cred.username.isValid() && cred.password.isValid()) {
              newState = newState.copyWith(
                username: cred.username,
                password: cred.password,
                rememberPassword: true,
                authFailureOrSuccessOption: none(),
              );
            }
            currentMarket.fold(
              (l) => newState = newState.copyWith(isSubmitting: false),
              (currentMarket) {
                final setMarket = currentMarket.isEmpty
                    ? e.appMarket
                    : AppMarket(currentMarket);
                newState = newState.copyWith(
                  isSubmitting: false,
                );

                add(_SetCurrentMarket(setMarket));
              },
            );

            emit(newState);
          },
        );
      },
      usernameChanged: (e) {
        emit(
          state.copyWith(
            username: Username(e.usernameStr),
            authFailureOrSuccessOption: none(),
          ),
        );
      },
      passwordChanged: (e) {
        emit(
          state.copyWith(
            password: Password.login(e.passwordStr),
            authFailureOrSuccessOption: none(),
          ),
        );
      },
      passwordVisibilityChanged: (e) {
        emit(state.copyWith(passwordVisible: !state.passwordVisible));
      },
      rememberCheckChanged: (e) {
        emit(state.copyWith(rememberPassword: !state.rememberPassword));
      },
      loginWithEmailAndPasswordPressed: (e) async {
        final isUsernameValid = state.username.isValid();
        final isPasswordValid = state.password.isValid();

        if (isUsernameValid && isPasswordValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await authRepository.login(
            username: state.username,
            password: state.password,
          );

          await failureOrSuccess.fold(
            (_) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: true,
                  authFailureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (login) async {
              await authRepository.storeJWT(
                access: login.access,
                refresh: login.refresh,
              );
              if (state.rememberPassword) {
                await authRepository.storeCredential(
                  username: state.username,
                  password: state.password,
                );
              } else {
                await authRepository.deleteCredential();
              }
              if (isClosed) return;
              emit(
                state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: false,
                  username: Username(''),
                  password: Password.login(''),
                  authFailureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        } else {
          if (isClosed) return;
          emit(state.copyWith(showErrorMessages: true));
        }
      },
      loginWithOktaButtonPressed: (e) async {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );
        final oktaLoginResult = await authRepository.loginWithOkta();
        if (isClosed) return;
        oktaLoginResult.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                authFailureOrSuccessOption: optionOf(oktaLoginResult),
              ),
            );
          },
          (success) => add(const LoginFormEvent.refreshOktaToken()),
        );
      },
      refreshOktaToken: (e) async {
        final oktaAccessResult = await authRepository.getOktaAccessToken();
        if (isClosed) return;
        oktaAccessResult.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                authFailureOrSuccessOption: optionOf(oktaAccessResult),
              ),
            );
          },
          (oktaAccessToken) => add(
            LoginFormEvent.exchanhgeEZRXToken(oktaAccessToken),
          ),
        );
      },
      exchanhgeEZRXToken: (e) async {
        final ezrxResult = await authRepository.getEZRXJWT(e.oktaAccessToken);
        await ezrxResult.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                authFailureOrSuccessOption: optionOf(ezrxResult),
              ),
            );
          },
          (login) async {
            await authRepository.storeJWT(
              access: login.access,
              refresh: login.refresh,
            );
            if (isClosed) return;
            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: false,
                authFailureOrSuccessOption: optionOf(ezrxResult),
              ),
            );
          },
        );
      },
      fetchCurrentMarket: (e) async {
        final currentMarket = await deviceRepository.getCurrentMarket();
        if (isClosed) return;
        currentMarket.fold(
          (failure) => emit(
            state.copyWith(
              authFailureOrSuccessOption: optionOf(currentMarket),
            ),
          ),
          (market) {
            emit(
              state.copyWith(
                currentMarket: AppMarket(market),
                authFailureOrSuccessOption: optionOf(currentMarket),
              ),
            );
          },
        );
      },
      setCurrentMarket: (e) async {
        final currentMarket = await deviceRepository.setCurrentMarket(
          currentMarket: e.currentMarket,
        );
        if (isClosed) return;
        currentMarket.fold(
          (failure) => emit(
            state.copyWith(
              authFailureOrSuccessOption: optionOf(currentMarket),
            ),
          ),
          (market) {
            emit(
              state.copyWith(
                currentMarket: e.currentMarket,
                authFailureOrSuccessOption: optionOf(currentMarket),
              ),
            );
          },
        );
      },
    );
  }
}
