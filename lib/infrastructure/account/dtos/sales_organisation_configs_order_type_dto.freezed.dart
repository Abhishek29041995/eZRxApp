// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation_configs_order_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrganisationConfigsOrderTypeDto
    _$SalesOrganisationConfigsOrderTypeDtoFromJson(Map<String, dynamic> json) {
  return _SalesOrganisationConfigsOrderTypeDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationConfigsOrderTypeDto {
  @JsonKey(name: 'categoryId', defaultValue: '')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason', defaultValue: 0)
  int get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'enabled', defaultValue: false)
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationConfigsOrderTypeDtoCopyWith<
          SalesOrganisationConfigsOrderTypeDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsOrderTypeDtoCopyWith<$Res> {
  factory $SalesOrganisationConfigsOrderTypeDtoCopyWith(
          SalesOrganisationConfigsOrderTypeDto value,
          $Res Function(SalesOrganisationConfigsOrderTypeDto) then) =
      _$SalesOrganisationConfigsOrderTypeDtoCopyWithImpl<$Res,
          SalesOrganisationConfigsOrderTypeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryId', defaultValue: '') String categoryId,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'orderReason', defaultValue: 0) int orderReason,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'enabled', defaultValue: false) bool enabled});
}

/// @nodoc
class _$SalesOrganisationConfigsOrderTypeDtoCopyWithImpl<$Res,
        $Val extends SalesOrganisationConfigsOrderTypeDto>
    implements $SalesOrganisationConfigsOrderTypeDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsOrderTypeDtoCopyWithImpl(this._value, this._then);

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
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrganisationConfigsOrderTypeDtoImplCopyWith<$Res>
    implements $SalesOrganisationConfigsOrderTypeDtoCopyWith<$Res> {
  factory _$$SalesOrganisationConfigsOrderTypeDtoImplCopyWith(
          _$SalesOrganisationConfigsOrderTypeDtoImpl value,
          $Res Function(_$SalesOrganisationConfigsOrderTypeDtoImpl) then) =
      __$$SalesOrganisationConfigsOrderTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryId', defaultValue: '') String categoryId,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'orderReason', defaultValue: 0) int orderReason,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'enabled', defaultValue: false) bool enabled});
}

/// @nodoc
class __$$SalesOrganisationConfigsOrderTypeDtoImplCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsOrderTypeDtoCopyWithImpl<$Res,
        _$SalesOrganisationConfigsOrderTypeDtoImpl>
    implements _$$SalesOrganisationConfigsOrderTypeDtoImplCopyWith<$Res> {
  __$$SalesOrganisationConfigsOrderTypeDtoImplCopyWithImpl(
      _$SalesOrganisationConfigsOrderTypeDtoImpl _value,
      $Res Function(_$SalesOrganisationConfigsOrderTypeDtoImpl) _then)
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
    return _then(_$SalesOrganisationConfigsOrderTypeDtoImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrganisationConfigsOrderTypeDtoImpl
    extends _SalesOrganisationConfigsOrderTypeDto {
  const _$SalesOrganisationConfigsOrderTypeDtoImpl(
      {@JsonKey(name: 'categoryId', defaultValue: '') required this.categoryId,
      @JsonKey(name: 'orderType', defaultValue: '') required this.orderType,
      @JsonKey(name: 'orderReason', defaultValue: 0) required this.orderReason,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'enabled', defaultValue: false) required this.enabled})
      : super._();

  factory _$SalesOrganisationConfigsOrderTypeDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesOrganisationConfigsOrderTypeDtoImplFromJson(json);

  @override
  @JsonKey(name: 'categoryId', defaultValue: '')
  final String categoryId;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: 0)
  final int orderReason;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'enabled', defaultValue: false)
  final bool enabled;

  @override
  String toString() {
    return 'SalesOrganisationConfigsOrderTypeDto(categoryId: $categoryId, orderType: $orderType, orderReason: $orderReason, description: $description, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrganisationConfigsOrderTypeDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, orderType, orderReason, description, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrganisationConfigsOrderTypeDtoImplCopyWith<
          _$SalesOrganisationConfigsOrderTypeDtoImpl>
      get copyWith => __$$SalesOrganisationConfigsOrderTypeDtoImplCopyWithImpl<
          _$SalesOrganisationConfigsOrderTypeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrganisationConfigsOrderTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationConfigsOrderTypeDto
    extends SalesOrganisationConfigsOrderTypeDto {
  const factory _SalesOrganisationConfigsOrderTypeDto(
          {@JsonKey(name: 'categoryId', defaultValue: '')
          required final String categoryId,
          @JsonKey(name: 'orderType', defaultValue: '')
          required final String orderType,
          @JsonKey(name: 'orderReason', defaultValue: 0)
          required final int orderReason,
          @JsonKey(name: 'description', defaultValue: '')
          required final String description,
          @JsonKey(name: 'enabled', defaultValue: false)
          required final bool enabled}) =
      _$SalesOrganisationConfigsOrderTypeDtoImpl;
  const _SalesOrganisationConfigsOrderTypeDto._() : super._();

  factory _SalesOrganisationConfigsOrderTypeDto.fromJson(
          Map<String, dynamic> json) =
      _$SalesOrganisationConfigsOrderTypeDtoImpl.fromJson;

  @override
  @JsonKey(name: 'categoryId', defaultValue: '')
  String get categoryId;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: 0)
  int get orderReason;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'enabled', defaultValue: false)
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrganisationConfigsOrderTypeDtoImplCopyWith<
          _$SalesOrganisationConfigsOrderTypeDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
