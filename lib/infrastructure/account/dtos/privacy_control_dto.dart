import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_control_dto.freezed.dart';
part 'privacy_control_dto.g.dart';

@freezed
class PrivacyControlDto with _$PrivacyControlDto {
  const PrivacyControlDto._();

  const factory PrivacyControlDto({
    @JsonKey(defaultValue: false) required bool automatedPersonalisation,
    @JsonKey(defaultValue: false) required bool directMarketing,
    @JsonKey(defaultValue: false) required bool viaEmails,
    @JsonKey(defaultValue: false) required bool viaPushNotification,
    @JsonKey(defaultValue: false) required bool viaSMS,
  }) = _PrivacyControlDto;

  factory PrivacyControlDto.fromDomain(PrivacyControl privacyControl) {
    return PrivacyControlDto(
      automatedPersonalisation: privacyControl.automatedPersonalisation,
      directMarketing: privacyControl.directMarketing,
      viaEmails: privacyControl.viaEmails,
      viaPushNotification: privacyControl.viaPushNotification,
      viaSMS: privacyControl.viaSMS,
    );
  }

  static const emptyPrivacyControlDto = PrivacyControlDto(
    automatedPersonalisation: false,
    directMarketing: false,
    viaEmails: false,
    viaPushNotification: false,
    viaSMS: false,
  );
  factory PrivacyControlDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacyControlDtoFromJson(json);
}
