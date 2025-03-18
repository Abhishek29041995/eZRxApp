// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestInformationDtoImpl _$$RequestInformationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestInformationDtoImpl(
      requestHeader: RequestInformationHeaderDto.fromJson(
          json['requestHeader'] as Map<String, dynamic>),
      requestInformation: (json['requestInformationV2'] as List<dynamic>?)
              ?.map((e) => ReturnRequestInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$RequestInformationDtoImplToJson(
        _$RequestInformationDtoImpl instance) =>
    <String, dynamic>{
      'requestHeader': instance.requestHeader.toJson(),
      'requestInformationV2':
          instance.requestInformation.map((e) => e.toJson()).toList(),
    };
