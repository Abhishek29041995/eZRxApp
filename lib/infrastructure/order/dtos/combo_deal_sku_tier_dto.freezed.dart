// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_sku_tier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComboDealSKUTierDto _$ComboDealSKUTierDtoFromJson(Map<String, dynamic> json) {
  return _ComboDealSKUTierDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealSKUTierDto {
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  int get minQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealSKUTierDtoCopyWith<ComboDealSKUTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealSKUTierDtoCopyWith<$Res> {
  factory $ComboDealSKUTierDtoCopyWith(
          ComboDealSKUTierDto value, $Res Function(ComboDealSKUTierDto) then) =
      _$ComboDealSKUTierDtoCopyWithImpl<$Res, ComboDealSKUTierDto>;
  @useResult
  $Res call(
      {@StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @StringToDoubleConverter()
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      int minQty,
      @JsonKey(name: 'type', defaultValue: '') String type});
}

/// @nodoc
class _$ComboDealSKUTierDtoCopyWithImpl<$Res, $Val extends ComboDealSKUTierDto>
    implements $ComboDealSKUTierDtoCopyWith<$Res> {
  _$ComboDealSKUTierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealSKUTierDtoImplCopyWith<$Res>
    implements $ComboDealSKUTierDtoCopyWith<$Res> {
  factory _$$ComboDealSKUTierDtoImplCopyWith(_$ComboDealSKUTierDtoImpl value,
          $Res Function(_$ComboDealSKUTierDtoImpl) then) =
      __$$ComboDealSKUTierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @StringToDoubleConverter()
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber,
      @StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      int minQty,
      @JsonKey(name: 'type', defaultValue: '') String type});
}

/// @nodoc
class __$$ComboDealSKUTierDtoImplCopyWithImpl<$Res>
    extends _$ComboDealSKUTierDtoCopyWithImpl<$Res, _$ComboDealSKUTierDtoImpl>
    implements _$$ComboDealSKUTierDtoImplCopyWith<$Res> {
  __$$ComboDealSKUTierDtoImplCopyWithImpl(_$ComboDealSKUTierDtoImpl _value,
      $Res Function(_$ComboDealSKUTierDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_$ComboDealSKUTierDtoImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComboDealSKUTierDtoImpl extends _ComboDealSKUTierDto {
  const _$ComboDealSKUTierDtoImpl(
      {@StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required this.rate,
      @StringToDoubleConverter()
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required this.conditionNumber,
      @StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      required this.minQty,
      @JsonKey(name: 'type', defaultValue: '') required this.type})
      : super._();

  factory _$ComboDealSKUTierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComboDealSKUTierDtoImplFromJson(json);

  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  final String conditionNumber;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  final int minQty;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;

  @override
  String toString() {
    return 'ComboDealSKUTierDto(rate: $rate, conditionNumber: $conditionNumber, minQty: $minQty, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealSKUTierDtoImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, conditionNumber, minQty, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealSKUTierDtoImplCopyWith<_$ComboDealSKUTierDtoImpl> get copyWith =>
      __$$ComboDealSKUTierDtoImplCopyWithImpl<_$ComboDealSKUTierDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComboDealSKUTierDtoImplToJson(
      this,
    );
  }
}

abstract class _ComboDealSKUTierDto extends ComboDealSKUTierDto {
  const factory _ComboDealSKUTierDto(
      {@StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required final double rate,
      @StringToDoubleConverter()
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required final String conditionNumber,
      @StringToIntConverter()
      @JsonKey(name: 'minQty', defaultValue: 0)
      required final int minQty,
      @JsonKey(name: 'type', defaultValue: '')
      required final String type}) = _$ComboDealSKUTierDtoImpl;
  const _ComboDealSKUTierDto._() : super._();

  factory _ComboDealSKUTierDto.fromJson(Map<String, dynamic> json) =
      _$ComboDealSKUTierDtoImpl.fromJson;

  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'minQty', defaultValue: 0)
  int get minQty;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealSKUTierDtoImplCopyWith<_$ComboDealSKUTierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
