// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_tier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceTierDto _$PriceTierDtoFromJson(Map<String, dynamic> json) {
  return _PriceTierDto.fromJson(json);
}

/// @nodoc
mixin _$PriceTierDto {
  @JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceTierDtoCopyWith<PriceTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierDtoCopyWith<$Res> {
  factory $PriceTierDtoCopyWith(
          PriceTierDto value, $Res Function(PriceTierDto) then) =
      _$PriceTierDtoCopyWithImpl<$Res, PriceTierDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
      List<PriceTierItemDto> items});
}

/// @nodoc
class _$PriceTierDtoCopyWithImpl<$Res, $Val extends PriceTierDto>
    implements $PriceTierDtoCopyWith<$Res> {
  _$PriceTierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceTierDtoImplCopyWith<$Res>
    implements $PriceTierDtoCopyWith<$Res> {
  factory _$$PriceTierDtoImplCopyWith(
          _$PriceTierDtoImpl value, $Res Function(_$PriceTierDtoImpl) then) =
      __$$PriceTierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
      List<PriceTierItemDto> items});
}

/// @nodoc
class __$$PriceTierDtoImplCopyWithImpl<$Res>
    extends _$PriceTierDtoCopyWithImpl<$Res, _$PriceTierDtoImpl>
    implements _$$PriceTierDtoImplCopyWith<$Res> {
  __$$PriceTierDtoImplCopyWithImpl(
      _$PriceTierDtoImpl _value, $Res Function(_$PriceTierDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PriceTierDtoImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceTierDtoImpl extends _PriceTierDto {
  const _$PriceTierDtoImpl(
      {@JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
      required final List<PriceTierItemDto> items})
      : _items = items,
        super._();

  factory _$PriceTierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceTierDtoImplFromJson(json);

  final List<PriceTierItemDto> _items;
  @override
  @JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceTierDto(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTierDtoImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTierDtoImplCopyWith<_$PriceTierDtoImpl> get copyWith =>
      __$$PriceTierDtoImplCopyWithImpl<_$PriceTierDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceTierDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceTierDto extends PriceTierDto {
  const factory _PriceTierDto(
      {@JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
      required final List<PriceTierItemDto> items}) = _$PriceTierDtoImpl;
  const _PriceTierDto._() : super._();

  factory _PriceTierDto.fromJson(Map<String, dynamic> json) =
      _$PriceTierDtoImpl.fromJson;

  @override
  @JsonKey(name: 'priceTier', defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$PriceTierDtoImplCopyWith<_$PriceTierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceTierItemDto _$PriceTierItemDtoFromJson(Map<String, dynamic> json) {
  return _PriceTierItemDto.fromJson(json);
}

/// @nodoc
mixin _$PriceTierItemDto {
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'applyBonus', defaultValue: false)
  bool get applyBonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequence', defaultValue: 0)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage', defaultValue: 0)
  double get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'minAmount', defaultValue: 0)
  double get minAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'scaleBasis', defaultValue: '')
  String get scaleBasis => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotionAmount', defaultValue: 0)
  double get promotionAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceTierItemDtoCopyWith<PriceTierItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierItemDtoCopyWith<$Res> {
  factory $PriceTierItemDtoCopyWith(
          PriceTierItemDto value, $Res Function(PriceTierItemDto) then) =
      _$PriceTierItemDtoCopyWithImpl<$Res, PriceTierItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'applyBonus', defaultValue: false) bool applyBonus,
      @JsonKey(name: 'sequence', defaultValue: 0) int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'percentage', defaultValue: 0) double percentage,
      @JsonKey(name: 'minAmount', defaultValue: 0) double minAmount,
      @JsonKey(name: 'scaleBasis', defaultValue: '') String scaleBasis,
      @JsonKey(name: 'promotionAmount', defaultValue: 0)
      double promotionAmount});
}

/// @nodoc
class _$PriceTierItemDtoCopyWithImpl<$Res, $Val extends PriceTierItemDto>
    implements $PriceTierItemDtoCopyWith<$Res> {
  _$PriceTierItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
    Object? percentage = null,
    Object? minAmount = null,
    Object? scaleBasis = null,
    Object? promotionAmount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
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
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scaleBasis: null == scaleBasis
          ? _value.scaleBasis
          : scaleBasis // ignore: cast_nullable_to_non_nullable
              as String,
      promotionAmount: null == promotionAmount
          ? _value.promotionAmount
          : promotionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceTierItemDtoImplCopyWith<$Res>
    implements $PriceTierItemDtoCopyWith<$Res> {
  factory _$$PriceTierItemDtoImplCopyWith(_$PriceTierItemDtoImpl value,
          $Res Function(_$PriceTierItemDtoImpl) then) =
      __$$PriceTierItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'applyBonus', defaultValue: false) bool applyBonus,
      @JsonKey(name: 'sequence', defaultValue: 0) int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) int quantity,
      @JsonKey(name: 'rate', defaultValue: 0) double rate,
      @JsonKey(name: 'percentage', defaultValue: 0) double percentage,
      @JsonKey(name: 'minAmount', defaultValue: 0) double minAmount,
      @JsonKey(name: 'scaleBasis', defaultValue: '') String scaleBasis,
      @JsonKey(name: 'promotionAmount', defaultValue: 0)
      double promotionAmount});
}

