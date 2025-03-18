// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentSummaryGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  List<PaymentSummaryDetails> get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryGroupCopyWith<PaymentSummaryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryGroupCopyWith<$Res> {
  factory $PaymentSummaryGroupCopyWith(
          PaymentSummaryGroup value, $Res Function(PaymentSummaryGroup) then) =
      _$PaymentSummaryGroupCopyWithImpl<$Res, PaymentSummaryGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate, List<PaymentSummaryDetails> details});
}

/// @nodoc
class _$PaymentSummaryGroupCopyWithImpl<$Res, $Val extends PaymentSummaryGroup>
    implements $PaymentSummaryGroupCopyWith<$Res> {
  _$PaymentSummaryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSummaryGroupImplCopyWith<$Res>
    implements $PaymentSummaryGroupCopyWith<$Res> {
  factory _$$PaymentSummaryGroupImplCopyWith(_$PaymentSummaryGroupImpl value,
          $Res Function(_$PaymentSummaryGroupImpl) then) =
      __$$PaymentSummaryGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate, List<PaymentSummaryDetails> details});
}

/// @nodoc
class __$$PaymentSummaryGroupImplCopyWithImpl<$Res>
    extends _$PaymentSummaryGroupCopyWithImpl<$Res, _$PaymentSummaryGroupImpl>
    implements _$$PaymentSummaryGroupImplCopyWith<$Res> {
  __$$PaymentSummaryGroupImplCopyWithImpl(_$PaymentSummaryGroupImpl _value,
      $Res Function(_$PaymentSummaryGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? details = null,
  }) {
    return _then(_$PaymentSummaryGroupImpl(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
    ));
  }
}

/// @nodoc

class _$PaymentSummaryGroupImpl implements _PaymentSummaryGroup {
  _$PaymentSummaryGroupImpl(
      {required this.createdDate,
      required final List<PaymentSummaryDetails> details})
      : _details = details;

  @override
  final DateTimeStringValue createdDate;
  final List<PaymentSummaryDetails> _details;
  @override
  List<PaymentSummaryDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'PaymentSummaryGroup(createdDate: $createdDate, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryGroupImpl &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createdDate, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryGroupImplCopyWith<_$PaymentSummaryGroupImpl> get copyWith =>
      __$$PaymentSummaryGroupImplCopyWithImpl<_$PaymentSummaryGroupImpl>(
          this, _$identity);
}

abstract class _PaymentSummaryGroup implements PaymentSummaryGroup {
  factory _PaymentSummaryGroup(
          {required final DateTimeStringValue createdDate,
          required final List<PaymentSummaryDetails> details}) =
      _$PaymentSummaryGroupImpl;

  @override
  DateTimeStringValue get createdDate;
  @override
  List<PaymentSummaryDetails> get details;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryGroupImplCopyWith<_$PaymentSummaryGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
