// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_management_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClaimManagementFilter {
  List<ClaimType> get claimTypes => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClaimManagementFilterCopyWith<ClaimManagementFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimManagementFilterCopyWith<$Res> {
  factory $ClaimManagementFilterCopyWith(ClaimManagementFilter value,
          $Res Function(ClaimManagementFilter) then) =
      _$ClaimManagementFilterCopyWithImpl<$Res, ClaimManagementFilter>;
  @useResult
  $Res call({List<ClaimType> claimTypes, SearchKey searchKey});
}

/// @nodoc
class _$ClaimManagementFilterCopyWithImpl<$Res,
        $Val extends ClaimManagementFilter>
    implements $ClaimManagementFilterCopyWith<$Res> {
  _$ClaimManagementFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimTypes = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      claimTypes: null == claimTypes
          ? _value.claimTypes
          : claimTypes // ignore: cast_nullable_to_non_nullable
              as List<ClaimType>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimManagementFilterImplCopyWith<$Res>
    implements $ClaimManagementFilterCopyWith<$Res> {
  factory _$$ClaimManagementFilterImplCopyWith(
          _$ClaimManagementFilterImpl value,
          $Res Function(_$ClaimManagementFilterImpl) then) =
      __$$ClaimManagementFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClaimType> claimTypes, SearchKey searchKey});
}

/// @nodoc
class __$$ClaimManagementFilterImplCopyWithImpl<$Res>
    extends _$ClaimManagementFilterCopyWithImpl<$Res,
        _$ClaimManagementFilterImpl>
    implements _$$ClaimManagementFilterImplCopyWith<$Res> {
  __$$ClaimManagementFilterImplCopyWithImpl(_$ClaimManagementFilterImpl _value,
      $Res Function(_$ClaimManagementFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimTypes = null,
    Object? searchKey = null,
  }) {
    return _then(_$ClaimManagementFilterImpl(
      claimTypes: null == claimTypes
          ? _value._claimTypes
          : claimTypes // ignore: cast_nullable_to_non_nullable
              as List<ClaimType>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$ClaimManagementFilterImpl extends _ClaimManagementFilter {
  _$ClaimManagementFilterImpl(
      {required final List<ClaimType> claimTypes, required this.searchKey})
      : _claimTypes = claimTypes,
        super._();

  final List<ClaimType> _claimTypes;
  @override
  List<ClaimType> get claimTypes {
    if (_claimTypes is EqualUnmodifiableListView) return _claimTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_claimTypes);
  }

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ClaimManagementFilter(claimTypes: $claimTypes, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimManagementFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._claimTypes, _claimTypes) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_claimTypes), searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimManagementFilterImplCopyWith<_$ClaimManagementFilterImpl>
      get copyWith => __$$ClaimManagementFilterImplCopyWithImpl<
          _$ClaimManagementFilterImpl>(this, _$identity);
}

abstract class _ClaimManagementFilter extends ClaimManagementFilter {
  factory _ClaimManagementFilter(
      {required final List<ClaimType> claimTypes,
      required final SearchKey searchKey}) = _$ClaimManagementFilterImpl;
  _ClaimManagementFilter._() : super._();

  @override
  List<ClaimType> get claimTypes;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$ClaimManagementFilterImplCopyWith<_$ClaimManagementFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
