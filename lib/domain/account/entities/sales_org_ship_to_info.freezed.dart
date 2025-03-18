// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_org_ship_to_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrgShipToInfo {
  String get shipToCustomerCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrgShipToInfoCopyWith<SalesOrgShipToInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgShipToInfoCopyWith<$Res> {
  factory $SalesOrgShipToInfoCopyWith(
          SalesOrgShipToInfo value, $Res Function(SalesOrgShipToInfo) then) =
      _$SalesOrgShipToInfoCopyWithImpl<$Res, SalesOrgShipToInfo>;
  @useResult
  $Res call({String shipToCustomerCode});
}

/// @nodoc
class _$SalesOrgShipToInfoCopyWithImpl<$Res, $Val extends SalesOrgShipToInfo>
    implements $SalesOrgShipToInfoCopyWith<$Res> {
  _$SalesOrgShipToInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCustomerCode = null,
  }) {
    return _then(_value.copyWith(
      shipToCustomerCode: null == shipToCustomerCode
          ? _value.shipToCustomerCode
          : shipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrgShipToInfoImplCopyWith<$Res>
    implements $SalesOrgShipToInfoCopyWith<$Res> {
  factory _$$SalesOrgShipToInfoImplCopyWith(_$SalesOrgShipToInfoImpl value,
          $Res Function(_$SalesOrgShipToInfoImpl) then) =
      __$$SalesOrgShipToInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shipToCustomerCode});
}

/// @nodoc
class __$$SalesOrgShipToInfoImplCopyWithImpl<$Res>
    extends _$SalesOrgShipToInfoCopyWithImpl<$Res, _$SalesOrgShipToInfoImpl>
    implements _$$SalesOrgShipToInfoImplCopyWith<$Res> {
  __$$SalesOrgShipToInfoImplCopyWithImpl(_$SalesOrgShipToInfoImpl _value,
      $Res Function(_$SalesOrgShipToInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCustomerCode = null,
  }) {
    return _then(_$SalesOrgShipToInfoImpl(
      shipToCustomerCode: null == shipToCustomerCode
          ? _value.shipToCustomerCode
          : shipToCustomerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SalesOrgShipToInfoImpl extends _SalesOrgShipToInfo {
  const _$SalesOrgShipToInfoImpl({required this.shipToCustomerCode})
      : super._();

  @override
  final String shipToCustomerCode;

  @override
  String toString() {
    return 'SalesOrgShipToInfo(shipToCustomerCode: $shipToCustomerCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrgShipToInfoImpl &&
            (identical(other.shipToCustomerCode, shipToCustomerCode) ||
                other.shipToCustomerCode == shipToCustomerCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shipToCustomerCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrgShipToInfoImplCopyWith<_$SalesOrgShipToInfoImpl> get copyWith =>
      __$$SalesOrgShipToInfoImplCopyWithImpl<_$SalesOrgShipToInfoImpl>(
          this, _$identity);
}

abstract class _SalesOrgShipToInfo extends SalesOrgShipToInfo {
  const factory _SalesOrgShipToInfo(
      {required final String shipToCustomerCode}) = _$SalesOrgShipToInfoImpl;
  const _SalesOrgShipToInfo._() : super._();

  @override
  String get shipToCustomerCode;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrgShipToInfoImplCopyWith<_$SalesOrgShipToInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
