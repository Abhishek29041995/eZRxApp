// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitOrderResponseDtoImpl _$$SubmitOrderResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitOrderResponseDtoImpl(
      salesDocument: json['SalesDocument'] as String? ?? '',
      salesDocuments: (json['SalesDocuments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      messages: (json['Messages'] as List<dynamic>?)
              ?.map((e) => SubmitOrderResponseMessageDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$SubmitOrderResponseDtoImplToJson(
        _$SubmitOrderResponseDtoImpl instance) =>
    <String, dynamic>{
      'SalesDocument': instance.salesDocument,
      'SalesDocuments': instance.salesDocuments,
      'Messages': instance.messages.map((e) => e.toJson()).toList(),
    };
