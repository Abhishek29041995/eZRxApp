// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByOrder {
  int get orderCount => throw _privateConstructorUsedError;
  List<String> get creatingOrderIds => throw _privateConstructorUsedError;
  List<OrderHistoryDetails> get orderHeaders =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderCopyWith<ViewByOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderCopyWith<$Res> {
  factory $ViewByOrderCopyWith(
          ViewByOrder value, $Res Function(ViewByOrder) then) =
      _$ViewByOrderCopyWithImpl<$Res, ViewByOrder>;
  @useResult
  $Res call(
      {int orderCount,
      List<String> creatingOrderIds,
      List<OrderHistoryDetails> orderHeaders});
}

/// @nodoc
class _$ViewByOrderCopyWithImpl<$Res, $Val extends ViewByOrder>
    implements $ViewByOrderCopyWith<$Res> {
  _$ViewByOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_value.copyWith(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value.creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value.orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewByOrderImplCopyWith<$Res>
    implements $ViewByOrderCopyWith<$Res> {
  factory _$$ViewByOrderImplCopyWith(
          _$ViewByOrderImpl value, $Res Function(_$ViewByOrderImpl) then) =
      __$$ViewByOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderCount,
      List<String> creatingOrderIds,
      List<OrderHistoryDetails> orderHeaders});
}

/// @nodoc
class __$$ViewByOrderImplCopyWithImpl<$Res>
    extends _$ViewByOrderCopyWithImpl<$Res, _$ViewByOrderImpl>
    implements _$$ViewByOrderImplCopyWith<$Res> {
  __$$ViewByOrderImplCopyWithImpl(
      _$ViewByOrderImpl _value, $Res Function(_$ViewByOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_$ViewByOrderImpl(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value._creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value._orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
    ));
  }
}

/// @nodoc

class _$ViewByOrderImpl extends _ViewByOrder {
  _$ViewByOrderImpl(
      {required this.orderCount,
      required final List<String> creatingOrderIds,
      required final List<OrderHistoryDetails> orderHeaders})
      : _creatingOrderIds = creatingOrderIds,
        _orderHeaders = orderHeaders,
        super._();

  @override
  final int orderCount;
  final List<String> _creatingOrderIds;
  @override
  List<String> get creatingOrderIds {
    if (_creatingOrderIds is EqualUnmodifiableListView)
      return _creatingOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creatingOrderIds);
  }

  final List<OrderHistoryDetails> _orderHeaders;
  @override
  List<OrderHistoryDetails> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  String toString() {
    return 'ViewByOrder(orderCount: $orderCount, creatingOrderIds: $creatingOrderIds, orderHeaders: $orderHeaders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByOrderImpl &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            const DeepCollectionEquality()
                .equals(other._creatingOrderIds, _creatingOrderIds) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderCount,
      const DeepCollectionEquality().hash(_creatingOrderIds),
      const DeepCollectionEquality().hash(_orderHeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByOrderImplCopyWith<_$ViewByOrderImpl> get copyWith =>
      __$$ViewByOrderImplCopyWithImpl<_$ViewByOrderImpl>(this, _$identity);
}

abstract class _ViewByOrder extends ViewByOrder {
  factory _ViewByOrder(
          {required final int orderCount,
          required final List<String> creatingOrderIds,
          required final List<OrderHistoryDetails> orderHeaders}) =
      _$ViewByOrderImpl;
  _ViewByOrder._() : super._();

  @override
  int get orderCount;
  @override
  List<String> get creatingOrderIds;
  @override
  List<OrderHistoryDetails> get orderHeaders;
  @override
  @JsonKey(ignore: true)
  _$$ViewByOrderImplCopyWith<_$ViewByOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
