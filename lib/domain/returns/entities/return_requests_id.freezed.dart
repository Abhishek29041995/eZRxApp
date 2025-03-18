// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_requests_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnRequestsId {
  String get requestId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnRequestsIdCopyWith<ReturnRequestsId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestsIdCopyWith<$Res> {
  factory $ReturnRequestsIdCopyWith(
          ReturnRequestsId value, $Res Function(ReturnRequestsId) then) =
      _$ReturnRequestsIdCopyWithImpl<$Res, ReturnRequestsId>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class _$ReturnRequestsIdCopyWithImpl<$Res, $Val extends ReturnRequestsId>
    implements $ReturnRequestsIdCopyWith<$Res> {
  _$ReturnRequestsIdCopyWithImpl(this._value, this._then);

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
abstract class _$$ReturnRequestsIdImplCopyWith<$Res>
    implements $ReturnRequestsIdCopyWith<$Res> {
  factory _$$ReturnRequestsIdImplCopyWith(_$ReturnRequestsIdImpl value,
          $Res Function(_$ReturnRequestsIdImpl) then) =
      __$$ReturnRequestsIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$ReturnRequestsIdImplCopyWithImpl<$Res>
    extends _$ReturnRequestsIdCopyWithImpl<$Res, _$ReturnRequestsIdImpl>
    implements _$$ReturnRequestsIdImplCopyWith<$Res> {
  __$$ReturnRequestsIdImplCopyWithImpl(_$ReturnRequestsIdImpl _value,
      $Res Function(_$ReturnRequestsIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$ReturnRequestsIdImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReturnRequestsIdImpl extends _ReturnRequestsId {
  _$ReturnRequestsIdImpl({required this.requestId}) : super._();

  @override
  final String requestId;

  @override
  String toString() {
    return 'ReturnRequestsId(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestsIdImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestsIdImplCopyWith<_$ReturnRequestsIdImpl> get copyWith =>
      __$$ReturnRequestsIdImplCopyWithImpl<_$ReturnRequestsIdImpl>(
          this, _$identity);
}

abstract class _ReturnRequestsId extends ReturnRequestsId {
  factory _ReturnRequestsId({required final String requestId}) =
      _$ReturnRequestsIdImpl;
  _ReturnRequestsId._() : super._();

  @override
  String get requestId;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestsIdImplCopyWith<_$ReturnRequestsIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
