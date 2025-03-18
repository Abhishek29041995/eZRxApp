// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentTerm {
  String get paymentTermCode => throw _privateConstructorUsedError;
  int get paymentTermRanking => throw _privateConstructorUsedError;
  String get paymentTermDescription => throw _privateConstructorUsedError;
  int get paymentTermSubranking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentTermCopyWith<PaymentTerm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermCopyWith<$Res> {
  factory $PaymentTermCopyWith(
          PaymentTerm value, $Res Function(PaymentTerm) then) =
      _$PaymentTermCopyWithImpl<$Res, PaymentTerm>;
  @useResult
  $Res call(
      {String paymentTermCode,
      int paymentTermRanking,
      String paymentTermDescription,
      int paymentTermSubranking});
}

/// @nodoc
class _$PaymentTermCopyWithImpl<$Res, $Val extends PaymentTerm>
    implements $PaymentTermCopyWith<$Res> {
  _$PaymentTermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermRanking = null,
    Object? paymentTermDescription = null,
    Object? paymentTermSubranking = null,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: null == paymentTermRanking
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: null == paymentTermSubranking
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTermImplCopyWith<$Res>
    implements $PaymentTermCopyWith<$Res> {
  factory _$$PaymentTermImplCopyWith(
          _$PaymentTermImpl value, $Res Function(_$PaymentTermImpl) then) =
      __$$PaymentTermImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentTermCode,
      int paymentTermRanking,
      String paymentTermDescription,
      int paymentTermSubranking});
}

/// @nodoc
class __$$PaymentTermImplCopyWithImpl<$Res>
    extends _$PaymentTermCopyWithImpl<$Res, _$PaymentTermImpl>
    implements _$$PaymentTermImplCopyWith<$Res> {
  __$$PaymentTermImplCopyWithImpl(
      _$PaymentTermImpl _value, $Res Function(_$PaymentTermImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermRanking = null,
    Object? paymentTermDescription = null,
    Object? paymentTermSubranking = null,
  }) {
    return _then(_$PaymentTermImpl(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: null == paymentTermRanking
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: null == paymentTermSubranking
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaymentTermImpl extends _PaymentTerm {
  const _$PaymentTermImpl(
      {required this.paymentTermCode,
      required this.paymentTermRanking,
      required this.paymentTermDescription,
      required this.paymentTermSubranking})
      : super._();

  @override
  final String paymentTermCode;
  @override
  final int paymentTermRanking;
  @override
  final String paymentTermDescription;
  @override
  final int paymentTermSubranking;

  @override
  String toString() {
    return 'PaymentTerm(paymentTermCode: $paymentTermCode, paymentTermRanking: $paymentTermRanking, paymentTermDescription: $paymentTermDescription, paymentTermSubranking: $paymentTermSubranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTermImpl &&
            (identical(other.paymentTermCode, paymentTermCode) ||
                other.paymentTermCode == paymentTermCode) &&
            (identical(other.paymentTermRanking, paymentTermRanking) ||
                other.paymentTermRanking == paymentTermRanking) &&
            (identical(other.paymentTermDescription, paymentTermDescription) ||
                other.paymentTermDescription == paymentTermDescription) &&
            (identical(other.paymentTermSubranking, paymentTermSubranking) ||
                other.paymentTermSubranking == paymentTermSubranking));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentTermCode,
      paymentTermRanking, paymentTermDescription, paymentTermSubranking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTermImplCopyWith<_$PaymentTermImpl> get copyWith =>
      __$$PaymentTermImplCopyWithImpl<_$PaymentTermImpl>(this, _$identity);
}

abstract class _PaymentTerm extends PaymentTerm {
  const factory _PaymentTerm(
      {required final String paymentTermCode,
      required final int paymentTermRanking,
      required final String paymentTermDescription,
      required final int paymentTermSubranking}) = _$PaymentTermImpl;
  const _PaymentTerm._() : super._();

  @override
  String get paymentTermCode;
  @override
  int get paymentTermRanking;
  @override
  String get paymentTermDescription;
  @override
  int get paymentTermSubranking;
  @override
  @JsonKey(ignore: true)
  _$$PaymentTermImplCopyWith<_$PaymentTermImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
