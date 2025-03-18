// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_combo_deal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceComboDeal {
  bool get isEligible => throw _privateConstructorUsedError;
  FlexibleGroup get flexibleGroup => throw _privateConstructorUsedError;
  SalesDealNumber get salesDeal => throw _privateConstructorUsedError;
  PriceComboDealCategory get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceComboDealCopyWith<PriceComboDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCopyWith<$Res> {
  factory $PriceComboDealCopyWith(
          PriceComboDeal value, $Res Function(PriceComboDeal) then) =
      _$PriceComboDealCopyWithImpl<$Res, PriceComboDeal>;
  @useResult
  $Res call(
      {bool isEligible,
      FlexibleGroup flexibleGroup,
      SalesDealNumber salesDeal,
      PriceComboDealCategory category});

  $PriceComboDealCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$PriceComboDealCopyWithImpl<$Res, $Val extends PriceComboDeal>
    implements $PriceComboDealCopyWith<$Res> {
  _$PriceComboDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as FlexibleGroup,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as SalesDealNumber,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCategoryCopyWith<$Res> get category {
    return $PriceComboDealCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceComboDealImplCopyWith<$Res>
    implements $PriceComboDealCopyWith<$Res> {
  factory _$$PriceComboDealImplCopyWith(_$PriceComboDealImpl value,
          $Res Function(_$PriceComboDealImpl) then) =
      __$$PriceComboDealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEligible,
      FlexibleGroup flexibleGroup,
      SalesDealNumber salesDeal,
      PriceComboDealCategory category});

  @override
  $PriceComboDealCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$PriceComboDealImplCopyWithImpl<$Res>
    extends _$PriceComboDealCopyWithImpl<$Res, _$PriceComboDealImpl>
    implements _$$PriceComboDealImplCopyWith<$Res> {
  __$$PriceComboDealImplCopyWithImpl(
      _$PriceComboDealImpl _value, $Res Function(_$PriceComboDealImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_$PriceComboDealImpl(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as FlexibleGroup,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as SalesDealNumber,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategory,
    ));
  }
}

/// @nodoc

class _$PriceComboDealImpl extends _PriceComboDeal {
  const _$PriceComboDealImpl(
      {required this.isEligible,
      required this.flexibleGroup,
      required this.salesDeal,
      required this.category})
      : super._();

  @override
  final bool isEligible;
  @override
  final FlexibleGroup flexibleGroup;
  @override
  final SalesDealNumber salesDeal;
  @override
  final PriceComboDealCategory category;

  @override
  String toString() {
    return 'PriceComboDeal(isEligible: $isEligible, flexibleGroup: $flexibleGroup, salesDeal: $salesDeal, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealImpl &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.flexibleGroup, flexibleGroup) ||
                other.flexibleGroup == flexibleGroup) &&
            (identical(other.salesDeal, salesDeal) ||
                other.salesDeal == salesDeal) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isEligible, flexibleGroup, salesDeal, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceComboDealImplCopyWith<_$PriceComboDealImpl> get copyWith =>
      __$$PriceComboDealImplCopyWithImpl<_$PriceComboDealImpl>(
          this, _$identity);
}

abstract class _PriceComboDeal extends PriceComboDeal {
  const factory _PriceComboDeal(
      {required final bool isEligible,
      required final FlexibleGroup flexibleGroup,
      required final SalesDealNumber salesDeal,
      required final PriceComboDealCategory category}) = _$PriceComboDealImpl;
  const _PriceComboDeal._() : super._();

  @override
  bool get isEligible;
  @override
  FlexibleGroup get flexibleGroup;
  @override
  SalesDealNumber get salesDeal;
  @override
  PriceComboDealCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealImplCopyWith<_$PriceComboDealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceComboDealCategory {
  ComboDealCategoryType get type => throw _privateConstructorUsedError;
  List<String> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceComboDealCategoryCopyWith<PriceComboDealCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCategoryCopyWith<$Res> {
  factory $PriceComboDealCategoryCopyWith(PriceComboDealCategory value,
          $Res Function(PriceComboDealCategory) then) =
      _$PriceComboDealCategoryCopyWithImpl<$Res, PriceComboDealCategory>;
  @useResult
  $Res call({ComboDealCategoryType type, List<String> values});
}

/// @nodoc
class _$PriceComboDealCategoryCopyWithImpl<$Res,
        $Val extends PriceComboDealCategory>
    implements $PriceComboDealCategoryCopyWith<$Res> {
  _$PriceComboDealCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ComboDealCategoryType,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceComboDealCategoryImplCopyWith<$Res>
    implements $PriceComboDealCategoryCopyWith<$Res> {
  factory _$$PriceComboDealCategoryImplCopyWith(
          _$PriceComboDealCategoryImpl value,
          $Res Function(_$PriceComboDealCategoryImpl) then) =
      __$$PriceComboDealCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ComboDealCategoryType type, List<String> values});
}

/// @nodoc
class __$$PriceComboDealCategoryImplCopyWithImpl<$Res>
    extends _$PriceComboDealCategoryCopyWithImpl<$Res,
        _$PriceComboDealCategoryImpl>
    implements _$$PriceComboDealCategoryImplCopyWith<$Res> {
  __$$PriceComboDealCategoryImplCopyWithImpl(
      _$PriceComboDealCategoryImpl _value,
      $Res Function(_$PriceComboDealCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? values = null,
  }) {
    return _then(_$PriceComboDealCategoryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ComboDealCategoryType,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PriceComboDealCategoryImpl extends _PriceComboDealCategory {
  const _$PriceComboDealCategoryImpl(
      {required this.type, required final List<String> values})
      : _values = values,
        super._();

  @override
  final ComboDealCategoryType type;
  final List<String> _values;
  @override
  List<String> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'PriceComboDealCategory(type: $type, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealCategoryImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceComboDealCategoryImplCopyWith<_$PriceComboDealCategoryImpl>
      get copyWith => __$$PriceComboDealCategoryImplCopyWithImpl<
          _$PriceComboDealCategoryImpl>(this, _$identity);
}

abstract class _PriceComboDealCategory extends PriceComboDealCategory {
  const factory _PriceComboDealCategory(
      {required final ComboDealCategoryType type,
      required final List<String> values}) = _$PriceComboDealCategoryImpl;
  const _PriceComboDealCategory._() : super._();

  @override
  ComboDealCategoryType get type;
  @override
  List<String> get values;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealCategoryImplCopyWith<_$PriceComboDealCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
