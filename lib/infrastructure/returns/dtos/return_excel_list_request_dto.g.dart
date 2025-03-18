// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_excel_list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnExcelListRequestDtoImpl _$$ReturnExcelListRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnExcelListRequestDtoImpl(
      isViewByReturn: json['isViewByReturn'] as bool? ?? false,
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      username: json['username'] as String? ?? '',
      filterQuery: ReturnExcelFilterDto.fromJson(
          json['filterQuery'] as Map<String, dynamic>),
      searchKey: json['searchFilter'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnExcelListRequestDtoImplToJson(
        _$ReturnExcelListRequestDtoImpl instance) =>
    <String, dynamic>{
      'isViewByReturn': instance.isViewByReturn,
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'username': instance.username,
      'searchFilter': instance.searchKey,
    };
