part of 'privacy_consent_bloc.dart';

@freezed
class PrivacyConsentEvent with _$PrivacyConsentEvent {
  const factory PrivacyConsentEvent.initialized() = _Initialized;
  const factory PrivacyConsentEvent.fetch() = _Fetch;
  const factory PrivacyConsentEvent.submit() = _Submit;
  const factory PrivacyConsentEvent.clear() = _Clear;
  const factory PrivacyConsentEvent.updateAutomatedPersonalisation({
    required bool value,
  }) = _UpdateAutomatedPersonalisation;
  const factory PrivacyConsentEvent.updateViaEmail({
    required bool value,
  }) = _UpdateViaEmail;
  const factory PrivacyConsentEvent.updateViaPushNotification({
    required bool value,
  }) = _UpdateViaPushNotification;
  const factory PrivacyConsentEvent.updateViaSMS({
    required bool value,
  }) = _UpdateViaSMS;
}
