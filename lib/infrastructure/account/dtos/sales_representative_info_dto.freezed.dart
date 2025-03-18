// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_representative_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesRepresentativeInfoDto _$SalesRepresentativeInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesRepresentativeInfoDto.fromJson(json);
}

/// @nodoc
mixin _$SalesRepresentativeInfoDto {
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniquePrincipalGroup')
  List<String> get uniquePrincipalGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniquePrincipalNumber')
  List<String> get uniquePrincipalNumbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniqueSalesOrganisation')
  List<String> get uniqueSalesOrganisations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesRepresentativeInfoDtoCopyWith<SalesRepresentativeInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRepresentativeInfoDtoCopyWith<$Res> {
  factory $SalesRepresentativeInfoDtoCopyWith(SalesRepresentativeInfoDto value,
          $Res Function(SalesRepresentativeInfoDto) then) =
      _$SalesRepresentativeInfoDtoCopyWithImpl<$Res,
          SalesRepresentativeInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'uniquePrincipalGroup') List<String> uniquePrincipalGroups,
      @JsonKey(name: 'uniquePrincipalNumber')
      List<String> uniquePrincipalNumbers,
      @JsonKey(name: 'uniqueSalesOrganisation')
      List<String> uniqueSalesOrganisations});
}

/// @nodoc
class _$SalesRepresentativeInfoDtoCopyWithImpl<$Res,
        $Val extends SalesRepresentativeInfoDto>
    implements $SalesRepresentativeInfoDtoCopyWith<$Res> {
  _$SalesRepresentativeInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? uniquePrincipalGroups = null,
    Object? uniquePrincipalNumbers = null,
    Object? uniqueSalesOrganisations = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePrincipalGroups: null == uniquePrincipalGroups
          ? _value.uniquePrincipalGroups
          : uniquePrincipalGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniquePrincipalNumbers: null == uniquePrincipalNumbers
          ? _value.uniquePrincipalNumbers
          : uniquePrincipalNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueSalesOrganisations: null == uniqueSalesOrganisations
          ? _value.uniqueSalesOrganisations
          : uniqueSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesRepresentativeInfoDtoImplCopyWith<$Res>
    implements $SalesRepresentativeInfoDtoCopyWith<$Res> {
  factory _$$SalesRepresentativeInfoDtoImplCopyWith(
          _$SalesRepresentativeInfoDtoImpl value,
          $Res Function(_$SalesRepresentativeInfoDtoImpl) then) =
      __$$SalesRepresentativeInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'uniquePrincipalGroup') List<String> uniquePrincipalGroups,
      @JsonKey(name: 'uniquePrincipalNumber')
      List<String> uniquePrincipalNumbers,
      @JsonKey(name: 'uniqueSalesOrganisation')
      List<String> uniqueSalesOrganisations});
}

