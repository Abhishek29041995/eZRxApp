// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_response_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitOrderResponseMessageDtoImpl
    _$$SubmitOrderResponseMessageDtoImplFromJson(Map<String, dynamic> json) =>
        _$SubmitOrderResponseMessageDtoImpl(
          type: json['Type'] as String? ?? '',
          message: json['Message'] as String? ?? '',
        );

Map<String, dynamic> _$$SubmitOrderResponseMessageDtoImplToJson(
        _$SubmitOrderResponseMessageDtoImpl instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Message': instance.message,
    };
