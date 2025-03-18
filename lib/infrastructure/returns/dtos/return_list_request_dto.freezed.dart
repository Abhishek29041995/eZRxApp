// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_list_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnListRequestDto _$ReturnListRequestDtoFromJson(Map<String, dynamic> json) {
  return _ReturnListRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnListRequestDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 0)
  int get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get after => throw _privateConstructorUsedError;
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  ReturnFilterDto get filterQuery => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnListRequestDtoCopyWith<ReturnListRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListRequestDtoCopyWith<$Res> {
  factory $ReturnListRequestDtoCopyWith(ReturnListRequestDto value,
          $Res Function(ReturnListRequestDto) then) =
      _$ReturnListRequestDtoCopyWithImpl<$Res, ReturnListRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      ReturnFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchKey});

  $ReturnFilterDtoCopyWith<$Res> get filterQuery;
}

/// @nodoc
class _$ReturnListRequestDtoCopyWithImpl<$Res,
        $Val extends ReturnListRequestDto>
    implements $ReturnListRequestDtoCopyWith<$Res> {
  _$ReturnListRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? username = null,
    Object? first = null,
    Object? after = null,
    Object? filterQuery = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
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
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as ReturnFilterDto,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterDtoCopyWith<$Res> get filterQuery {
    return $ReturnFilterDtoCopyWith<$Res>(_value.filterQuery, (value) {
      return _then(_value.copyWith(filterQuery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnListRequestDtoImplCopyWith<$Res>
    implements $ReturnListRequestDtoCopyWith<$Res> {
  factory _$$ReturnListRequestDtoImplCopyWith(_$ReturnListRequestDtoImpl value,
          $Res Function(_$ReturnListRequestDtoImpl) then) =
      __$$ReturnListRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      ReturnFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchKey});

  @override
  $ReturnFilterDtoCopyWith<$Res> get filterQuery;
}

/// @nodoc
class __$$ReturnListRequestDtoImplCopyWithImpl<$Res>
    extends _$ReturnListRequestDtoCopyWithImpl<$Res, _$ReturnListRequestDtoImpl>
    implements _$$ReturnListRequestDtoImplCopyWith<$Res> {
  __$$ReturnListRequestDtoImplCopyWithImpl(_$ReturnListRequestDtoImpl _value,
      $Res Function(_$ReturnListRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? username = null,
    Object? first = null,
    Object? after = null,
    Object? filterQuery = null,
    Object? searchKey = null,
  }) {
    return _then(_$ReturnListRequestDtoImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
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
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuery: null == filterQuery
          ? _value.filterQuery
          : filterQuery // ignore: cast_nullable_to_non_nullable
              as ReturnFilterDto,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnListRequestDtoImpl extends _ReturnListRequestDto {
  const _$ReturnListRequestDtoImpl(
      {@JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required this.shipTo,
      @JsonKey(name: 'username', defaultValue: '') required this.username,
      @JsonKey(name: 'first', defaultValue: 0) required this.first,
      @JsonKey(name: 'after', defaultValue: 0) required this.after,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      required this.filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '') required this.searchKey})
      : super._();

  factory _$ReturnListRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnListRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
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
  @JsonKey(name: 'first', defaultValue: 0)
  final int first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int after;
  @override
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  final ReturnFilterDto filterQuery;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  final String searchKey;

  @override
  String toString() {
    return 'ReturnListRequestDto(salesOrg: $salesOrg, soldTo: $soldTo, shipTo: $shipTo, username: $username, first: $first, after: $after, filterQuery: $filterQuery, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnListRequestDtoImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.filterQuery, filterQuery) ||
                other.filterQuery == filterQuery) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, soldTo, shipTo,
      username, first, after, filterQuery, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnListRequestDtoImplCopyWith<_$ReturnListRequestDtoImpl>
      get copyWith =>
          __$$ReturnListRequestDtoImplCopyWithImpl<_$ReturnListRequestDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnListRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnListRequestDto extends ReturnListRequestDto {
  const factory _ReturnListRequestDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required final String shipTo,
      @JsonKey(name: 'username', defaultValue: '')
      required final String username,
      @JsonKey(name: 'first', defaultValue: 0) required final int first,
      @JsonKey(name: 'after', defaultValue: 0) required final int after,
      @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
      required final ReturnFilterDto filterQuery,
      @JsonKey(name: 'searchFilter', defaultValue: '')
      required final String searchKey}) = _$ReturnListRequestDtoImpl;
  const _ReturnListRequestDto._() : super._();

  factory _ReturnListRequestDto.fromJson(Map<String, dynamic> json) =
      _$ReturnListRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
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
  @JsonKey(name: 'first', defaultValue: 0)
  int get first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get after;
  @override
  @JsonKey(name: 'filterQuery', defaultValue: null, includeToJson: false)
  ReturnFilterDto get filterQuery;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$ReturnListRequestDtoImplCopyWith<_$ReturnListRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
