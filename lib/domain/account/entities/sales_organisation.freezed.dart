// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrganisation {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  List<SalesOrgCustomerInfo> get customerInfos =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrganisationCopyWith<SalesOrganisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationCopyWith<$Res> {
  factory $SalesOrganisationCopyWith(
          SalesOrganisation value, $Res Function(SalesOrganisation) then) =
      _$SalesOrganisationCopyWithImpl<$Res, SalesOrganisation>;
  @useResult
  $Res call({SalesOrg salesOrg, List<SalesOrgCustomerInfo> customerInfos});
}

/// @nodoc
class _$SalesOrganisationCopyWithImpl<$Res, $Val extends SalesOrganisation>
    implements $SalesOrganisationCopyWith<$Res> {
  _$SalesOrganisationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerInfos = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      customerInfos: null == customerInfos
          ? _value.customerInfos
          : customerInfos // ignore: cast_nullable_to_non_nullable
              as List<SalesOrgCustomerInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrganisationImplCopyWith<$Res>
    implements $SalesOrganisationCopyWith<$Res> {
  factory _$$SalesOrganisationImplCopyWith(_$SalesOrganisationImpl value,
          $Res Function(_$SalesOrganisationImpl) then) =
      __$$SalesOrganisationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg, List<SalesOrgCustomerInfo> customerInfos});
}

/// @nodoc
class __$$SalesOrganisationImplCopyWithImpl<$Res>
    extends _$SalesOrganisationCopyWithImpl<$Res, _$SalesOrganisationImpl>
    implements _$$SalesOrganisationImplCopyWith<$Res> {
  __$$SalesOrganisationImplCopyWithImpl(_$SalesOrganisationImpl _value,
      $Res Function(_$SalesOrganisationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? customerInfos = null,
  }) {
    return _then(_$SalesOrganisationImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      customerInfos: null == customerInfos
          ? _value._customerInfos
          : customerInfos // ignore: cast_nullable_to_non_nullable
              as List<SalesOrgCustomerInfo>,
    ));
  }
}

/// @nodoc

class _$SalesOrganisationImpl extends _SalesOrganisation {
  const _$SalesOrganisationImpl(
      {required this.salesOrg,
      required final List<SalesOrgCustomerInfo> customerInfos})
      : _customerInfos = customerInfos,
        super._();

  @override
  final SalesOrg salesOrg;
  final List<SalesOrgCustomerInfo> _customerInfos;
  @override
  List<SalesOrgCustomerInfo> get customerInfos {
    if (_customerInfos is EqualUnmodifiableListView) return _customerInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerInfos);
  }

  @override
  String toString() {
    return 'SalesOrganisation(salesOrg: $salesOrg, customerInfos: $customerInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrganisationImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._customerInfos, _customerInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg,
      const DeepCollectionEquality().hash(_customerInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrganisationImplCopyWith<_$SalesOrganisationImpl> get copyWith =>
      __$$SalesOrganisationImplCopyWithImpl<_$SalesOrganisationImpl>(
          this, _$identity);
}

abstract class _SalesOrganisation extends SalesOrganisation {
  const factory _SalesOrganisation(
          {required final SalesOrg salesOrg,
          required final List<SalesOrgCustomerInfo> customerInfos}) =
      _$SalesOrganisationImpl;
  const _SalesOrganisation._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  List<SalesOrgCustomerInfo> get customerInfos;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrganisationImplCopyWith<_$SalesOrganisationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
