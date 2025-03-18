// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_customer_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCustomerInformationDto _$PaymentCustomerInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentCustomerInformationDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentCustomerInformationDto {
  @JsonKey(name: 'paymentTerm')
  String get paymentTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList => throw _privateConstructorUsedError;
  @JsonKey(name: 'billTo')
  List<BillToDto> get billToDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCustomerInformationDtoCopyWith<PaymentCustomerInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationDtoCopyWith<$Res> {
  factory $PaymentCustomerInformationDtoCopyWith(
          PaymentCustomerInformationDto value,
          $Res Function(PaymentCustomerInformationDto) then) =
      _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
          PaymentCustomerInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTerm') String paymentTerm,
      @JsonKey(name: 'shipTo') List<ShipToDto> shipToDtoList,
      @JsonKey(name: 'billTo') List<BillToDto> billToDto});
}

/// @nodoc
class _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
        $Val extends PaymentCustomerInformationDto>
    implements $PaymentCustomerInformationDtoCopyWith<$Res> {
  _$PaymentCustomerInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToDtoList = null,
    Object? billToDto = null,
  }) {
    return _then(_value.copyWith(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToDtoList: null == shipToDtoList
          ? _value.shipToDtoList
          : shipToDtoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToDto>,
      billToDto: null == billToDto
          ? _value.billToDto
          : billToDto // ignore: cast_nullable_to_non_nullable
              as List<BillToDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCustomerInformationDtoImplCopyWith<$Res>
    implements $PaymentCustomerInformationDtoCopyWith<$Res> {
  factory _$$PaymentCustomerInformationDtoImplCopyWith(
          _$PaymentCustomerInformationDtoImpl value,
          $Res Function(_$PaymentCustomerInformationDtoImpl) then) =
      __$$PaymentCustomerInformationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTerm') String paymentTerm,
      @JsonKey(name: 'shipTo') List<ShipToDto> shipToDtoList,
      @JsonKey(name: 'billTo') List<BillToDto> billToDto});
}

/// @nodoc
class __$$PaymentCustomerInformationDtoImplCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
        _$PaymentCustomerInformationDtoImpl>
    implements _$$PaymentCustomerInformationDtoImplCopyWith<$Res> {
  __$$PaymentCustomerInformationDtoImplCopyWithImpl(
      _$PaymentCustomerInformationDtoImpl _value,
      $Res Function(_$PaymentCustomerInformationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToDtoList = null,
    Object? billToDto = null,
  }) {
    return _then(_$PaymentCustomerInformationDtoImpl(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToDtoList: null == shipToDtoList
          ? _value._shipToDtoList
          : shipToDtoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToDto>,
      billToDto: null == billToDto
          ? _value._billToDto
          : billToDto // ignore: cast_nullable_to_non_nullable
              as List<BillToDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCustomerInformationDtoImpl
    extends _PaymentCustomerInformationDto {
  const _$PaymentCustomerInformationDtoImpl(
      {@JsonKey(name: 'paymentTerm') required this.paymentTerm,
      @JsonKey(name: 'shipTo') required final List<ShipToDto> shipToDtoList,
      @JsonKey(name: 'billTo') required final List<BillToDto> billToDto})
      : _shipToDtoList = shipToDtoList,
        _billToDto = billToDto,
        super._();

  factory _$PaymentCustomerInformationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaymentCustomerInformationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentTerm')
  final String paymentTerm;
  final List<ShipToDto> _shipToDtoList;
  @override
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList {
    if (_shipToDtoList is EqualUnmodifiableListView) return _shipToDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToDtoList);
  }

  final List<BillToDto> _billToDto;
  @override
  @JsonKey(name: 'billTo')
  List<BillToDto> get billToDto {
    if (_billToDto is EqualUnmodifiableListView) return _billToDto;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billToDto);
  }

  @override
  String toString() {
    return 'PaymentCustomerInformationDto(paymentTerm: $paymentTerm, shipToDtoList: $shipToDtoList, billToDto: $billToDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCustomerInformationDtoImpl &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm) &&
            const DeepCollectionEquality()
                .equals(other._shipToDtoList, _shipToDtoList) &&
            const DeepCollectionEquality()
                .equals(other._billToDto, _billToDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentTerm,
      const DeepCollectionEquality().hash(_shipToDtoList),
      const DeepCollectionEquality().hash(_billToDto));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCustomerInformationDtoImplCopyWith<
          _$PaymentCustomerInformationDtoImpl>
      get copyWith => __$$PaymentCustomerInformationDtoImplCopyWithImpl<
          _$PaymentCustomerInformationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCustomerInformationDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentCustomerInformationDto
    extends PaymentCustomerInformationDto {
  const factory _PaymentCustomerInformationDto(
          {@JsonKey(name: 'paymentTerm') required final String paymentTerm,
          @JsonKey(name: 'shipTo') required final List<ShipToDto> shipToDtoList,
          @JsonKey(name: 'billTo') required final List<BillToDto> billToDto}) =
      _$PaymentCustomerInformationDtoImpl;
  const _PaymentCustomerInformationDto._() : super._();

  factory _PaymentCustomerInformationDto.fromJson(Map<String, dynamic> json) =
      _$PaymentCustomerInformationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentTerm')
  String get paymentTerm;
  @override
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList;
  @override
  @JsonKey(name: 'billTo')
  List<BillToDto> get billToDto;
  @override
  @JsonKey(ignore: true)
  _$$PaymentCustomerInformationDtoImplCopyWith<
          _$PaymentCustomerInformationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
