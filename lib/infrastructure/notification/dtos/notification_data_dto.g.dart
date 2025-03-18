// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDataDtoImpl _$$NotificationDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      isRead: json['isRead'] as bool,
      returnRequestId: json['returnRequestNumber'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      paymentNumber: json['paymentNumber'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$NotificationDataDtoImplToJson(
        _$NotificationDataDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'returnRequestNumber': instance.returnRequestId,
      'orderNumber': instance.orderNumber,
      'paymentNumber': instance.paymentNumber,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'isMarketPlace': instance.isMarketPlace,
    };
