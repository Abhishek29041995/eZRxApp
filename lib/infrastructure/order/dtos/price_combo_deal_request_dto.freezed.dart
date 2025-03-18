// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_combo_deal_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceComboDealRequestDto _$PriceComboDealRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _PriceComboDealRequestDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealRequestDto {
  @JsonKey(name: 'Eligible', defaultValue: false)
  bool get isEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  String get flexibleGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  String get salesDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  PriceComboDealCategoryRequestDto get category =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealRequestDtoCopyWith<PriceComboDealRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealRequestDtoCopyWith<$Res> {
  factory $PriceComboDealRequestDtoCopyWith(PriceComboDealRequestDto value,
          $Res Function(PriceComboDealRequestDto) then) =
      _$PriceComboDealRequestDtoCopyWithImpl<$Res, PriceComboDealRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Eligible', defaultValue: false) bool isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '') String flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '') String salesDeal,
      @JsonKey(name: 'Category') PriceComboDealCategoryRequestDto category});

  $PriceComboDealCategoryRequestDtoCopyWith<$Res> get category;
}

/// @nodoc
class _$PriceComboDealRequestDtoCopyWithImpl<$Res,
        $Val extends PriceComboDealRequestDto>
    implements $PriceComboDealRequestDtoCopyWith<$Res> {
  _$PriceComboDealRequestDtoCopyWithImpl(this._value, this._then);

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
              as PriceComboDealCategoryRequestDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCategoryRequestDtoCopyWith<$Res> get category {
    return $PriceComboDealCategoryRequestDtoCopyWith<$Res>(_value.category,
        (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceComboDealRequestDtoImplCopyWith<$Res>
    implements $PriceComboDealRequestDtoCopyWith<$Res> {
  factory _$$PriceComboDealRequestDtoImplCopyWith(
          _$PriceComboDealRequestDtoImpl value,
          $Res Function(_$PriceComboDealRequestDtoImpl) then) =
      __$$PriceComboDealRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Eligible', defaultValue: false) bool isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '') String flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '') String salesDeal,
      @JsonKey(name: 'Category') PriceComboDealCategoryRequestDto category});

  @override
  $PriceComboDealCategoryRequestDtoCopyWith<$Res> get category;
}

/// @nodoc
class __$$PriceComboDealRequestDtoImplCopyWithImpl<$Res>
    extends _$PriceComboDealRequestDtoCopyWithImpl<$Res,
        _$PriceComboDealRequestDtoImpl>
    implements _$$PriceComboDealRequestDtoImplCopyWith<$Res> {
  __$$PriceComboDealRequestDtoImplCopyWithImpl(
      _$PriceComboDealRequestDtoImpl _value,
      $Res Function(_$PriceComboDealRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_$PriceComboDealRequestDtoImpl(
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
              as PriceComboDealCategoryRequestDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceComboDealRequestDtoImpl extends _PriceComboDealRequestDto {
  const _$PriceComboDealRequestDtoImpl(
      {@JsonKey(name: 'Eligible', defaultValue: false) required this.isEligible,
      @JsonKey(name: 'FlexibleGroup', defaultValue: '')
      required this.flexibleGroup,
      @JsonKey(name: 'SalesDeal', defaultValue: '') required this.salesDeal,
      @JsonKey(name: 'Category')
      this.category = PriceComboDealCategoryRequestDto.empty})
      : super._();

  factory _$PriceComboDealRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceComboDealRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Eligible', defaultValue: false)
  final bool isEligible;
  @override
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  final String flexibleGroup;
  @override
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  final String salesDeal;
  @override
  @JsonKey(name: 'Category')
  final PriceComboDealCategoryRequestDto category;

  @override
  String toString() {
    return 'PriceComboDealRequestDto(isEligible: $isEligible, flexibleGroup: $flexibleGroup, salesDeal: $salesDeal, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealRequestDtoImpl &&
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
  _$$PriceComboDealRequestDtoImplCopyWith<_$PriceComboDealRequestDtoImpl>
      get copyWith => __$$PriceComboDealRequestDtoImplCopyWithImpl<
          _$PriceComboDealRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceComboDealRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceComboDealRequestDto extends PriceComboDealRequestDto {
  const factory _PriceComboDealRequestDto(
          {@JsonKey(name: 'Eligible', defaultValue: false)
          required final bool isEligible,
          @JsonKey(name: 'FlexibleGroup', defaultValue: '')
          required final String flexibleGroup,
          @JsonKey(name: 'SalesDeal', defaultValue: '')
          required final String salesDeal,
          @JsonKey(name: 'Category')
          final PriceComboDealCategoryRequestDto category}) =
      _$PriceComboDealRequestDtoImpl;
  const _PriceComboDealRequestDto._() : super._();

  factory _PriceComboDealRequestDto.fromJson(Map<String, dynamic> json) =
      _$PriceComboDealRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Eligible', defaultValue: false)
  bool get isEligible;
  @override
  @JsonKey(name: 'FlexibleGroup', defaultValue: '')
  String get flexibleGroup;
  @override
  @JsonKey(name: 'SalesDeal', defaultValue: '')
  String get salesDeal;
  @override
  @JsonKey(name: 'Category')
  PriceComboDealCategoryRequestDto get category;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealRequestDtoImplCopyWith<_$PriceComboDealRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PriceComboDealCategoryRequestDto _$PriceComboDealCategoryRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _PriceComboDealCategoryRequestDto.fromJson(json);
}

/// @nodoc
mixin _$PriceComboDealCategoryRequestDto {
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value', defaultValue: <String>[])
  List<String> get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceComboDealCategoryRequestDtoCopyWith<PriceComboDealCategoryRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCategoryRequestDtoCopyWith<$Res> {
  factory $PriceComboDealCategoryRequestDtoCopyWith(
          PriceComboDealCategoryRequestDto value,
          $Res Function(PriceComboDealCategoryRequestDto) then) =
      _$PriceComboDealCategoryRequestDtoCopyWithImpl<$Res,
          PriceComboDealCategoryRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Value', defaultValue: <String>[]) List<String> value});
}

/// @nodoc
class _$PriceComboDealCategoryRequestDtoCopyWithImpl<$Res,
        $Val extends PriceComboDealCategoryRequestDto>
    implements $PriceComboDealCategoryRequestDtoCopyWith<$Res> {
  _$PriceComboDealCategoryRequestDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$PriceComboDealCategoryRequestDtoImplCopyWith<$Res>
    implements $PriceComboDealCategoryRequestDtoCopyWith<$Res> {
  factory _$$PriceComboDealCategoryRequestDtoImplCopyWith(
          _$PriceComboDealCategoryRequestDtoImpl value,
          $Res Function(_$PriceComboDealCategoryRequestDtoImpl) then) =
      __$$PriceComboDealCategoryRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Value', defaultValue: <String>[]) List<String> value});
}

/// @nodoc
class __$$PriceComboDealCategoryRequestDtoImplCopyWithImpl<$Res>
    extends _$PriceComboDealCategoryRequestDtoCopyWithImpl<$Res,
        _$PriceComboDealCategoryRequestDtoImpl>
    implements _$$PriceComboDealCategoryRequestDtoImplCopyWith<$Res> {
  __$$PriceComboDealCategoryRequestDtoImplCopyWithImpl(
      _$PriceComboDealCategoryRequestDtoImpl _value,
      $Res Function(_$PriceComboDealCategoryRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$PriceComboDealCategoryRequestDtoImpl(
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
class _$PriceComboDealCategoryRequestDtoImpl
    extends _PriceComboDealCategoryRequestDto {
  const _$PriceComboDealCategoryRequestDtoImpl(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'Value', defaultValue: <String>[])
      required final List<String> value})
      : _value = value,
        super._();

  factory _$PriceComboDealCategoryRequestDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PriceComboDealCategoryRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  final List<String> _value;
  @override
  @JsonKey(name: 'Value', defaultValue: <String>[])
  List<String> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'PriceComboDealCategoryRequestDto(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComboDealCategoryRequestDtoImpl &&
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
  _$$PriceComboDealCategoryRequestDtoImplCopyWith<
          _$PriceComboDealCategoryRequestDtoImpl>
      get copyWith => __$$PriceComboDealCategoryRequestDtoImplCopyWithImpl<
          _$PriceComboDealCategoryRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceComboDealCategoryRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceComboDealCategoryRequestDto
    extends PriceComboDealCategoryRequestDto {
  const factory _PriceComboDealCategoryRequestDto(
          {@JsonKey(name: 'Type', defaultValue: '') required final String type,
          @JsonKey(name: 'Value', defaultValue: <String>[])
          required final List<String> value}) =
      _$PriceComboDealCategoryRequestDtoImpl;
  const _PriceComboDealCategoryRequestDto._() : super._();

  factory _PriceComboDealCategoryRequestDto.fromJson(
          Map<String, dynamic> json) =
      _$PriceComboDealCategoryRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Value', defaultValue: <String>[])
  List<String> get value;
  @override
  @JsonKey(ignore: true)
  _$$PriceComboDealCategoryRequestDtoImplCopyWith<
          _$PriceComboDealCategoryRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
