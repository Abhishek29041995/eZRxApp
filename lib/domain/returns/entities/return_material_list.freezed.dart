// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_material_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnMaterialList {
  List<MaterialBasicInformation> get basicInformations =>
      throw _privateConstructorUsedError;
  List<ReturnMaterial> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnMaterialListCopyWith<ReturnMaterialList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnMaterialListCopyWith<$Res> {
  factory $ReturnMaterialListCopyWith(
          ReturnMaterialList value, $Res Function(ReturnMaterialList) then) =
      _$ReturnMaterialListCopyWithImpl<$Res, ReturnMaterialList>;
  @useResult
  $Res call(
      {List<MaterialBasicInformation> basicInformations,
      List<ReturnMaterial> items});
}

/// @nodoc
class _$ReturnMaterialListCopyWithImpl<$Res, $Val extends ReturnMaterialList>
    implements $ReturnMaterialListCopyWith<$Res> {
  _$ReturnMaterialListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      basicInformations: null == basicInformations
          ? _value.basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformation>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnMaterialListImplCopyWith<$Res>
    implements $ReturnMaterialListCopyWith<$Res> {
  factory _$$ReturnMaterialListImplCopyWith(_$ReturnMaterialListImpl value,
          $Res Function(_$ReturnMaterialListImpl) then) =
      __$$ReturnMaterialListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MaterialBasicInformation> basicInformations,
      List<ReturnMaterial> items});
}

/// @nodoc
class __$$ReturnMaterialListImplCopyWithImpl<$Res>
    extends _$ReturnMaterialListCopyWithImpl<$Res, _$ReturnMaterialListImpl>
    implements _$$ReturnMaterialListImplCopyWith<$Res> {
  __$$ReturnMaterialListImplCopyWithImpl(_$ReturnMaterialListImpl _value,
      $Res Function(_$ReturnMaterialListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_$ReturnMaterialListImpl(
      basicInformations: null == basicInformations
          ? _value._basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformation>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
    ));
  }
}

/// @nodoc

class _$ReturnMaterialListImpl extends _ReturnMaterialList {
  const _$ReturnMaterialListImpl(
      {required final List<MaterialBasicInformation> basicInformations,
      required final List<ReturnMaterial> items})
      : _basicInformations = basicInformations,
        _items = items,
        super._();

  final List<MaterialBasicInformation> _basicInformations;
  @override
  List<MaterialBasicInformation> get basicInformations {
    if (_basicInformations is EqualUnmodifiableListView)
      return _basicInformations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicInformations);
  }

  final List<ReturnMaterial> _items;
  @override
  List<ReturnMaterial> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnMaterialList(basicInformations: $basicInformations, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnMaterialListImpl &&
            const DeepCollectionEquality()
                .equals(other._basicInformations, _basicInformations) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_basicInformations),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnMaterialListImplCopyWith<_$ReturnMaterialListImpl> get copyWith =>
      __$$ReturnMaterialListImplCopyWithImpl<_$ReturnMaterialListImpl>(
          this, _$identity);
}

abstract class _ReturnMaterialList extends ReturnMaterialList {
  const factory _ReturnMaterialList(
      {required final List<MaterialBasicInformation> basicInformations,
      required final List<ReturnMaterial> items}) = _$ReturnMaterialListImpl;
  const _ReturnMaterialList._() : super._();

  @override
  List<MaterialBasicInformation> get basicInformations;
  @override
  List<ReturnMaterial> get items;
  @override
  @JsonKey(ignore: true)
  _$$ReturnMaterialListImplCopyWith<_$ReturnMaterialListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
