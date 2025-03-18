// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_summary_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FullSummaryFilter {
  DateTimeStringValue get dueDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get dueDateTo => throw _privateConstructorUsedError;
  DateTimeStringValue get documentDateFrom =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get documentDateTo => throw _privateConstructorUsedError;
  List<String> get filterStatuses => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  FilterOption get filterOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullSummaryFilterCopyWith<FullSummaryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullSummaryFilterCopyWith<$Res> {
  factory $FullSummaryFilterCopyWith(
          FullSummaryFilter value, $Res Function(FullSummaryFilter) then) =
      _$FullSummaryFilterCopyWithImpl<$Res, FullSummaryFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue dueDateFrom,
      DateTimeStringValue dueDateTo,
      DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      List<String> filterStatuses,
      SearchKey searchKey,
      FilterOption filterOption});
}

/// @nodoc
class _$FullSummaryFilterCopyWithImpl<$Res, $Val extends FullSummaryFilter>
    implements $FullSummaryFilterCopyWith<$Res> {
  _$FullSummaryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateFrom = null,
    Object? dueDateTo = null,
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
    Object? filterOption = null,
  }) {
    return _then(_value.copyWith(
      dueDateFrom: null == dueDateFrom
          ? _value.dueDateFrom
          : dueDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      dueDateTo: null == dueDateTo
          ? _value.dueDateTo
          : dueDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      filterOption: null == filterOption
          ? _value.filterOption
          : filterOption // ignore: cast_nullable_to_non_nullable
              as FilterOption,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FullSummaryFilterImplCopyWith<$Res>
    implements $FullSummaryFilterCopyWith<$Res> {
  factory _$$FullSummaryFilterImplCopyWith(_$FullSummaryFilterImpl value,
          $Res Function(_$FullSummaryFilterImpl) then) =
      __$$FullSummaryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue dueDateFrom,
      DateTimeStringValue dueDateTo,
      DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      List<String> filterStatuses,
      SearchKey searchKey,
      FilterOption filterOption});
}

/// @nodoc
class __$$FullSummaryFilterImplCopyWithImpl<$Res>
    extends _$FullSummaryFilterCopyWithImpl<$Res, _$FullSummaryFilterImpl>
    implements _$$FullSummaryFilterImplCopyWith<$Res> {
  __$$FullSummaryFilterImplCopyWithImpl(_$FullSummaryFilterImpl _value,
      $Res Function(_$FullSummaryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateFrom = null,
    Object? dueDateTo = null,
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
    Object? filterOption = null,
  }) {
    return _then(_$FullSummaryFilterImpl(
      dueDateFrom: null == dueDateFrom
          ? _value.dueDateFrom
          : dueDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      dueDateTo: null == dueDateTo
          ? _value.dueDateTo
          : dueDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      filterStatuses: null == filterStatuses
          ? _value._filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      filterOption: null == filterOption
          ? _value.filterOption
          : filterOption // ignore: cast_nullable_to_non_nullable
              as FilterOption,
    ));
  }
}

/// @nodoc

class _$FullSummaryFilterImpl extends _FullSummaryFilter {
  _$FullSummaryFilterImpl(
      {required this.dueDateFrom,
      required this.dueDateTo,
      required this.documentDateFrom,
      required this.documentDateTo,
      required final List<String> filterStatuses,
      required this.searchKey,
      required this.filterOption})
      : _filterStatuses = filterStatuses,
        super._();

  @override
  final DateTimeStringValue dueDateFrom;
  @override
  final DateTimeStringValue dueDateTo;
  @override
  final DateTimeStringValue documentDateFrom;
  @override
  final DateTimeStringValue documentDateTo;
  final List<String> _filterStatuses;
  @override
  List<String> get filterStatuses {
    if (_filterStatuses is EqualUnmodifiableListView) return _filterStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterStatuses);
  }

  @override
  final SearchKey searchKey;
  @override
  final FilterOption filterOption;

  @override
  String toString() {
    return 'FullSummaryFilter(dueDateFrom: $dueDateFrom, dueDateTo: $dueDateTo, documentDateFrom: $documentDateFrom, documentDateTo: $documentDateTo, filterStatuses: $filterStatuses, searchKey: $searchKey, filterOption: $filterOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullSummaryFilterImpl &&
            (identical(other.dueDateFrom, dueDateFrom) ||
                other.dueDateFrom == dueDateFrom) &&
            (identical(other.dueDateTo, dueDateTo) ||
                other.dueDateTo == dueDateTo) &&
            (identical(other.documentDateFrom, documentDateFrom) ||
                other.documentDateFrom == documentDateFrom) &&
            (identical(other.documentDateTo, documentDateTo) ||
                other.documentDateTo == documentDateTo) &&
            const DeepCollectionEquality()
                .equals(other._filterStatuses, _filterStatuses) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.filterOption, filterOption) ||
                other.filterOption == filterOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dueDateFrom,
      dueDateTo,
      documentDateFrom,
      documentDateTo,
      const DeepCollectionEquality().hash(_filterStatuses),
      searchKey,
      filterOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullSummaryFilterImplCopyWith<_$FullSummaryFilterImpl> get copyWith =>
      __$$FullSummaryFilterImplCopyWithImpl<_$FullSummaryFilterImpl>(
          this, _$identity);
}

abstract class _FullSummaryFilter extends FullSummaryFilter {
  factory _FullSummaryFilter(
      {required final DateTimeStringValue dueDateFrom,
      required final DateTimeStringValue dueDateTo,
      required final DateTimeStringValue documentDateFrom,
      required final DateTimeStringValue documentDateTo,
      required final List<String> filterStatuses,
      required final SearchKey searchKey,
      required final FilterOption filterOption}) = _$FullSummaryFilterImpl;
  _FullSummaryFilter._() : super._();

  @override
  DateTimeStringValue get dueDateFrom;
  @override
  DateTimeStringValue get dueDateTo;
  @override
  DateTimeStringValue get documentDateFrom;
  @override
  DateTimeStringValue get documentDateTo;
  @override
  List<String> get filterStatuses;
  @override
  SearchKey get searchKey;
  @override
  FilterOption get filterOption;
  @override
  @JsonKey(ignore: true)
  _$$FullSummaryFilterImplCopyWith<_$FullSummaryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
