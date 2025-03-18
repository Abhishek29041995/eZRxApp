// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnListRequest {
  String get customerCode => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  String get shipToInfo => throw _privateConstructorUsedError;
  Username get userName => throw _privateConstructorUsedError;
  int get first => throw _privateConstructorUsedError;
  int get after => throw _privateConstructorUsedError;
  ReturnFilter get filter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnListRequestCopyWith<ReturnListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListRequestCopyWith<$Res> {
  factory $ReturnListRequestCopyWith(
          ReturnListRequest value, $Res Function(ReturnListRequest) then) =
      _$ReturnListRequestCopyWithImpl<$Res, ReturnListRequest>;
  @useResult
  $Res call(
      {String customerCode,
      SalesOrg salesOrg,
      String shipToInfo,
      Username userName,
      int first,
      int after,
      ReturnFilter filter,
      SearchKey searchKey});

  $ReturnFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$ReturnListRequestCopyWithImpl<$Res, $Val extends ReturnListRequest>
    implements $ReturnListRequestCopyWith<$Res> {
  _$ReturnListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? userName = null,
    Object? first = null,
    Object? after = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get filter {
    return $ReturnFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnListRequestImplCopyWith<$Res>
    implements $ReturnListRequestCopyWith<$Res> {
  factory _$$ReturnListRequestImplCopyWith(_$ReturnListRequestImpl value,
          $Res Function(_$ReturnListRequestImpl) then) =
      __$$ReturnListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerCode,
      SalesOrg salesOrg,
      String shipToInfo,
      Username userName,
      int first,
      int after,
      ReturnFilter filter,
      SearchKey searchKey});

  @override
  $ReturnFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ReturnListRequestImplCopyWithImpl<$Res>
    extends _$ReturnListRequestCopyWithImpl<$Res, _$ReturnListRequestImpl>
    implements _$$ReturnListRequestImplCopyWith<$Res> {
  __$$ReturnListRequestImplCopyWithImpl(_$ReturnListRequestImpl _value,
      $Res Function(_$ReturnListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? salesOrg = null,
    Object? shipToInfo = null,
    Object? userName = null,
    Object? first = null,
    Object? after = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_$ReturnListRequestImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$ReturnListRequestImpl extends _ReturnListRequest {
  const _$ReturnListRequestImpl(
      {required this.customerCode,
      required this.salesOrg,
      required this.shipToInfo,
      required this.userName,
      required this.first,
      required this.after,
      required this.filter,
      required this.searchKey})
      : super._();

  @override
  final String customerCode;
  @override
  final SalesOrg salesOrg;
  @override
  final String shipToInfo;
  @override
  final Username userName;
  @override
  final int first;
  @override
  final int after;
  @override
  final ReturnFilter filter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnListRequest(customerCode: $customerCode, salesOrg: $salesOrg, shipToInfo: $shipToInfo, userName: $userName, first: $first, after: $after, filter: $filter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnListRequestImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCode, salesOrg,
      shipToInfo, userName, first, after, filter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnListRequestImplCopyWith<_$ReturnListRequestImpl> get copyWith =>
      __$$ReturnListRequestImplCopyWithImpl<_$ReturnListRequestImpl>(
          this, _$identity);
}

abstract class _ReturnListRequest extends ReturnListRequest {
  const factory _ReturnListRequest(
      {required final String customerCode,
      required final SalesOrg salesOrg,
      required final String shipToInfo,
      required final Username userName,
      required final int first,
      required final int after,
      required final ReturnFilter filter,
      required final SearchKey searchKey}) = _$ReturnListRequestImpl;
  const _ReturnListRequest._() : super._();

  @override
  String get customerCode;
  @override
  SalesOrg get salesOrg;
  @override
  String get shipToInfo;
  @override
  Username get userName;
  @override
  int get first;
  @override
  int get after;
  @override
  ReturnFilter get filter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$ReturnListRequestImplCopyWith<_$ReturnListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
