import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'material_filter_dto.freezed.dart';
part 'material_filter_dto.g.dart';

@freezed
class MaterialFilterDto with _$MaterialFilterDto {
  const MaterialFilterDto._();
  const factory MaterialFilterDto({
    @JsonKey(name: 'ManufactureList', defaultValue: <String>[])
        required List<String> manufactureList,
    @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
        required List<MaterialFilterCountryDto> countryList,
    @JsonKey(name: 'BrandList', defaultValue: <String>[])
        required List<String> brandList,
  }) = _MaterialFilterDto;

  MaterialFilter toDomain() {
    return MaterialFilter(
      manufactureMapOptions: {for (final e in manufactureList) e: false},
      countryMapOptions: {for (final e in countryList) e.toDomain(): false},
      brandList: brandList,
    );
  }

  factory MaterialFilterDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialFilterDtoFromJson(json);
}

@freezed
class MaterialFilterCountryDto with _$MaterialFilterCountryDto {
  const MaterialFilterCountryDto._();
  const factory MaterialFilterCountryDto({
    @JsonKey(name: 'Code', defaultValue: '') required String code,
    @JsonKey(name: 'Name', defaultValue: '') required String name,
  }) = _MaterialFilterCountryDto;

  MaterialFilterCountry toDomain() {
    return MaterialFilterCountry(
      code: code,
      name: name,
    );
  }

  factory MaterialFilterCountryDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialFilterCountryDtoFromJson(json);
}
