// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_tracker_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStatusTrackerDtoImpl _$$OrderStatusTrackerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusTrackerDtoImpl(
      action: json['Actiom'] as String? ?? '',
      stepName: json['StepName'] as String? ?? '',
      stepStage: json['StepStape'] as String? ?? '',
      state: json['State'] as String? ?? '',
      status: json['Status'] as String? ?? '',
      updateTimeStamp: json['UpdateTimeStamp'] as String? ?? '',
      preformedAt: json['PreformedAt'] as String? ?? '',
    );

Map<String, dynamic> _$$OrderStatusTrackerDtoImplToJson(
        _$OrderStatusTrackerDtoImpl instance) =>
    <String, dynamic>{
      'Actiom': instance.action,
      'StepName': instance.stepName,
      'StepStape': instance.stepStage,
      'State': instance.state,
      'Status': instance.status,
      'UpdateTimeStamp': instance.updateTimeStamp,
      'PreformedAt': instance.preformedAt,
    };
