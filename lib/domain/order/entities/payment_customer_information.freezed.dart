// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_customer_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentCustomerInformation {
  String get paymentTerm => throw _privateConstructorUsedError;
  List<ShipToInfo> get shipToInfoList => throw _privateConstructorUsedError;
  List<BillToInfo> get billToInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentCustomerInformationCopyWith<PaymentCustomerInformation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationCopyWith<$Res> {
  factory $PaymentCustomerInformationCopyWith(PaymentCustomerInformation value,
          $Res Function(PaymentCustomerInformation) then) =
      _$PaymentCustomerInformationCopyWithImpl<$Res,
          PaymentCustomerInformation>;
  @useResult
  $Res call(
      {String paymentTerm,
      List<ShipToInfo> shipToInfoList,
      List<BillToInfo> billToInfo});
}

/// @nodoc
class _$PaymentCustomerInformationCopyWithImpl<$Res,
        $Val extends PaymentCustomerInformation>
    implements $PaymentCustomerInformationCopyWith<$Res> {
  _$PaymentCustomerInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToInfoList = null,
    Object? billToInfo = null,
  }) {
    return _then(_value.copyWith(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfoList: null == shipToInfoList
          ? _value.shipToInfoList
          : shipToInfoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
      billToInfo: null == billToInfo
          ? _value.billToInfo
          : billToInfo // ignore: cast_nullable_to_non_nullable
              as List<BillToInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCustomerInformationImplCopyWith<$Res>
    implements $PaymentCustomerInformationCopyWith<$Res> {
  factory _$$PaymentCustomerInformationImplCopyWith(
          _$PaymentCustomerInformationImpl value,
          $Res Function(_$PaymentCustomerInformationImpl) then) =
      __$$PaymentCustomerInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentTerm,
      List<ShipToInfo> shipToInfoList,
      List<BillToInfo> billToInfo});
}

/// @nodoc
class __$$PaymentCustomerInformationImplCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationCopyWithImpl<$Res,
        _$PaymentCustomerInformationImpl>
    implements _$$PaymentCustomerInformationImplCopyWith<$Res> {
  __$$PaymentCustomerInformationImplCopyWithImpl(
      _$PaymentCustomerInformationImpl _value,
      $Res Function(_$PaymentCustomerInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToInfoList = null,
    Object? billToInfo = null,
  }) {
    return _then(_$PaymentCustomerInformationImpl(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfoList: null == shipToInfoList
          ? _value._shipToInfoList
          : shipToInfoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
      billToInfo: null == billToInfo
          ? _value._billToInfo
          : billToInfo // ignore: cast_nullable_to_non_nullable
              as List<BillToInfo>,
    ));
  }
}

/// @nodoc

class _$PaymentCustomerInformationImpl extends _PaymentCustomerInformation {
  const _$PaymentCustomerInformationImpl(
      {required this.paymentTerm,
      required final List<ShipToInfo> shipToInfoList,
      required final List<BillToInfo> billToInfo})
      : _shipToInfoList = shipToInfoList,
        _billToInfo = billToInfo,
        super._();

  @override
  final String paymentTerm;
  final List<ShipToInfo> _shipToInfoList;
  @override
  List<ShipToInfo> get shipToInfoList {
    if (_shipToInfoList is EqualUnmodifiableListView) return _shipToInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToInfoList);
  }

  final List<BillToInfo> _billToInfo;
  @override
  List<BillToInfo> get billToInfo {
    if (_billToInfo is EqualUnmodifiableListView) return _billToInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billToInfo);
  }

  @override
  String toString() {
    return 'PaymentCustomerInformation(paymentTerm: $paymentTerm, shipToInfoList: $shipToInfoList, billToInfo: $billToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCustomerInformationImpl &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm) &&
            const DeepCollectionEquality()
                .equals(other._shipToInfoList, _shipToInfoList) &&
            const DeepCollectionEquality()
                .equals(other._billToInfo, _billToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentTerm,
      const DeepCollectionEquality().hash(_shipToInfoList),
      const DeepCollectionEquality().hash(_billToInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCustomerInformationImplCopyWith<_$PaymentCustomerInformationImpl>
      get copyWith => __$$PaymentCustomerInformationImplCopyWithImpl<
          _$PaymentCustomerInformationImpl>(this, _$identity);
}

abstract class _PaymentCustomerInformation extends PaymentCustomerInformation {
  const factory _PaymentCustomerInformation(
          {required final String paymentTerm,
          required final List<ShipToInfo> shipToInfoList,
          required final List<BillToInfo> billToInfo}) =
      _$PaymentCustomerInformationImpl;
  const _PaymentCustomerInformation._() : super._();

  @override
  String get paymentTerm;
  @override
  List<ShipToInfo> get shipToInfoList;
  @override
  List<BillToInfo> get billToInfo;
  @override
  @JsonKey(ignore: true)
  _$$PaymentCustomerInformationImplCopyWith<_$PaymentCustomerInformationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
