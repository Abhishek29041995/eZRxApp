// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_sales_representative_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExternalSalesRepresentativeInfo {
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExternalSalesRepresentativeInfoCopyWith<ExternalSalesRepresentativeInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalSalesRepresentativeInfoCopyWith<$Res> {
  factory $ExternalSalesRepresentativeInfoCopyWith(
          ExternalSalesRepresentativeInfo value,
          $Res Function(ExternalSalesRepresentativeInfo) then) =
      _$ExternalSalesRepresentativeInfoCopyWithImpl<$Res,
          ExternalSalesRepresentativeInfo>;
  @useResult
  $Res call({int userId, String userName});
}

/// @nodoc
class _$ExternalSalesRepresentativeInfoCopyWithImpl<$Res,
        $Val extends ExternalSalesRepresentativeInfo>
    implements $ExternalSalesRepresentativeInfoCopyWith<$Res> {
  _$ExternalSalesRepresentativeInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$ExternalSalesRepresentativeInfoImplCopyWith<$Res>
    implements $ExternalSalesRepresentativeInfoCopyWith<$Res> {
  factory _$$ExternalSalesRepresentativeInfoImplCopyWith(
          _$ExternalSalesRepresentativeInfoImpl value,
          $Res Function(_$ExternalSalesRepresentativeInfoImpl) then) =
      __$$ExternalSalesRepresentativeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, String userName});
}

/// @nodoc
class __$$ExternalSalesRepresentativeInfoImplCopyWithImpl<$Res>
    extends _$ExternalSalesRepresentativeInfoCopyWithImpl<$Res,
        _$ExternalSalesRepresentativeInfoImpl>
    implements _$$ExternalSalesRepresentativeInfoImplCopyWith<$Res> {
  __$$ExternalSalesRepresentativeInfoImplCopyWithImpl(
      _$ExternalSalesRepresentativeInfoImpl _value,
      $Res Function(_$ExternalSalesRepresentativeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
  }) {
    return _then(_$ExternalSalesRepresentativeInfoImpl(
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

class _$ExternalSalesRepresentativeInfoImpl
    extends _ExternalSalesRepresentativeInfo {
  const _$ExternalSalesRepresentativeInfoImpl(
      {required this.userId, required this.userName})
      : super._();

  @override
  final int userId;
  @override
  final String userName;

  @override
  String toString() {
    return 'ExternalSalesRepresentativeInfo(userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalSalesRepresentativeInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalSalesRepresentativeInfoImplCopyWith<
          _$ExternalSalesRepresentativeInfoImpl>
      get copyWith => __$$ExternalSalesRepresentativeInfoImplCopyWithImpl<
          _$ExternalSalesRepresentativeInfoImpl>(this, _$identity);
}

abstract class _ExternalSalesRepresentativeInfo
    extends ExternalSalesRepresentativeInfo {
  const factory _ExternalSalesRepresentativeInfo(
      {required final int userId,
      required final String userName}) = _$ExternalSalesRepresentativeInfoImpl;
  const _ExternalSalesRepresentativeInfo._() : super._();

  @override
  int get userId;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$ExternalSalesRepresentativeInfoImplCopyWith<
          _$ExternalSalesRepresentativeInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
