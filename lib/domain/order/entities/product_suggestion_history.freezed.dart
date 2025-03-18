// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_suggestion_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductSuggestionHistory {
  List<SearchKey> get searchKeyList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSuggestionHistoryCopyWith<ProductSuggestionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSuggestionHistoryCopyWith<$Res> {
  factory $ProductSuggestionHistoryCopyWith(ProductSuggestionHistory value,
          $Res Function(ProductSuggestionHistory) then) =
      _$ProductSuggestionHistoryCopyWithImpl<$Res, ProductSuggestionHistory>;
  @useResult
  $Res call({List<SearchKey> searchKeyList});
}

/// @nodoc
class _$ProductSuggestionHistoryCopyWithImpl<$Res,
        $Val extends ProductSuggestionHistory>
    implements $ProductSuggestionHistoryCopyWith<$Res> {
  _$ProductSuggestionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKeyList = null,
  }) {
    return _then(_value.copyWith(
      searchKeyList: null == searchKeyList
          ? _value.searchKeyList
          : searchKeyList // ignore: cast_nullable_to_non_nullable
              as List<SearchKey>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductSuggestionHistoryImplCopyWith<$Res>
    implements $ProductSuggestionHistoryCopyWith<$Res> {
  factory _$$ProductSuggestionHistoryImplCopyWith(
          _$ProductSuggestionHistoryImpl value,
          $Res Function(_$ProductSuggestionHistoryImpl) then) =
      __$$ProductSuggestionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchKey> searchKeyList});
}

/// @nodoc
class __$$ProductSuggestionHistoryImplCopyWithImpl<$Res>
    extends _$ProductSuggestionHistoryCopyWithImpl<$Res,
        _$ProductSuggestionHistoryImpl>
    implements _$$ProductSuggestionHistoryImplCopyWith<$Res> {
  __$$ProductSuggestionHistoryImplCopyWithImpl(
      _$ProductSuggestionHistoryImpl _value,
      $Res Function(_$ProductSuggestionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKeyList = null,
  }) {
    return _then(_$ProductSuggestionHistoryImpl(
      searchKeyList: null == searchKeyList
          ? _value._searchKeyList
          : searchKeyList // ignore: cast_nullable_to_non_nullable
              as List<SearchKey>,
    ));
  }
}

/// @nodoc

class _$ProductSuggestionHistoryImpl extends _ProductSuggestionHistory {
  _$ProductSuggestionHistoryImpl({required final List<SearchKey> searchKeyList})
      : _searchKeyList = searchKeyList,
        super._();

  final List<SearchKey> _searchKeyList;
  @override
  List<SearchKey> get searchKeyList {
    if (_searchKeyList is EqualUnmodifiableListView) return _searchKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeyList);
  }

  @override
  String toString() {
    return 'ProductSuggestionHistory(searchKeyList: $searchKeyList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSuggestionHistoryImpl &&
            const DeepCollectionEquality()
                .equals(other._searchKeyList, _searchKeyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchKeyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSuggestionHistoryImplCopyWith<_$ProductSuggestionHistoryImpl>
      get copyWith => __$$ProductSuggestionHistoryImplCopyWithImpl<
          _$ProductSuggestionHistoryImpl>(this, _$identity);
}

abstract class _ProductSuggestionHistory extends ProductSuggestionHistory {
  factory _ProductSuggestionHistory(
          {required final List<SearchKey> searchKeyList}) =
      _$ProductSuggestionHistoryImpl;
  _ProductSuggestionHistory._() : super._();

  @override
  List<SearchKey> get searchKeyList;
  @override
  @JsonKey(ignore: true)
  _$$ProductSuggestionHistoryImplCopyWith<_$ProductSuggestionHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
