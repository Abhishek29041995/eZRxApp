// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceComboDealDto _$PriceComboDealDtoFromJson(Map<String, dynamic> json) {
  return _PriceComboDealDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealDto {
  @JsonKey(name: 'eligible', defaultValue: false)
  bool get isEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'flexibleGroup', defaultValue: '')
  String get flexibleGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDeal', defaultValue: '')
  String get salesDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  PriceComboDealCategoryDto get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealDtoCopyWith<PriceComboDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealDtoCopyWith<$Res> {
  factory $PriceComboDealDtoCopyWith(
          PriceComboDealDto value, $Res Function(PriceComboDealDto) then) =
      _$PriceComboDealDtoCopyWithImpl<$Res, PriceComboDealDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'eligible', defaultValue: false) bool isEligible,
      @JsonKey(name: 'flexibleGroup', defaultValue: '') String flexibleGroup,
      @JsonKey(name: 'salesDeal', defaultValue: '') String salesDeal,
      @JsonKey(name: 'category') PriceComboDealCategoryDto category});

  $PriceComboDealCategoryDtoCopyWith<$Res> get category;
}

/// @nodoc
class _$PriceComboDealDtoCopyWithImpl<$Res, $Val extends PriceComboDealDto>
    implements $PriceComboDealDtoCopyWith<$Res> {
  _$PriceComboDealDtoCopyWithImpl(this._value, this._then);

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
              as String,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategoryDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCategoryDtoCopyWith<$Res> get category {
    return $PriceComboDealCategoryDtoCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceComboDealDtoImplCopyWith<$Res>
    implements $PriceComboDealDtoCopyWith<$Res> {
  factory _$$PriceComboDealDtoImplCopyWith(_$PriceComboDealDtoImpl value,
          $Res Function(_$PriceComboDealDtoImpl) then) =
      __$$PriceComboDealDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'eligible', defaultValue: false) bool isEligible,
      @JsonKey(name: 'flexibleGroup', defaultValue: '') String flexibleGroup,
      @JsonKey(name: 'salesDeal', defaultValue: '') String salesDeal,
      @JsonKey(name: 'category') PriceComboDealCategoryDto category});

  @override
  $PriceComboDealCategoryDtoCopyWith<$Res> get category;
}

