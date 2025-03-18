import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_control.freezed.dart';

@freezed
class PrivacyControl with _$PrivacyControl {
  const PrivacyControl._();

  const factory PrivacyControl({
    required bool automatedPersonalisation,
    required bool directMarketing,
    required bool viaEmails,
    required bool viaPushNotification,
    required bool viaSMS,
  }) = _PrivacyControl;

  factory PrivacyControl.empty() => const PrivacyControl(
        automatedPersonalisation: false,
        directMarketing: false,
        viaEmails: false,
        viaPushNotification: false,
        viaSMS: false,
      );
}
