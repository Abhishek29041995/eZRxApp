// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDtoImpl _$$NotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDtoImpl(
      pagination:
          PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
      notificationData: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  NotificationDataDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$NotificationDtoImplToJson(
        _$NotificationDtoImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination.toJson(),
      'data': instance.notificationData.map((e) => e.toJson()).toList(),
    };
