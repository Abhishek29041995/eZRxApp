// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByItemGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  PrincipalName get manufactureName => throw _privateConstructorUsedError;
  List<OrderHistoryItem> get orderHistoryItem =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemGroupCopyWith<ViewByItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemGroupCopyWith<$Res> {
  factory $ViewByItemGroupCopyWith(
          ViewByItemGroup value, $Res Function(ViewByItemGroup) then) =
      _$ViewByItemGroupCopyWithImpl<$Res, ViewByItemGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      PrincipalName manufactureName,
      List<OrderHistoryItem> orderHistoryItem});
}

/// @nodoc
class _$ViewByItemGroupCopyWithImpl<$Res, $Val extends ViewByItemGroup>
    implements $ViewByItemGroupCopyWith<$Res> {
  _$ViewByItemGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? manufactureName = null,
    Object? orderHistoryItem = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      orderHistoryItem: null == orderHistoryItem
          ? _value.orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewByItemGroupImplCopyWith<$Res>
    implements $ViewByItemGroupCopyWith<$Res> {
  factory _$$ViewByItemGroupImplCopyWith(_$ViewByItemGroupImpl value,
          $Res Function(_$ViewByItemGroupImpl) then) =
      __$$ViewByItemGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      PrincipalName manufactureName,
      List<OrderHistoryItem> orderHistoryItem});
}

/// @nodoc
class __$$ViewByItemGroupImplCopyWithImpl<$Res>
    extends _$ViewByItemGroupCopyWithImpl<$Res, _$ViewByItemGroupImpl>
    implements _$$ViewByItemGroupImplCopyWith<$Res> {
  __$$ViewByItemGroupImplCopyWithImpl(
      _$ViewByItemGroupImpl _value, $Res Function(_$ViewByItemGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? manufactureName = null,
    Object? orderHistoryItem = null,
  }) {
    return _then(_$ViewByItemGroupImpl(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      manufactureName: null == manufactureName
          ? _value.manufactureName
          : manufactureName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      orderHistoryItem: null == orderHistoryItem
          ? _value._orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItem>,
    ));
  }
}

/// @nodoc

class _$ViewByItemGroupImpl implements _ViewByItemGroup {
  _$ViewByItemGroupImpl(
      {required this.createdDate,
      required this.manufactureName,
      required final List<OrderHistoryItem> orderHistoryItem})
      : _orderHistoryItem = orderHistoryItem;

  @override
  final DateTimeStringValue createdDate;
  @override
  final PrincipalName manufactureName;
  final List<OrderHistoryItem> _orderHistoryItem;
  @override
  List<OrderHistoryItem> get orderHistoryItem {
    if (_orderHistoryItem is EqualUnmodifiableListView)
      return _orderHistoryItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryItem);
  }

  @override
  String toString() {
    return 'ViewByItemGroup(createdDate: $createdDate, manufactureName: $manufactureName, orderHistoryItem: $orderHistoryItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByItemGroupImpl &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.manufactureName, manufactureName) ||
                other.manufactureName == manufactureName) &&
            const DeepCollectionEquality()
                .equals(other._orderHistoryItem, _orderHistoryItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdDate, manufactureName,
      const DeepCollectionEquality().hash(_orderHistoryItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByItemGroupImplCopyWith<_$ViewByItemGroupImpl> get copyWith =>
      __$$ViewByItemGroupImplCopyWithImpl<_$ViewByItemGroupImpl>(
          this, _$identity);
}

abstract class _ViewByItemGroup implements ViewByItemGroup {
  factory _ViewByItemGroup(
          {required final DateTimeStringValue createdDate,
          required final PrincipalName manufactureName,
          required final List<OrderHistoryItem> orderHistoryItem}) =
      _$ViewByItemGroupImpl;

  @override
  DateTimeStringValue get createdDate;
  @override
  PrincipalName get manufactureName;
  @override
  List<OrderHistoryItem> get orderHistoryItem;
  @override
  @JsonKey(ignore: true)
  _$$ViewByItemGroupImplCopyWith<_$ViewByItemGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
