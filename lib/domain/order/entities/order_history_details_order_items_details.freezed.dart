// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDetails {
  String get discountCode => throw _privateConstructorUsedError;
  String get discountDescription => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemDetailsCopyWith<
          OrderHistoryDetailsOrderItemDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDetailsCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDetailsCopyWith(
          OrderHistoryDetailsOrderItemDetails value,
          $Res Function(OrderHistoryDetailsOrderItemDetails) then) =
      _$OrderHistoryDetailsOrderItemDetailsCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemDetails>;
  @useResult
  $Res call({String discountCode, String discountDescription, String rate});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDetailsCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemDetails>
    implements $OrderHistoryDetailsOrderItemDetailsCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountCode = null,
    Object? discountDescription = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: null == discountDescription
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsOrderItemDetailsImplCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDetailsCopyWith<$Res> {
  factory _$$OrderHistoryDetailsOrderItemDetailsImplCopyWith(
          _$OrderHistoryDetailsOrderItemDetailsImpl value,
          $Res Function(_$OrderHistoryDetailsOrderItemDetailsImpl) then) =
      __$$OrderHistoryDetailsOrderItemDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String discountCode, String discountDescription, String rate});
}

/// @nodoc
class __$$OrderHistoryDetailsOrderItemDetailsImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDetailsCopyWithImpl<$Res,
        _$OrderHistoryDetailsOrderItemDetailsImpl>
    implements _$$OrderHistoryDetailsOrderItemDetailsImplCopyWith<$Res> {
  __$$OrderHistoryDetailsOrderItemDetailsImplCopyWithImpl(
      _$OrderHistoryDetailsOrderItemDetailsImpl _value,
      $Res Function(_$OrderHistoryDetailsOrderItemDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountCode = null,
    Object? discountDescription = null,
    Object? rate = null,
  }) {
    return _then(_$OrderHistoryDetailsOrderItemDetailsImpl(
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: null == discountDescription
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderHistoryDetailsOrderItemDetailsImpl
    extends _OrderHistoryDetailsOrderItemDetails {
  _$OrderHistoryDetailsOrderItemDetailsImpl(
      {required this.discountCode,
      required this.discountDescription,
      required this.rate})
      : super._();

  @override
  final String discountCode;
  @override
  final String discountDescription;
  @override
  final String rate;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDetails(discountCode: $discountCode, discountDescription: $discountDescription, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsOrderItemDetailsImpl &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.discountDescription, discountDescription) ||
                other.discountDescription == discountDescription) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, discountCode, discountDescription, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsOrderItemDetailsImplCopyWith<
          _$OrderHistoryDetailsOrderItemDetailsImpl>
      get copyWith => __$$OrderHistoryDetailsOrderItemDetailsImplCopyWithImpl<
          _$OrderHistoryDetailsOrderItemDetailsImpl>(this, _$identity);
}

abstract class _OrderHistoryDetailsOrderItemDetails
    extends OrderHistoryDetailsOrderItemDetails {
  factory _OrderHistoryDetailsOrderItemDetails(
      {required final String discountCode,
      required final String discountDescription,
      required final String rate}) = _$OrderHistoryDetailsOrderItemDetailsImpl;
  _OrderHistoryDetailsOrderItemDetails._() : super._();

  @override
  String get discountCode;
  @override
  String get discountDescription;
  @override
  String get rate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsOrderItemDetailsImplCopyWith<
          _$OrderHistoryDetailsOrderItemDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
