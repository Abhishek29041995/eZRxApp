// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialFilterDtoImpl _$$MaterialFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialFilterDtoImpl(
      manufactureList: (json['ManufactureList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      countryList: (json['CountryList'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialFilterCountryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      brandList: (json['BrandList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$MaterialFilterDtoImplToJson(
        _$MaterialFilterDtoImpl instance) =>
    <String, dynamic>{
      'ManufactureList': instance.manufactureList,
      'CountryList': instance.countryList.map((e) => e.toJson()).toList(),
      'BrandList': instance.brandList,
    };

_$MaterialFilterCountryDtoImpl _$$MaterialFilterCountryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialFilterCountryDtoImpl(
      code: json['Code'] as String? ?? '',
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$MaterialFilterCountryDtoImplToJson(
        _$MaterialFilterCountryDtoImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Name': instance.name,
    };