/// @nodoc
class __$$SalesRepresentativeInfoDtoImplCopyWithImpl<$Res>
    extends _$SalesRepresentativeInfoDtoCopyWithImpl<$Res,
        _$SalesRepresentativeInfoDtoImpl>
    implements _$$SalesRepresentativeInfoDtoImplCopyWith<$Res> {
  __$$SalesRepresentativeInfoDtoImplCopyWithImpl(
      _$SalesRepresentativeInfoDtoImpl _value,
      $Res Function(_$SalesRepresentativeInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? uniquePrincipalGroups = null,
    Object? uniquePrincipalNumbers = null,
    Object? uniqueSalesOrganisations = null,
  }) {
    return _then(_$SalesRepresentativeInfoDtoImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePrincipalGroups: null == uniquePrincipalGroups
          ? _value._uniquePrincipalGroups
          : uniquePrincipalGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniquePrincipalNumbers: null == uniquePrincipalNumbers
          ? _value._uniquePrincipalNumbers
          : uniquePrincipalNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueSalesOrganisations: null == uniqueSalesOrganisations
          ? _value._uniqueSalesOrganisations
          : uniqueSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesRepresentativeInfoDtoImpl extends _SalesRepresentativeInfoDto {
  const _$SalesRepresentativeInfoDtoImpl(
      {@JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'uniquePrincipalGroup')
      required final List<String> uniquePrincipalGroups,
      @JsonKey(name: 'uniquePrincipalNumber')
      required final List<String> uniquePrincipalNumbers,
      @JsonKey(name: 'uniqueSalesOrganisation')
      required final List<String> uniqueSalesOrganisations})
      : _uniquePrincipalGroups = uniquePrincipalGroups,
        _uniquePrincipalNumbers = uniquePrincipalNumbers,
        _uniqueSalesOrganisations = uniqueSalesOrganisations,
        super._();

  factory _$SalesRepresentativeInfoDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesRepresentativeInfoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int count;
  final List<String> _uniquePrincipalGroups;
  @override
  @JsonKey(name: 'uniquePrincipalGroup')
  List<String> get uniquePrincipalGroups {
    if (_uniquePrincipalGroups is EqualUnmodifiableListView)
      return _uniquePrincipalGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalGroups);
  }

  final List<String> _uniquePrincipalNumbers;
  @override
  @JsonKey(name: 'uniquePrincipalNumber')
  List<String> get uniquePrincipalNumbers {
    if (_uniquePrincipalNumbers is EqualUnmodifiableListView)
      return _uniquePrincipalNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalNumbers);
  }

  final List<String> _uniqueSalesOrganisations;
  @override
  @JsonKey(name: 'uniqueSalesOrganisation')
  List<String> get uniqueSalesOrganisations {
    if (_uniqueSalesOrganisations is EqualUnmodifiableListView)
      return _uniqueSalesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueSalesOrganisations);
  }

  @override
  String toString() {
    return 'SalesRepresentativeInfoDto(count: $count, uniquePrincipalGroups: $uniquePrincipalGroups, uniquePrincipalNumbers: $uniquePrincipalNumbers, uniqueSalesOrganisations: $uniqueSalesOrganisations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesRepresentativeInfoDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._uniquePrincipalGroups, _uniquePrincipalGroups) &&
            const DeepCollectionEquality().equals(
                other._uniquePrincipalNumbers, _uniquePrincipalNumbers) &&
            const DeepCollectionEquality().equals(
                other._uniqueSalesOrganisations, _uniqueSalesOrganisations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      const DeepCollectionEquality().hash(_uniquePrincipalGroups),
      const DeepCollectionEquality().hash(_uniquePrincipalNumbers),
      const DeepCollectionEquality().hash(_uniqueSalesOrganisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesRepresentativeInfoDtoImplCopyWith<_$SalesRepresentativeInfoDtoImpl>
      get copyWith => __$$SalesRepresentativeInfoDtoImplCopyWithImpl<
          _$SalesRepresentativeInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesRepresentativeInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _SalesRepresentativeInfoDto extends SalesRepresentativeInfoDto {
  const factory _SalesRepresentativeInfoDto(
          {@JsonKey(name: 'count') required final int count,
          @JsonKey(name: 'uniquePrincipalGroup')
          required final List<String> uniquePrincipalGroups,
          @JsonKey(name: 'uniquePrincipalNumber')
          required final List<String> uniquePrincipalNumbers,
          @JsonKey(name: 'uniqueSalesOrganisation')
          required final List<String> uniqueSalesOrganisations}) =
      _$SalesRepresentativeInfoDtoImpl;
  const _SalesRepresentativeInfoDto._() : super._();

  factory _SalesRepresentativeInfoDto.fromJson(Map<String, dynamic> json) =
      _$SalesRepresentativeInfoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'uniquePrincipalGroup')
  List<String> get uniquePrincipalGroups;
  @override
  @JsonKey(name: 'uniquePrincipalNumber')
  List<String> get uniquePrincipalNumbers;
  @override
  @JsonKey(name: 'uniqueSalesOrganisation')
  List<String> get uniqueSalesOrganisations;
  @override
  @JsonKey(ignore: true)
  _$$SalesRepresentativeInfoDtoImplCopyWith<_$SalesRepresentativeInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
