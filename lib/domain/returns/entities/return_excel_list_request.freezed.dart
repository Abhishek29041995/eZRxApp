// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_excel_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnExcelListRequest {
  String get customerCode => throw _privateConstructorUsedError;
  bool get isViewByReturn => throw _privateConstructorUsedError;
  String get shipToInfo => throw _privateConstructorUsedError;
  Username get userName => throw _privateConstructorUsedError;
  ReturnFilter get filter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnExcelListRequestCopyWith<ReturnExcelListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnExcelListRequestCopyWith<$Res> {
  factory $ReturnExcelListRequestCopyWith(ReturnExcelListRequest value,
          $Res Function(ReturnExcelListRequest) then) =
      _$ReturnExcelListRequestCopyWithImpl<$Res, ReturnExcelListRequest>;
  @useResult
  $Res call(
      {String customerCode,
      bool isViewByReturn,
      String shipToInfo,
      Username userName,
      ReturnFilter filter,
      SearchKey searchKey});

  $ReturnFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$ReturnExcelListRequestCopyWithImpl<$Res,
        $Val extends ReturnExcelListRequest>
    implements $ReturnExcelListRequestCopyWith<$Res> {
  _$ReturnExcelListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? isViewByReturn = null,
    Object? shipToInfo = null,
    Object? userName = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      isViewByReturn: null == isViewByReturn
          ? _value.isViewByReturn
          : isViewByReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
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
abstract class _$$ReturnExcelListRequestImplCopyWith<$Res>
    implements $ReturnExcelListRequestCopyWith<$Res> {
  factory _$$ReturnExcelListRequestImplCopyWith(
          _$ReturnExcelListRequestImpl value,
          $Res Function(_$ReturnExcelListRequestImpl) then) =
      __$$ReturnExcelListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerCode,
      bool isViewByReturn,
      String shipToInfo,
      Username userName,
      ReturnFilter filter,
      SearchKey searchKey});

  @override
  $ReturnFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ReturnExcelListRequestImplCopyWithImpl<$Res>
    extends _$ReturnExcelListRequestCopyWithImpl<$Res,
        _$ReturnExcelListRequestImpl>
    implements _$$ReturnExcelListRequestImplCopyWith<$Res> {
  __$$ReturnExcelListRequestImplCopyWithImpl(
      _$ReturnExcelListRequestImpl _value,
      $Res Function(_$ReturnExcelListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? isViewByReturn = null,
    Object? shipToInfo = null,
    Object? userName = null,
    Object? filter = null,
    Object? searchKey = null,
  }) {
    return _then(_$ReturnExcelListRequestImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      isViewByReturn: null == isViewByReturn
          ? _value.isViewByReturn
          : isViewByReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
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

class _$ReturnExcelListRequestImpl extends _ReturnExcelListRequest {
  const _$ReturnExcelListRequestImpl(
      {required this.customerCode,
      required this.isViewByReturn,
      required this.shipToInfo,
      required this.userName,
      required this.filter,
      required this.searchKey})
      : super._();

  @override
  final String customerCode;
  @override
  final bool isViewByReturn;
  @override
  final String shipToInfo;
  @override
  final Username userName;
  @override
  final ReturnFilter filter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnExcelListRequest(customerCode: $customerCode, isViewByReturn: $isViewByReturn, shipToInfo: $shipToInfo, userName: $userName, filter: $filter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnExcelListRequestImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.isViewByReturn, isViewByReturn) ||
                other.isViewByReturn == isViewByReturn) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCode, isViewByReturn,
      shipToInfo, userName, filter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnExcelListRequestImplCopyWith<_$ReturnExcelListRequestImpl>
      get copyWith => __$$ReturnExcelListRequestImplCopyWithImpl<
          _$ReturnExcelListRequestImpl>(this, _$identity);
}

abstract class _ReturnExcelListRequest extends ReturnExcelListRequest {
  const factory _ReturnExcelListRequest(
      {required final String customerCode,
      required final bool isViewByReturn,
      required final String shipToInfo,
      required final Username userName,
      required final ReturnFilter filter,
      required final SearchKey searchKey}) = _$ReturnExcelListRequestImpl;
  const _ReturnExcelListRequest._() : super._();

  @override
  String get customerCode;
  @override
  bool get isViewByReturn;
  @override
  String get shipToInfo;
  @override
  Username get userName;
  @override
  ReturnFilter get filter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$ReturnExcelListRequestImplCopyWith<_$ReturnExcelListRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
