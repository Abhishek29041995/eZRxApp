// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_credits_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllCreditsFilter {
  DateTimeStringValue get documentDateFrom =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get documentDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  List<String> get filterStatuses => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  FilterOption get filterOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllCreditsFilterCopyWith<AllCreditsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCreditsFilterCopyWith<$Res> {
  factory $AllCreditsFilterCopyWith(
          AllCreditsFilter value, $Res Function(AllCreditsFilter) then) =
      _$AllCreditsFilterCopyWithImpl<$Res, AllCreditsFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<String> filterStatuses,
      SearchKey searchKey,
      FilterOption filterOption});
}

/// @nodoc
class _$AllCreditsFilterCopyWithImpl<$Res, $Val extends AllCreditsFilter>
    implements $AllCreditsFilterCopyWith<$Res> {
  _$AllCreditsFilterCopyWithImpl(this._value, this._then);

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
    Object? filterStatuses = null,
    Object? searchKey = null,
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
abstract class _$$AllCreditsFilterImplCopyWith<$Res>
    implements $AllCreditsFilterCopyWith<$Res> {
  factory _$$AllCreditsFilterImplCopyWith(_$AllCreditsFilterImpl value,
          $Res Function(_$AllCreditsFilterImpl) then) =
      __$$AllCreditsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<String> filterStatuses,
      SearchKey searchKey,
      FilterOption filterOption});
}

/// @nodoc
class __$$AllCreditsFilterImplCopyWithImpl<$Res>
    extends _$AllCreditsFilterCopyWithImpl<$Res, _$AllCreditsFilterImpl>
    implements _$$AllCreditsFilterImplCopyWith<$Res> {
  __$$AllCreditsFilterImplCopyWithImpl(_$AllCreditsFilterImpl _value,
      $Res Function(_$AllCreditsFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
    Object? filterOption = null,
  }) {
    return _then(_$AllCreditsFilterImpl(
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

class _$AllCreditsFilterImpl extends _AllCreditsFilter {
  _$AllCreditsFilterImpl(
      {required this.documentDateFrom,
      required this.documentDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required final List<String> filterStatuses,
      required this.searchKey,
      required this.filterOption})
      : _filterStatuses = filterStatuses,
        super._();

  @override
  final DateTimeStringValue documentDateFrom;
  @override
  final DateTimeStringValue documentDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
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
    return 'AllCreditsFilter(documentDateFrom: $documentDateFrom, documentDateTo: $documentDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterStatuses: $filterStatuses, searchKey: $searchKey, filterOption: $filterOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCreditsFilterImpl &&
            (identical(other.documentDateFrom, documentDateFrom) ||
                other.documentDateFrom == documentDateFrom) &&
            (identical(other.documentDateTo, documentDateTo) ||
                other.documentDateTo == documentDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
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
      documentDateFrom,
      documentDateTo,
      amountValueFrom,
      amountValueTo,
      const DeepCollectionEquality().hash(_filterStatuses),
      searchKey,
      filterOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCreditsFilterImplCopyWith<_$AllCreditsFilterImpl> get copyWith =>
      __$$AllCreditsFilterImplCopyWithImpl<_$AllCreditsFilterImpl>(
          this, _$identity);
}

abstract class _AllCreditsFilter extends AllCreditsFilter {
  factory _AllCreditsFilter(
      {required final DateTimeStringValue documentDateFrom,
      required final DateTimeStringValue documentDateTo,
      required final RangeValue amountValueFrom,
      required final RangeValue amountValueTo,
      required final List<String> filterStatuses,
      required final SearchKey searchKey,
      required final FilterOption filterOption}) = _$AllCreditsFilterImpl;
  _AllCreditsFilter._() : super._();

  @override
  DateTimeStringValue get documentDateFrom;
  @override
  DateTimeStringValue get documentDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  List<String> get filterStatuses;
  @override
  SearchKey get searchKey;
  @override
  FilterOption get filterOption;
  @override
  @JsonKey(ignore: true)
  _$$AllCreditsFilterImplCopyWith<_$AllCreditsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
