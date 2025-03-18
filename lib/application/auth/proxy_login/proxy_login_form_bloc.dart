import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'proxy_login_form_bloc.freezed.dart';
part 'proxy_login_form_event.dart';
part 'proxy_login_form_state.dart';

class ProxyLoginFormBloc
    extends Bloc<ProxyLoginFormEvent, ProxyLoginFormState> {
  final IAuthRepository authRepository;

  ProxyLoginFormBloc({
    required this.authRepository,
  }) : super(ProxyLoginFormState.initial()) {
    on<ProxyLoginFormEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ProxyLoginFormEvent event,
    Emitter<ProxyLoginFormState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(ProxyLoginFormState.initial());
      },
      usernameChanged: (e) {
        emit(
          state.copyWith(
            username: Username(e.usernameStr),
            authFailureOrSuccessOption: none(),
          ),
        );
      },
      loginWithADButtonPressed: (e) async {
        final isProxyUsernameValid = state.username.isValid();
        if (isProxyUsernameValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          final proxyLoginFailureOrSuccess = await authRepository.proxyLogin(
            username: state.username,
          );
          await proxyLoginFailureOrSuccess.fold(
            (_) {
              if (isClosed) return;
              emit(
                state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: true,
                  authFailureOrSuccessOption: optionOf(
                    proxyLoginFailureOrSuccess,
                  ),
                ),
              );
            },
            (login) async {
              await authRepository.logout();
              await authRepository.storeJWT(
                access: login.access,
                refresh: login.refresh,
              );
              if (isClosed) return;
              emit(
                state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: false,
                  authFailureOrSuccessOption: optionOf(
                    proxyLoginFailureOrSuccess,
                  ),
                ),
              );
            },
          );
        } else {
          if (isClosed) return;
          emit(state.copyWith(showErrorMessages: true));
        }
      },
    );
  }
}
