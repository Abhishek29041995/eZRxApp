// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewByOrderDto _$ViewByOrderDtoFromJson(Map<String, dynamic> json) {
  return _ViewByOrderDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByOrderDto {
  @JsonKey(name: 'orderCount', defaultValue: 0)
  int get orderCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
  List<OrderHistoryDetailsDto> get orderHeaders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByOrderDtoCopyWith<ViewByOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderDtoCopyWith<$Res> {
  factory $ViewByOrderDtoCopyWith(
          ViewByOrderDto value, $Res Function(ViewByOrderDto) then) =
      _$ViewByOrderDtoCopyWithImpl<$Res, ViewByOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCount', defaultValue: 0) int orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
      List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
      List<OrderHistoryDetailsDto> orderHeaders});
}

/// @nodoc
class _$ViewByOrderDtoCopyWithImpl<$Res, $Val extends ViewByOrderDto>
    implements $ViewByOrderDtoCopyWith<$Res> {
  _$ViewByOrderDtoCopyWithImpl(this._value, this._then);

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
              as List<OrderHistoryDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewByOrderDtoImplCopyWith<$Res>
    implements $ViewByOrderDtoCopyWith<$Res> {
  factory _$$ViewByOrderDtoImplCopyWith(_$ViewByOrderDtoImpl value,
          $Res Function(_$ViewByOrderDtoImpl) then) =
      __$$ViewByOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCount', defaultValue: 0) int orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
      List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
      List<OrderHistoryDetailsDto> orderHeaders});
}

/// @nodoc
class __$$ViewByOrderDtoImplCopyWithImpl<$Res>
    extends _$ViewByOrderDtoCopyWithImpl<$Res, _$ViewByOrderDtoImpl>
    implements _$$ViewByOrderDtoImplCopyWith<$Res> {
  __$$ViewByOrderDtoImplCopyWithImpl(
      _$ViewByOrderDtoImpl _value, $Res Function(_$ViewByOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_$ViewByOrderDtoImpl(
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
              as List<OrderHistoryDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewByOrderDtoImpl extends _ViewByOrderDto {
  const _$ViewByOrderDtoImpl(
      {@JsonKey(name: 'orderCount', defaultValue: 0) required this.orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
      required final List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
      required final List<OrderHistoryDetailsDto> orderHeaders})
      : _creatingOrderIds = creatingOrderIds,
        _orderHeaders = orderHeaders,
        super._();

  factory _$ViewByOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewByOrderDtoImplFromJson(json);

  @override
  @JsonKey(name: 'orderCount', defaultValue: 0)
  final int orderCount;
  final List<String> _creatingOrderIds;
  @override
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds {
    if (_creatingOrderIds is EqualUnmodifiableListView)
      return _creatingOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creatingOrderIds);
  }

  final List<OrderHistoryDetailsDto> _orderHeaders;
  @override
  @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
  List<OrderHistoryDetailsDto> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  String toString() {
    return 'ViewByOrderDto(orderCount: $orderCount, creatingOrderIds: $creatingOrderIds, orderHeaders: $orderHeaders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByOrderDtoImpl &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            const DeepCollectionEquality()
                .equals(other._creatingOrderIds, _creatingOrderIds) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderCount,
      const DeepCollectionEquality().hash(_creatingOrderIds),
      const DeepCollectionEquality().hash(_orderHeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByOrderDtoImplCopyWith<_$ViewByOrderDtoImpl> get copyWith =>
      __$$ViewByOrderDtoImplCopyWithImpl<_$ViewByOrderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewByOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _ViewByOrderDto extends ViewByOrderDto {
  const factory _ViewByOrderDto(
          {@JsonKey(name: 'orderCount', defaultValue: 0)
          required final int orderCount,
          @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
          required final List<String> creatingOrderIds,
          @JsonKey(
              name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
          required final List<OrderHistoryDetailsDto> orderHeaders}) =
      _$ViewByOrderDtoImpl;
  const _ViewByOrderDto._() : super._();

  factory _ViewByOrderDto.fromJson(Map<String, dynamic> json) =
      _$ViewByOrderDtoImpl.fromJson;

  @override
  @JsonKey(name: 'orderCount', defaultValue: 0)
  int get orderCount;
  @override
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds;
  @override
  @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsDto>[])
  List<OrderHistoryDetailsDto> get orderHeaders;
  @override
  @JsonKey(ignore: true)
  _$$ViewByOrderDtoImplCopyWith<_$ViewByOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
