// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountSelector {
  String get salesOrg => throw _privateConstructorUsedError;
  String get customerCode => throw _privateConstructorUsedError;
  String get shippingAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSelectorCopyWith<AccountSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSelectorCopyWith<$Res> {
  factory $AccountSelectorCopyWith(
          AccountSelector value, $Res Function(AccountSelector) then) =
      _$AccountSelectorCopyWithImpl<$Res, AccountSelector>;
  @useResult
  $Res call({String salesOrg, String customerCode, String shippingAddress});
}

/// @nodoc
class _$AccountSelectorCopyWithImpl<$Res, $Val extends AccountSelector>
    implements $AccountSelectorCopyWith<$Res> {
  _$AccountSelectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shippingAddress = null,
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
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountSelectorImplCopyWith<$Res>
    implements $AccountSelectorCopyWith<$Res> {
  factory _$$AccountSelectorImplCopyWith(_$AccountSelectorImpl value,
          $Res Function(_$AccountSelectorImpl) then) =
      __$$AccountSelectorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String salesOrg, String customerCode, String shippingAddress});
}

/// @nodoc
class __$$AccountSelectorImplCopyWithImpl<$Res>
    extends _$AccountSelectorCopyWithImpl<$Res, _$AccountSelectorImpl>
    implements _$$AccountSelectorImplCopyWith<$Res> {
  __$$AccountSelectorImplCopyWithImpl(
      _$AccountSelectorImpl _value, $Res Function(_$AccountSelectorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerCode = null,
    Object? shippingAddress = null,
  }) {
    return _then(_$AccountSelectorImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountSelectorImpl extends _AccountSelector {
  const _$AccountSelectorImpl(
      {required this.salesOrg,
      required this.customerCode,
      required this.shippingAddress})
      : super._();

  @override
  final String salesOrg;
  @override
  final String customerCode;
  @override
  final String shippingAddress;

  @override
  String toString() {
    return 'AccountSelector(salesOrg: $salesOrg, customerCode: $customerCode, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSelectorImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, customerCode, shippingAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSelectorImplCopyWith<_$AccountSelectorImpl> get copyWith =>
      __$$AccountSelectorImplCopyWithImpl<_$AccountSelectorImpl>(
          this, _$identity);
}

abstract class _AccountSelector extends AccountSelector {
  const factory _AccountSelector(
      {required final String salesOrg,
      required final String customerCode,
      required final String shippingAddress}) = _$AccountSelectorImpl;
  const _AccountSelector._() : super._();

  @override
  String get salesOrg;
  @override
  String get customerCode;
  @override
  String get shippingAddress;
  @override
  @JsonKey(ignore: true)
  _$$AccountSelectorImplCopyWith<_$AccountSelectorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
