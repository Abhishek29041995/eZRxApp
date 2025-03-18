// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerCodeConfig {
  String get customerCode => throw _privateConstructorUsedError;
  bool get disableReturns => throw _privateConstructorUsedError;
  bool get disablePayments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerCodeConfigCopyWith<CustomerCodeConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeConfigCopyWith<$Res> {
  factory $CustomerCodeConfigCopyWith(
          CustomerCodeConfig value, $Res Function(CustomerCodeConfig) then) =
      _$CustomerCodeConfigCopyWithImpl<$Res, CustomerCodeConfig>;
  @useResult
  $Res call({String customerCode, bool disableReturns, bool disablePayments});
}

/// @nodoc
class _$CustomerCodeConfigCopyWithImpl<$Res, $Val extends CustomerCodeConfig>
    implements $CustomerCodeConfigCopyWith<$Res> {
  _$CustomerCodeConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? disableReturns = null,
    Object? disablePayments = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayments: null == disablePayments
          ? _value.disablePayments
          : disablePayments // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerCodeConfigImplCopyWith<$Res>
    implements $CustomerCodeConfigCopyWith<$Res> {
  factory _$$CustomerCodeConfigImplCopyWith(_$CustomerCodeConfigImpl value,
          $Res Function(_$CustomerCodeConfigImpl) then) =
      __$$CustomerCodeConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerCode, bool disableReturns, bool disablePayments});
}

/// @nodoc
class __$$CustomerCodeConfigImplCopyWithImpl<$Res>
    extends _$CustomerCodeConfigCopyWithImpl<$Res, _$CustomerCodeConfigImpl>
    implements _$$CustomerCodeConfigImplCopyWith<$Res> {
  __$$CustomerCodeConfigImplCopyWithImpl(_$CustomerCodeConfigImpl _value,
      $Res Function(_$CustomerCodeConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? disableReturns = null,
    Object? disablePayments = null,
  }) {
    return _then(_$CustomerCodeConfigImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayments: null == disablePayments
          ? _value.disablePayments
          : disablePayments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerCodeConfigImpl extends _CustomerCodeConfig {
  _$CustomerCodeConfigImpl(
      {required this.customerCode,
      required this.disableReturns,
      required this.disablePayments})
      : super._();

  @override
  final String customerCode;
  @override
  final bool disableReturns;
  @override
  final bool disablePayments;

  @override
  String toString() {
    return 'CustomerCodeConfig(customerCode: $customerCode, disableReturns: $disableReturns, disablePayments: $disablePayments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCodeConfigImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.disableReturns, disableReturns) ||
                other.disableReturns == disableReturns) &&
            (identical(other.disablePayments, disablePayments) ||
                other.disablePayments == disablePayments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCode, disableReturns, disablePayments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCodeConfigImplCopyWith<_$CustomerCodeConfigImpl> get copyWith =>
      __$$CustomerCodeConfigImplCopyWithImpl<_$CustomerCodeConfigImpl>(
          this, _$identity);
}

abstract class _CustomerCodeConfig extends CustomerCodeConfig {
  factory _CustomerCodeConfig(
      {required final String customerCode,
      required final bool disableReturns,
      required final bool disablePayments}) = _$CustomerCodeConfigImpl;
  _CustomerCodeConfig._() : super._();

  @override
  String get customerCode;
  @override
  bool get disableReturns;
  @override
  bool get disablePayments;
  @override
  @JsonKey(ignore: true)
  _$$CustomerCodeConfigImplCopyWith<_$CustomerCodeConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
