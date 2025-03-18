// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaqEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) getFaq,
    required TResult Function(SalesOrg salesOrg) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(SearchKey searchKey) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? getFaq,
    TResult? Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? getFaq,
    TResult Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqEventCopyWith<$Res> {
  factory $FaqEventCopyWith(FaqEvent value, $Res Function(FaqEvent) then) =
      _$FaqEventCopyWithImpl<$Res, FaqEvent>;
}

/// @nodoc
class _$FaqEventCopyWithImpl<$Res, $Val extends FaqEvent>
    implements $FaqEventCopyWith<$Res> {
  _$FaqEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetFaqImplCopyWith<$Res> {
  factory _$$GetFaqImplCopyWith(
          _$GetFaqImpl value, $Res Function(_$GetFaqImpl) then) =
      __$$GetFaqImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$GetFaqImplCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$GetFaqImpl>
    implements _$$GetFaqImplCopyWith<$Res> {
  __$$GetFaqImplCopyWithImpl(
      _$GetFaqImpl _value, $Res Function(_$GetFaqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$GetFaqImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$GetFaqImpl implements _GetFaq {
  const _$GetFaqImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'FaqEvent.getFaq(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFaqImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFaqImplCopyWith<_$GetFaqImpl> get copyWith =>
      __$$GetFaqImplCopyWithImpl<_$GetFaqImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) getFaq,
    required TResult Function(SalesOrg salesOrg) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(SearchKey searchKey) updateSearchKey,
  }) {
    return getFaq(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? getFaq,
    TResult? Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
  }) {
    return getFaq?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? getFaq,
    TResult Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (getFaq != null) {
      return getFaq(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updateSearchKey,
  }) {
    return getFaq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updateSearchKey,
  }) {
    return getFaq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (getFaq != null) {
      return getFaq(this);
    }
    return orElse();
  }
}

abstract class _GetFaq implements FaqEvent {
  const factory _GetFaq({required final SalesOrg salesOrg}) = _$GetFaqImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$GetFaqImplCopyWith<_$GetFaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreFaqImplCopyWith<$Res> {
  factory _$$LoadMoreFaqImplCopyWith(
          _$LoadMoreFaqImpl value, $Res Function(_$LoadMoreFaqImpl) then) =
      __$$LoadMoreFaqImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$LoadMoreFaqImplCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$LoadMoreFaqImpl>
    implements _$$LoadMoreFaqImplCopyWith<$Res> {
  __$$LoadMoreFaqImplCopyWithImpl(
      _$LoadMoreFaqImpl _value, $Res Function(_$LoadMoreFaqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$LoadMoreFaqImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$LoadMoreFaqImpl implements _LoadMoreFaq {
  const _$LoadMoreFaqImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'FaqEvent.loadMoreAFaq(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreFaqImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreFaqImplCopyWith<_$LoadMoreFaqImpl> get copyWith =>
      __$$LoadMoreFaqImplCopyWithImpl<_$LoadMoreFaqImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) getFaq,
    required TResult Function(SalesOrg salesOrg) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(SearchKey searchKey) updateSearchKey,
  }) {
    return loadMoreAFaq(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? getFaq,
    TResult? Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
  }) {
    return loadMoreAFaq?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? getFaq,
    TResult Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (loadMoreAFaq != null) {
      return loadMoreAFaq(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updateSearchKey,
  }) {
    return loadMoreAFaq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updateSearchKey,
  }) {
    return loadMoreAFaq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (loadMoreAFaq != null) {
      return loadMoreAFaq(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreFaq implements FaqEvent {
  const factory _LoadMoreFaq({required final SalesOrg salesOrg}) =
      _$LoadMoreFaqImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$LoadMoreFaqImplCopyWith<_$LoadMoreFaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByFaqCategoryImplCopyWith<$Res> {
  factory _$$FilterByFaqCategoryImplCopyWith(_$FilterByFaqCategoryImpl value,
          $Res Function(_$FilterByFaqCategoryImpl) then) =
      __$$FilterByFaqCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FAQCategory selectedCategory});
}

/// @nodoc
class __$$FilterByFaqCategoryImplCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$FilterByFaqCategoryImpl>
    implements _$$FilterByFaqCategoryImplCopyWith<$Res> {
  __$$FilterByFaqCategoryImplCopyWithImpl(_$FilterByFaqCategoryImpl _value,
      $Res Function(_$FilterByFaqCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
  }) {
    return _then(_$FilterByFaqCategoryImpl(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
    ));
  }
}

/// @nodoc

class _$FilterByFaqCategoryImpl implements _FilterByFaqCategory {
  const _$FilterByFaqCategoryImpl({required this.selectedCategory});

  @override
  final FAQCategory selectedCategory;

  @override
  String toString() {
    return 'FaqEvent.filterByFaqCategory(selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByFaqCategoryImpl &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByFaqCategoryImplCopyWith<_$FilterByFaqCategoryImpl> get copyWith =>
      __$$FilterByFaqCategoryImplCopyWithImpl<_$FilterByFaqCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) getFaq,
    required TResult Function(SalesOrg salesOrg) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(SearchKey searchKey) updateSearchKey,
  }) {
    return filterByFaqCategory(selectedCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? getFaq,
    TResult? Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
  }) {
    return filterByFaqCategory?.call(selectedCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? getFaq,
    TResult Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (filterByFaqCategory != null) {
      return filterByFaqCategory(selectedCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updateSearchKey,
  }) {
    return filterByFaqCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updateSearchKey,
  }) {
    return filterByFaqCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (filterByFaqCategory != null) {
      return filterByFaqCategory(this);
    }
    return orElse();
  }
}

abstract class _FilterByFaqCategory implements FaqEvent {
  const factory _FilterByFaqCategory(
          {required final FAQCategory selectedCategory}) =
      _$FilterByFaqCategoryImpl;

  FAQCategory get selectedCategory;
  @JsonKey(ignore: true)
  _$$FilterByFaqCategoryImplCopyWith<_$FilterByFaqCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedSearchFaqImplCopyWith<$Res> {
  factory _$$UpdatedSearchFaqImplCopyWith(_$UpdatedSearchFaqImpl value,
          $Res Function(_$UpdatedSearchFaqImpl) then) =
      __$$UpdatedSearchFaqImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$UpdatedSearchFaqImplCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$UpdatedSearchFaqImpl>
    implements _$$UpdatedSearchFaqImplCopyWith<$Res> {
  __$$UpdatedSearchFaqImplCopyWithImpl(_$UpdatedSearchFaqImpl _value,
      $Res Function(_$UpdatedSearchFaqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$UpdatedSearchFaqImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$UpdatedSearchFaqImpl implements _UpdatedSearchFaq {
  const _$UpdatedSearchFaqImpl({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'FaqEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedSearchFaqImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedSearchFaqImplCopyWith<_$UpdatedSearchFaqImpl> get copyWith =>
      __$$UpdatedSearchFaqImplCopyWithImpl<_$UpdatedSearchFaqImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) getFaq,
    required TResult Function(SalesOrg salesOrg) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(SearchKey searchKey) updateSearchKey,
  }) {
    return updateSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? getFaq,
    TResult? Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(SearchKey searchKey)? updateSearchKey,
  }) {
    return updateSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? getFaq,
    TResult Function(SalesOrg salesOrg)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(SearchKey searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updateSearchKey,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updateSearchKey,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdatedSearchFaq implements FaqEvent {
  const factory _UpdatedSearchFaq({required final SearchKey searchKey}) =
      _$UpdatedSearchFaqImpl;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$UpdatedSearchFaqImplCopyWith<_$UpdatedSearchFaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FaqState {
  FAQInfo get faqInfo => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  FAQCategory get selectedCategory => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaqStateCopyWith<FaqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqStateCopyWith<$Res> {
  factory $FaqStateCopyWith(FaqState value, $Res Function(FaqState) then) =
      _$FaqStateCopyWithImpl<$Res, FaqState>;
  @useResult
  $Res call(
      {FAQInfo faqInfo,
      bool isFetching,
      bool canLoadMore,
      FAQCategory selectedCategory,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $FAQInfoCopyWith<$Res> get faqInfo;
}

/// @nodoc
class _$FaqStateCopyWithImpl<$Res, $Val extends FaqState>
    implements $FaqStateCopyWith<$Res> {
  _$FaqStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? selectedCategory = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      faqInfo: null == faqInfo
          ? _value.faqInfo
          : faqInfo // ignore: cast_nullable_to_non_nullable
              as FAQInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FAQInfoCopyWith<$Res> get faqInfo {
    return $FAQInfoCopyWith<$Res>(_value.faqInfo, (value) {
      return _then(_value.copyWith(faqInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaqStateImplCopyWith<$Res>
    implements $FaqStateCopyWith<$Res> {
  factory _$$FaqStateImplCopyWith(
          _$FaqStateImpl value, $Res Function(_$FaqStateImpl) then) =
      __$$FaqStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FAQInfo faqInfo,
      bool isFetching,
      bool canLoadMore,
      FAQCategory selectedCategory,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $FAQInfoCopyWith<$Res> get faqInfo;
}

/// @nodoc
class __$$FaqStateImplCopyWithImpl<$Res>
    extends _$FaqStateCopyWithImpl<$Res, _$FaqStateImpl>
    implements _$$FaqStateImplCopyWith<$Res> {
  __$$FaqStateImplCopyWithImpl(
      _$FaqStateImpl _value, $Res Function(_$FaqStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? selectedCategory = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$FaqStateImpl(
      faqInfo: null == faqInfo
          ? _value.faqInfo
          : faqInfo // ignore: cast_nullable_to_non_nullable
              as FAQInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$FaqStateImpl extends _FaqState {
  const _$FaqStateImpl(
      {required this.faqInfo,
      required this.isFetching,
      required this.canLoadMore,
      required this.selectedCategory,
      required this.searchKey,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final FAQInfo faqInfo;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final FAQCategory selectedCategory;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'FaqState(faqInfo: $faqInfo, isFetching: $isFetching, canLoadMore: $canLoadMore, selectedCategory: $selectedCategory, searchKey: $searchKey, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqStateImpl &&
            (identical(other.faqInfo, faqInfo) || other.faqInfo == faqInfo) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, faqInfo, isFetching, canLoadMore,
      selectedCategory, searchKey, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqStateImplCopyWith<_$FaqStateImpl> get copyWith =>
      __$$FaqStateImplCopyWithImpl<_$FaqStateImpl>(this, _$identity);
}

abstract class _FaqState extends FaqState {
  const factory _FaqState(
      {required final FAQInfo faqInfo,
      required final bool isFetching,
      required final bool canLoadMore,
      required final FAQCategory selectedCategory,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$FaqStateImpl;
  const _FaqState._() : super._();

  @override
  FAQInfo get faqInfo;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  FAQCategory get selectedCategory;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$FaqStateImplCopyWith<_$FaqStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
