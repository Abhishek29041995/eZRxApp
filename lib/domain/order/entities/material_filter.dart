import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_filter.freezed.dart';

@freezed
class MaterialFilter with _$MaterialFilter {
  const MaterialFilter._();

  const factory MaterialFilter({
    @Default(false) bool isFavourite,
    @Default(false) bool isMarketPlace,
    @Default(false) bool isCovidSelected,
    @Default(false) bool bundleOffers,
    @Default(false) bool comboOffers,
    @Default(false) bool isProductOffer,
    @Default(false) bool isTender,
    @Default(Sort.az) Sort sortBy,
    @Default(false) bool hasAccessToCovidMaterial,
    required Map<String, bool> manufactureMapOptions,
    required Map<MaterialFilterCountry, bool> countryMapOptions,
    required List<String> brandList,
    @Default(<String>[]) List<String> manufactureListSelected,
    @Default(<MaterialFilterCountry>[])
    List<MaterialFilterCountry> countryListSelected,
    @Default(false) bool isGimmick,
    @Default(false) bool isSample,
    @Default(false) bool isPoison,
  }) = _MaterialFilter;

  factory MaterialFilter.empty() => const MaterialFilter(
        sortBy: Sort.az,
        manufactureMapOptions: <String, bool>{},
        countryMapOptions: <MaterialFilterCountry, bool>{},
        brandList: <String>[],
        manufactureListSelected: <String>[],
        countryListSelected: <MaterialFilterCountry>[],
      );

  bool get displayManufactureOption => manufactureMapOptions.isNotEmpty;

  bool get displayCountryOfOriginOption => countryMapOptions.isNotEmpty;

  bool get displayCategorySection =>
      displayManufactureOption || displayCountryOfOriginOption;

  String get type {
    // If both bundle and product offers are selected, Type is empty
    if (bundleOffers && isProductOffer) return '';

    // If only bundle offer is selected, Type is 'bundle'
    if (bundleOffers) return 'bundle';

    // If only product offer is selected, Type is 'material'
    if (isProductOffer) return 'material';

    // If neither bundle nor product offers are selected, Type is empty
    return '';
  }

  Map<String, dynamic> get trackingInfo {
    final showProductFilter = <String>[];
    if (isFavourite) showProductFilter.add('Favourites');
    if (isProductOffer) showProductFilter.add('Items with offers');
    if (bundleOffers) showProductFilter.add('Bundle offers');
    if (isMarketPlace) showProductFilter.add('Marketplace items');
    if (isTender) showProductFilter.add('Tender Contract');
    if (isGimmick) showProductFilter.add('Gimmick Items');
    if (isSample) showProductFilter.add('Sample Items');
    if (isPoison) showProductFilter.add('Poison');

    return {
      if (showProductFilter.isNotEmpty)
        TrackingProps.filterShowProduct: showProductFilter,
      TrackingProps.filterSortBy: sortBy.title,
      if (manufactureListSelected.isNotEmpty)
        TrackingProps.filterManufacturer: manufactureListSelected,
      if (countryListSelected.isNotEmpty)
        TrackingProps.filterCountryOfOrigin:
            countryListSelected.map((e) => e.name).toList(),
    };
  }

  //Please don't reference this [isCovidSelectedFilterValue] for any future
  //implementation this is implemented now because of bad API design we have
  //right now, it helps to determine the value for isFOCMaterial that we have
  //to send to api:
  // Here [hasAccessToCovidMaterial] is the flag which determines whether the
  // selected customer code is eligible for covid materials.
  //i) if hasAccessToCovidMaterial --> true and isCovidSelected --> true then it will
  // return true.
  //ii) if hasAccessToCovidMaterial --> true and isCovidSelected --> false then it
  // will return null.
  //iii) if hasAccessToCovidMaterial --> false and isCovidSelected --> false then it
  // will return false.
  bool? get isCovidSelectedFilterValue =>
      hasAccessToCovidMaterial && !isCovidSelected ? null : isCovidSelected;
}

@freezed
class MaterialFilterCountry with _$MaterialFilterCountry {
  const MaterialFilterCountry._();

  const factory MaterialFilterCountry({
    required String code,
    required String name,
  }) = _MaterialFilterCountry;

  factory MaterialFilterCountry.empty() => const MaterialFilterCountry(
        code: '',
        name: '',
      );
}
