import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_data.freezed.dart';

@freezed
class CountryData with _$CountryData {
  const CountryData._();
  factory CountryData({
    required String country,
    required StringValue countryName,
  }) = _CountryData;

  factory CountryData.empty() => CountryData(
        country: '',
        countryName: StringValue(''),
      );
}
