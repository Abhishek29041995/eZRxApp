// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrganisationDto _$SalesOrganisationDtoFromJson(Map<String, dynamic> json) {
  return _SalesOrganisationDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationDto {
  @JsonKey(name: 'SalesOrg')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipToCode')
  List<String> get shipToCodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationDtoCopyWith<SalesOrganisationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationDtoCopyWith<$Res> {
  factory $SalesOrganisationDtoCopyWith(SalesOrganisationDto value,
          $Res Function(SalesOrganisationDto) then) =
      _$SalesOrganisationDtoCopyWithImpl<$Res, SalesOrganisationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesOrg') String salesOrg,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'ShipToCode') List<String> shipToCodes});
}

/// @nodoc
class _$SalesOrganisationDtoCopyWithImpl<$Res,
        $Val extends SalesOrganisationDto>
    implements $SalesOrganisationDtoCopyWith<$Res> {
  _$SalesOrganisationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shipToCodes = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToCodes: null == shipToCodes
          ? _value.shipToCodes
          : shipToCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrganisationDtoImplCopyWith<$Res>
    implements $SalesOrganisationDtoCopyWith<$Res> {
  factory _$$SalesOrganisationDtoImplCopyWith(_$SalesOrganisationDtoImpl value,
          $Res Function(_$SalesOrganisationDtoImpl) then) =
      __$$SalesOrganisationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SalesOrg') String salesOrg,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'ShipToCode') List<String> shipToCodes});
}

/// @nodoc
class __$$SalesOrganisationDtoImplCopyWithImpl<$Res>
    extends _$SalesOrganisationDtoCopyWithImpl<$Res, _$SalesOrganisationDtoImpl>
    implements _$$SalesOrganisationDtoImplCopyWith<$Res> {
  __$$SalesOrganisationDtoImplCopyWithImpl(_$SalesOrganisationDtoImpl _value,
      $Res Function(_$SalesOrganisationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shipToCodes = null,
  }) {
    return _then(_$SalesOrganisationDtoImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToCodes: null == shipToCodes
          ? _value._shipToCodes
          : shipToCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrganisationDtoImpl extends _SalesOrganisationDto {
  const _$SalesOrganisationDtoImpl(
      {@JsonKey(name: 'SalesOrg') required this.salesOrg,
      @JsonKey(name: 'CustomerCode') required this.customerCode,
      @JsonKey(name: 'ShipToCode') required final List<String> shipToCodes})
      : _shipToCodes = shipToCodes,
        super._();

  factory _$SalesOrganisationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrganisationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'SalesOrg')
  final String salesOrg;
  @override
  @JsonKey(name: 'CustomerCode')
  final String customerCode;
  final List<String> _shipToCodes;
  @override
  @JsonKey(name: 'ShipToCode')
  List<String> get shipToCodes {
    if (_shipToCodes is EqualUnmodifiableListView) return _shipToCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToCodes);
  }

  @override
  String toString() {
    return 'SalesOrganisationDto(salesOrg: $salesOrg, customerCode: $customerCode, shipToCodes: $shipToCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrganisationDtoImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            const DeepCollectionEquality()
                .equals(other._shipToCodes, _shipToCodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, customerCode,
      const DeepCollectionEquality().hash(_shipToCodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrganisationDtoImplCopyWith<_$SalesOrganisationDtoImpl>
      get copyWith =>
          __$$SalesOrganisationDtoImplCopyWithImpl<_$SalesOrganisationDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrganisationDtoImplToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationDto extends SalesOrganisationDto {
  const factory _SalesOrganisationDto(
      {@JsonKey(name: 'SalesOrg') required final String salesOrg,
      @JsonKey(name: 'CustomerCode') required final String customerCode,
      @JsonKey(name: 'ShipToCode')
      required final List<String> shipToCodes}) = _$SalesOrganisationDtoImpl;
  const _SalesOrganisationDto._() : super._();

  factory _SalesOrganisationDto.fromJson(Map<String, dynamic> json) =
      _$SalesOrganisationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'SalesOrg')
  String get salesOrg;
  @override
  @JsonKey(name: 'CustomerCode')
  String get customerCode;
  @override
  @JsonKey(name: 'ShipToCode')
  List<String> get shipToCodes;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrganisationDtoImplCopyWith<_$SalesOrganisationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
