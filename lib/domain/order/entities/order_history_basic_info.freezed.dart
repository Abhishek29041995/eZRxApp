// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_basic_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryBasicInfo {
  String get soldTo => throw _privateConstructorUsedError;
  String get shipTo => throw _privateConstructorUsedError;
  value_objects.CompanyName get companyName =>
      throw _privateConstructorUsedError;
  PaymentTerm get paymentTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryBasicInfoCopyWith<OrderHistoryBasicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryBasicInfoCopyWith<$Res> {
  factory $OrderHistoryBasicInfoCopyWith(OrderHistoryBasicInfo value,
          $Res Function(OrderHistoryBasicInfo) then) =
      _$OrderHistoryBasicInfoCopyWithImpl<$Res, OrderHistoryBasicInfo>;
  @useResult
  $Res call(
      {String soldTo,
      String shipTo,
      value_objects.CompanyName companyName,
      PaymentTerm paymentTerm});

  $PaymentTermCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class _$OrderHistoryBasicInfoCopyWithImpl<$Res,
        $Val extends OrderHistoryBasicInfo>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  _$OrderHistoryBasicInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as value_objects.CompanyName,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTerm,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentTermCopyWith<$Res> get paymentTerm {
    return $PaymentTermCopyWith<$Res>(_value.paymentTerm, (value) {
      return _then(_value.copyWith(paymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryBasicInfoImplCopyWith<$Res>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  factory _$$OrderHistoryBasicInfoImplCopyWith(
          _$OrderHistoryBasicInfoImpl value,
          $Res Function(_$OrderHistoryBasicInfoImpl) then) =
      __$$OrderHistoryBasicInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String soldTo,
      String shipTo,
      value_objects.CompanyName companyName,
      PaymentTerm paymentTerm});

  @override
  $PaymentTermCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class __$$OrderHistoryBasicInfoImplCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoCopyWithImpl<$Res,
        _$OrderHistoryBasicInfoImpl>
    implements _$$OrderHistoryBasicInfoImplCopyWith<$Res> {
  __$$OrderHistoryBasicInfoImplCopyWithImpl(_$OrderHistoryBasicInfoImpl _value,
      $Res Function(_$OrderHistoryBasicInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_$OrderHistoryBasicInfoImpl(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as value_objects.CompanyName,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTerm,
    ));
  }
}

/// @nodoc

class _$OrderHistoryBasicInfoImpl extends _OrderHistoryBasicInfo {
  _$OrderHistoryBasicInfoImpl(
      {required this.soldTo,
      required this.shipTo,
      required this.companyName,
      required this.paymentTerm})
      : super._();

  @override
  final String soldTo;
  @override
  final String shipTo;
  @override
  final value_objects.CompanyName companyName;
  @override
  final PaymentTerm paymentTerm;

  @override
  String toString() {
    return 'OrderHistoryBasicInfo(soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName, paymentTerm: $paymentTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryBasicInfoImpl &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, soldTo, shipTo, companyName, paymentTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryBasicInfoImplCopyWith<_$OrderHistoryBasicInfoImpl>
      get copyWith => __$$OrderHistoryBasicInfoImplCopyWithImpl<
          _$OrderHistoryBasicInfoImpl>(this, _$identity);
}

abstract class _OrderHistoryBasicInfo extends OrderHistoryBasicInfo {
  factory _OrderHistoryBasicInfo(
      {required final String soldTo,
      required final String shipTo,
      required final value_objects.CompanyName companyName,
      required final PaymentTerm paymentTerm}) = _$OrderHistoryBasicInfoImpl;
  _OrderHistoryBasicInfo._() : super._();

  @override
  String get soldTo;
  @override
  String get shipTo;
  @override
  value_objects.CompanyName get companyName;
  @override
  PaymentTerm get paymentTerm;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryBasicInfoImplCopyWith<_$OrderHistoryBasicInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
