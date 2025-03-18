// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_response_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmitOrderResponseMessageDto _$SubmitOrderResponseMessageDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitOrderResponseMessageDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitOrderResponseMessageDto {
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitOrderResponseMessageDtoCopyWith<SubmitOrderResponseMessageDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  factory $SubmitOrderResponseMessageDtoCopyWith(
          SubmitOrderResponseMessageDto value,
          $Res Function(SubmitOrderResponseMessageDto) then) =
      _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
          SubmitOrderResponseMessageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
        $Val extends SubmitOrderResponseMessageDto>
    implements $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  _$SubmitOrderResponseMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitOrderResponseMessageDtoImplCopyWith<$Res>
    implements $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  factory _$$SubmitOrderResponseMessageDtoImplCopyWith(
          _$SubmitOrderResponseMessageDtoImpl value,
          $Res Function(_$SubmitOrderResponseMessageDtoImpl) then) =
      __$$SubmitOrderResponseMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class __$$SubmitOrderResponseMessageDtoImplCopyWithImpl<$Res>
    extends _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
        _$SubmitOrderResponseMessageDtoImpl>
    implements _$$SubmitOrderResponseMessageDtoImplCopyWith<$Res> {
  __$$SubmitOrderResponseMessageDtoImplCopyWithImpl(
      _$SubmitOrderResponseMessageDtoImpl _value,
      $Res Function(_$SubmitOrderResponseMessageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$SubmitOrderResponseMessageDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitOrderResponseMessageDtoImpl
    extends _SubmitOrderResponseMessageDto {
  const _$SubmitOrderResponseMessageDtoImpl(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'Message', defaultValue: '') required this.message})
      : super._();

  factory _$SubmitOrderResponseMessageDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SubmitOrderResponseMessageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'SubmitOrderResponseMessageDto(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitOrderResponseMessageDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitOrderResponseMessageDtoImplCopyWith<
          _$SubmitOrderResponseMessageDtoImpl>
      get copyWith => __$$SubmitOrderResponseMessageDtoImplCopyWithImpl<
          _$SubmitOrderResponseMessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitOrderResponseMessageDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmitOrderResponseMessageDto
    extends SubmitOrderResponseMessageDto {
  const factory _SubmitOrderResponseMessageDto(
      {@JsonKey(name: 'Type', defaultValue: '') required final String type,
      @JsonKey(name: 'Message', defaultValue: '')
      required final String message}) = _$SubmitOrderResponseMessageDtoImpl;
  const _SubmitOrderResponseMessageDto._() : super._();

  factory _SubmitOrderResponseMessageDto.fromJson(Map<String, dynamic> json) =
      _$SubmitOrderResponseMessageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SubmitOrderResponseMessageDtoImplCopyWith<
          _$SubmitOrderResponseMessageDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
