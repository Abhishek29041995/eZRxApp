// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_material_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnMaterialListDto _$ReturnMaterialListDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnMaterialListDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnMaterialListDto {
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'materials',
      fromJson: _mappingReturnMaterial,
      defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnMaterialListDtoCopyWith<ReturnMaterialListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnMaterialListDtoCopyWith<$Res> {
  factory $ReturnMaterialListDtoCopyWith(ReturnMaterialListDto value,
          $Res Function(ReturnMaterialListDto) then) =
      _$ReturnMaterialListDtoCopyWithImpl<$Res, ReturnMaterialListDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'materialBasicInformation',
          defaultValue: <MaterialBasicInformationDto>[])
      List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials',
          fromJson: _mappingReturnMaterial,
          defaultValue: <ReturnMaterialDto>[])
      List<ReturnMaterialDto> items});
}

/// @nodoc
class _$ReturnMaterialListDtoCopyWithImpl<$Res,
        $Val extends ReturnMaterialListDto>
    implements $ReturnMaterialListDtoCopyWith<$Res> {
  _$ReturnMaterialListDtoCopyWithImpl(this._value, this._then);

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
              as List<MaterialBasicInformationDto>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnMaterialListDtoImplCopyWith<$Res>
    implements $ReturnMaterialListDtoCopyWith<$Res> {
  factory _$$ReturnMaterialListDtoImplCopyWith(
          _$ReturnMaterialListDtoImpl value,
          $Res Function(_$ReturnMaterialListDtoImpl) then) =
      __$$ReturnMaterialListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'materialBasicInformation',
          defaultValue: <MaterialBasicInformationDto>[])
      List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials',
          fromJson: _mappingReturnMaterial,
          defaultValue: <ReturnMaterialDto>[])
      List<ReturnMaterialDto> items});
}

/// @nodoc
class __$$ReturnMaterialListDtoImplCopyWithImpl<$Res>
    extends _$ReturnMaterialListDtoCopyWithImpl<$Res,
        _$ReturnMaterialListDtoImpl>
    implements _$$ReturnMaterialListDtoImplCopyWith<$Res> {
  __$$ReturnMaterialListDtoImplCopyWithImpl(_$ReturnMaterialListDtoImpl _value,
      $Res Function(_$ReturnMaterialListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_$ReturnMaterialListDtoImpl(
      basicInformations: null == basicInformations
          ? _value._basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformationDto>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnMaterialListDtoImpl extends _ReturnMaterialListDto {
  const _$ReturnMaterialListDtoImpl(
      {@JsonKey(
          name: 'materialBasicInformation',
          defaultValue: <MaterialBasicInformationDto>[])
      required final List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials',
          fromJson: _mappingReturnMaterial,
          defaultValue: <ReturnMaterialDto>[])
      required final List<ReturnMaterialDto> items})
      : _basicInformations = basicInformations,
        _items = items,
        super._();

  factory _$ReturnMaterialListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnMaterialListDtoImplFromJson(json);

  final List<MaterialBasicInformationDto> _basicInformations;
  @override
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations {
    if (_basicInformations is EqualUnmodifiableListView)
      return _basicInformations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicInformations);
  }

  final List<ReturnMaterialDto> _items;
  @override
  @JsonKey(
      name: 'materials',
      fromJson: _mappingReturnMaterial,
      defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnMaterialListDto(basicInformations: $basicInformations, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnMaterialListDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._basicInformations, _basicInformations) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_basicInformations),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnMaterialListDtoImplCopyWith<_$ReturnMaterialListDtoImpl>
      get copyWith => __$$ReturnMaterialListDtoImplCopyWithImpl<
          _$ReturnMaterialListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnMaterialListDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnMaterialListDto extends ReturnMaterialListDto {
  const factory _ReturnMaterialListDto(
          {@JsonKey(
              name: 'materialBasicInformation',
              defaultValue: <MaterialBasicInformationDto>[])
          required final List<MaterialBasicInformationDto> basicInformations,
          @JsonKey(
              name: 'materials',
              fromJson: _mappingReturnMaterial,
              defaultValue: <ReturnMaterialDto>[])
          required final List<ReturnMaterialDto> items}) =
      _$ReturnMaterialListDtoImpl;
  const _ReturnMaterialListDto._() : super._();

  factory _ReturnMaterialListDto.fromJson(Map<String, dynamic> json) =
      _$ReturnMaterialListDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations;
  @override
  @JsonKey(
      name: 'materials',
      fromJson: _mappingReturnMaterial,
      defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$ReturnMaterialListDtoImplCopyWith<_$ReturnMaterialListDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
