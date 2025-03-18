// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerLicense {
  StringValue get licenseNumbers => throw _privateConstructorUsedError;
  StringValue get licenseType => throw _privateConstructorUsedError;
  StringValue get licenseDescription => throw _privateConstructorUsedError;
  DateTimeStringValue get validFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get validTo => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerLicenseCopyWith<CustomerLicense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLicenseCopyWith<$Res> {
  factory $CustomerLicenseCopyWith(
          CustomerLicense value, $Res Function(CustomerLicense) then) =
      _$CustomerLicenseCopyWithImpl<$Res, CustomerLicense>;
  @useResult
  $Res call(
      {StringValue licenseNumbers,
      StringValue licenseType,
      StringValue licenseDescription,
      DateTimeStringValue validFrom,
      DateTimeStringValue validTo,
      StatusType status});
}

/// @nodoc
class _$CustomerLicenseCopyWithImpl<$Res, $Val extends CustomerLicense>
    implements $CustomerLicenseCopyWith<$Res> {
  _$CustomerLicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseNumbers = null,
    Object? licenseType = null,
    Object? licenseDescription = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      licenseNumbers: null == licenseNumbers
          ? _value.licenseNumbers
          : licenseNumbers // ignore: cast_nullable_to_non_nullable
              as StringValue,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerLicenseImplCopyWith<$Res>
    implements $CustomerLicenseCopyWith<$Res> {
  factory _$$CustomerLicenseImplCopyWith(_$CustomerLicenseImpl value,
          $Res Function(_$CustomerLicenseImpl) then) =
      __$$CustomerLicenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue licenseNumbers,
      StringValue licenseType,
      StringValue licenseDescription,
      DateTimeStringValue validFrom,
      DateTimeStringValue validTo,
      StatusType status});
}

/// @nodoc
class __$$CustomerLicenseImplCopyWithImpl<$Res>
    extends _$CustomerLicenseCopyWithImpl<$Res, _$CustomerLicenseImpl>
    implements _$$CustomerLicenseImplCopyWith<$Res> {
  __$$CustomerLicenseImplCopyWithImpl(
      _$CustomerLicenseImpl _value, $Res Function(_$CustomerLicenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseNumbers = null,
    Object? licenseType = null,
    Object? licenseDescription = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? status = null,
  }) {
    return _then(_$CustomerLicenseImpl(
      licenseNumbers: null == licenseNumbers
          ? _value.licenseNumbers
          : licenseNumbers // ignore: cast_nullable_to_non_nullable
              as StringValue,
      licenseType: null == licenseType
          ? _value.licenseType
          : licenseType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      licenseDescription: null == licenseDescription
          ? _value.licenseDescription
          : licenseDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
    ));
  }
}

/// @nodoc

class _$CustomerLicenseImpl extends _CustomerLicense {
  _$CustomerLicenseImpl(
      {required this.licenseNumbers,
      required this.licenseType,
      required this.licenseDescription,
      required this.validFrom,
      required this.validTo,
      required this.status})
      : super._();

  @override
  final StringValue licenseNumbers;
  @override
  final StringValue licenseType;
  @override
  final StringValue licenseDescription;
  @override
  final DateTimeStringValue validFrom;
  @override
  final DateTimeStringValue validTo;
  @override
  final StatusType status;

  @override
  String toString() {
    return 'CustomerLicense(licenseNumbers: $licenseNumbers, licenseType: $licenseType, licenseDescription: $licenseDescription, validFrom: $validFrom, validTo: $validTo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLicenseImpl &&
            (identical(other.licenseNumbers, licenseNumbers) ||
                other.licenseNumbers == licenseNumbers) &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType) &&
            (identical(other.licenseDescription, licenseDescription) ||
                other.licenseDescription == licenseDescription) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, licenseNumbers, licenseType,
      licenseDescription, validFrom, validTo, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLicenseImplCopyWith<_$CustomerLicenseImpl> get copyWith =>
      __$$CustomerLicenseImplCopyWithImpl<_$CustomerLicenseImpl>(
          this, _$identity);
}

abstract class _CustomerLicense extends CustomerLicense {
  factory _CustomerLicense(
      {required final StringValue licenseNumbers,
      required final StringValue licenseType,
      required final StringValue licenseDescription,
      required final DateTimeStringValue validFrom,
      required final DateTimeStringValue validTo,
      required final StatusType status}) = _$CustomerLicenseImpl;
  _CustomerLicense._() : super._();

  @override
  StringValue get licenseNumbers;
  @override
  StringValue get licenseType;
  @override
  StringValue get licenseDescription;
  @override
  DateTimeStringValue get validFrom;
  @override
  DateTimeStringValue get validTo;
  @override
  StatusType get status;
  @override
  @JsonKey(ignore: true)
  _$$CustomerLicenseImplCopyWith<_$CustomerLicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
