// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_credit_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailableCreditFilter {
  DateTimeStringValue get documentDateFrom =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get documentDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  FilterOption get filterOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailableCreditFilterCopyWith<AvailableCreditFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableCreditFilterCopyWith<$Res> {
  factory $AvailableCreditFilterCopyWith(AvailableCreditFilter value,
          $Res Function(AvailableCreditFilter) then) =
      _$AvailableCreditFilterCopyWithImpl<$Res, AvailableCreditFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      FilterOption filterOption});
}

/// @nodoc
class _$AvailableCreditFilterCopyWithImpl<$Res,
        $Val extends AvailableCreditFilter>
    implements $AvailableCreditFilterCopyWith<$Res> {
  _$AvailableCreditFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterOption = null,
  }) {
    return _then(_value.copyWith(
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterOption: null == filterOption
          ? _value.filterOption
          : filterOption // ignore: cast_nullable_to_non_nullable
              as FilterOption,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableCreditFilterImplCopyWith<$Res>
    implements $AvailableCreditFilterCopyWith<$Res> {
  factory _$$AvailableCreditFilterImplCopyWith(
          _$AvailableCreditFilterImpl value,
          $Res Function(_$AvailableCreditFilterImpl) then) =
      __$$AvailableCreditFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      FilterOption filterOption});
}

/// @nodoc
class __$$AvailableCreditFilterImplCopyWithImpl<$Res>
    extends _$AvailableCreditFilterCopyWithImpl<$Res,
        _$AvailableCreditFilterImpl>
    implements _$$AvailableCreditFilterImplCopyWith<$Res> {
  __$$AvailableCreditFilterImplCopyWithImpl(_$AvailableCreditFilterImpl _value,
      $Res Function(_$AvailableCreditFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterOption = null,
  }) {
    return _then(_$AvailableCreditFilterImpl(
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterOption: null == filterOption
          ? _value.filterOption
          : filterOption // ignore: cast_nullable_to_non_nullable
              as FilterOption,
    ));
  }
}

/// @nodoc

class _$AvailableCreditFilterImpl extends _AvailableCreditFilter {
  _$AvailableCreditFilterImpl(
      {required this.documentDateFrom,
      required this.documentDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required this.filterOption})
      : super._();

  @override
  final DateTimeStringValue documentDateFrom;
  @override
  final DateTimeStringValue documentDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
  @override
  final FilterOption filterOption;

  @override
  String toString() {
    return 'AvailableCreditFilter(documentDateFrom: $documentDateFrom, documentDateTo: $documentDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterOption: $filterOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableCreditFilterImpl &&
            (identical(other.documentDateFrom, documentDateFrom) ||
                other.documentDateFrom == documentDateFrom) &&
            (identical(other.documentDateTo, documentDateTo) ||
                other.documentDateTo == documentDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            (identical(other.filterOption, filterOption) ||
                other.filterOption == filterOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentDateFrom, documentDateTo,
      amountValueFrom, amountValueTo, filterOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableCreditFilterImplCopyWith<_$AvailableCreditFilterImpl>
      get copyWith => __$$AvailableCreditFilterImplCopyWithImpl<
          _$AvailableCreditFilterImpl>(this, _$identity);
}

abstract class _AvailableCreditFilter extends AvailableCreditFilter {
  factory _AvailableCreditFilter(
      {required final DateTimeStringValue documentDateFrom,
      required final DateTimeStringValue documentDateTo,
      required final RangeValue amountValueFrom,
      required final RangeValue amountValueTo,
      required final FilterOption filterOption}) = _$AvailableCreditFilterImpl;
  _AvailableCreditFilter._() : super._();

  @override
  DateTimeStringValue get documentDateFrom;
  @override
  DateTimeStringValue get documentDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  FilterOption get filterOption;
  @override
  @JsonKey(ignore: true)
  _$$AvailableCreditFilterImplCopyWith<_$AvailableCreditFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
