// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoaGroup {
  int get createdDate => throw _privateConstructorUsedError;
  List<Soa> get soaList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoaGroupCopyWith<SoaGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaGroupCopyWith<$Res> {
  factory $SoaGroupCopyWith(SoaGroup value, $Res Function(SoaGroup) then) =
      _$SoaGroupCopyWithImpl<$Res, SoaGroup>;
  @useResult
  $Res call({int createdDate, List<Soa> soaList});
}

/// @nodoc
class _$SoaGroupCopyWithImpl<$Res, $Val extends SoaGroup>
    implements $SoaGroupCopyWith<$Res> {
  _$SoaGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? soaList = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as int,
      soaList: null == soaList
          ? _value.soaList
          : soaList // ignore: cast_nullable_to_non_nullable
              as List<Soa>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoaGroupImplCopyWith<$Res>
    implements $SoaGroupCopyWith<$Res> {
  factory _$$SoaGroupImplCopyWith(
          _$SoaGroupImpl value, $Res Function(_$SoaGroupImpl) then) =
      __$$SoaGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int createdDate, List<Soa> soaList});
}

/// @nodoc
class __$$SoaGroupImplCopyWithImpl<$Res>
    extends _$SoaGroupCopyWithImpl<$Res, _$SoaGroupImpl>
    implements _$$SoaGroupImplCopyWith<$Res> {
  __$$SoaGroupImplCopyWithImpl(
      _$SoaGroupImpl _value, $Res Function(_$SoaGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? soaList = null,
  }) {
    return _then(_$SoaGroupImpl(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as int,
      soaList: null == soaList
          ? _value._soaList
          : soaList // ignore: cast_nullable_to_non_nullable
              as List<Soa>,
    ));
  }
}

/// @nodoc

class _$SoaGroupImpl implements _SoaGroup {
  _$SoaGroupImpl({required this.createdDate, required final List<Soa> soaList})
      : _soaList = soaList;

  @override
  final int createdDate;
  final List<Soa> _soaList;
  @override
  List<Soa> get soaList {
    if (_soaList is EqualUnmodifiableListView) return _soaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soaList);
  }

  @override
  String toString() {
    return 'SoaGroup(createdDate: $createdDate, soaList: $soaList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoaGroupImpl &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality().equals(other._soaList, _soaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createdDate, const DeepCollectionEquality().hash(_soaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoaGroupImplCopyWith<_$SoaGroupImpl> get copyWith =>
      __$$SoaGroupImplCopyWithImpl<_$SoaGroupImpl>(this, _$identity);
}

abstract class _SoaGroup implements SoaGroup {
  factory _SoaGroup(
      {required final int createdDate,
      required final List<Soa> soaList}) = _$SoaGroupImpl;

  @override
  int get createdDate;
  @override
  List<Soa> get soaList;
  @override
  @JsonKey(ignore: true)
  _$$SoaGroupImplCopyWith<_$SoaGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
