// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ship_to_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShipToInfo {
  bool get defaultShipToAddress => throw _privateConstructorUsedError;
  String get shipToCustomerCode => throw _privateConstructorUsedError;
  ShipToName get shipToName => throw _privateConstructorUsedError;
  ShipToAddress get shipToAddress => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get building => throw _privateConstructorUsedError;
  String get city1 => throw _privateConstructorUsedError;
  String get city2 => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get houseNumber1 => throw _privateConstructorUsedError;
  String get telephoneNumber => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get floor => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get targetCustomerType => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  List<LicenseInfo> get licenses => throw _privateConstructorUsedError;
  CustomerBlock get customerBlock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipToInfoCopyWith<ShipToInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipToInfoCopyWith<$Res> {
  factory $ShipToInfoCopyWith(
          ShipToInfo value, $Res Function(ShipToInfo) then) =
      _$ShipToInfoCopyWithImpl<$Res, ShipToInfo>;
  @useResult
  $Res call(
      {bool defaultShipToAddress,
      String shipToCustomerCode,
      ShipToName shipToName,
      ShipToAddress shipToAddress,
      Status status,
      String building,
      String city1,
      String city2,
      String postalCode,
      String houseNumber1,
      String telephoneNumber,
      String region,
      String floor,
      String plant,
      String targetCustomerType,
      String country,
      List<LicenseInfo> licenses,
      CustomerBlock customerBlock});

  $ShipToNameCopyWith<$Res> get shipToName;
  $ShipToAddressCopyWith<$Res> get shipToAddress;
}

