// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClaimItemDto _$ClaimItemDtoFromJson(Map<String, dynamic> json) {
  return _ClaimItemDto.fromJson(json);
}

/// @nodoc
mixin _$ClaimItemDto {
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimId', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimAmount', defaultValue: '')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: 0)
  int get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'claimType', defaultValue: '')
  String get claimType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClaimItemDtoCopyWith<ClaimItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimItemDtoCopyWith<$Res> {
  factory $ClaimItemDtoCopyWith(
          ClaimItemDto value, $Res Function(ClaimItemDto) then) =
      _$ClaimItemDtoCopyWithImpl<$Res, ClaimItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'claimId', defaultValue: 0) int id,
      @JsonKey(name: 'claimAmount', defaultValue: '') String amount,
      @JsonKey(name: 'principalCode', defaultValue: 0) int principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'claimType', defaultValue: '') String claimType});
}

/// @nodoc
class _$ClaimItemDtoCopyWithImpl<$Res, $Val extends ClaimItemDto>
    implements $ClaimItemDtoCopyWith<$Res> {
  _$ClaimItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? amount = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? claimType = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as int,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      claimType: null == claimType
          ? _value.claimType
          : claimType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimItemDtoImplCopyWith<$Res>
    implements $ClaimItemDtoCopyWith<$Res> {
  factory _$$ClaimItemDtoImplCopyWith(
          _$ClaimItemDtoImpl value, $Res Function(_$ClaimItemDtoImpl) then) =
      __$$ClaimItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'createdAt', defaultValue: '') String createdAt,
      @JsonKey(name: 'claimId', defaultValue: 0) int id,
      @JsonKey(name: 'claimAmount', defaultValue: '') String amount,
      @JsonKey(name: 'principalCode', defaultValue: 0) int principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'claimType', defaultValue: '') String claimType});
}

/// @nodoc
class __$$ClaimItemDtoImplCopyWithImpl<$Res>
    extends _$ClaimItemDtoCopyWithImpl<$Res, _$ClaimItemDtoImpl>
    implements _$$ClaimItemDtoImplCopyWith<$Res> {
  __$$ClaimItemDtoImplCopyWithImpl(
      _$ClaimItemDtoImpl _value, $Res Function(_$ClaimItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? amount = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? claimType = null,
  }) {
    return _then(_$ClaimItemDtoImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as int,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      claimType: null == claimType
          ? _value.claimType
          : claimType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimItemDtoImpl extends _ClaimItemDto {
  const _$ClaimItemDtoImpl(
      {@JsonKey(name: 'createdAt', defaultValue: '') required this.createdAt,
      @JsonKey(name: 'claimId', defaultValue: 0) required this.id,
      @JsonKey(name: 'claimAmount', defaultValue: '') required this.amount,
      @JsonKey(name: 'principalCode', defaultValue: 0)
      required this.principalCode,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'claimType', defaultValue: '') required this.claimType})
      : super._();

  factory _$ClaimItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  final String createdAt;
  @override
  @JsonKey(name: 'claimId', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'claimAmount', defaultValue: '')
  final String amount;
  @override
  @JsonKey(name: 'principalCode', defaultValue: 0)
  final int principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'claimType', defaultValue: '')
  final String claimType;

  @override
  String toString() {
    return 'ClaimItemDto(createdAt: $createdAt, id: $id, amount: $amount, principalCode: $principalCode, principalName: $principalName, claimType: $claimType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimItemDtoImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.claimType, claimType) ||
                other.claimType == claimType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, amount,
      principalCode, principalName, claimType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimItemDtoImplCopyWith<_$ClaimItemDtoImpl> get copyWith =>
      __$$ClaimItemDtoImplCopyWithImpl<_$ClaimItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ClaimItemDto extends ClaimItemDto {
  const factory _ClaimItemDto(
      {@JsonKey(name: 'createdAt', defaultValue: '')
      required final String createdAt,
      @JsonKey(name: 'claimId', defaultValue: 0) required final int id,
      @JsonKey(name: 'claimAmount', defaultValue: '')
      required final String amount,
      @JsonKey(name: 'principalCode', defaultValue: 0)
      required final int principalCode,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'claimType', defaultValue: '')
      required final String claimType}) = _$ClaimItemDtoImpl;
  const _ClaimItemDto._() : super._();

  factory _ClaimItemDto.fromJson(Map<String, dynamic> json) =
      _$ClaimItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  String get createdAt;
  @override
  @JsonKey(name: 'claimId', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'claimAmount', defaultValue: '')
  String get amount;
  @override
  @JsonKey(name: 'principalCode', defaultValue: 0)
  int get principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'claimType', defaultValue: '')
  String get claimType;
  @override
  @JsonKey(ignore: true)
  _$$ClaimItemDtoImplCopyWith<_$ClaimItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