/// @nodoc
class __$$PriceComboDealDtoImplCopyWithImpl<$Res>
    extends _$PriceComboDealDtoCopyWithImpl<$Res, _$PriceComboDealDtoImpl>
    implements _$$PriceComboDealDtoImplCopyWith<$Res> {
  __$$PriceComboDealDtoImplCopyWithImpl(_$PriceComboDealDtoImpl _value,
      $Res Function(_$PriceComboDealDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_$PriceComboDealDtoImpl(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategoryDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceComboDealDtoImpl extends _PriceComboDealDto {
  const _$PriceComboDealDtoImpl(
      {@JsonKey(name: 'eligible', defaultValue: false) required this.isEligible,
      @JsonKey(name: 'flexibleGroup', defaultValue: '')
      required this.flexibleGroup,
      @JsonKey(name: 'salesDeal', defaultValue: '') required this.salesDeal,
      @JsonKey(name: 'category')
      this.category = PriceComboDealCategoryDto.empty})
      : super._();

  factory _$PriceComboDealDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceComboDealDtoImplFromJson(json);

  @override
  @JsonKey(name: 'eligible', defaultValue: false)
  final bool isEligible;
  @override
  @JsonKey(name: 'flexibleGroup', defaultValue: '')
  final String flexibleGroup;
  @override
  @JsonKey(name: 'salesDeal', defaultValue: '')
  final String salesDeal;
  @override
  @JsonKey(name: 'category')
  final PriceComboDealCategoryDto category;

  @override
  String toString() {
    return 'PriceComboDealDto(isEligible: $isEligible, flexibleGroup: $flexibleGroup, salesDeal: $salesDeal, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealDtoImpl &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.flexibleGroup, flexibleGroup) ||
                other.flexibleGroup == flexibleGroup) &&
            (identical(other.salesDeal, salesDeal) ||
                other.salesDeal == salesDeal) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isEligible, flexibleGroup, salesDeal, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceComboDealDtoImplCopyWith<_$PriceComboDealDtoImpl> get copyWith =>
      __$$PriceComboDealDtoImplCopyWithImpl<_$PriceComboDealDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceComboDealDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceComboDealDto extends PriceComboDealDto {
  const factory _PriceComboDealDto(
      {@JsonKey(name: 'eligible', defaultValue: false)
      required final bool isEligible,
      @JsonKey(name: 'flexibleGroup', defaultValue: '')
      required final String flexibleGroup,
      @JsonKey(name: 'salesDeal', defaultValue: '')
      required final String salesDeal,
      @JsonKey(name: 'category')
      final PriceComboDealCategoryDto category}) = _$PriceComboDealDtoImpl;
  const _PriceComboDealDto._() : super._();

  factory _PriceComboDealDto.fromJson(Map<String, dynamic> json) =
      _$PriceComboDealDtoImpl.fromJson;

  @override
  @JsonKey(name: 'eligible', defaultValue: false)
  bool get isEligible;
  @override
  @JsonKey(name: 'flexibleGroup', defaultValue: '')
  String get flexibleGroup;
  @override
  @JsonKey(name: 'salesDeal', defaultValue: '')
  String get salesDeal;
  @override
  @JsonKey(name: 'category')
  PriceComboDealCategoryDto get category;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealDtoImplCopyWith<_$PriceComboDealDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceComboDealCategoryDto _$PriceComboDealCategoryDtoFromJson(
    Map<String, dynamic> json) {
  return _PriceComboDealCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealCategoryDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'value', defaultValue: <String>[])
  List<String> get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealCategoryDtoCopyWith<PriceComboDealCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCategoryDtoCopyWith<$Res> {
  factory $PriceComboDealCategoryDtoCopyWith(PriceComboDealCategoryDto value,
          $Res Function(PriceComboDealCategoryDto) then) =
      _$PriceComboDealCategoryDtoCopyWithImpl<$Res, PriceComboDealCategoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'value', defaultValue: <String>[]) List<String> value});
}

/// @nodoc
class _$PriceComboDealCategoryDtoCopyWithImpl<$Res,
        $Val extends PriceComboDealCategoryDto>
    implements $PriceComboDealCategoryDtoCopyWith<$Res> {
  _$PriceComboDealCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceComboDealCategoryDtoImplCopyWith<$Res>
    implements $PriceComboDealCategoryDtoCopyWith<$Res> {
  factory _$$PriceComboDealCategoryDtoImplCopyWith(
          _$PriceComboDealCategoryDtoImpl value,
          $Res Function(_$PriceComboDealCategoryDtoImpl) then) =
      __$$PriceComboDealCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'value', defaultValue: <String>[]) List<String> value});
}

/// @nodoc
class __$$PriceComboDealCategoryDtoImplCopyWithImpl<$Res>
    extends _$PriceComboDealCategoryDtoCopyWithImpl<$Res,
        _$PriceComboDealCategoryDtoImpl>
    implements _$$PriceComboDealCategoryDtoImplCopyWith<$Res> {
  __$$PriceComboDealCategoryDtoImplCopyWithImpl(
      _$PriceComboDealCategoryDtoImpl _value,
      $Res Function(_$PriceComboDealCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$PriceComboDealCategoryDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceComboDealCategoryDtoImpl extends _PriceComboDealCategoryDto {
  const _$PriceComboDealCategoryDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'value', defaultValue: <String>[])
      required final List<String> value})
      : _value = value,
        super._();

  factory _$PriceComboDealCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceComboDealCategoryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  final List<String> _value;
  @override
  @JsonKey(name: 'value', defaultValue: <String>[])
  List<String> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'PriceComboDealCategoryDto(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealCategoryDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceComboDealCategoryDtoImplCopyWith<_$PriceComboDealCategoryDtoImpl>
      get copyWith => __$$PriceComboDealCategoryDtoImplCopyWithImpl<
          _$PriceComboDealCategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceComboDealCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceComboDealCategoryDto extends PriceComboDealCategoryDto {
  const factory _PriceComboDealCategoryDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'value', defaultValue: <String>[])
      required final List<String> value}) = _$PriceComboDealCategoryDtoImpl;
  const _PriceComboDealCategoryDto._() : super._();

  factory _PriceComboDealCategoryDto.fromJson(Map<String, dynamic> json) =
      _$PriceComboDealCategoryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'value', defaultValue: <String>[])
  List<String> get value;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealCategoryDtoImplCopyWith<_$PriceComboDealCategoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
