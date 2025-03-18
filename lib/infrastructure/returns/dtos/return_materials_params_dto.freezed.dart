// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_materials_params_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnMaterialsParamsDto _$ReturnMaterialsParamsDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnMaterialsParamsDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnMaterialsParamsDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 0)
  int get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get after => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
  ReturnItemsFilterDto get filter => throw _privateConstructorUsedError;
  @JsonKey(name: 'language', defaultValue: '')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnMaterialsParamsDtoCopyWith<ReturnMaterialsParamsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnMaterialsParamsDtoCopyWith<$Res> {
  factory $ReturnMaterialsParamsDtoCopyWith(ReturnMaterialsParamsDto value,
          $Res Function(ReturnMaterialsParamsDto) then) =
      _$ReturnMaterialsParamsDtoCopyWithImpl<$Res, ReturnMaterialsParamsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchFilter,
      @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
      ReturnItemsFilterDto filter,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'username', defaultValue: '') String username});

  $ReturnItemsFilterDtoCopyWith<$Res> get filter;
}

/// @nodoc
class _$ReturnMaterialsParamsDtoCopyWithImpl<$Res,
        $Val extends ReturnMaterialsParamsDto>
    implements $ReturnMaterialsParamsDtoCopyWith<$Res> {
  _$ReturnMaterialsParamsDtoCopyWithImpl(this._value, this._then);

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
    Object? first = null,
    Object? after = null,
    Object? searchFilter = null,
    Object? filter = null,
    Object? language = null,
    Object? username = null,
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
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilterDto,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemsFilterDtoCopyWith<$Res> get filter {
    return $ReturnItemsFilterDtoCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnMaterialsParamsDtoImplCopyWith<$Res>
    implements $ReturnMaterialsParamsDtoCopyWith<$Res> {
  factory _$$ReturnMaterialsParamsDtoImplCopyWith(
          _$ReturnMaterialsParamsDtoImpl value,
          $Res Function(_$ReturnMaterialsParamsDtoImpl) then) =
      __$$ReturnMaterialsParamsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') String shipTo,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'searchFilter', defaultValue: '') String searchFilter,
      @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
      ReturnItemsFilterDto filter,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'username', defaultValue: '') String username});

  @override
  $ReturnItemsFilterDtoCopyWith<$Res> get filter;
}

/// @nodoc
class __$$ReturnMaterialsParamsDtoImplCopyWithImpl<$Res>
    extends _$ReturnMaterialsParamsDtoCopyWithImpl<$Res,
        _$ReturnMaterialsParamsDtoImpl>
    implements _$$ReturnMaterialsParamsDtoImplCopyWith<$Res> {
  __$$ReturnMaterialsParamsDtoImplCopyWithImpl(
      _$ReturnMaterialsParamsDtoImpl _value,
      $Res Function(_$ReturnMaterialsParamsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? first = null,
    Object? after = null,
    Object? searchFilter = null,
    Object? filter = null,
    Object? language = null,
    Object? username = null,
  }) {
    return _then(_$ReturnMaterialsParamsDtoImpl(
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
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilterDto,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnMaterialsParamsDtoImpl extends _ReturnMaterialsParamsDto {
  const _$ReturnMaterialsParamsDtoImpl(
      {@JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required this.shipTo,
      @JsonKey(name: 'first', defaultValue: 0) required this.first,
      @JsonKey(name: 'after', defaultValue: 0) required this.after,
      @JsonKey(name: 'searchFilter', defaultValue: '')
      required this.searchFilter,
      @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
      required this.filter,
      @JsonKey(name: 'language', defaultValue: '') required this.language,
      @JsonKey(name: 'username', defaultValue: '') required this.username})
      : super._();

  factory _$ReturnMaterialsParamsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnMaterialsParamsDtoImplFromJson(json);

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
  @JsonKey(name: 'first', defaultValue: 0)
  final int first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int after;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  final String searchFilter;
  @override
  @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
  final ReturnItemsFilterDto filter;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  final String language;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  @override
  String toString() {
    return 'ReturnMaterialsParamsDto(salesOrg: $salesOrg, soldTo: $soldTo, shipTo: $shipTo, first: $first, after: $after, searchFilter: $searchFilter, filter: $filter, language: $language, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnMaterialsParamsDtoImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.searchFilter, searchFilter) ||
                other.searchFilter == searchFilter) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, soldTo, shipTo, first,
      after, searchFilter, filter, language, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnMaterialsParamsDtoImplCopyWith<_$ReturnMaterialsParamsDtoImpl>
      get copyWith => __$$ReturnMaterialsParamsDtoImplCopyWithImpl<
          _$ReturnMaterialsParamsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnMaterialsParamsDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnMaterialsParamsDto extends ReturnMaterialsParamsDto {
  const factory _ReturnMaterialsParamsDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: '') required final String shipTo,
      @JsonKey(name: 'first', defaultValue: 0) required final int first,
      @JsonKey(name: 'after', defaultValue: 0) required final int after,
      @JsonKey(name: 'searchFilter', defaultValue: '')
      required final String searchFilter,
      @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
      required final ReturnItemsFilterDto filter,
      @JsonKey(name: 'language', defaultValue: '')
      required final String language,
      @JsonKey(name: 'username', defaultValue: '')
      required final String username}) = _$ReturnMaterialsParamsDtoImpl;
  const _ReturnMaterialsParamsDto._() : super._();

  factory _ReturnMaterialsParamsDto.fromJson(Map<String, dynamic> json) =
      _$ReturnMaterialsParamsDtoImpl.fromJson;

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
  @JsonKey(name: 'first', defaultValue: 0)
  int get first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get after;
  @override
  @JsonKey(name: 'searchFilter', defaultValue: '')
  String get searchFilter;
  @override
  @JsonKey(name: 'filter', defaultValue: null, includeToJson: false)
  ReturnItemsFilterDto get filter;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  String get language;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$ReturnMaterialsParamsDtoImplCopyWith<_$ReturnMaterialsParamsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
