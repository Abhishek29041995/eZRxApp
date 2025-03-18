part of 'aup_tc_bloc.dart';

@freezed
class AupTcEvent with _$AupTcEvent {
  const factory AupTcEvent.show(User user) = _Show;
  const factory AupTcEvent.termsOfUseConsent({
    required bool newValue,
  }) = _TermsOfUseConsent;
  const factory AupTcEvent.privacyPolicyConsent({
    required bool newValue,
  }) = _PrivacyPolicyConsent;
}
