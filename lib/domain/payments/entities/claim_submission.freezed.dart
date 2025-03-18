// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClaimSubmission {
  PrincipalData get principal => throw _privateConstructorUsedError;
  ClaimType get claimType => throw _privateConstructorUsedError;
  double get claimAmount => throw _privateConstructorUsedError;
  String get claimDetails => throw _privateConstructorUsedError;
  List<PlatformFile> get documents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClaimSubmissionCopyWith<ClaimSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimSubmissionCopyWith<$Res> {
  factory $ClaimSubmissionCopyWith(
          ClaimSubmission value, $Res Function(ClaimSubmission) then) =
      _$ClaimSubmissionCopyWithImpl<$Res, ClaimSubmission>;
  @useResult
  $Res call(
      {PrincipalData principal,
      ClaimType claimType,
      double claimAmount,
      String claimDetails,
      List<PlatformFile> documents});

  $PrincipalDataCopyWith<$Res> get principal;
}

/// @nodoc
class _$ClaimSubmissionCopyWithImpl<$Res, $Val extends ClaimSubmission>
    implements $ClaimSubmissionCopyWith<$Res> {
  _$ClaimSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principal = null,
    Object? claimType = null,
    Object? claimAmount = null,
    Object? claimDetails = null,
    Object? documents = null,
  }) {
    return _then(_value.copyWith(
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      claimType: null == claimType
          ? _value.claimType
          : claimType // ignore: cast_nullable_to_non_nullable
              as ClaimType,
      claimAmount: null == claimAmount
          ? _value.claimAmount
          : claimAmount // ignore: cast_nullable_to_non_nullable
              as double,
      claimDetails: null == claimDetails
          ? _value.claimDetails
          : claimDetails // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principal {
    return $PrincipalDataCopyWith<$Res>(_value.principal, (value) {
      return _then(_value.copyWith(principal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClaimSubmissionImplCopyWith<$Res>
    implements $ClaimSubmissionCopyWith<$Res> {
  factory _$$ClaimSubmissionImplCopyWith(_$ClaimSubmissionImpl value,
          $Res Function(_$ClaimSubmissionImpl) then) =
      __$$ClaimSubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PrincipalData principal,
      ClaimType claimType,
      double claimAmount,
      String claimDetails,
      List<PlatformFile> documents});

  @override
  $PrincipalDataCopyWith<$Res> get principal;
}

/// @nodoc
class __$$ClaimSubmissionImplCopyWithImpl<$Res>
    extends _$ClaimSubmissionCopyWithImpl<$Res, _$ClaimSubmissionImpl>
    implements _$$ClaimSubmissionImplCopyWith<$Res> {
  __$$ClaimSubmissionImplCopyWithImpl(
      _$ClaimSubmissionImpl _value, $Res Function(_$ClaimSubmissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principal = null,
    Object? claimType = null,
    Object? claimAmount = null,
    Object? claimDetails = null,
    Object? documents = null,
  }) {
    return _then(_$ClaimSubmissionImpl(
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      claimType: null == claimType
          ? _value.claimType
          : claimType // ignore: cast_nullable_to_non_nullable
              as ClaimType,
      claimAmount: null == claimAmount
          ? _value.claimAmount
          : claimAmount // ignore: cast_nullable_to_non_nullable
              as double,
      claimDetails: null == claimDetails
          ? _value.claimDetails
          : claimDetails // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }
}

/// @nodoc

class _$ClaimSubmissionImpl extends _ClaimSubmission {
  const _$ClaimSubmissionImpl(
      {required this.principal,
      required this.claimType,
      required this.claimAmount,
      required this.claimDetails,
      required final List<PlatformFile> documents})
      : _documents = documents,
        super._();

  @override
  final PrincipalData principal;
  @override
  final ClaimType claimType;
  @override
  final double claimAmount;
  @override
  final String claimDetails;
  final List<PlatformFile> _documents;
  @override
  List<PlatformFile> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'ClaimSubmission(principal: $principal, claimType: $claimType, claimAmount: $claimAmount, claimDetails: $claimDetails, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimSubmissionImpl &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.claimType, claimType) ||
                other.claimType == claimType) &&
            (identical(other.claimAmount, claimAmount) ||
                other.claimAmount == claimAmount) &&
            (identical(other.claimDetails, claimDetails) ||
                other.claimDetails == claimDetails) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      principal,
      claimType,
      claimAmount,
      claimDetails,
      const DeepCollectionEquality().hash(_documents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimSubmissionImplCopyWith<_$ClaimSubmissionImpl> get copyWith =>
      __$$ClaimSubmissionImplCopyWithImpl<_$ClaimSubmissionImpl>(
          this, _$identity);
}

abstract class _ClaimSubmission extends ClaimSubmission {
  const factory _ClaimSubmission(
      {required final PrincipalData principal,
      required final ClaimType claimType,
      required final double claimAmount,
      required final String claimDetails,
      required final List<PlatformFile> documents}) = _$ClaimSubmissionImpl;
  const _ClaimSubmission._() : super._();

  @override
  PrincipalData get principal;
  @override
  ClaimType get claimType;
  @override
  double get claimAmount;
  @override
  String get claimDetails;
  @override
  List<PlatformFile> get documents;
  @override
  @JsonKey(ignore: true)
  _$$ClaimSubmissionImplCopyWith<_$ClaimSubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
