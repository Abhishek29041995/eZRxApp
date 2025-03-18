// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation_configs_principal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrganisationConfigsPrincipal {
  DateTimeStringValue get date => throw _privateConstructorUsedError;
  PrincipalCode get principalCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrganisationConfigsPrincipalCopyWith<SalesOrganisationConfigsPrincipal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsPrincipalCopyWith<$Res> {
  factory $SalesOrganisationConfigsPrincipalCopyWith(
          SalesOrganisationConfigsPrincipal value,
          $Res Function(SalesOrganisationConfigsPrincipal) then) =
      _$SalesOrganisationConfigsPrincipalCopyWithImpl<$Res,
          SalesOrganisationConfigsPrincipal>;
  @useResult
  $Res call({DateTimeStringValue date, PrincipalCode principalCode});
}

/// @nodoc
class _$SalesOrganisationConfigsPrincipalCopyWithImpl<$Res,
        $Val extends SalesOrganisationConfigsPrincipal>
    implements $SalesOrganisationConfigsPrincipalCopyWith<$Res> {
  _$SalesOrganisationConfigsPrincipalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? principalCode = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrganisationConfigsPrincipalImplCopyWith<$Res>
    implements $SalesOrganisationConfigsPrincipalCopyWith<$Res> {
  factory _$$SalesOrganisationConfigsPrincipalImplCopyWith(
          _$SalesOrganisationConfigsPrincipalImpl value,
          $Res Function(_$SalesOrganisationConfigsPrincipalImpl) then) =
      __$$SalesOrganisationConfigsPrincipalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeStringValue date, PrincipalCode principalCode});
}

/// @nodoc
class __$$SalesOrganisationConfigsPrincipalImplCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsPrincipalCopyWithImpl<$Res,
        _$SalesOrganisationConfigsPrincipalImpl>
    implements _$$SalesOrganisationConfigsPrincipalImplCopyWith<$Res> {
  __$$SalesOrganisationConfigsPrincipalImplCopyWithImpl(
      _$SalesOrganisationConfigsPrincipalImpl _value,
      $Res Function(_$SalesOrganisationConfigsPrincipalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? principalCode = null,
  }) {
    return _then(_$SalesOrganisationConfigsPrincipalImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
    ));
  }
}

/// @nodoc

class _$SalesOrganisationConfigsPrincipalImpl
    extends _SalesOrganisationConfigsPrincipal {
  const _$SalesOrganisationConfigsPrincipalImpl(
      {required this.date, required this.principalCode})
      : super._();

  @override
  final DateTimeStringValue date;
  @override
  final PrincipalCode principalCode;

  @override
  String toString() {
    return 'SalesOrganisationConfigsPrincipal(date: $date, principalCode: $principalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrganisationConfigsPrincipalImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, principalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrganisationConfigsPrincipalImplCopyWith<
          _$SalesOrganisationConfigsPrincipalImpl>
      get copyWith => __$$SalesOrganisationConfigsPrincipalImplCopyWithImpl<
          _$SalesOrganisationConfigsPrincipalImpl>(this, _$identity);
}

abstract class _SalesOrganisationConfigsPrincipal
    extends SalesOrganisationConfigsPrincipal {
  const factory _SalesOrganisationConfigsPrincipal(
          {required final DateTimeStringValue date,
          required final PrincipalCode principalCode}) =
      _$SalesOrganisationConfigsPrincipalImpl;
  const _SalesOrganisationConfigsPrincipal._() : super._();

  @override
  DateTimeStringValue get date;
  @override
  PrincipalCode get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrganisationConfigsPrincipalImplCopyWith<
          _$SalesOrganisationConfigsPrincipalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
