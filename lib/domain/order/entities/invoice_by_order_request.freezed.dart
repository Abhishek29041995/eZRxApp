// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_by_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceByOrderRequest {
  String get customerCodeSoldTo => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get offSet => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceByOrderRequestCopyWith<InvoiceByOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceByOrderRequestCopyWith<$Res> {
  factory $InvoiceByOrderRequestCopyWith(InvoiceByOrderRequest value,
          $Res Function(InvoiceByOrderRequest) then) =
      _$InvoiceByOrderRequestCopyWithImpl<$Res, InvoiceByOrderRequest>;
  @useResult
  $Res call(
      {String customerCodeSoldTo,
      String language,
      int pageSize,
      int offSet,
      String orderNumber});
}

/// @nodoc
class _$InvoiceByOrderRequestCopyWithImpl<$Res,
        $Val extends InvoiceByOrderRequest>
    implements $InvoiceByOrderRequestCopyWith<$Res> {
  _$InvoiceByOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeSoldTo = null,
    Object? language = null,
    Object? pageSize = null,
    Object? offSet = null,
    Object? orderNumber = null,
  }) {
    return _then(_value.copyWith(
      customerCodeSoldTo: null == customerCodeSoldTo
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offSet: null == offSet
          ? _value.offSet
          : offSet // ignore: cast_nullable_to_non_nullable
              as int,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceByOrderRequestImplCopyWith<$Res>
    implements $InvoiceByOrderRequestCopyWith<$Res> {
  factory _$$InvoiceByOrderRequestImplCopyWith(
          _$InvoiceByOrderRequestImpl value,
          $Res Function(_$InvoiceByOrderRequestImpl) then) =
      __$$InvoiceByOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerCodeSoldTo,
      String language,
      int pageSize,
      int offSet,
      String orderNumber});
}

/// @nodoc
class __$$InvoiceByOrderRequestImplCopyWithImpl<$Res>
    extends _$InvoiceByOrderRequestCopyWithImpl<$Res,
        _$InvoiceByOrderRequestImpl>
    implements _$$InvoiceByOrderRequestImplCopyWith<$Res> {
  __$$InvoiceByOrderRequestImplCopyWithImpl(_$InvoiceByOrderRequestImpl _value,
      $Res Function(_$InvoiceByOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeSoldTo = null,
    Object? language = null,
    Object? pageSize = null,
    Object? offSet = null,
    Object? orderNumber = null,
  }) {
    return _then(_$InvoiceByOrderRequestImpl(
      customerCodeSoldTo: null == customerCodeSoldTo
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offSet: null == offSet
          ? _value.offSet
          : offSet // ignore: cast_nullable_to_non_nullable
              as int,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvoiceByOrderRequestImpl extends _InvoiceByOrderRequest {
  _$InvoiceByOrderRequestImpl(
      {required this.customerCodeSoldTo,
      required this.language,
      required this.pageSize,
      required this.offSet,
      required this.orderNumber})
      : super._();

  @override
  final String customerCodeSoldTo;
  @override
  final String language;
  @override
  final int pageSize;
  @override
  final int offSet;
  @override
  final String orderNumber;

  @override
  String toString() {
    return 'InvoiceByOrderRequest(customerCodeSoldTo: $customerCodeSoldTo, language: $language, pageSize: $pageSize, offSet: $offSet, orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceByOrderRequestImpl &&
            (identical(other.customerCodeSoldTo, customerCodeSoldTo) ||
                other.customerCodeSoldTo == customerCodeSoldTo) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.offSet, offSet) || other.offSet == offSet) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customerCodeSoldTo, language, pageSize, offSet, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceByOrderRequestImplCopyWith<_$InvoiceByOrderRequestImpl>
      get copyWith => __$$InvoiceByOrderRequestImplCopyWithImpl<
          _$InvoiceByOrderRequestImpl>(this, _$identity);
}

abstract class _InvoiceByOrderRequest extends InvoiceByOrderRequest {
  factory _InvoiceByOrderRequest(
      {required final String customerCodeSoldTo,
      required final String language,
      required final int pageSize,
      required final int offSet,
      required final String orderNumber}) = _$InvoiceByOrderRequestImpl;
  _InvoiceByOrderRequest._() : super._();

  @override
  String get customerCodeSoldTo;
  @override
  String get language;
  @override
  int get pageSize;
  @override
  int get offSet;
  @override
  String get orderNumber;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceByOrderRequestImplCopyWith<_$InvoiceByOrderRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
