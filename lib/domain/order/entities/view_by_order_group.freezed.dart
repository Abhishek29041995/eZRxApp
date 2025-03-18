// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByOrdersGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  PrincipalName get principalName => throw _privateConstructorUsedError;
  List<OrderHistoryDetails> get orderHeaders =>
      throw _privateConstructorUsedError;
  MaterialNumber get parentId => throw _privateConstructorUsedError;
  List<OrderHistoryDetailsOrderItem> get viewByOrderItem =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrdersGroupCopyWith<ViewByOrdersGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrdersGroupCopyWith<$Res> {
  factory $ViewByOrdersGroupCopyWith(
          ViewByOrdersGroup value, $Res Function(ViewByOrdersGroup) then) =
      _$ViewByOrdersGroupCopyWithImpl<$Res, ViewByOrdersGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      PrincipalName principalName,
      List<OrderHistoryDetails> orderHeaders,
      MaterialNumber parentId,
      List<OrderHistoryDetailsOrderItem> viewByOrderItem});
}

/// @nodoc
class _$ViewByOrdersGroupCopyWithImpl<$Res, $Val extends ViewByOrdersGroup>
    implements $ViewByOrdersGroupCopyWith<$Res> {
  _$ViewByOrdersGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? principalName = null,
    Object? orderHeaders = null,
    Object? parentId = null,
    Object? viewByOrderItem = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      orderHeaders: null == orderHeaders
          ? _value.orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      viewByOrderItem: null == viewByOrderItem
          ? _value.viewByOrderItem
          : viewByOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewByOrdersGroupImplCopyWith<$Res>
    implements $ViewByOrdersGroupCopyWith<$Res> {
  factory _$$ViewByOrdersGroupImplCopyWith(_$ViewByOrdersGroupImpl value,
          $Res Function(_$ViewByOrdersGroupImpl) then) =
      __$$ViewByOrdersGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      PrincipalName principalName,
      List<OrderHistoryDetails> orderHeaders,
      MaterialNumber parentId,
      List<OrderHistoryDetailsOrderItem> viewByOrderItem});
}

/// @nodoc
class __$$ViewByOrdersGroupImplCopyWithImpl<$Res>
    extends _$ViewByOrdersGroupCopyWithImpl<$Res, _$ViewByOrdersGroupImpl>
    implements _$$ViewByOrdersGroupImplCopyWith<$Res> {
  __$$ViewByOrdersGroupImplCopyWithImpl(_$ViewByOrdersGroupImpl _value,
      $Res Function(_$ViewByOrdersGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? principalName = null,
    Object? orderHeaders = null,
    Object? parentId = null,
    Object? viewByOrderItem = null,
  }) {
    return _then(_$ViewByOrdersGroupImpl(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      orderHeaders: null == orderHeaders
          ? _value._orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetails>,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      viewByOrderItem: null == viewByOrderItem
          ? _value._viewByOrderItem
          : viewByOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItem>,
    ));
  }
}

/// @nodoc

class _$ViewByOrdersGroupImpl extends _ViewByOrdersGroup {
  _$ViewByOrdersGroupImpl(
      {required this.createdDate,
      required this.principalName,
      required final List<OrderHistoryDetails> orderHeaders,
      required this.parentId,
      required final List<OrderHistoryDetailsOrderItem> viewByOrderItem})
      : _orderHeaders = orderHeaders,
        _viewByOrderItem = viewByOrderItem,
        super._();

  @override
  final DateTimeStringValue createdDate;
  @override
  final PrincipalName principalName;
  final List<OrderHistoryDetails> _orderHeaders;
  @override
  List<OrderHistoryDetails> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  final MaterialNumber parentId;
  final List<OrderHistoryDetailsOrderItem> _viewByOrderItem;
  @override
  List<OrderHistoryDetailsOrderItem> get viewByOrderItem {
    if (_viewByOrderItem is EqualUnmodifiableListView) return _viewByOrderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewByOrderItem);
  }

  @override
  String toString() {
    return 'ViewByOrdersGroup(createdDate: $createdDate, principalName: $principalName, orderHeaders: $orderHeaders, parentId: $parentId, viewByOrderItem: $viewByOrderItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByOrdersGroupImpl &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality()
                .equals(other._viewByOrderItem, _viewByOrderItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdDate,
      principalName,
      const DeepCollectionEquality().hash(_orderHeaders),
      parentId,
      const DeepCollectionEquality().hash(_viewByOrderItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByOrdersGroupImplCopyWith<_$ViewByOrdersGroupImpl> get copyWith =>
      __$$ViewByOrdersGroupImplCopyWithImpl<_$ViewByOrdersGroupImpl>(
          this, _$identity);
}

abstract class _ViewByOrdersGroup extends ViewByOrdersGroup {
  factory _ViewByOrdersGroup(
          {required final DateTimeStringValue createdDate,
          required final PrincipalName principalName,
          required final List<OrderHistoryDetails> orderHeaders,
          required final MaterialNumber parentId,
          required final List<OrderHistoryDetailsOrderItem> viewByOrderItem}) =
      _$ViewByOrdersGroupImpl;
  _ViewByOrdersGroup._() : super._();

  @override
  DateTimeStringValue get createdDate;
  @override
  PrincipalName get principalName;
  @override
  List<OrderHistoryDetails> get orderHeaders;
  @override
  MaterialNumber get parentId;
  @override
  List<OrderHistoryDetailsOrderItem> get viewByOrderItem;
  @override
  @JsonKey(ignore: true)
  _$$ViewByOrdersGroupImplCopyWith<_$ViewByOrdersGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
