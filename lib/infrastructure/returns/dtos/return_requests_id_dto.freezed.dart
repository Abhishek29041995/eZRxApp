// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_requests_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnRequestsIdDto _$ReturnRequestsIdDtoFromJson(Map<String, dynamic> json) {
  return _ReturnRequestsIdDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestsIdDto {
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestsIdDtoCopyWith<ReturnRequestsIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestsIdDtoCopyWith<$Res> {
  factory $ReturnRequestsIdDtoCopyWith(
          ReturnRequestsIdDto value, $Res Function(ReturnRequestsIdDto) then) =
      _$ReturnRequestsIdDtoCopyWithImpl<$Res, ReturnRequestsIdDto>;
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class _$ReturnRequestsIdDtoCopyWithImpl<$Res, $Val extends ReturnRequestsIdDto>
    implements $ReturnRequestsIdDtoCopyWith<$Res> {
  _$ReturnRequestsIdDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnRequestsIdDtoImplCopyWith<$Res>
    implements $ReturnRequestsIdDtoCopyWith<$Res> {
  factory _$$ReturnRequestsIdDtoImplCopyWith(_$ReturnRequestsIdDtoImpl value,
          $Res Function(_$ReturnRequestsIdDtoImpl) then) =
      __$$ReturnRequestsIdDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class __$$ReturnRequestsIdDtoImplCopyWithImpl<$Res>
    extends _$ReturnRequestsIdDtoCopyWithImpl<$Res, _$ReturnRequestsIdDtoImpl>
    implements _$$ReturnRequestsIdDtoImplCopyWith<$Res> {
  __$$ReturnRequestsIdDtoImplCopyWithImpl(_$ReturnRequestsIdDtoImpl _value,
      $Res Function(_$ReturnRequestsIdDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$ReturnRequestsIdDtoImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnRequestsIdDtoImpl extends _ReturnRequestsIdDto {
  _$ReturnRequestsIdDtoImpl(
      {@JsonKey(name: 'requestId', defaultValue: '') required this.requestId})
      : super._();

  factory _$ReturnRequestsIdDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnRequestsIdDtoImplFromJson(json);

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  final String requestId;

  @override
  String toString() {
    return 'ReturnRequestsIdDto(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestsIdDtoImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestsIdDtoImplCopyWith<_$ReturnRequestsIdDtoImpl> get copyWith =>
      __$$ReturnRequestsIdDtoImplCopyWithImpl<_$ReturnRequestsIdDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnRequestsIdDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnRequestsIdDto extends ReturnRequestsIdDto {
  factory _ReturnRequestsIdDto(
      {@JsonKey(name: 'requestId', defaultValue: '')
      required final String requestId}) = _$ReturnRequestsIdDtoImpl;
  _ReturnRequestsIdDto._() : super._();

  factory _ReturnRequestsIdDto.fromJson(Map<String, dynamic> json) =
      _$ReturnRequestsIdDtoImpl.fromJson;

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestsIdDtoImplCopyWith<_$ReturnRequestsIdDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
