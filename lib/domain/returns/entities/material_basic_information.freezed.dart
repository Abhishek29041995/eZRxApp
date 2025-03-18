// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_basic_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialBasicInformation {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  String get partnerRole => throw _privateConstructorUsedError;
  String get partnerNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialBasicInformationCopyWith<MaterialBasicInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialBasicInformationCopyWith<$Res> {
  factory $MaterialBasicInformationCopyWith(MaterialBasicInformation value,
          $Res Function(MaterialBasicInformation) then) =
      _$MaterialBasicInformationCopyWithImpl<$Res, MaterialBasicInformation>;
  @useResult
  $Res call({SalesOrg salesOrg, String partnerRole, String partnerNumber});
}

/// @nodoc
class _$MaterialBasicInformationCopyWithImpl<$Res,
        $Val extends MaterialBasicInformation>
    implements $MaterialBasicInformationCopyWith<$Res> {
  _$MaterialBasicInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? partnerRole = null,
    Object? partnerNumber = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      partnerRole: null == partnerRole
          ? _value.partnerRole
          : partnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      partnerNumber: null == partnerNumber
          ? _value.partnerNumber
          : partnerNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialBasicInformationImplCopyWith<$Res>
    implements $MaterialBasicInformationCopyWith<$Res> {
  factory _$$MaterialBasicInformationImplCopyWith(
          _$MaterialBasicInformationImpl value,
          $Res Function(_$MaterialBasicInformationImpl) then) =
      __$$MaterialBasicInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg, String partnerRole, String partnerNumber});
}

/// @nodoc
class __$$MaterialBasicInformationImplCopyWithImpl<$Res>
    extends _$MaterialBasicInformationCopyWithImpl<$Res,
        _$MaterialBasicInformationImpl>
    implements _$$MaterialBasicInformationImplCopyWith<$Res> {
  __$$MaterialBasicInformationImplCopyWithImpl(
      _$MaterialBasicInformationImpl _value,
      $Res Function(_$MaterialBasicInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? partnerRole = null,
    Object? partnerNumber = null,
  }) {
    return _then(_$MaterialBasicInformationImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      partnerRole: null == partnerRole
          ? _value.partnerRole
          : partnerRole // ignore: cast_nullable_to_non_nullable
              as String,
      partnerNumber: null == partnerNumber
          ? _value.partnerNumber
          : partnerNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MaterialBasicInformationImpl extends _MaterialBasicInformation {
  const _$MaterialBasicInformationImpl(
      {required this.salesOrg,
      required this.partnerRole,
      required this.partnerNumber})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final String partnerRole;
  @override
  final String partnerNumber;

  @override
  String toString() {
    return 'MaterialBasicInformation(salesOrg: $salesOrg, partnerRole: $partnerRole, partnerNumber: $partnerNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialBasicInformationImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.partnerRole, partnerRole) ||
                other.partnerRole == partnerRole) &&
            (identical(other.partnerNumber, partnerNumber) ||
                other.partnerNumber == partnerNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, partnerRole, partnerNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialBasicInformationImplCopyWith<_$MaterialBasicInformationImpl>
      get copyWith => __$$MaterialBasicInformationImplCopyWithImpl<
          _$MaterialBasicInformationImpl>(this, _$identity);
}

abstract class _MaterialBasicInformation extends MaterialBasicInformation {
  const factory _MaterialBasicInformation(
      {required final SalesOrg salesOrg,
      required final String partnerRole,
      required final String partnerNumber}) = _$MaterialBasicInformationImpl;
  const _MaterialBasicInformation._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  String get partnerRole;
  @override
  String get partnerNumber;
  @override
  @JsonKey(ignore: true)
  _$$MaterialBasicInformationImplCopyWith<_$MaterialBasicInformationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
