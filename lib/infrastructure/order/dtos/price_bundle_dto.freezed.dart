// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bundle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceBundleDto _$PriceBundleDtoFromJson(Map<String, dynamic> json) {
  return _PriceBundleDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBundleDto {
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditions', defaultValue: '')
  String get conditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBundleDtoCopyWith<PriceBundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleDtoCopyWith<$Res> {
  factory $PriceBundleDtoCopyWith(
          PriceBundleDto value, $Res Function(PriceBundleDto) then) =
      _$PriceBundleDtoCopyWithImpl<$Res, PriceBundleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String name,
      @JsonKey(name: 'bundleCode', defaultValue: '') String code,
      @JsonKey(name: 'conditions', defaultValue: '') String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible,
      @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
      List<PriceBundleItemDto> information});
}

/// @nodoc
class _$PriceBundleDtoCopyWithImpl<$Res, $Val extends PriceBundleDto>
    implements $PriceBundleDtoCopyWith<$Res> {
  _$PriceBundleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? conditions = null,
    Object? bonusEligible = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBundleDtoImplCopyWith<$Res>
    implements $PriceBundleDtoCopyWith<$Res> {
  factory _$$PriceBundleDtoImplCopyWith(_$PriceBundleDtoImpl value,
          $Res Function(_$PriceBundleDtoImpl) then) =
      __$$PriceBundleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String name,
      @JsonKey(name: 'bundleCode', defaultValue: '') String code,
      @JsonKey(name: 'conditions', defaultValue: '') String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible,
      @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
      List<PriceBundleItemDto> information});
}

/// @nodoc
class __$$PriceBundleDtoImplCopyWithImpl<$Res>
    extends _$PriceBundleDtoCopyWithImpl<$Res, _$PriceBundleDtoImpl>
    implements _$$PriceBundleDtoImplCopyWith<$Res> {
  __$$PriceBundleDtoImplCopyWithImpl(
      _$PriceBundleDtoImpl _value, $Res Function(_$PriceBundleDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? conditions = null,
    Object? bonusEligible = null,
    Object? information = null,
  }) {
    return _then(_$PriceBundleDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      information: null == information
          ? _value._information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceBundleDtoImpl extends _PriceBundleDto {
  const _$PriceBundleDtoImpl(
      {@JsonKey(name: 'bundleName', defaultValue: '') required this.name,
      @JsonKey(name: 'bundleCode', defaultValue: '') required this.code,
      @JsonKey(name: 'conditions', defaultValue: '') required this.conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required this.bonusEligible,
      @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
      required final List<PriceBundleItemDto> information})
      : _information = information,
        super._();

  factory _$PriceBundleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceBundleDtoImplFromJson(json);

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  final String code;
  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  final String conditions;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  final bool bonusEligible;
  final List<PriceBundleItemDto> _information;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information {
    if (_information is EqualUnmodifiableListView) return _information;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_information);
  }

  @override
  String toString() {
    return 'PriceBundleDto(name: $name, code: $code, conditions: $conditions, bonusEligible: $bonusEligible, information: $information)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBundleDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, conditions,
      bonusEligible, const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBundleDtoImplCopyWith<_$PriceBundleDtoImpl> get copyWith =>
      __$$PriceBundleDtoImplCopyWithImpl<_$PriceBundleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceBundleDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceBundleDto extends PriceBundleDto {
  const factory _PriceBundleDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
      required final String name,
      @JsonKey(name: 'bundleCode', defaultValue: '') required final String code,
      @JsonKey(name: 'conditions', defaultValue: '')
      required final String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required final bool bonusEligible,
      @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
      required final List<PriceBundleItemDto>
          information}) = _$PriceBundleDtoImpl;
  const _PriceBundleDto._() : super._();

  factory _PriceBundleDto.fromJson(Map<String, dynamic> json) =
      _$PriceBundleDtoImpl.fromJson;

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  String get conditions;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <PriceBundleItemDto>[])
  List<PriceBundleItemDto> get information;
  @override
  @JsonKey(ignore: true)
  _$$PriceBundleDtoImplCopyWith<_$PriceBundleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceBundleItemDto _$PriceBundleItemDtoFromJson(Map<String, dynamic> json) {
  return _PriceBundleItemDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBundleItemDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequence', defaultValue: 0)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBundleItemDtoCopyWith<PriceBundleItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleItemDtoCopyWith<$Res> {
  factory $PriceBundleItemDtoCopyWith(
          PriceBundleItemDto value, $Res Function(PriceBundleItemDto) then) =
      _$PriceBundleItemDtoCopyWithImpl<$Res, PriceBundleItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'sequence', defaultValue: 0) int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'rate', defaultValue: 0) double rate});
}

/// @nodoc
class _$PriceBundleItemDtoCopyWithImpl<$Res, $Val extends PriceBundleItemDto>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  _$PriceBundleItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceBundleItemDtoImplCopyWith<$Res>
    implements $PriceBundleItemDtoCopyWith<$Res> {
  factory _$$PriceBundleItemDtoImplCopyWith(_$PriceBundleItemDtoImpl value,
          $Res Function(_$PriceBundleItemDtoImpl) then) =
      __$$PriceBundleItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'sequence', defaultValue: 0) int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'rate', defaultValue: 0) double rate});
}

/// @nodoc
class __$$PriceBundleItemDtoImplCopyWithImpl<$Res>
    extends _$PriceBundleItemDtoCopyWithImpl<$Res, _$PriceBundleItemDtoImpl>
    implements _$$PriceBundleItemDtoImplCopyWith<$Res> {
  __$$PriceBundleItemDtoImplCopyWithImpl(_$PriceBundleItemDtoImpl _value,
      $Res Function(_$PriceBundleItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$PriceBundleItemDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceBundleItemDtoImpl extends _PriceBundleItemDto {
  const _$PriceBundleItemDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'sequence', defaultValue: 0) required this.sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity,
      @JsonKey(name: 'rate', defaultValue: 0) required this.rate})
      : super._();

  factory _$PriceBundleItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceBundleItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'sequence', defaultValue: 0)
  final int sequence;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  final double rate;

  @override
  String toString() {
    return 'PriceBundleItemDto(type: $type, sequence: $sequence, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceBundleItemDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, sequence, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceBundleItemDtoImplCopyWith<_$PriceBundleItemDtoImpl> get copyWith =>
      __$$PriceBundleItemDtoImplCopyWithImpl<_$PriceBundleItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceBundleItemDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceBundleItemDto extends PriceBundleItemDto {
  const factory _PriceBundleItemDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'sequence', defaultValue: 0) required final int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) required final int quantity,
      @JsonKey(name: 'rate', defaultValue: 0)
      required final double rate}) = _$PriceBundleItemDtoImpl;
  const _PriceBundleItemDto._() : super._();

  factory _PriceBundleItemDto.fromJson(Map<String, dynamic> json) =
      _$PriceBundleItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'sequence', defaultValue: 0)
  int get sequence;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$PriceBundleItemDtoImplCopyWith<_$PriceBundleItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
