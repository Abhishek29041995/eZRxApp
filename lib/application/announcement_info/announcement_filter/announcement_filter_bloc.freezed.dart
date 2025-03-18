// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnnouncementFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementFilterEventCopyWith<$Res> {
  factory $AnnouncementFilterEventCopyWith(AnnouncementFilterEvent value,
          $Res Function(AnnouncementFilterEvent) then) =
      _$AnnouncementFilterEventCopyWithImpl<$Res, AnnouncementFilterEvent>;
}

/// @nodoc
class _$AnnouncementFilterEventCopyWithImpl<$Res,
        $Val extends AnnouncementFilterEvent>
    implements $AnnouncementFilterEventCopyWith<$Res> {
  _$AnnouncementFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoryChangedImplCopyWith<$Res> {
  factory _$$CategoryChangedImplCopyWith(_$CategoryChangedImpl value,
          $Res Function(_$CategoryChangedImpl) then) =
      __$$CategoryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterCategory, bool selected});
}

/// @nodoc
class __$$CategoryChangedImplCopyWithImpl<$Res>
    extends _$AnnouncementFilterEventCopyWithImpl<$Res, _$CategoryChangedImpl>
    implements _$$CategoryChangedImplCopyWith<$Res> {
  __$$CategoryChangedImplCopyWithImpl(
      _$CategoryChangedImpl _value, $Res Function(_$CategoryChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategory = null,
    Object? selected = null,
  }) {
    return _then(_$CategoryChangedImpl(
      null == filterCategory
          ? _value.filterCategory
          : filterCategory // ignore: cast_nullable_to_non_nullable
              as String,
      null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CategoryChangedImpl implements _CategoryChanged {
  const _$CategoryChangedImpl(this.filterCategory, this.selected);

  @override
  final String filterCategory;
  @override
  final bool selected;

  @override
  String toString() {
    return 'AnnouncementFilterEvent.categoryChanged(filterCategory: $filterCategory, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryChangedImpl &&
            (identical(other.filterCategory, filterCategory) ||
                other.filterCategory == filterCategory) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterCategory, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      __$$CategoryChangedImplCopyWithImpl<_$CategoryChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return categoryChanged(filterCategory, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return categoryChanged?.call(filterCategory, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(filterCategory, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return categoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return categoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(this);
    }
    return orElse();
  }
}

abstract class _CategoryChanged implements AnnouncementFilterEvent {
  const factory _CategoryChanged(
      final String filterCategory, final bool selected) = _$CategoryChangedImpl;

  String get filterCategory;
  bool get selected;
  @JsonKey(ignore: true)
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCategoryWhileOpenBottomSheetImplCopyWith<$Res> {
  factory _$$SetCategoryWhileOpenBottomSheetImplCopyWith(
          _$SetCategoryWhileOpenBottomSheetImpl value,
          $Res Function(_$SetCategoryWhileOpenBottomSheetImpl) then) =
      __$$SetCategoryWhileOpenBottomSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> filterCategory});
}

/// @nodoc
class __$$SetCategoryWhileOpenBottomSheetImplCopyWithImpl<$Res>
    extends _$AnnouncementFilterEventCopyWithImpl<$Res,
        _$SetCategoryWhileOpenBottomSheetImpl>
    implements _$$SetCategoryWhileOpenBottomSheetImplCopyWith<$Res> {
  __$$SetCategoryWhileOpenBottomSheetImplCopyWithImpl(
      _$SetCategoryWhileOpenBottomSheetImpl _value,
      $Res Function(_$SetCategoryWhileOpenBottomSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategory = null,
  }) {
    return _then(_$SetCategoryWhileOpenBottomSheetImpl(
      null == filterCategory
          ? _value._filterCategory
          : filterCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SetCategoryWhileOpenBottomSheetImpl
    implements _SetCategoryWhileOpenBottomSheet {
  const _$SetCategoryWhileOpenBottomSheetImpl(final List<String> filterCategory)
      : _filterCategory = filterCategory;

  final List<String> _filterCategory;
  @override
  List<String> get filterCategory {
    if (_filterCategory is EqualUnmodifiableListView) return _filterCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCategory);
  }

  @override
  String toString() {
    return 'AnnouncementFilterEvent.setCategoryWhileOpenBottomSheet(filterCategory: $filterCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCategoryWhileOpenBottomSheetImpl &&
            const DeepCollectionEquality()
                .equals(other._filterCategory, _filterCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filterCategory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCategoryWhileOpenBottomSheetImplCopyWith<
          _$SetCategoryWhileOpenBottomSheetImpl>
      get copyWith => __$$SetCategoryWhileOpenBottomSheetImplCopyWithImpl<
          _$SetCategoryWhileOpenBottomSheetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet(filterCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet?.call(filterCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (setCategoryWhileOpenBottomSheet != null) {
      return setCategoryWhileOpenBottomSheet(filterCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (setCategoryWhileOpenBottomSheet != null) {
      return setCategoryWhileOpenBottomSheet(this);
    }
    return orElse();
  }
}

abstract class _SetCategoryWhileOpenBottomSheet
    implements AnnouncementFilterEvent {
  const factory _SetCategoryWhileOpenBottomSheet(
          final List<String> filterCategory) =
      _$SetCategoryWhileOpenBottomSheetImpl;

  List<String> get filterCategory;
  @JsonKey(ignore: true)
  _$$SetCategoryWhileOpenBottomSheetImplCopyWith<
          _$SetCategoryWhileOpenBottomSheetImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCategoryImplCopyWith<$Res> {
  factory _$$ResetCategoryImplCopyWith(
          _$ResetCategoryImpl value, $Res Function(_$ResetCategoryImpl) then) =
      __$$ResetCategoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCategoryImplCopyWithImpl<$Res>
    extends _$AnnouncementFilterEventCopyWithImpl<$Res, _$ResetCategoryImpl>
    implements _$$ResetCategoryImplCopyWith<$Res> {
  __$$ResetCategoryImplCopyWithImpl(
      _$ResetCategoryImpl _value, $Res Function(_$ResetCategoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetCategoryImpl implements _ResetCategory {
  const _$ResetCategoryImpl();

  @override
  String toString() {
    return 'AnnouncementFilterEvent.resetCategory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetCategoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return resetCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return resetCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (resetCategory != null) {
      return resetCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return resetCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return resetCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (resetCategory != null) {
      return resetCategory(this);
    }
    return orElse();
  }
}

abstract class _ResetCategory implements AnnouncementFilterEvent {
  const factory _ResetCategory() = _$ResetCategoryImpl;
}

/// @nodoc
abstract class _$$FetchCategoryImplCopyWith<$Res> {
  factory _$$FetchCategoryImplCopyWith(
          _$FetchCategoryImpl value, $Res Function(_$FetchCategoryImpl) then) =
      __$$FetchCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$FetchCategoryImplCopyWithImpl<$Res>
    extends _$AnnouncementFilterEventCopyWithImpl<$Res, _$FetchCategoryImpl>
    implements _$$FetchCategoryImplCopyWith<$Res> {
  __$$FetchCategoryImplCopyWithImpl(
      _$FetchCategoryImpl _value, $Res Function(_$FetchCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$FetchCategoryImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$FetchCategoryImpl implements _FetchCategory {
  const _$FetchCategoryImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementFilterEvent.fetchCategory(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCategoryImplCopyWith<_$FetchCategoryImpl> get copyWith =>
      __$$FetchCategoryImplCopyWithImpl<_$FetchCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return fetchCategory(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return fetchCategory?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return fetchCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return fetchCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(this);
    }
    return orElse();
  }
}

abstract class _FetchCategory implements AnnouncementFilterEvent {
  const factory _FetchCategory({required final SalesOrg salesOrg}) =
      _$FetchCategoryImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$FetchCategoryImplCopyWith<_$FetchCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementFilterState {
  List<String> get filterCategoryKeyList => throw _privateConstructorUsedError;
  List<String> get categoryKeyList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementFilterStateCopyWith<AnnouncementFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementFilterStateCopyWith<$Res> {
  factory $AnnouncementFilterStateCopyWith(AnnouncementFilterState value,
          $Res Function(AnnouncementFilterState) then) =
      _$AnnouncementFilterStateCopyWithImpl<$Res, AnnouncementFilterState>;
  @useResult
  $Res call(
      {List<String> filterCategoryKeyList,
      List<String> categoryKeyList,
      bool isLoading});
}

/// @nodoc
class _$AnnouncementFilterStateCopyWithImpl<$Res,
        $Val extends AnnouncementFilterState>
    implements $AnnouncementFilterStateCopyWith<$Res> {
  _$AnnouncementFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategoryKeyList = null,
    Object? categoryKeyList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      filterCategoryKeyList: null == filterCategoryKeyList
          ? _value.filterCategoryKeyList
          : filterCategoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryKeyList: null == categoryKeyList
          ? _value.categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementFilterStateImplCopyWith<$Res>
    implements $AnnouncementFilterStateCopyWith<$Res> {
  factory _$$AnnouncementFilterStateImplCopyWith(
          _$AnnouncementFilterStateImpl value,
          $Res Function(_$AnnouncementFilterStateImpl) then) =
      __$$AnnouncementFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> filterCategoryKeyList,
      List<String> categoryKeyList,
      bool isLoading});
}

/// @nodoc
class __$$AnnouncementFilterStateImplCopyWithImpl<$Res>
    extends _$AnnouncementFilterStateCopyWithImpl<$Res,
        _$AnnouncementFilterStateImpl>
    implements _$$AnnouncementFilterStateImplCopyWith<$Res> {
  __$$AnnouncementFilterStateImplCopyWithImpl(
      _$AnnouncementFilterStateImpl _value,
      $Res Function(_$AnnouncementFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategoryKeyList = null,
    Object? categoryKeyList = null,
    Object? isLoading = null,
  }) {
    return _then(_$AnnouncementFilterStateImpl(
      filterCategoryKeyList: null == filterCategoryKeyList
          ? _value._filterCategoryKeyList
          : filterCategoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryKeyList: null == categoryKeyList
          ? _value._categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnnouncementFilterStateImpl extends _AnnouncementFilterState {
  const _$AnnouncementFilterStateImpl(
      {required final List<String> filterCategoryKeyList,
      required final List<String> categoryKeyList,
      required this.isLoading})
      : _filterCategoryKeyList = filterCategoryKeyList,
        _categoryKeyList = categoryKeyList,
        super._();

  final List<String> _filterCategoryKeyList;
  @override
  List<String> get filterCategoryKeyList {
    if (_filterCategoryKeyList is EqualUnmodifiableListView)
      return _filterCategoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCategoryKeyList);
  }

  final List<String> _categoryKeyList;
  @override
  List<String> get categoryKeyList {
    if (_categoryKeyList is EqualUnmodifiableListView) return _categoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryKeyList);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AnnouncementFilterState(filterCategoryKeyList: $filterCategoryKeyList, categoryKeyList: $categoryKeyList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementFilterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._filterCategoryKeyList, _filterCategoryKeyList) &&
            const DeepCollectionEquality()
                .equals(other._categoryKeyList, _categoryKeyList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterCategoryKeyList),
      const DeepCollectionEquality().hash(_categoryKeyList),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementFilterStateImplCopyWith<_$AnnouncementFilterStateImpl>
      get copyWith => __$$AnnouncementFilterStateImplCopyWithImpl<
          _$AnnouncementFilterStateImpl>(this, _$identity);
}

abstract class _AnnouncementFilterState extends AnnouncementFilterState {
  const factory _AnnouncementFilterState(
      {required final List<String> filterCategoryKeyList,
      required final List<String> categoryKeyList,
      required final bool isLoading}) = _$AnnouncementFilterStateImpl;
  const _AnnouncementFilterState._() : super._();

  @override
  List<String> get filterCategoryKeyList;
  @override
  List<String> get categoryKeyList;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementFilterStateImplCopyWith<_$AnnouncementFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
