// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BundleInfoDto _$BundleInfoDtoFromJson(Map<String, dynamic> json) {
  return _BundleInfoDto.fromJson(json);
}

/// @nodoc
mixin _$BundleInfoDto {
  @JsonKey(name: 'sequence')
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate')
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleInfoDtoCopyWith<BundleInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleInfoDtoCopyWith<$Res> {
  factory $BundleInfoDtoCopyWith(
          BundleInfoDto value, $Res Function(BundleInfoDto) then) =
      _$BundleInfoDtoCopyWithImpl<$Res, BundleInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sequence') int sequence,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'rate') double rate});
}

/// @nodoc
class _$BundleInfoDtoCopyWithImpl<$Res, $Val extends BundleInfoDto>
    implements $BundleInfoDtoCopyWith<$Res> {
  _$BundleInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
    Object? quantity = null,
    Object? type = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BundleInfoDtoImplCopyWith<$Res>
    implements $BundleInfoDtoCopyWith<$Res> {
  factory _$$BundleInfoDtoImplCopyWith(
          _$BundleInfoDtoImpl value, $Res Function(_$BundleInfoDtoImpl) then) =
      __$$BundleInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sequence') int sequence,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'rate') double rate});
}

/// @nodoc
class __$$BundleInfoDtoImplCopyWithImpl<$Res>
    extends _$BundleInfoDtoCopyWithImpl<$Res, _$BundleInfoDtoImpl>
    implements _$$BundleInfoDtoImplCopyWith<$Res> {
  __$$BundleInfoDtoImplCopyWithImpl(
      _$BundleInfoDtoImpl _value, $Res Function(_$BundleInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
    Object? quantity = null,
    Object? type = null,
    Object? rate = null,
  }) {
    return _then(_$BundleInfoDtoImpl(
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BundleInfoDtoImpl extends _BundleInfoDto {
  const _$BundleInfoDtoImpl(
      {@JsonKey(name: 'sequence') required this.sequence,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'rate') required this.rate})
      : super._();

  factory _$BundleInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BundleInfoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'sequence')
  final int sequence;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'rate')
  final double rate;

  @override
  String toString() {
    return 'BundleInfoDto(sequence: $sequence, quantity: $quantity, type: $type, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleInfoDtoImpl &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sequence, quantity, type, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleInfoDtoImplCopyWith<_$BundleInfoDtoImpl> get copyWith =>
      __$$BundleInfoDtoImplCopyWithImpl<_$BundleInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BundleInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _BundleInfoDto extends BundleInfoDto {
  const factory _BundleInfoDto(
      {@JsonKey(name: 'sequence') required final int sequence,
      @JsonKey(name: 'quantity') required final int quantity,
      @JsonKey(name: 'type') required final String type,
      @JsonKey(name: 'rate') required final double rate}) = _$BundleInfoDtoImpl;
  const _BundleInfoDto._() : super._();

  factory _BundleInfoDto.fromJson(Map<String, dynamic> json) =
      _$BundleInfoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'sequence')
  int get sequence;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'rate')
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$BundleInfoDtoImplCopyWith<_$BundleInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
