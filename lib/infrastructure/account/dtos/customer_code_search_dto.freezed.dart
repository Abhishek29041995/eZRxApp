// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerCodeSearchDto _$CustomerCodeSearchDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerCodeSearchDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerCodeSearchDto {
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 24)
  int get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
  bool get filterBlockCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get after => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchKey', defaultValue: '')
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCodeSearchDtoCopyWith<CustomerCodeSearchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeSearchDtoCopyWith<$Res> {
  factory $CustomerCodeSearchDtoCopyWith(CustomerCodeSearchDto value,
          $Res Function(CustomerCodeSearchDto) then) =
      _$CustomerCodeSearchDtoCopyWithImpl<$Res, CustomerCodeSearchDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrganisation', defaultValue: '') String salesOrg,
      @JsonKey(name: 'first', defaultValue: 24) int first,
      @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
      bool filterBlockCustomer,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'searchKey', defaultValue: '') String searchKey});
}

/// @nodoc
class _$CustomerCodeSearchDtoCopyWithImpl<$Res,
        $Val extends CustomerCodeSearchDto>
    implements $CustomerCodeSearchDtoCopyWith<$Res> {
  _$CustomerCodeSearchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? first = null,
    Object? filterBlockCustomer = null,
    Object? after = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      filterBlockCustomer: null == filterBlockCustomer
          ? _value.filterBlockCustomer
          : filterBlockCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerCodeSearchDtoImplCopyWith<$Res>
    implements $CustomerCodeSearchDtoCopyWith<$Res> {
  factory _$$CustomerCodeSearchDtoImplCopyWith(
          _$CustomerCodeSearchDtoImpl value,
          $Res Function(_$CustomerCodeSearchDtoImpl) then) =
      __$$CustomerCodeSearchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrganisation', defaultValue: '') String salesOrg,
      @JsonKey(name: 'first', defaultValue: 24) int first,
      @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
      bool filterBlockCustomer,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'searchKey', defaultValue: '') String searchKey});
}

/// @nodoc
class __$$CustomerCodeSearchDtoImplCopyWithImpl<$Res>
    extends _$CustomerCodeSearchDtoCopyWithImpl<$Res,
        _$CustomerCodeSearchDtoImpl>
    implements _$$CustomerCodeSearchDtoImplCopyWith<$Res> {
  __$$CustomerCodeSearchDtoImplCopyWithImpl(_$CustomerCodeSearchDtoImpl _value,
      $Res Function(_$CustomerCodeSearchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? first = null,
    Object? filterBlockCustomer = null,
    Object? after = null,
    Object? searchKey = null,
  }) {
    return _then(_$CustomerCodeSearchDtoImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      filterBlockCustomer: null == filterBlockCustomer
          ? _value.filterBlockCustomer
          : filterBlockCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCodeSearchDtoImpl extends _CustomerCodeSearchDto {
  const _$CustomerCodeSearchDtoImpl(
      {@JsonKey(name: 'salesOrganisation', defaultValue: '')
      required this.salesOrg,
      @JsonKey(name: 'first', defaultValue: 24) required this.first,
      @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
      required this.filterBlockCustomer,
      @JsonKey(name: 'after', defaultValue: 0) required this.after,
      @JsonKey(name: 'searchKey', defaultValue: '') required this.searchKey})
      : super._();

  factory _$CustomerCodeSearchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCodeSearchDtoImplFromJson(json);

  @override
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'first', defaultValue: 24)
  final int first;
  @override
  @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
  final bool filterBlockCustomer;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int after;
  @override
  @JsonKey(name: 'searchKey', defaultValue: '')
  final String searchKey;

  @override
  String toString() {
    return 'CustomerCodeSearchDto(salesOrg: $salesOrg, first: $first, filterBlockCustomer: $filterBlockCustomer, after: $after, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCodeSearchDtoImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.filterBlockCustomer, filterBlockCustomer) ||
                other.filterBlockCustomer == filterBlockCustomer) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrg, first, filterBlockCustomer, after, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCodeSearchDtoImplCopyWith<_$CustomerCodeSearchDtoImpl>
      get copyWith => __$$CustomerCodeSearchDtoImplCopyWithImpl<
          _$CustomerCodeSearchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCodeSearchDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerCodeSearchDto extends CustomerCodeSearchDto {
  const factory _CustomerCodeSearchDto(
      {@JsonKey(name: 'salesOrganisation', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'first', defaultValue: 24) required final int first,
      @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
      required final bool filterBlockCustomer,
      @JsonKey(name: 'after', defaultValue: 0) required final int after,
      @JsonKey(name: 'searchKey', defaultValue: '')
      required final String searchKey}) = _$CustomerCodeSearchDtoImpl;
  const _CustomerCodeSearchDto._() : super._();

  factory _CustomerCodeSearchDto.fromJson(Map<String, dynamic> json) =
      _$CustomerCodeSearchDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrganisation', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'first', defaultValue: 24)
  int get first;
  @override
  @JsonKey(name: 'filterBlockCustomer', defaultValue: false)
  bool get filterBlockCustomer;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get after;
  @override
  @JsonKey(name: 'searchKey', defaultValue: '')
  String get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$CustomerCodeSearchDtoImplCopyWith<_$CustomerCodeSearchDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