/// @nodoc
class _$ShipToInfoCopyWithImpl<$Res, $Val extends ShipToInfo>
    implements $ShipToInfoCopyWith<$Res> {
  _$ShipToInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultShipToAddress = null,
    Object? shipToCustomerCode = null,
    Object? shipToName = null,
    Object? shipToAddress = null,
    Object? status = null,
    Object? building = null,
    Object? city1 = null,
    Object? city2 = null,
    Object? postalCode = null,
    Object? houseNumber1 = null,
    Object? telephoneNumber = null,
    Object? region = null,
    Object? floor = null,
    Object? plant = null,
    Object? targetCustomerType = null,
    Object? country = null,
    Object? licenses = null,
    Object? customerBlock = null,
  }) {
    return _then(_value.copyWith(
      defaultShipToAddress: null == defaultShipToAddress
          ? _value.defaultShipToAddress
          : defaultShipToAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToCustomerCode: null == shipToCustomerCode
          ? _value.shipToCustomerCode
          : shipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToName: null == shipToName
          ? _value.shipToName
          : shipToName // ignore: cast_nullable_to_non_nullable
              as ShipToName,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as ShipToAddress,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      city1: null == city1
          ? _value.city1
          : city1 // ignore: cast_nullable_to_non_nullable
              as String,
      city2: null == city2
          ? _value.city2
          : city2 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber1: null == houseNumber1
          ? _value.houseNumber1
          : houseNumber1 // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      targetCustomerType: null == targetCustomerType
          ? _value.targetCustomerType
          : targetCustomerType // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      licenses: null == licenses
          ? _value.licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<LicenseInfo>,
      customerBlock: null == customerBlock
          ? _value.customerBlock
          : customerBlock // ignore: cast_nullable_to_non_nullable
              as CustomerBlock,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToNameCopyWith<$Res> get shipToName {
    return $ShipToNameCopyWith<$Res>(_value.shipToName, (value) {
      return _then(_value.copyWith(shipToName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToAddressCopyWith<$Res> get shipToAddress {
    return $ShipToAddressCopyWith<$Res>(_value.shipToAddress, (value) {
      return _then(_value.copyWith(shipToAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipToInfoImplCopyWith<$Res>
    implements $ShipToInfoCopyWith<$Res> {
  factory _$$ShipToInfoImplCopyWith(
          _$ShipToInfoImpl value, $Res Function(_$ShipToInfoImpl) then) =
      __$$ShipToInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool defaultShipToAddress,
      String shipToCustomerCode,
      ShipToName shipToName,
      ShipToAddress shipToAddress,
      Status status,
      String building,
      String city1,
      String city2,
      String postalCode,
      String houseNumber1,
      String telephoneNumber,
      String region,
      String floor,
      String plant,
      String targetCustomerType,
      String country,
      List<LicenseInfo> licenses,
      CustomerBlock customerBlock});

  @override
  $ShipToNameCopyWith<$Res> get shipToName;
  @override
  $ShipToAddressCopyWith<$Res> get shipToAddress;
}

/// @nodoc
class __$$ShipToInfoImplCopyWithImpl<$Res>
    extends _$ShipToInfoCopyWithImpl<$Res, _$ShipToInfoImpl>
    implements _$$ShipToInfoImplCopyWith<$Res> {
  __$$ShipToInfoImplCopyWithImpl(
      _$ShipToInfoImpl _value, $Res Function(_$ShipToInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultShipToAddress = null,
    Object? shipToCustomerCode = null,
    Object? shipToName = null,
    Object? shipToAddress = null,
    Object? status = null,
    Object? building = null,
    Object? city1 = null,
    Object? city2 = null,
    Object? postalCode = null,
    Object? houseNumber1 = null,
    Object? telephoneNumber = null,
    Object? region = null,
    Object? floor = null,
    Object? plant = null,
    Object? targetCustomerType = null,
    Object? country = null,
    Object? licenses = null,
    Object? customerBlock = null,
  }) {
    return _then(_$ShipToInfoImpl(
      defaultShipToAddress: null == defaultShipToAddress
          ? _value.defaultShipToAddress
          : defaultShipToAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToCustomerCode: null == shipToCustomerCode
          ? _value.shipToCustomerCode
          : shipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToName: null == shipToName
          ? _value.shipToName
          : shipToName // ignore: cast_nullable_to_non_nullable
              as ShipToName,
      shipToAddress: null == shipToAddress
          ? _value.shipToAddress
          : shipToAddress // ignore: cast_nullable_to_non_nullable
              as ShipToAddress,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      city1: null == city1
          ? _value.city1
          : city1 // ignore: cast_nullable_to_non_nullable
              as String,
      city2: null == city2
          ? _value.city2
          : city2 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber1: null == houseNumber1
          ? _value.houseNumber1
          : houseNumber1 // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      plant: null == plant
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      targetCustomerType: null == targetCustomerType
          ? _value.targetCustomerType
          : targetCustomerType // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      licenses: null == licenses
          ? _value._licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<LicenseInfo>,
      customerBlock: null == customerBlock
          ? _value.customerBlock
          : customerBlock // ignore: cast_nullable_to_non_nullable
              as CustomerBlock,
    ));
  }
}

/// @nodoc

class _$ShipToInfoImpl extends _ShipToInfo {
  const _$ShipToInfoImpl(
      {required this.defaultShipToAddress,
      required this.shipToCustomerCode,
      required this.shipToName,
      required this.shipToAddress,
      required this.status,
      required this.building,
      required this.city1,
      required this.city2,
      required this.postalCode,
      required this.houseNumber1,
      required this.telephoneNumber,
      required this.region,
      required this.floor,
      required this.plant,
      required this.targetCustomerType,
      required this.country,
      required final List<LicenseInfo> licenses,
      required this.customerBlock})
      : _licenses = licenses,
        super._();

  @override
  final bool defaultShipToAddress;
  @override
  final String shipToCustomerCode;
  @override
  final ShipToName shipToName;
  @override
  final ShipToAddress shipToAddress;
  @override
  final Status status;
  @override
  final String building;
  @override
  final String city1;
  @override
  final String city2;
  @override
  final String postalCode;
  @override
  final String houseNumber1;
  @override
  final String telephoneNumber;
  @override
  final String region;
  @override
  final String floor;
  @override
  final String plant;
  @override
  final String targetCustomerType;
  @override
  final String country;
  final List<LicenseInfo> _licenses;
  @override
  List<LicenseInfo> get licenses {
    if (_licenses is EqualUnmodifiableListView) return _licenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_licenses);
  }

  @override
  final CustomerBlock customerBlock;

  @override
  String toString() {
    return 'ShipToInfo(defaultShipToAddress: $defaultShipToAddress, shipToCustomerCode: $shipToCustomerCode, shipToName: $shipToName, shipToAddress: $shipToAddress, status: $status, building: $building, city1: $city1, city2: $city2, postalCode: $postalCode, houseNumber1: $houseNumber1, telephoneNumber: $telephoneNumber, region: $region, floor: $floor, plant: $plant, targetCustomerType: $targetCustomerType, country: $country, licenses: $licenses, customerBlock: $customerBlock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipToInfoImpl &&
            (identical(other.defaultShipToAddress, defaultShipToAddress) ||
                other.defaultShipToAddress == defaultShipToAddress) &&
            (identical(other.shipToCustomerCode, shipToCustomerCode) ||
                other.shipToCustomerCode == shipToCustomerCode) &&
            (identical(other.shipToName, shipToName) ||
                other.shipToName == shipToName) &&
            (identical(other.shipToAddress, shipToAddress) ||
                other.shipToAddress == shipToAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.city1, city1) || other.city1 == city1) &&
            (identical(other.city2, city2) || other.city2 == city2) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.houseNumber1, houseNumber1) ||
                other.houseNumber1 == houseNumber1) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.targetCustomerType, targetCustomerType) ||
                other.targetCustomerType == targetCustomerType) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other._licenses, _licenses) &&
            (identical(other.customerBlock, customerBlock) ||
                other.customerBlock == customerBlock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      defaultShipToAddress,
      shipToCustomerCode,
      shipToName,
      shipToAddress,
      status,
      building,
      city1,
      city2,
      postalCode,
      houseNumber1,
      telephoneNumber,
      region,
      floor,
      plant,
      targetCustomerType,
      country,
      const DeepCollectionEquality().hash(_licenses),
      customerBlock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipToInfoImplCopyWith<_$ShipToInfoImpl> get copyWith =>
      __$$ShipToInfoImplCopyWithImpl<_$ShipToInfoImpl>(this, _$identity);
}

abstract class _ShipToInfo extends ShipToInfo {
  const factory _ShipToInfo(
      {required final bool defaultShipToAddress,
      required final String shipToCustomerCode,
      required final ShipToName shipToName,
      required final ShipToAddress shipToAddress,
      required final Status status,
      required final String building,
      required final String city1,
      required final String city2,
      required final String postalCode,
      required final String houseNumber1,
      required final String telephoneNumber,
      required final String region,
      required final String floor,
      required final String plant,
      required final String targetCustomerType,
      required final String country,
      required final List<LicenseInfo> licenses,
      required final CustomerBlock customerBlock}) = _$ShipToInfoImpl;
  const _ShipToInfo._() : super._();

  @override
  bool get defaultShipToAddress;
  @override
  String get shipToCustomerCode;
  @override
  ShipToName get shipToName;
  @override
  ShipToAddress get shipToAddress;
  @override
  Status get status;
  @override
  String get building;
  @override
  String get city1;
  @override
  String get city2;
  @override
  String get postalCode;
  @override
  String get houseNumber1;
  @override
  String get telephoneNumber;
  @override
  String get region;
  @override
  String get floor;
  @override
  String get plant;
  @override
  String get targetCustomerType;
  @override
  String get country;
  @override
  List<LicenseInfo> get licenses;
  @override
  CustomerBlock get customerBlock;
  @override
  @JsonKey(ignore: true)
  _$$ShipToInfoImplCopyWith<_$ShipToInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
