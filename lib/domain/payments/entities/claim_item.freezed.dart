// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClaimItem {
  DateTimeStringValue get createdAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get principalCode => throw _privateConstructorUsedError;
  String get principalName => throw _privateConstructorUsedError;
  ClaimType get claimType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClaimItemCopyWith<ClaimItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimItemCopyWith<$Res> {
  factory $ClaimItemCopyWith(ClaimItem value, $Res Function(ClaimItem) then) =
      _$ClaimItemCopyWithImpl<$Res, ClaimItem>;
  @useResult
  $Res call(
      {DateTimeStringValue createdAt,
      int id,
      double amount,
      int principalCode,
      String principalName,
      ClaimType claimType});
}

/// @nodoc
class _$ClaimItemCopyWithImpl<$Res, $Val extends ClaimItem>
    implements $ClaimItemCopyWith<$Res> {
  _$ClaimItemCopyWithImpl(this._value, this._then);

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
              as DateTimeStringValue,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
              as ClaimType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimItemImplCopyWith<$Res>
    implements $ClaimItemCopyWith<$Res> {
  factory _$$ClaimItemImplCopyWith(
          _$ClaimItemImpl value, $Res Function(_$ClaimItemImpl) then) =
      __$$ClaimItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdAt,
      int id,
      double amount,
      int principalCode,
      String principalName,
      ClaimType claimType});
}

/// @nodoc
class __$$ClaimItemImplCopyWithImpl<$Res>
    extends _$ClaimItemCopyWithImpl<$Res, _$ClaimItemImpl>
    implements _$$ClaimItemImplCopyWith<$Res> {
  __$$ClaimItemImplCopyWithImpl(
      _$ClaimItemImpl _value, $Res Function(_$ClaimItemImpl) _then)
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
    return _then(_$ClaimItemImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
              as ClaimType,
    ));
  }
}

/// @nodoc

class _$ClaimItemImpl extends _ClaimItem {
  const _$ClaimItemImpl(
      {required this.createdAt,
      required this.id,
      required this.amount,
      required this.principalCode,
      required this.principalName,
      required this.claimType})
      : super._();

  @override
  final DateTimeStringValue createdAt;
  @override
  final int id;
  @override
  final double amount;
  @override
  final int principalCode;
  @override
  final String principalName;
  @override
  final ClaimType claimType;

  @override
  String toString() {
    return 'ClaimItem(createdAt: $createdAt, id: $id, amount: $amount, principalCode: $principalCode, principalName: $principalName, claimType: $claimType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimItemImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, amount,
      principalCode, principalName, claimType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimItemImplCopyWith<_$ClaimItemImpl> get copyWith =>
      __$$ClaimItemImplCopyWithImpl<_$ClaimItemImpl>(this, _$identity);
}

abstract class _ClaimItem extends ClaimItem {
  const factory _ClaimItem(
      {required final DateTimeStringValue createdAt,
      required final int id,
      required final double amount,
      required final int principalCode,
      required final String principalName,
      required final ClaimType claimType}) = _$ClaimItemImpl;
  const _ClaimItem._() : super._();

  @override
  DateTimeStringValue get createdAt;
  @override
  int get id;
  @override
  double get amount;
  @override
  int get principalCode;
  @override
  String get principalName;
  @override
  ClaimType get claimType;
  @override
  @JsonKey(ignore: true)
  _$$ClaimItemImplCopyWith<_$ClaimItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
