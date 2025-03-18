part of 'proxy_login_form_bloc.dart';

@freezed
class ProxyLoginFormState with _$ProxyLoginFormState {
  const factory ProxyLoginFormState({
    required Username username,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ApiFailure, dynamic>> authFailureOrSuccessOption,
  }) = _ProxyLoginFormState;

  factory ProxyLoginFormState.initial() => ProxyLoginFormState(
        username: Username(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
