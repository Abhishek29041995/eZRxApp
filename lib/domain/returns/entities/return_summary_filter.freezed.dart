// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_summary_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnSummaryFilter {
  SearchKey get requestId => throw _privateConstructorUsedError;
  DateTimeStringValue get dateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get dateTo => throw _privateConstructorUsedError;
  RangeValue get refundTotalTo => throw _privateConstructorUsedError;
  RangeValue get refundTotalFrom => throw _privateConstructorUsedError;
  StatusType get sortBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryFilterCopyWith<ReturnSummaryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryFilterCopyWith<$Res> {
  factory $ReturnSummaryFilterCopyWith(
          ReturnSummaryFilter value, $Res Function(ReturnSummaryFilter) then) =
      _$ReturnSummaryFilterCopyWithImpl<$Res, ReturnSummaryFilter>;
  @useResult
  $Res call(
      {SearchKey requestId,
      DateTimeStringValue dateFrom,
      DateTimeStringValue dateTo,
      RangeValue refundTotalTo,
      RangeValue refundTotalFrom,
      StatusType sortBy});
}

/// @nodoc
class _$ReturnSummaryFilterCopyWithImpl<$Res, $Val extends ReturnSummaryFilter>
    implements $ReturnSummaryFilterCopyWith<$Res> {
  _$ReturnSummaryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalTo = null,
    Object? refundTotalFrom = null,
    Object? sortBy = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as StatusType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnSummaryFilterImplCopyWith<$Res>
    implements $ReturnSummaryFilterCopyWith<$Res> {
  factory _$$ReturnSummaryFilterImplCopyWith(_$ReturnSummaryFilterImpl value,
          $Res Function(_$ReturnSummaryFilterImpl) then) =
      __$$ReturnSummaryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchKey requestId,
      DateTimeStringValue dateFrom,
      DateTimeStringValue dateTo,
      RangeValue refundTotalTo,
      RangeValue refundTotalFrom,
      StatusType sortBy});
}

/// @nodoc
class __$$ReturnSummaryFilterImplCopyWithImpl<$Res>
    extends _$ReturnSummaryFilterCopyWithImpl<$Res, _$ReturnSummaryFilterImpl>
    implements _$$ReturnSummaryFilterImplCopyWith<$Res> {
  __$$ReturnSummaryFilterImplCopyWithImpl(_$ReturnSummaryFilterImpl _value,
      $Res Function(_$ReturnSummaryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalTo = null,
    Object? refundTotalFrom = null,
    Object? sortBy = null,
  }) {
    return _then(_$ReturnSummaryFilterImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as StatusType,
    ));
  }
}

/// @nodoc

class _$ReturnSummaryFilterImpl extends _ReturnSummaryFilter {
  _$ReturnSummaryFilterImpl(
      {required this.requestId,
      required this.dateFrom,
      required this.dateTo,
      required this.refundTotalTo,
      required this.refundTotalFrom,
      required this.sortBy})
      : super._();

  @override
  final SearchKey requestId;
  @override
  final DateTimeStringValue dateFrom;
  @override
  final DateTimeStringValue dateTo;
  @override
  final RangeValue refundTotalTo;
  @override
  final RangeValue refundTotalFrom;
  @override
  final StatusType sortBy;

  @override
  String toString() {
    return 'ReturnSummaryFilter(requestId: $requestId, dateFrom: $dateFrom, dateTo: $dateTo, refundTotalTo: $refundTotalTo, refundTotalFrom: $refundTotalFrom, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnSummaryFilterImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.refundTotalTo, refundTotalTo) ||
                other.refundTotalTo == refundTotalTo) &&
            (identical(other.refundTotalFrom, refundTotalFrom) ||
                other.refundTotalFrom == refundTotalFrom) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId, dateFrom, dateTo,
      refundTotalTo, refundTotalFrom, sortBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnSummaryFilterImplCopyWith<_$ReturnSummaryFilterImpl> get copyWith =>
      __$$ReturnSummaryFilterImplCopyWithImpl<_$ReturnSummaryFilterImpl>(
          this, _$identity);
}

abstract class _ReturnSummaryFilter extends ReturnSummaryFilter {
  factory _ReturnSummaryFilter(
      {required final SearchKey requestId,
      required final DateTimeStringValue dateFrom,
      required final DateTimeStringValue dateTo,
      required final RangeValue refundTotalTo,
      required final RangeValue refundTotalFrom,
      required final StatusType sortBy}) = _$ReturnSummaryFilterImpl;
  _ReturnSummaryFilter._() : super._();

  @override
  SearchKey get requestId;
  @override
  DateTimeStringValue get dateFrom;
  @override
  DateTimeStringValue get dateTo;
  @override
  RangeValue get refundTotalTo;
  @override
  RangeValue get refundTotalFrom;
  @override
  StatusType get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$ReturnSummaryFilterImplCopyWith<_$ReturnSummaryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
