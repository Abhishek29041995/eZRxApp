// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_control_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyControlDtoImpl _$$PrivacyControlDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyControlDtoImpl(
      automatedPersonalisation:
          json['automatedPersonalisation'] as bool? ?? false,
      directMarketing: json['directMarketing'] as bool? ?? false,
      viaEmails: json['viaEmails'] as bool? ?? false,
      viaPushNotification: json['viaPushNotification'] as bool? ?? false,
      viaSMS: json['viaSMS'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrivacyControlDtoImplToJson(
        _$PrivacyControlDtoImpl instance) =>
    <String, dynamic>{
      'automatedPersonalisation': instance.automatedPersonalisation,
      'directMarketing': instance.directMarketing,
      'viaEmails': instance.viaEmails,
      'viaPushNotification': instance.viaPushNotification,
      'viaSMS': instance.viaSMS,
    };
