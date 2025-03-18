// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_customer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmitOrderCustomerDto _$SubmitOrderCustomerDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitOrderCustomerDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitOrderCustomerDto {
  @JsonKey(name: 'customerNumber', defaultValue: '')
  String get customerNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
  String get customerNumberShipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  String get salesOrganisation => throw _privateConstructorUsedError;
  @JsonKey(name: 'division', defaultValue: '')
  String get division => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitOrderCustomerDtoCopyWith<SubmitOrderCustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderCustomerDtoCopyWith<$Res> {
  factory $SubmitOrderCustomerDtoCopyWith(SubmitOrderCustomerDto value,
          $Res Function(SubmitOrderCustomerDto) then) =
      _$SubmitOrderCustomerDtoCopyWithImpl<$Res, SubmitOrderCustomerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customerNumber', defaultValue: '') String customerNumber,
      @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
      String customerNumberShipTo,
      @JsonKey(name: 'salesOrganisation', defaultValue: '')
      String salesOrganisation,
      @JsonKey(name: 'division', defaultValue: '') String division});
}

/// @nodoc
class _$SubmitOrderCustomerDtoCopyWithImpl<$Res,
        $Val extends SubmitOrderCustomerDto>
    implements $SubmitOrderCustomerDtoCopyWith<$Res> {
  _$SubmitOrderCustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerNumber = null,
    Object? customerNumberShipTo = null,
    Object? salesOrganisation = null,
    Object? division = null,
  }) {
    return _then(_value.copyWith(
      customerNumber: null == customerNumber
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumberShipTo: null == customerNumberShipTo
          ? _value.customerNumberShipTo
          : customerNumberShipTo // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitOrderCustomerDtoImplCopyWith<$Res>
    implements $SubmitOrderCustomerDtoCopyWith<$Res> {
  factory _$$SubmitOrderCustomerDtoImplCopyWith(
          _$SubmitOrderCustomerDtoImpl value,
          $Res Function(_$SubmitOrderCustomerDtoImpl) then) =
      __$$SubmitOrderCustomerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customerNumber', defaultValue: '') String customerNumber,
      @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
      String customerNumberShipTo,
      @JsonKey(name: 'salesOrganisation', defaultValue: '')
      String salesOrganisation,
      @JsonKey(name: 'division', defaultValue: '') String division});
}

/// @nodoc
class __$$SubmitOrderCustomerDtoImplCopyWithImpl<$Res>
    extends _$SubmitOrderCustomerDtoCopyWithImpl<$Res,
        _$SubmitOrderCustomerDtoImpl>
    implements _$$SubmitOrderCustomerDtoImplCopyWith<$Res> {
  __$$SubmitOrderCustomerDtoImplCopyWithImpl(
      _$SubmitOrderCustomerDtoImpl _value,
      $Res Function(_$SubmitOrderCustomerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerNumber = null,
    Object? customerNumberShipTo = null,
    Object? salesOrganisation = null,
    Object? division = null,
  }) {
    return _then(_$SubmitOrderCustomerDtoImpl(
      customerNumber: null == customerNumber
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumberShipTo: null == customerNumberShipTo
          ? _value.customerNumberShipTo
          : customerNumberShipTo // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitOrderCustomerDtoImpl extends _SubmitOrderCustomerDto {
  const _$SubmitOrderCustomerDtoImpl(
      {@JsonKey(name: 'customerNumber', defaultValue: '')
      required this.customerNumber,
      @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
      required this.customerNumberShipTo,
      @JsonKey(name: 'salesOrganisation', defaultValue: '')
      required this.salesOrganisation,
      @JsonKey(name: 'division', defaultValue: '') required this.division})
      : super._();

  factory _$SubmitOrderCustomerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitOrderCustomerDtoImplFromJson(json);

  @override
  @JsonKey(name: 'customerNumber', defaultValue: '')
  final String customerNumber;
  @override
  @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
  final String customerNumberShipTo;
  @override
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  final String salesOrganisation;
  @override
  @JsonKey(name: 'division', defaultValue: '')
  final String division;

  @override
  String toString() {
    return 'SubmitOrderCustomerDto(customerNumber: $customerNumber, customerNumberShipTo: $customerNumberShipTo, salesOrganisation: $salesOrganisation, division: $division)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitOrderCustomerDtoImpl &&
            (identical(other.customerNumber, customerNumber) ||
                other.customerNumber == customerNumber) &&
            (identical(other.customerNumberShipTo, customerNumberShipTo) ||
                other.customerNumberShipTo == customerNumberShipTo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.division, division) ||
                other.division == division));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerNumber,
      customerNumberShipTo, salesOrganisation, division);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitOrderCustomerDtoImplCopyWith<_$SubmitOrderCustomerDtoImpl>
      get copyWith => __$$SubmitOrderCustomerDtoImplCopyWithImpl<
          _$SubmitOrderCustomerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitOrderCustomerDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmitOrderCustomerDto extends SubmitOrderCustomerDto {
  const factory _SubmitOrderCustomerDto(
      {@JsonKey(name: 'customerNumber', defaultValue: '')
      required final String customerNumber,
      @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
      required final String customerNumberShipTo,
      @JsonKey(name: 'salesOrganisation', defaultValue: '')
      required final String salesOrganisation,
      @JsonKey(name: 'division', defaultValue: '')
      required final String division}) = _$SubmitOrderCustomerDtoImpl;
  const _SubmitOrderCustomerDto._() : super._();

  factory _SubmitOrderCustomerDto.fromJson(Map<String, dynamic> json) =
      _$SubmitOrderCustomerDtoImpl.fromJson;

  @override
  @JsonKey(name: 'customerNumber', defaultValue: '')
  String get customerNumber;
  @override
  @JsonKey(name: 'customerNumberShipTo', defaultValue: '')
  String get customerNumberShipTo;
  @override
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  String get salesOrganisation;
  @override
  @JsonKey(name: 'division', defaultValue: '')
  String get division;
  @override
  @JsonKey(ignore: true)
  _$$SubmitOrderCustomerDtoImplCopyWith<_$SubmitOrderCustomerDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
