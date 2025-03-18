// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_representative_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesRepresentativeInfo {
  int get count => throw _privateConstructorUsedError;
  List<String> get uniquePrincipalGroup => throw _privateConstructorUsedError;
  List<String> get uniquePrincipalNumber => throw _privateConstructorUsedError;
  List<String> get uniqueSalesOrganisation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesRepresentativeInfoCopyWith<SalesRepresentativeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRepresentativeInfoCopyWith<$Res> {
  factory $SalesRepresentativeInfoCopyWith(SalesRepresentativeInfo value,
          $Res Function(SalesRepresentativeInfo) then) =
      _$SalesRepresentativeInfoCopyWithImpl<$Res, SalesRepresentativeInfo>;
  @useResult
  $Res call(
      {int count,
      List<String> uniquePrincipalGroup,
      List<String> uniquePrincipalNumber,
      List<String> uniqueSalesOrganisation});
}

/// @nodoc
class _$SalesRepresentativeInfoCopyWithImpl<$Res,
        $Val extends SalesRepresentativeInfo>
    implements $SalesRepresentativeInfoCopyWith<$Res> {
  _$SalesRepresentativeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? uniquePrincipalGroup = null,
    Object? uniquePrincipalNumber = null,
    Object? uniqueSalesOrganisation = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePrincipalGroup: null == uniquePrincipalGroup
          ? _value.uniquePrincipalGroup
          : uniquePrincipalGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniquePrincipalNumber: null == uniquePrincipalNumber
          ? _value.uniquePrincipalNumber
          : uniquePrincipalNumber // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueSalesOrganisation: null == uniqueSalesOrganisation
          ? _value.uniqueSalesOrganisation
          : uniqueSalesOrganisation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesRepresentativeInfoImplCopyWith<$Res>
    implements $SalesRepresentativeInfoCopyWith<$Res> {
  factory _$$SalesRepresentativeInfoImplCopyWith(
          _$SalesRepresentativeInfoImpl value,
          $Res Function(_$SalesRepresentativeInfoImpl) then) =
      __$$SalesRepresentativeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      List<String> uniquePrincipalGroup,
      List<String> uniquePrincipalNumber,
      List<String> uniqueSalesOrganisation});
}

/// @nodoc
class __$$SalesRepresentativeInfoImplCopyWithImpl<$Res>
    extends _$SalesRepresentativeInfoCopyWithImpl<$Res,
        _$SalesRepresentativeInfoImpl>
    implements _$$SalesRepresentativeInfoImplCopyWith<$Res> {
  __$$SalesRepresentativeInfoImplCopyWithImpl(
      _$SalesRepresentativeInfoImpl _value,
      $Res Function(_$SalesRepresentativeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? uniquePrincipalGroup = null,
    Object? uniquePrincipalNumber = null,
    Object? uniqueSalesOrganisation = null,
  }) {
    return _then(_$SalesRepresentativeInfoImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePrincipalGroup: null == uniquePrincipalGroup
          ? _value._uniquePrincipalGroup
          : uniquePrincipalGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniquePrincipalNumber: null == uniquePrincipalNumber
          ? _value._uniquePrincipalNumber
          : uniquePrincipalNumber // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueSalesOrganisation: null == uniqueSalesOrganisation
          ? _value._uniqueSalesOrganisation
          : uniqueSalesOrganisation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SalesRepresentativeInfoImpl extends _SalesRepresentativeInfo {
  const _$SalesRepresentativeInfoImpl(
      {required this.count,
      required final List<String> uniquePrincipalGroup,
      required final List<String> uniquePrincipalNumber,
      required final List<String> uniqueSalesOrganisation})
      : _uniquePrincipalGroup = uniquePrincipalGroup,
        _uniquePrincipalNumber = uniquePrincipalNumber,
        _uniqueSalesOrganisation = uniqueSalesOrganisation,
        super._();

  @override
  final int count;
  final List<String> _uniquePrincipalGroup;
  @override
  List<String> get uniquePrincipalGroup {
    if (_uniquePrincipalGroup is EqualUnmodifiableListView)
      return _uniquePrincipalGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalGroup);
  }

  final List<String> _uniquePrincipalNumber;
  @override
  List<String> get uniquePrincipalNumber {
    if (_uniquePrincipalNumber is EqualUnmodifiableListView)
      return _uniquePrincipalNumber;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalNumber);
  }

  final List<String> _uniqueSalesOrganisation;
  @override
  List<String> get uniqueSalesOrganisation {
    if (_uniqueSalesOrganisation is EqualUnmodifiableListView)
      return _uniqueSalesOrganisation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueSalesOrganisation);
  }

  @override
  String toString() {
    return 'SalesRepresentativeInfo(count: $count, uniquePrincipalGroup: $uniquePrincipalGroup, uniquePrincipalNumber: $uniquePrincipalNumber, uniqueSalesOrganisation: $uniqueSalesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesRepresentativeInfoImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._uniquePrincipalGroup, _uniquePrincipalGroup) &&
            const DeepCollectionEquality()
                .equals(other._uniquePrincipalNumber, _uniquePrincipalNumber) &&
            const DeepCollectionEquality().equals(
                other._uniqueSalesOrganisation, _uniqueSalesOrganisation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      const DeepCollectionEquality().hash(_uniquePrincipalGroup),
      const DeepCollectionEquality().hash(_uniquePrincipalNumber),
      const DeepCollectionEquality().hash(_uniqueSalesOrganisation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesRepresentativeInfoImplCopyWith<_$SalesRepresentativeInfoImpl>
      get copyWith => __$$SalesRepresentativeInfoImplCopyWithImpl<
          _$SalesRepresentativeInfoImpl>(this, _$identity);
}

abstract class _SalesRepresentativeInfo extends SalesRepresentativeInfo {
  const factory _SalesRepresentativeInfo(
          {required final int count,
          required final List<String> uniquePrincipalGroup,
          required final List<String> uniquePrincipalNumber,
          required final List<String> uniqueSalesOrganisation}) =
      _$SalesRepresentativeInfoImpl;
  const _SalesRepresentativeInfo._() : super._();

  @override
  int get count;
  @override
  List<String> get uniquePrincipalGroup;
  @override
  List<String> get uniquePrincipalNumber;
  @override
  List<String> get uniqueSalesOrganisation;
  @override
  @JsonKey(ignore: true)
  _$$SalesRepresentativeInfoImplCopyWith<_$SalesRepresentativeInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
