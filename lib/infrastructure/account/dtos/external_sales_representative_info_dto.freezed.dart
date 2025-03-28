// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_sales_representative_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExternalSalesRepresentativeInfoDto _$ExternalSalesRepresentativeInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _ExternalSalesRepresentativeInfoDto.fromJson(json);
}

/// @nodoc
mixin _$ExternalSalesRepresentativeInfoDto {
  @JsonKey(name: 'userId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalSalesRepresentativeInfoDtoCopyWith<
          ExternalSalesRepresentativeInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalSalesRepresentativeInfoDtoCopyWith<$Res> {
  factory $ExternalSalesRepresentativeInfoDtoCopyWith(
          ExternalSalesRepresentativeInfoDto value,
          $Res Function(ExternalSalesRepresentativeInfoDto) then) =
      _$ExternalSalesRepresentativeInfoDtoCopyWithImpl<$Res,
          ExternalSalesRepresentativeInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'userName') String userName});
}

/// @nodoc
class _$ExternalSalesRepresentativeInfoDtoCopyWithImpl<$Res,
        $Val extends ExternalSalesRepresentativeInfoDto>
    implements $ExternalSalesRepresentativeInfoDtoCopyWith<$Res> {
  _$ExternalSalesRepresentativeInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalSalesRepresentativeInfoDtoImplCopyWith<$Res>
    implements $ExternalSalesRepresentativeInfoDtoCopyWith<$Res> {
  factory _$$ExternalSalesRepresentativeInfoDtoImplCopyWith(
          _$ExternalSalesRepresentativeInfoDtoImpl value,
          $Res Function(_$ExternalSalesRepresentativeInfoDtoImpl) then) =
      __$$ExternalSalesRepresentativeInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'userName') String userName});
}

/// @nodoc
class __$$ExternalSalesRepresentativeInfoDtoImplCopyWithImpl<$Res>
    extends _$ExternalSalesRepresentativeInfoDtoCopyWithImpl<$Res,
        _$ExternalSalesRepresentativeInfoDtoImpl>
    implements _$$ExternalSalesRepresentativeInfoDtoImplCopyWith<$Res> {
  __$$ExternalSalesRepresentativeInfoDtoImplCopyWithImpl(
      _$ExternalSalesRepresentativeInfoDtoImpl _value,
      $Res Function(_$ExternalSalesRepresentativeInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
  }) {
    return _then(_$ExternalSalesRepresentativeInfoDtoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalSalesRepresentativeInfoDtoImpl
    extends _ExternalSalesRepresentativeInfoDto {
  const _$ExternalSalesRepresentativeInfoDtoImpl(
      {@JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'userName') required this.userName})
      : super._();

  factory _$ExternalSalesRepresentativeInfoDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ExternalSalesRepresentativeInfoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final int userId;
  @override
  @JsonKey(name: 'userName')
  final String userName;

  @override
  String toString() {
    return 'ExternalSalesRepresentativeInfoDto(userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalSalesRepresentativeInfoDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalSalesRepresentativeInfoDtoImplCopyWith<
          _$ExternalSalesRepresentativeInfoDtoImpl>
      get copyWith => __$$ExternalSalesRepresentativeInfoDtoImplCopyWithImpl<
          _$ExternalSalesRepresentativeInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalSalesRepresentativeInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _ExternalSalesRepresentativeInfoDto
    extends ExternalSalesRepresentativeInfoDto {
  const factory _ExternalSalesRepresentativeInfoDto(
          {@JsonKey(name: 'userId') required final int userId,
          @JsonKey(name: 'userName') required final String userName}) =
      _$ExternalSalesRepresentativeInfoDtoImpl;
  const _ExternalSalesRepresentativeInfoDto._() : super._();

  factory _ExternalSalesRepresentativeInfoDto.fromJson(
          Map<String, dynamic> json) =
      _$ExternalSalesRepresentativeInfoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'userId')
  int get userId;
  @override
  @JsonKey(name: 'userName')
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$ExternalSalesRepresentativeInfoDtoImplCopyWith<
          _$ExternalSalesRepresentativeInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
