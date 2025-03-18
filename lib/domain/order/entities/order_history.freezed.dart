// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistory {
  OrderHistoryBasicInfo get orderBasicInformation =>
      throw _privateConstructorUsedError;
  List<OrderHistoryItem> get orderHistoryItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call(
      {OrderHistoryBasicInfo orderBasicInformation,
      List<OrderHistoryItem> orderHistoryItems});

  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderBasicInformation = null,
    Object? orderHistoryItems = null,
  }) {
    return _then(_value.copyWith(
      orderBasicInformation: null == orderBasicInformation
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfo,
      orderHistoryItems: null == orderHistoryItems
          ? _value.orderHistoryItems
          : orderHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation {
    return $OrderHistoryBasicInfoCopyWith<$Res>(_value.orderBasicInformation,
        (value) {
      return _then(_value.copyWith(orderBasicInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryImplCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$OrderHistoryImplCopyWith(
          _$OrderHistoryImpl value, $Res Function(_$OrderHistoryImpl) then) =
      __$$OrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderHistoryBasicInfo orderBasicInformation,
      List<OrderHistoryItem> orderHistoryItems});

  @override
  $OrderHistoryBasicInfoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class __$$OrderHistoryImplCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$OrderHistoryImpl>
    implements _$$OrderHistoryImplCopyWith<$Res> {
  __$$OrderHistoryImplCopyWithImpl(
      _$OrderHistoryImpl _value, $Res Function(_$OrderHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderBasicInformation = null,
    Object? orderHistoryItems = null,
  }) {
    return _then(_$OrderHistoryImpl(
      orderBasicInformation: null == orderBasicInformation
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfo,
      orderHistoryItems: null == orderHistoryItems
          ? _value._orderHistoryItems
          : orderHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }
}

/// @nodoc

class _$OrderHistoryImpl extends _OrderHistory {
  _$OrderHistoryImpl(
      {required this.orderBasicInformation,
      required final List<OrderHistoryItem> orderHistoryItems})
      : _orderHistoryItems = orderHistoryItems,
        super._();

  @override
  final OrderHistoryBasicInfo orderBasicInformation;
  final List<OrderHistoryItem> _orderHistoryItems;
  @override
  List<OrderHistoryItem> get orderHistoryItems {
    if (_orderHistoryItems is EqualUnmodifiableListView)
      return _orderHistoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItems);
  }

  @override
  String toString() {
    return 'OrderHistory(orderBasicInformation: $orderBasicInformation, orderHistoryItems: $orderHistoryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryImpl &&
            (identical(other.orderBasicInformation, orderBasicInformation) ||
                other.orderBasicInformation == orderBasicInformation) &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryItems, _orderHistoryItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderBasicInformation,
      const DeepCollectionEquality().hash(_orderHistoryItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      __$$OrderHistoryImplCopyWithImpl<_$OrderHistoryImpl>(this, _$identity);
}

abstract class _OrderHistory extends OrderHistory {
  factory _OrderHistory(
          {required final OrderHistoryBasicInfo orderBasicInformation,
          required final List<OrderHistoryItem> orderHistoryItems}) =
      _$OrderHistoryImpl;
  _OrderHistory._() : super._();

  @override
  OrderHistoryBasicInfo get orderBasicInformation;
  @override
  List<OrderHistoryItem> get orderHistoryItems;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
