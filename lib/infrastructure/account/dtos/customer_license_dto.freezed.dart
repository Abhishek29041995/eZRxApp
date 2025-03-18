// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_license_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerLicenseDto _$CustomerLicenseDtoFromJson(Map<String, dynamic> json) {
  return _CustomerLicenseDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerLicenseDto {
  @JsonKey(name: 'licenceType', defaultValue: '')
  String get licenseType => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'validFrom', defaultValue: '')
  String get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'validTo', defaultValue: '')
  String get validTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  String get licenseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerLicenseDtoCopyWith<CustomerLicenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLicenseDtoCopyWith<$Res> {
  factory $CustomerLicenseDtoCopyWith(
          CustomerLicenseDto value, $Res Function(CustomerLicenseDto) then) =
      _$CustomerLicenseDtoCopyWithImpl<$Res, CustomerLicenseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType', defaultValue: '') String licenseType,
      @JsonKey(name: 'licenseNumber', defaultValue: '') String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '') String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '') String validTo,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      String licenseDescription,
      @JsonKey(name: 'status', defaultValue: '') String status});
}

/// @nodoc
class _$CustomerLicenseDtoCopyWithImpl<$Res, $Val extends CustomerLicenseDto>
    implements $CustomerLicenseDtoCopyWith<$Res> {
  _$CustomerLicenseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseType = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? licenseDescription = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
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
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerLicenseDtoImplCopyWith<$Res>
    implements $CustomerLicenseDtoCopyWith<$Res> {
  factory _$$CustomerLicenseDtoImplCopyWith(_$CustomerLicenseDtoImpl value,
          $Res Function(_$CustomerLicenseDtoImpl) then) =
      __$$CustomerLicenseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'licenceType', defaultValue: '') String licenseType,
      @JsonKey(name: 'licenseNumber', defaultValue: '') String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '') String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '') String validTo,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      String licenseDescription,
      @JsonKey(name: 'status', defaultValue: '') String status});
}

/// @nodoc
class __$$CustomerLicenseDtoImplCopyWithImpl<$Res>
    extends _$CustomerLicenseDtoCopyWithImpl<$Res, _$CustomerLicenseDtoImpl>
    implements _$$CustomerLicenseDtoImplCopyWith<$Res> {
  __$$CustomerLicenseDtoImplCopyWithImpl(_$CustomerLicenseDtoImpl _value,
      $Res Function(_$CustomerLicenseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseType = null,
    Object? licenseNumber = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? licenseDescription = null,
    Object? status = null,
  }) {
    return _then(_$CustomerLicenseDtoImpl(
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
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
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerLicenseDtoImpl extends _CustomerLicenseDto {
  _$CustomerLicenseDtoImpl(
      {@JsonKey(name: 'licenceType', defaultValue: '')
      required this.licenseType,
      @JsonKey(name: 'licenseNumber', defaultValue: '')
      required this.licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '') required this.validFrom,
      @JsonKey(name: 'validTo', defaultValue: '') required this.validTo,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      required this.licenseDescription,
      @JsonKey(name: 'status', defaultValue: '') required this.status})
      : super._();

  factory _$CustomerLicenseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerLicenseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'licenceType', defaultValue: '')
  final String licenseType;
  @override
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  final String licenseNumber;
  @override
  @JsonKey(name: 'validFrom', defaultValue: '')
  final String validFrom;
  @override
  @JsonKey(name: 'validTo', defaultValue: '')
  final String validTo;
  @override
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  final String licenseDescription;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;

  @override
  String toString() {
    return 'CustomerLicenseDto(licenseType: $licenseType, licenseNumber: $licenseNumber, validFrom: $validFrom, validTo: $validTo, licenseDescription: $licenseDescription, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLicenseDtoImpl &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.licenseDescription, licenseDescription) ||
                other.licenseDescription == licenseDescription) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licenseType, licenseNumber,
      validFrom, validTo, licenseDescription, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLicenseDtoImplCopyWith<_$CustomerLicenseDtoImpl> get copyWith =>
      __$$CustomerLicenseDtoImplCopyWithImpl<_$CustomerLicenseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerLicenseDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerLicenseDto extends CustomerLicenseDto {
  factory _CustomerLicenseDto(
      {@JsonKey(name: 'licenceType', defaultValue: '')
      required final String licenseType,
      @JsonKey(name: 'licenseNumber', defaultValue: '')
      required final String licenseNumber,
      @JsonKey(name: 'validFrom', defaultValue: '')
      required final String validFrom,
      @JsonKey(name: 'validTo', defaultValue: '') required final String validTo,
      @JsonKey(name: 'licenseDescription', defaultValue: '')
      required final String licenseDescription,
      @JsonKey(name: 'status', defaultValue: '')
      required final String status}) = _$CustomerLicenseDtoImpl;
  _CustomerLicenseDto._() : super._();

  factory _CustomerLicenseDto.fromJson(Map<String, dynamic> json) =
      _$CustomerLicenseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'licenceType', defaultValue: '')
  String get licenseType;
  @override
  @JsonKey(name: 'licenseNumber', defaultValue: '')
  String get licenseNumber;
  @override
  @JsonKey(name: 'validFrom', defaultValue: '')
  String get validFrom;
  @override
  @JsonKey(name: 'validTo', defaultValue: '')
  String get validTo;
  @override
  @JsonKey(name: 'licenseDescription', defaultValue: '')
  String get licenseDescription;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$CustomerLicenseDtoImplCopyWith<_$CustomerLicenseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
