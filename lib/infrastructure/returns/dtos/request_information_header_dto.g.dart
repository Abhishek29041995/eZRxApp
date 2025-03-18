// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_information_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestInformationHeaderDtoImpl _$$RequestInformationHeaderDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestInformationHeaderDtoImpl(
      returnReference: json['returnReference'] as String? ?? '',
      specialInstructions: json['specialInstructions'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      createdTime: json['createdTime'] as String? ?? '',
      cName1: json['cName1'] as String? ?? '',
      refundTotal: json['refundTotal'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      requestID: json['requestID'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      bapiStatus: json['bapiStatus'] as String? ?? '',
      totalItemCount: json['totalItemCount'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$RequestInformationHeaderDtoImplToJson(
        _$RequestInformationHeaderDtoImpl instance) =>
    <String, dynamic>{
      'returnReference': instance.returnReference,
      'specialInstructions': instance.specialInstructions,
      'createdDate': instance.createdDate,
      'createdTime': instance.createdTime,
      'cName1': instance.cName1,
      'refundTotal': instance.refundTotal,
      'soldTo': instance.soldTo,
      'requestID': instance.requestID,
      'createdBy': instance.createdBy,
      'bapiStatus': instance.bapiStatus,
      'totalItemCount': instance.totalItemCount,
      'isMarketPlace': instance.isMarketPlace,
    };
