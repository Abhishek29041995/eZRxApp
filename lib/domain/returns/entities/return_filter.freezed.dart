// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnFilter {
  DateTimeStringValue get returnDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get returnDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  List<StatusType> get returnStatusList => throw _privateConstructorUsedError;
  MaterialOriginFilter get materialOriginFilter =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnFilterCopyWith<ReturnFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnFilterCopyWith<$Res> {
  factory $ReturnFilterCopyWith(
          ReturnFilter value, $Res Function(ReturnFilter) then) =
      _$ReturnFilterCopyWithImpl<$Res, ReturnFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue returnDateFrom,
      DateTimeStringValue returnDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> returnStatusList,
      MaterialOriginFilter materialOriginFilter});
}

/// @nodoc
class _$ReturnFilterCopyWithImpl<$Res, $Val extends ReturnFilter>
    implements $ReturnFilterCopyWith<$Res> {
  _$ReturnFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnDateFrom = null,
    Object? returnDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? returnStatusList = null,
    Object? materialOriginFilter = null,
  }) {
    return _then(_value.copyWith(
      returnDateFrom: null == returnDateFrom
          ? _value.returnDateFrom
          : returnDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnDateTo: null == returnDateTo
          ? _value.returnDateTo
          : returnDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      returnStatusList: null == returnStatusList
          ? _value.returnStatusList
          : returnStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      materialOriginFilter: null == materialOriginFilter
          ? _value.materialOriginFilter
          : materialOriginFilter // ignore: cast_nullable_to_non_nullable
              as MaterialOriginFilter,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnFilterImplCopyWith<$Res>
    implements $ReturnFilterCopyWith<$Res> {
  factory _$$ReturnFilterImplCopyWith(
          _$ReturnFilterImpl value, $Res Function(_$ReturnFilterImpl) then) =
      __$$ReturnFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue returnDateFrom,
      DateTimeStringValue returnDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<StatusType> returnStatusList,
      MaterialOriginFilter materialOriginFilter});
}

/// @nodoc
class __$$ReturnFilterImplCopyWithImpl<$Res>
    extends _$ReturnFilterCopyWithImpl<$Res, _$ReturnFilterImpl>
    implements _$$ReturnFilterImplCopyWith<$Res> {
  __$$ReturnFilterImplCopyWithImpl(
      _$ReturnFilterImpl _value, $Res Function(_$ReturnFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnDateFrom = null,
    Object? returnDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? returnStatusList = null,
    Object? materialOriginFilter = null,
  }) {
    return _then(_$ReturnFilterImpl(
      returnDateFrom: null == returnDateFrom
          ? _value.returnDateFrom
          : returnDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      returnDateTo: null == returnDateTo
          ? _value.returnDateTo
          : returnDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      returnStatusList: null == returnStatusList
          ? _value._returnStatusList
          : returnStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      materialOriginFilter: null == materialOriginFilter
          ? _value.materialOriginFilter
          : materialOriginFilter // ignore: cast_nullable_to_non_nullable
              as MaterialOriginFilter,
    ));
  }
}

/// @nodoc

class _$ReturnFilterImpl extends _ReturnFilter {
  _$ReturnFilterImpl(
      {required this.returnDateFrom,
      required this.returnDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required final List<StatusType> returnStatusList,
      required this.materialOriginFilter})
      : _returnStatusList = returnStatusList,
        super._();

  @override
  final DateTimeStringValue returnDateFrom;
  @override
  final DateTimeStringValue returnDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
  final List<StatusType> _returnStatusList;
  @override
  List<StatusType> get returnStatusList {
    if (_returnStatusList is EqualUnmodifiableListView)
      return _returnStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnStatusList);
  }

  @override
  final MaterialOriginFilter materialOriginFilter;

  @override
  String toString() {
    return 'ReturnFilter(returnDateFrom: $returnDateFrom, returnDateTo: $returnDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, returnStatusList: $returnStatusList, materialOriginFilter: $materialOriginFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnFilterImpl &&
            (identical(other.returnDateFrom, returnDateFrom) ||
                other.returnDateFrom == returnDateFrom) &&
            (identical(other.returnDateTo, returnDateTo) ||
                other.returnDateTo == returnDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            const DeepCollectionEquality()
                .equals(other._returnStatusList, _returnStatusList) &&
            (identical(other.materialOriginFilter, materialOriginFilter) ||
                other.materialOriginFilter == materialOriginFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnDateFrom,
      returnDateTo,
      amountValueFrom,
      amountValueTo,
      const DeepCollectionEquality().hash(_returnStatusList),
      materialOriginFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnFilterImplCopyWith<_$ReturnFilterImpl> get copyWith =>
      __$$ReturnFilterImplCopyWithImpl<_$ReturnFilterImpl>(this, _$identity);
}

abstract class _ReturnFilter extends ReturnFilter {
  factory _ReturnFilter(
          {required final DateTimeStringValue returnDateFrom,
          required final DateTimeStringValue returnDateTo,
          required final RangeValue amountValueFrom,
          required final RangeValue amountValueTo,
          required final List<StatusType> returnStatusList,
          required final MaterialOriginFilter materialOriginFilter}) =
      _$ReturnFilterImpl;
  _ReturnFilter._() : super._();

  @override
  DateTimeStringValue get returnDateFrom;
  @override
  DateTimeStringValue get returnDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  List<StatusType> get returnStatusList;
  @override
  MaterialOriginFilter get materialOriginFilter;
  @override
  @JsonKey(ignore: true)
  _$$ReturnFilterImplCopyWith<_$ReturnFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
