part of 'aup_tc_bloc.dart';

@freezed
class AupTcState with _$AupTcState {
  const AupTcState._();

  const factory AupTcState({
    required User user,
    required bool tncConsent,
    required bool privacyConsent,
  }) = _AupTcState;

  factory AupTcState.initial() => AupTcState(
        user: User.empty(),
        tncConsent: false,
        privacyConsent: false,
      );

  bool get userConsentAll => tncConsent && privacyConsent;
}
