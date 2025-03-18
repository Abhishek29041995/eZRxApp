// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddRequestParams {
  String get returnReference => throw _privateConstructorUsedError;
  String get specialInstruction => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get soldTo => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddRequestParamsCopyWith<AddRequestParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRequestParamsCopyWith<$Res> {
  factory $AddRequestParamsCopyWith(
          AddRequestParams value, $Res Function(AddRequestParams) then) =
      _$AddRequestParamsCopyWithImpl<$Res, AddRequestParams>;
  @useResult
  $Res call(
      {String returnReference,
      String specialInstruction,
      User user,
      String soldTo,
      List<InvoiceDetails> invoiceDetails});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AddRequestParamsCopyWithImpl<$Res, $Val extends AddRequestParams>
    implements $AddRequestParamsCopyWith<$Res> {
  _$AddRequestParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
    Object? specialInstruction = null,
    Object? user = null,
    Object? soldTo = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_value.copyWith(
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddRequestParamsImplCopyWith<$Res>
    implements $AddRequestParamsCopyWith<$Res> {
  factory _$$AddRequestParamsImplCopyWith(_$AddRequestParamsImpl value,
          $Res Function(_$AddRequestParamsImpl) then) =
      __$$AddRequestParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String returnReference,
      String specialInstruction,
      User user,
      String soldTo,
      List<InvoiceDetails> invoiceDetails});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AddRequestParamsImplCopyWithImpl<$Res>
    extends _$AddRequestParamsCopyWithImpl<$Res, _$AddRequestParamsImpl>
    implements _$$AddRequestParamsImplCopyWith<$Res> {
  __$$AddRequestParamsImplCopyWithImpl(_$AddRequestParamsImpl _value,
      $Res Function(_$AddRequestParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
    Object? specialInstruction = null,
    Object? user = null,
    Object? soldTo = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_$AddRequestParamsImpl(
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ));
  }
}

/// @nodoc

class _$AddRequestParamsImpl extends _AddRequestParams {
  const _$AddRequestParamsImpl(
      {required this.returnReference,
      required this.specialInstruction,
      required this.user,
      required this.soldTo,
      required final List<InvoiceDetails> invoiceDetails})
      : _invoiceDetails = invoiceDetails,
        super._();

  @override
  final String returnReference;
  @override
  final String specialInstruction;
  @override
  final User user;
  @override
  final String soldTo;
  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  String toString() {
    return 'AddRequestParams(returnReference: $returnReference, specialInstruction: $specialInstruction, user: $user, soldTo: $soldTo, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRequestParamsImpl &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnReference,
      specialInstruction,
      user,
      soldTo,
      const DeepCollectionEquality().hash(_invoiceDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRequestParamsImplCopyWith<_$AddRequestParamsImpl> get copyWith =>
      __$$AddRequestParamsImplCopyWithImpl<_$AddRequestParamsImpl>(
          this, _$identity);
}

abstract class _AddRequestParams extends AddRequestParams {
  const factory _AddRequestParams(
          {required final String returnReference,
          required final String specialInstruction,
          required final User user,
          required final String soldTo,
          required final List<InvoiceDetails> invoiceDetails}) =
      _$AddRequestParamsImpl;
  const _AddRequestParams._() : super._();

  @override
  String get returnReference;
  @override
  String get specialInstruction;
  @override
  User get user;
  @override
  String get soldTo;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$AddRequestParamsImplCopyWith<_$AddRequestParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
