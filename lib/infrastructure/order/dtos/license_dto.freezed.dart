// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LicenseDto _$LicenseDtoFromJson(Map<String, dynamic> json) {
  return _licenseDto.fromJson(json);
}

/// @nodoc
mixin _$LicenseDto {
  @JsonKey(name: 'licenceType', defaultValue: '')
  String get licenceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  String get licenseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'validFrom',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  String get validFrom => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'validTo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  String get validTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseDtoCopyWith<LicenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseDtoCopyWith<$Res> {
  factory $LicenseDtoCopyWith(
          LicenseDto value, $Res Function(LicenseDto) then) =
      _$LicenseDtoCopyWithImpl<$Res, LicenseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType', defaultValue: '') String licenceType,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      String licenseDescription,
      @JsonKey(name: 'licenseNumber', defaultValue: '') String licenseNumber,
      @JsonKey(
          name: 'validFrom',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      String validFrom,
      @JsonKey(
          name: 'validTo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      String validTo});
}

/// @nodoc
class _$LicenseDtoCopyWithImpl<$Res, $Val extends LicenseDto>
    implements $LicenseDtoCopyWith<$Res> {
  _$LicenseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenceType = null,
    Object? licenseDescription = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
  }) {
    return _then(_value.copyWith(
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$licenseDtoImplCopyWith<$Res>
    implements $LicenseDtoCopyWith<$Res> {
  factory _$$licenseDtoImplCopyWith(
          _$licenseDtoImpl value, $Res Function(_$licenseDtoImpl) then) =
      __$$licenseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType', defaultValue: '') String licenceType,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      String licenseDescription,
      @JsonKey(name: 'licenseNumber', defaultValue: '') String licenseNumber,
      @JsonKey(
          name: 'validFrom',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      String validFrom,
      @JsonKey(
          name: 'validTo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      String validTo});
}

/// @nodoc
class __$$licenseDtoImplCopyWithImpl<$Res>
    extends _$LicenseDtoCopyWithImpl<$Res, _$licenseDtoImpl>
    implements _$$licenseDtoImplCopyWith<$Res> {
  __$$licenseDtoImplCopyWithImpl(
      _$licenseDtoImpl _value, $Res Function(_$licenseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenceType = null,
    Object? licenseDescription = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
  }) {
    return _then(_$licenseDtoImpl(
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$licenseDtoImpl extends _licenseDto {
  const _$licenseDtoImpl(
      {@JsonKey(name: 'licenceType', defaultValue: '')
      required this.licenceType,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      required this.licenseDescription,
      @JsonKey(name: 'licenseNumber', defaultValue: '')
      required this.licenseNumber,
      @JsonKey(
          name: 'validFrom',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      required this.validFrom,
      @JsonKey(
          name: 'validTo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      required this.validTo})
      : super._();

  factory _$licenseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$licenseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'licenceType', defaultValue: '')
  final String licenceType;
  @override
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  final String licenseDescription;
  @override
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  final String licenseNumber;
  @override
  @JsonKey(
      name: 'validFrom',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  final String validFrom;
  @override
  @JsonKey(
      name: 'validTo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  final String validTo;

  @override
  String toString() {
    return 'LicenseDto(licenceType: $licenceType, licenseDescription: $licenseDescription, licenseNumber: $licenseNumber, validFrom: $validFrom, validTo: $validTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$licenseDtoImpl &&
            (identical(other.licenceType, licenceType) ||
                other.licenceType == licenceType) &&
            (identical(other.licenseDescription, licenseDescription) ||
                other.licenseDescription == licenseDescription) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licenceType, licenseDescription,
      licenseNumber, validFrom, validTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$licenseDtoImplCopyWith<_$licenseDtoImpl> get copyWith =>
      __$$licenseDtoImplCopyWithImpl<_$licenseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$licenseDtoImplToJson(
      this,
    );
  }
}

abstract class _licenseDto extends LicenseDto {
  const factory _licenseDto(
      {@JsonKey(name: 'licenceType', defaultValue: '')
      required final String licenceType,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      required final String licenseDescription,
      @JsonKey(name: 'licenseNumber', defaultValue: '')
      required final String licenseNumber,
      @JsonKey(
          name: 'validFrom',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      required final String validFrom,
      @JsonKey(
          name: 'validTo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readDateTimeStringFormat)
      required final String validTo}) = _$licenseDtoImpl;
  const _licenseDto._() : super._();

  factory _licenseDto.fromJson(Map<String, dynamic> json) =
      _$licenseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'licenceType', defaultValue: '')
  String get licenceType;
  @override
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  String get licenseDescription;
  @override
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  String get licenseNumber;
  @override
  @JsonKey(
      name: 'validFrom',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  String get validFrom;
  @override
  @JsonKey(
      name: 'validTo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readDateTimeStringFormat)
  String get validTo;
  @override
  @JsonKey(ignore: true)
  _$$licenseDtoImplCopyWith<_$licenseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
