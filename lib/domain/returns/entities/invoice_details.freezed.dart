// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceDetails {
  String get invoiceNumber => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  List<ReturnItemDetails> get returnItemDetailsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailsCopyWith<InvoiceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsCopyWith<$Res> {
  factory $InvoiceDetailsCopyWith(
          InvoiceDetails value, $Res Function(InvoiceDetails) then) =
      _$InvoiceDetailsCopyWithImpl<$Res, InvoiceDetails>;
  @useResult
  $Res call(
      {String invoiceNumber,
      SalesOrg salesOrg,
      List<ReturnItemDetails> returnItemDetailsList});
}

/// @nodoc
class _$InvoiceDetailsCopyWithImpl<$Res, $Val extends InvoiceDetails>
    implements $InvoiceDetailsCopyWith<$Res> {
  _$InvoiceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? returnItemDetailsList = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      returnItemDetailsList: null == returnItemDetailsList
          ? _value.returnItemDetailsList
          : returnItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailsImplCopyWith<$Res>
    implements $InvoiceDetailsCopyWith<$Res> {
  factory _$$InvoiceDetailsImplCopyWith(_$InvoiceDetailsImpl value,
          $Res Function(_$InvoiceDetailsImpl) then) =
      __$$InvoiceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invoiceNumber,
      SalesOrg salesOrg,
      List<ReturnItemDetails> returnItemDetailsList});
}

/// @nodoc
class __$$InvoiceDetailsImplCopyWithImpl<$Res>
    extends _$InvoiceDetailsCopyWithImpl<$Res, _$InvoiceDetailsImpl>
    implements _$$InvoiceDetailsImplCopyWith<$Res> {
  __$$InvoiceDetailsImplCopyWithImpl(
      _$InvoiceDetailsImpl _value, $Res Function(_$InvoiceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? returnItemDetailsList = null,
  }) {
    return _then(_$InvoiceDetailsImpl(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      returnItemDetailsList: null == returnItemDetailsList
          ? _value._returnItemDetailsList
          : returnItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetails>,
    ));
  }
}

/// @nodoc

class _$InvoiceDetailsImpl extends _InvoiceDetails {
  const _$InvoiceDetailsImpl(
      {required this.invoiceNumber,
      required this.salesOrg,
      required final List<ReturnItemDetails> returnItemDetailsList})
      : _returnItemDetailsList = returnItemDetailsList,
        super._();

  @override
  final String invoiceNumber;
  @override
  final SalesOrg salesOrg;
  final List<ReturnItemDetails> _returnItemDetailsList;
  @override
  List<ReturnItemDetails> get returnItemDetailsList {
    if (_returnItemDetailsList is EqualUnmodifiableListView)
      return _returnItemDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemDetailsList);
  }

  @override
  String toString() {
    return 'InvoiceDetails(invoiceNumber: $invoiceNumber, salesOrg: $salesOrg, returnItemDetailsList: $returnItemDetailsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailsImpl &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._returnItemDetailsList, _returnItemDetailsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, salesOrg,
      const DeepCollectionEquality().hash(_returnItemDetailsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      __$$InvoiceDetailsImplCopyWithImpl<_$InvoiceDetailsImpl>(
          this, _$identity);
}

abstract class _InvoiceDetails extends InvoiceDetails {
  const factory _InvoiceDetails(
          {required final String invoiceNumber,
          required final SalesOrg salesOrg,
          required final List<ReturnItemDetails> returnItemDetailsList}) =
      _$InvoiceDetailsImpl;
  const _InvoiceDetails._() : super._();

  @override
  String get invoiceNumber;
  @override
  SalesOrg get salesOrg;
  @override
  List<ReturnItemDetails> get returnItemDetailsList;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
