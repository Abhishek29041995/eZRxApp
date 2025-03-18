// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerPaymentFilter {
  DateTimeStringValue get today => throw _privateConstructorUsedError;
  DateTimeStringValue get yesterday => throw _privateConstructorUsedError;
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerPaymentFilterCopyWith<CustomerPaymentFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPaymentFilterCopyWith<$Res> {
  factory $CustomerPaymentFilterCopyWith(CustomerPaymentFilter value,
          $Res Function(CustomerPaymentFilter) then) =
      _$CustomerPaymentFilterCopyWithImpl<$Res, CustomerPaymentFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue today,
      DateTimeStringValue yesterday,
      String paymentBatchAdditionalInfo});
}

/// @nodoc
class _$CustomerPaymentFilterCopyWithImpl<$Res,
        $Val extends CustomerPaymentFilter>
    implements $CustomerPaymentFilterCopyWith<$Res> {
  _$CustomerPaymentFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? yesterday = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_value.copyWith(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      yesterday: null == yesterday
          ? _value.yesterday
          : yesterday // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPaymentFilterImplCopyWith<$Res>
    implements $CustomerPaymentFilterCopyWith<$Res> {
  factory _$$CustomerPaymentFilterImplCopyWith(
          _$CustomerPaymentFilterImpl value,
          $Res Function(_$CustomerPaymentFilterImpl) then) =
      __$$CustomerPaymentFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue today,
      DateTimeStringValue yesterday,
      String paymentBatchAdditionalInfo});
}

/// @nodoc
class __$$CustomerPaymentFilterImplCopyWithImpl<$Res>
    extends _$CustomerPaymentFilterCopyWithImpl<$Res,
        _$CustomerPaymentFilterImpl>
    implements _$$CustomerPaymentFilterImplCopyWith<$Res> {
  __$$CustomerPaymentFilterImplCopyWithImpl(_$CustomerPaymentFilterImpl _value,
      $Res Function(_$CustomerPaymentFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? yesterday = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_$CustomerPaymentFilterImpl(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      yesterday: null == yesterday
          ? _value.yesterday
          : yesterday // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerPaymentFilterImpl extends _CustomerPaymentFilter {
  _$CustomerPaymentFilterImpl(
      {required this.today,
      required this.yesterday,
      required this.paymentBatchAdditionalInfo})
      : super._();

  @override
  final DateTimeStringValue today;
  @override
  final DateTimeStringValue yesterday;
  @override
  final String paymentBatchAdditionalInfo;

  @override
  String toString() {
    return 'CustomerPaymentFilter(today: $today, yesterday: $yesterday, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPaymentFilterImpl &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.yesterday, yesterday) ||
                other.yesterday == yesterday) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, today, yesterday, paymentBatchAdditionalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPaymentFilterImplCopyWith<_$CustomerPaymentFilterImpl>
      get copyWith => __$$CustomerPaymentFilterImplCopyWithImpl<
          _$CustomerPaymentFilterImpl>(this, _$identity);
}

abstract class _CustomerPaymentFilter extends CustomerPaymentFilter {
  factory _CustomerPaymentFilter(
          {required final DateTimeStringValue today,
          required final DateTimeStringValue yesterday,
          required final String paymentBatchAdditionalInfo}) =
      _$CustomerPaymentFilterImpl;
  _CustomerPaymentFilter._() : super._();

  @override
  DateTimeStringValue get today;
  @override
  DateTimeStringValue get yesterday;
  @override
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPaymentFilterImplCopyWith<_$CustomerPaymentFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
