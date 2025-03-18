// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_group_deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComboDealGroupDealDto _$ComboDealGroupDealDtoFromJson(
    Map<String, dynamic> json) {
  return _ComboDealGroupDealDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealGroupDealDto {
  @StringToDoubleConverter()
  @JsonKey(name: 'minTotalAmount', defaultValue: 0)
  double get minTotalAmount => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
  double get maxTotalAmount => throw _privateConstructorUsedError;
  @StringToIntConverter()
  @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
  int get minTotalQuantity => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealGroupDealDtoCopyWith<ComboDealGroupDealDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealGroupDealDtoCopyWith<$Res> {
  factory $ComboDealGroupDealDtoCopyWith(ComboDealGroupDealDto value,
          $Res Function(ComboDealGroupDealDto) then) =
      _$ComboDealGroupDealDtoCopyWithImpl<$Res, ComboDealGroupDealDto>;
  @useResult
  $Res call(
      {@StringToDoubleConverter()
      @JsonKey(name: 'minTotalAmount', defaultValue: 0)
      double minTotalAmount,
      @StringToDoubleConverter()
      @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
      double maxTotalAmount,
      @StringToIntConverter()
      @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
      int minTotalQuantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber});
}

/// @nodoc
class _$ComboDealGroupDealDtoCopyWithImpl<$Res,
        $Val extends ComboDealGroupDealDto>
    implements $ComboDealGroupDealDtoCopyWith<$Res> {
  _$ComboDealGroupDealDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minTotalAmount = null,
    Object? maxTotalAmount = null,
    Object? minTotalQuantity = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
  }) {
    return _then(_value.copyWith(
      minTotalAmount: null == minTotalAmount
          ? _value.minTotalAmount
          : minTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxTotalAmount: null == maxTotalAmount
          ? _value.maxTotalAmount
          : maxTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minTotalQuantity: null == minTotalQuantity
          ? _value.minTotalQuantity
          : minTotalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealGroupDealDtoImplCopyWith<$Res>
    implements $ComboDealGroupDealDtoCopyWith<$Res> {
  factory _$$ComboDealGroupDealDtoImplCopyWith(
          _$ComboDealGroupDealDtoImpl value,
          $Res Function(_$ComboDealGroupDealDtoImpl) then) =
      __$$ComboDealGroupDealDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToDoubleConverter()
      @JsonKey(name: 'minTotalAmount', defaultValue: 0)
      double minTotalAmount,
      @StringToDoubleConverter()
      @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
      double maxTotalAmount,
      @StringToIntConverter()
      @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
      int minTotalQuantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      double rate,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      String conditionNumber});
}

/// @nodoc
class __$$ComboDealGroupDealDtoImplCopyWithImpl<$Res>
    extends _$ComboDealGroupDealDtoCopyWithImpl<$Res,
        _$ComboDealGroupDealDtoImpl>
    implements _$$ComboDealGroupDealDtoImplCopyWith<$Res> {
  __$$ComboDealGroupDealDtoImplCopyWithImpl(_$ComboDealGroupDealDtoImpl _value,
      $Res Function(_$ComboDealGroupDealDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minTotalAmount = null,
    Object? maxTotalAmount = null,
    Object? minTotalQuantity = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
  }) {
    return _then(_$ComboDealGroupDealDtoImpl(
      minTotalAmount: null == minTotalAmount
          ? _value.minTotalAmount
          : minTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxTotalAmount: null == maxTotalAmount
          ? _value.maxTotalAmount
          : maxTotalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minTotalQuantity: null == minTotalQuantity
          ? _value.minTotalQuantity
          : minTotalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComboDealGroupDealDtoImpl extends _ComboDealGroupDealDto {
  const _$ComboDealGroupDealDtoImpl(
      {@StringToDoubleConverter()
      @JsonKey(name: 'minTotalAmount', defaultValue: 0)
      required this.minTotalAmount,
      @StringToDoubleConverter()
      @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
      required this.maxTotalAmount,
      @StringToIntConverter()
      @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
      required this.minTotalQuantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required this.rate,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required this.conditionNumber})
      : super._();

  factory _$ComboDealGroupDealDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComboDealGroupDealDtoImplFromJson(json);

  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'minTotalAmount', defaultValue: 0)
  final double minTotalAmount;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
  final double maxTotalAmount;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
  final int minTotalQuantity;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  final String conditionNumber;

  @override
  String toString() {
    return 'ComboDealGroupDealDto(minTotalAmount: $minTotalAmount, maxTotalAmount: $maxTotalAmount, minTotalQuantity: $minTotalQuantity, rate: $rate, type: $type, conditionNumber: $conditionNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealGroupDealDtoImpl &&
            (identical(other.minTotalAmount, minTotalAmount) ||
                other.minTotalAmount == minTotalAmount) &&
            (identical(other.maxTotalAmount, maxTotalAmount) ||
                other.maxTotalAmount == maxTotalAmount) &&
            (identical(other.minTotalQuantity, minTotalQuantity) ||
                other.minTotalQuantity == minTotalQuantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minTotalAmount, maxTotalAmount,
      minTotalQuantity, rate, type, conditionNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealGroupDealDtoImplCopyWith<_$ComboDealGroupDealDtoImpl>
      get copyWith => __$$ComboDealGroupDealDtoImplCopyWithImpl<
          _$ComboDealGroupDealDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComboDealGroupDealDtoImplToJson(
      this,
    );
  }
}

abstract class _ComboDealGroupDealDto extends ComboDealGroupDealDto {
  const factory _ComboDealGroupDealDto(
      {@StringToDoubleConverter()
      @JsonKey(name: 'minTotalAmount', defaultValue: 0)
      required final double minTotalAmount,
      @StringToDoubleConverter()
      @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
      required final double maxTotalAmount,
      @StringToIntConverter()
      @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
      required final int minTotalQuantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'rate', defaultValue: 0)
      required final double rate,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      required final String conditionNumber}) = _$ComboDealGroupDealDtoImpl;
  const _ComboDealGroupDealDto._() : super._();

  factory _ComboDealGroupDealDto.fromJson(Map<String, dynamic> json) =
      _$ComboDealGroupDealDtoImpl.fromJson;

  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'minTotalAmount', defaultValue: 0)
  double get minTotalAmount;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
  double get maxTotalAmount;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
  int get minTotalQuantity;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealGroupDealDtoImplCopyWith<_$ComboDealGroupDealDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