/// @nodoc
class __$$PriceTierItemDtoImplCopyWithImpl<$Res>
    extends _$PriceTierItemDtoCopyWithImpl<$Res, _$PriceTierItemDtoImpl>
    implements _$$PriceTierItemDtoImplCopyWith<$Res> {
  __$$PriceTierItemDtoImplCopyWithImpl(_$PriceTierItemDtoImpl _value,
      $Res Function(_$PriceTierItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
    Object? percentage = null,
    Object? minAmount = null,
    Object? scaleBasis = null,
    Object? promotionAmount = null,
  }) {
    return _then(_$PriceTierItemDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
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
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scaleBasis: null == scaleBasis
          ? _value.scaleBasis
          : scaleBasis // ignore: cast_nullable_to_non_nullable
              as String,
      promotionAmount: null == promotionAmount
          ? _value.promotionAmount
          : promotionAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceTierItemDtoImpl extends _PriceTierItemDto {
  const _$PriceTierItemDtoImpl(
      {@JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'applyBonus', defaultValue: false)
      required this.applyBonus,
      @JsonKey(name: 'sequence', defaultValue: 0) required this.sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity,
      @JsonKey(name: 'rate', defaultValue: 0) required this.rate,
      @JsonKey(name: 'percentage', defaultValue: 0) required this.percentage,
      @JsonKey(name: 'minAmount', defaultValue: 0) required this.minAmount,
      @JsonKey(name: 'scaleBasis', defaultValue: '') required this.scaleBasis,
      @JsonKey(name: 'promotionAmount', defaultValue: 0)
      required this.promotionAmount})
      : super._();

  factory _$PriceTierItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceTierItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'applyBonus', defaultValue: false)
  final bool applyBonus;
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
  @JsonKey(name: 'percentage', defaultValue: 0)
  final double percentage;
  @override
  @JsonKey(name: 'minAmount', defaultValue: 0)
  final double minAmount;
  @override
  @JsonKey(name: 'scaleBasis', defaultValue: '')
  final String scaleBasis;
  @override
  @JsonKey(name: 'promotionAmount', defaultValue: 0)
  final double promotionAmount;

  @override
  String toString() {
    return 'PriceTierItemDto(type: $type, applyBonus: $applyBonus, sequence: $sequence, quantity: $quantity, rate: $rate, percentage: $percentage, minAmount: $minAmount, scaleBasis: $scaleBasis, promotionAmount: $promotionAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTierItemDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.applyBonus, applyBonus) ||
                other.applyBonus == applyBonus) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.scaleBasis, scaleBasis) ||
                other.scaleBasis == scaleBasis) &&
            (identical(other.promotionAmount, promotionAmount) ||
                other.promotionAmount == promotionAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, applyBonus, sequence,
      quantity, rate, percentage, minAmount, scaleBasis, promotionAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTierItemDtoImplCopyWith<_$PriceTierItemDtoImpl> get copyWith =>
      __$$PriceTierItemDtoImplCopyWithImpl<_$PriceTierItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceTierItemDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceTierItemDto extends PriceTierItemDto {
  const factory _PriceTierItemDto(
      {@JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'applyBonus', defaultValue: false)
      required final bool applyBonus,
      @JsonKey(name: 'sequence', defaultValue: 0) required final int sequence,
      @JsonKey(name: 'quantity', defaultValue: 0) required final int quantity,
      @JsonKey(name: 'rate', defaultValue: 0) required final double rate,
      @JsonKey(name: 'percentage', defaultValue: 0)
      required final double percentage,
      @JsonKey(name: 'minAmount', defaultValue: 0)
      required final double minAmount,
      @JsonKey(name: 'scaleBasis', defaultValue: '')
      required final String scaleBasis,
      @JsonKey(name: 'promotionAmount', defaultValue: 0)
      required final double promotionAmount}) = _$PriceTierItemDtoImpl;
  const _PriceTierItemDto._() : super._();

  factory _PriceTierItemDto.fromJson(Map<String, dynamic> json) =
      _$PriceTierItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'applyBonus', defaultValue: false)
  bool get applyBonus;
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
  @JsonKey(name: 'percentage', defaultValue: 0)
  double get percentage;
  @override
  @JsonKey(name: 'minAmount', defaultValue: 0)
  double get minAmount;
  @override
  @JsonKey(name: 'scaleBasis', defaultValue: '')
  String get scaleBasis;
  @override
  @JsonKey(name: 'promotionAmount', defaultValue: 0)
  double get promotionAmount;
  @override
  @JsonKey(ignore: true)
  _$$PriceTierItemDtoImplCopyWith<_$PriceTierItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
