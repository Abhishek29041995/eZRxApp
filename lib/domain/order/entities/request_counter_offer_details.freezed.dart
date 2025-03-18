// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_counter_offer_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestCounterOfferDetails {
  CounterOfferValue get counterOfferPrice => throw _privateConstructorUsedError;
  CounterOfferDiscountValue get discountOverridePercentage =>
      throw _privateConstructorUsedError;
  Currency get counterOfferCurrency => throw _privateConstructorUsedError;
  StringValue get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestCounterOfferDetailsCopyWith<RequestCounterOfferDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCounterOfferDetailsCopyWith<$Res> {
  factory $RequestCounterOfferDetailsCopyWith(RequestCounterOfferDetails value,
          $Res Function(RequestCounterOfferDetails) then) =
      _$RequestCounterOfferDetailsCopyWithImpl<$Res,
          RequestCounterOfferDetails>;
  @useResult
  $Res call(
      {CounterOfferValue counterOfferPrice,
      CounterOfferDiscountValue discountOverridePercentage,
      Currency counterOfferCurrency,
      StringValue comment});
}

/// @nodoc
class _$RequestCounterOfferDetailsCopyWithImpl<$Res,
        $Val extends RequestCounterOfferDetails>
    implements $RequestCounterOfferDetailsCopyWith<$Res> {
  _$RequestCounterOfferDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterOfferPrice = null,
    Object? discountOverridePercentage = null,
    Object? counterOfferCurrency = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as CounterOfferValue,
      discountOverridePercentage: null == discountOverridePercentage
          ? _value.discountOverridePercentage
          : discountOverridePercentage // ignore: cast_nullable_to_non_nullable
              as CounterOfferDiscountValue,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCounterOfferDetailsImplCopyWith<$Res>
    implements $RequestCounterOfferDetailsCopyWith<$Res> {
  factory _$$RequestCounterOfferDetailsImplCopyWith(
          _$RequestCounterOfferDetailsImpl value,
          $Res Function(_$RequestCounterOfferDetailsImpl) then) =
      __$$RequestCounterOfferDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CounterOfferValue counterOfferPrice,
      CounterOfferDiscountValue discountOverridePercentage,
      Currency counterOfferCurrency,
      StringValue comment});
}

/// @nodoc
class __$$RequestCounterOfferDetailsImplCopyWithImpl<$Res>
    extends _$RequestCounterOfferDetailsCopyWithImpl<$Res,
        _$RequestCounterOfferDetailsImpl>
    implements _$$RequestCounterOfferDetailsImplCopyWith<$Res> {
  __$$RequestCounterOfferDetailsImplCopyWithImpl(
      _$RequestCounterOfferDetailsImpl _value,
      $Res Function(_$RequestCounterOfferDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterOfferPrice = null,
    Object? discountOverridePercentage = null,
    Object? counterOfferCurrency = null,
    Object? comment = null,
  }) {
    return _then(_$RequestCounterOfferDetailsImpl(
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as CounterOfferValue,
      discountOverridePercentage: null == discountOverridePercentage
          ? _value.discountOverridePercentage
          : discountOverridePercentage // ignore: cast_nullable_to_non_nullable
              as CounterOfferDiscountValue,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$RequestCounterOfferDetailsImpl extends _RequestCounterOfferDetails {
  const _$RequestCounterOfferDetailsImpl(
      {required this.counterOfferPrice,
      required this.discountOverridePercentage,
      required this.counterOfferCurrency,
      required this.comment})
      : super._();

  @override
  final CounterOfferValue counterOfferPrice;
  @override
  final CounterOfferDiscountValue discountOverridePercentage;
  @override
  final Currency counterOfferCurrency;
  @override
  final StringValue comment;

  @override
  String toString() {
    return 'RequestCounterOfferDetails(counterOfferPrice: $counterOfferPrice, discountOverridePercentage: $discountOverridePercentage, counterOfferCurrency: $counterOfferCurrency, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCounterOfferDetailsImpl &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.discountOverridePercentage,
                    discountOverridePercentage) ||
                other.discountOverridePercentage ==
                    discountOverridePercentage) &&
            (identical(other.counterOfferCurrency, counterOfferCurrency) ||
                other.counterOfferCurrency == counterOfferCurrency) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counterOfferPrice,
      discountOverridePercentage, counterOfferCurrency, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCounterOfferDetailsImplCopyWith<_$RequestCounterOfferDetailsImpl>
      get copyWith => __$$RequestCounterOfferDetailsImplCopyWithImpl<
          _$RequestCounterOfferDetailsImpl>(this, _$identity);
}

abstract class _RequestCounterOfferDetails extends RequestCounterOfferDetails {
  const factory _RequestCounterOfferDetails(
      {required final CounterOfferValue counterOfferPrice,
      required final CounterOfferDiscountValue discountOverridePercentage,
      required final Currency counterOfferCurrency,
      required final StringValue comment}) = _$RequestCounterOfferDetailsImpl;
  const _RequestCounterOfferDetails._() : super._();

  @override
  CounterOfferValue get counterOfferPrice;
  @override
  CounterOfferDiscountValue get discountOverridePercentage;
  @override
  Currency get counterOfferCurrency;
  @override
  StringValue get comment;
  @override
  @JsonKey(ignore: true)
  _$$RequestCounterOfferDetailsImplCopyWith<_$RequestCounterOfferDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
