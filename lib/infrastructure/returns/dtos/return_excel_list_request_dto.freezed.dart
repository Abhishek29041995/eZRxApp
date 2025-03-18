// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_excel_list_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnExcelListRequestDto _$ReturnExcelListRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnExcelListRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnExcelListRequestDto {
  @JsonKey(name: 'isViewByReturn', defaultValue: false)
  bool get isViewByReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  ReturnExcelFilterDto get filterQuery => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnExcelListRequestDtoCopyWith<ReturnExcelListRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnExcelListRequestDtoCopyWith<$Res> {
  factory $ReturnExcelListRequestDtoCopyWith(ReturnExcelListRequestDto value,
          $Res Function(ReturnExcelListRequestDto) then) =
      _$ReturnExcelListRequestDtoCopyWithImpl<$Res, ReturnExcelListRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isViewByReturn', defaultValue: false)
      bool isViewByReturn,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      ReturnExcelFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchKey});

  $ReturnExcelFilterDtoCopyWith<$Res> get filterQuery;
}

/// @nodoc
class _$ReturnExcelListRequestDtoCopyWithImpl<$Res,
        $Val extends ReturnExcelListRequestDto>
    implements $ReturnExcelListRequestDtoCopyWith<$Res> {
  _$ReturnExcelListRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isViewByReturn = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? username = null,
    Object? filterQuery = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      isViewByReturn: null == isViewByReturn
          ? _value.isViewByReturn
          : isViewByReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as ReturnExcelFilterDto,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnExcelFilterDtoCopyWith<$Res> get filterQuery {
    return $ReturnExcelFilterDtoCopyWith<$Res>(_value.filterQuery, (value) {
      return _then(_value.copyWith(filterQuery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnExcelListRequestDtoImplCopyWith<$Res>
    implements $ReturnExcelListRequestDtoCopyWith<$Res> {
  factory _$$ReturnExcelListRequestDtoImplCopyWith(
          _$ReturnExcelListRequestDtoImpl value,
          $Res Function(_$ReturnExcelListRequestDtoImpl) then) =
      __$$ReturnExcelListRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isViewByReturn', defaultValue: false)
      bool isViewByReturn,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      ReturnExcelFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchKey});

  @override
  $ReturnExcelFilterDtoCopyWith<$Res> get filterQuery;
}

/// @nodoc
class __$$ReturnExcelListRequestDtoImplCopyWithImpl<$Res>
    extends _$ReturnExcelListRequestDtoCopyWithImpl<$Res,
        _$ReturnExcelListRequestDtoImpl>
    implements _$$ReturnExcelListRequestDtoImplCopyWith<$Res> {
  __$$ReturnExcelListRequestDtoImplCopyWithImpl(
      _$ReturnExcelListRequestDtoImpl _value,
      $Res Function(_$ReturnExcelListRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isViewByReturn = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? username = null,
    Object? filterQuery = null,
    Object? searchKey = null,
  }) {
    return _then(_$ReturnExcelListRequestDtoImpl(
      isViewByReturn: null == isViewByReturn
          ? _value.isViewByReturn
          : isViewByReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as ReturnExcelFilterDto,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnExcelListRequestDtoImpl extends _ReturnExcelListRequestDto {
  const _$ReturnExcelListRequestDtoImpl(
      {@JsonKey(name: 'isViewByReturn', defaultValue: false)
      required this.isViewByReturn,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required this.shipTo,
      @JsonKey(name: 'username', defaultValue: '') required this.username,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      required this.filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') required this.searchKey})
      : super._();

  factory _$ReturnExcelListRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnExcelListRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'isViewByReturn', defaultValue: false)
  final bool isViewByReturn;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'shipTo', defaultValue: '')
  final String shipTo;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @override
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  final ReturnExcelFilterDto filterQuery;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  final String searchKey;

  @override
  String toString() {
    return 'ReturnExcelListRequestDto(isViewByReturn: $isViewByReturn, soldTo: $soldTo, shipTo: $shipTo, username: $username, filterQuery: $filterQuery, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnExcelListRequestDtoImpl &&
            (identical(other.isViewByReturn, isViewByReturn) ||
                other.isViewByReturn == isViewByReturn) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.filterQuery, filterQuery) ||
                other.filterQuery == filterQuery) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isViewByReturn, soldTo, shipTo,
      username, filterQuery, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnExcelListRequestDtoImplCopyWith<_$ReturnExcelListRequestDtoImpl>
      get copyWith => __$$ReturnExcelListRequestDtoImplCopyWithImpl<
          _$ReturnExcelListRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnExcelListRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnExcelListRequestDto extends ReturnExcelListRequestDto {
  const factory _ReturnExcelListRequestDto(
      {@JsonKey(name: 'isViewByReturn', defaultValue: false)
      required final bool isViewByReturn,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required final String shipTo,
      @JsonKey(name: 'username', defaultValue: '')
      required final String username,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      required final ReturnExcelFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '')
      required final String searchKey}) = _$ReturnExcelListRequestDtoImpl;
  const _ReturnExcelListRequestDto._() : super._();

  factory _ReturnExcelListRequestDto.fromJson(Map<String, dynamic> json) =
      _$ReturnExcelListRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'isViewByReturn', defaultValue: false)
  bool get isViewByReturn;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  ReturnExcelFilterDto get filterQuery;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$ReturnExcelListRequestDtoImplCopyWith<_$ReturnExcelListRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
