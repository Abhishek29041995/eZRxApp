// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BundleDetails {
  String get bundleName => throw _privateConstructorUsedError;
  String get bundleCode => throw _privateConstructorUsedError;
  List<BundleInfo> get bundleInformation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleDetailsCopyWith<BundleDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleDetailsCopyWith<$Res> {
  factory $BundleDetailsCopyWith(
          BundleDetails value, $Res Function(BundleDetails) then) =
      _$BundleDetailsCopyWithImpl<$Res, BundleDetails>;
  @useResult
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class _$BundleDetailsCopyWithImpl<$Res, $Val extends BundleDetails>
    implements $BundleDetailsCopyWith<$Res> {
  _$BundleDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BundleDetailsImplCopyWith<$Res>
    implements $BundleDetailsCopyWith<$Res> {
  factory _$$BundleDetailsImplCopyWith(
          _$BundleDetailsImpl value, $Res Function(_$BundleDetailsImpl) then) =
      __$$BundleDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bundleName,
      String bundleCode,
      List<BundleInfo> bundleInformation});
}

/// @nodoc
class __$$BundleDetailsImplCopyWithImpl<$Res>
    extends _$BundleDetailsCopyWithImpl<$Res, _$BundleDetailsImpl>
    implements _$$BundleDetailsImplCopyWith<$Res> {
  __$$BundleDetailsImplCopyWithImpl(
      _$BundleDetailsImpl _value, $Res Function(_$BundleDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
  }) {
    return _then(_$BundleDetailsImpl(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
    ));
  }
}

/// @nodoc

class _$BundleDetailsImpl extends _BundleDetails {
  const _$BundleDetailsImpl(
      {required this.bundleName,
      required this.bundleCode,
      required final List<BundleInfo> bundleInformation})
      : _bundleInformation = bundleInformation,
        super._();

  @override
  final String bundleName;
  @override
  final String bundleCode;
  final List<BundleInfo> _bundleInformation;
  @override
  List<BundleInfo> get bundleInformation {
    if (_bundleInformation is EqualUnmodifiableListView)
      return _bundleInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  @override
  String toString() {
    return 'BundleDetails(bundleName: $bundleName, bundleCode: $bundleCode, bundleInformation: $bundleInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleDetailsImpl &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleName, bundleCode,
      const DeepCollectionEquality().hash(_bundleInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleDetailsImplCopyWith<_$BundleDetailsImpl> get copyWith =>
      __$$BundleDetailsImplCopyWithImpl<_$BundleDetailsImpl>(this, _$identity);
}

abstract class _BundleDetails extends BundleDetails {
  const factory _BundleDetails(
      {required final String bundleName,
      required final String bundleCode,
      required final List<BundleInfo> bundleInformation}) = _$BundleDetailsImpl;
  const _BundleDetails._() : super._();

  @override
  String get bundleName;
  @override
  String get bundleCode;
  @override
  List<BundleInfo> get bundleInformation;
  @override
  @JsonKey(ignore: true)
  _$$BundleDetailsImplCopyWith<_$BundleDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
