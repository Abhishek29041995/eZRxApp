part of 'contact_us_bloc.dart';

@freezed
class ContactUsEvent with _$ContactUsEvent {
  const factory ContactUsEvent.initialized({
    required AppMarket market,
  }) = _Initialized;
  const factory ContactUsEvent.submit() = _Submit;
  const factory ContactUsEvent.onUsernameChange({
    required String newValue,
  }) = _UsernameChange;
  const factory ContactUsEvent.onEmailChange({
    required String newValue,
  }) = _EmailChange;
  const factory ContactUsEvent.onContactNumberChange({
    required String newValue,
  }) = _ContactNumberChange;
  const factory ContactUsEvent.onMessageChange({
    required String newValue,
  }) = _MessageChange;
}
