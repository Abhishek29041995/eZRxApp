// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderType {
  DocumentType get categoryId => throw _privateConstructorUsedError;
  StringValue get orderType => throw _privateConstructorUsedError;
  int get orderReason => throw _privateConstructorUsedError;
  StringValue get description => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTypeCopyWith<OrderType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeCopyWith<$Res> {
  factory $OrderTypeCopyWith(OrderType value, $Res Function(OrderType) then) =
      _$OrderTypeCopyWithImpl<$Res, OrderType>;
  @useResult
  $Res call(
      {DocumentType categoryId,
      StringValue orderType,
      int orderReason,
      StringValue description,
      bool enabled});
}

/// @nodoc
class _$OrderTypeCopyWithImpl<$Res, $Val extends OrderType>
    implements $OrderTypeCopyWith<$Res> {
  _$OrderTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? description = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as StringValue,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderTypeImplCopyWith<$Res>
    implements $OrderTypeCopyWith<$Res> {
  factory _$$OrderTypeImplCopyWith(
          _$OrderTypeImpl value, $Res Function(_$OrderTypeImpl) then) =
      __$$OrderTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentType categoryId,
      StringValue orderType,
      int orderReason,
      StringValue description,
      bool enabled});
}

/// @nodoc
class __$$OrderTypeImplCopyWithImpl<$Res>
    extends _$OrderTypeCopyWithImpl<$Res, _$OrderTypeImpl>
    implements _$$OrderTypeImplCopyWith<$Res> {
  __$$OrderTypeImplCopyWithImpl(
      _$OrderTypeImpl _value, $Res Function(_$OrderTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? description = null,
    Object? enabled = null,
  }) {
    return _then(_$OrderTypeImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as StringValue,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderTypeImpl extends _OrderType {
  const _$OrderTypeImpl(
      {required this.categoryId,
      required this.orderType,
      required this.orderReason,
      required this.description,
      required this.enabled})
      : super._();

  @override
  final DocumentType categoryId;
  @override
  final StringValue orderType;
  @override
  final int orderReason;
  @override
  final StringValue description;
  @override
  final bool enabled;

  @override
  String toString() {
    return 'OrderType(categoryId: $categoryId, orderType: $orderType, orderReason: $orderReason, description: $description, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTypeImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, orderType, orderReason, description, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTypeImplCopyWith<_$OrderTypeImpl> get copyWith =>
      __$$OrderTypeImplCopyWithImpl<_$OrderTypeImpl>(this, _$identity);
}

abstract class _OrderType extends OrderType {
  const factory _OrderType(
      {required final DocumentType categoryId,
      required final StringValue orderType,
      required final int orderReason,
      required final StringValue description,
      required final bool enabled}) = _$OrderTypeImpl;
  const _OrderType._() : super._();

  @override
  DocumentType get categoryId;
  @override
  StringValue get orderType;
  @override
  int get orderReason;
  @override
  StringValue get description;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$OrderTypeImplCopyWith<_$OrderTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
