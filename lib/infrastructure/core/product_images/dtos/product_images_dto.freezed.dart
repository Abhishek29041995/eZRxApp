// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_images_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductImagesDto _$ProductImagesDtoFromJson(Map<String, dynamic> json) {
  return _ProductImagesDto.fromJson(json);
}

/// @nodoc
mixin _$ProductImagesDto {
  @JsonKey(name: 'materialID', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbNail', defaultValue: '')
  String get thumbNail => throw _privateConstructorUsedError;
  @JsonKey(name: 'image', defaultValue: <String>[])
  List<String> get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductImagesDtoCopyWith<ProductImagesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImagesDtoCopyWith<$Res> {
  factory $ProductImagesDtoCopyWith(
          ProductImagesDto value, $Res Function(ProductImagesDto) then) =
      _$ProductImagesDtoCopyWithImpl<$Res, ProductImagesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialID', defaultValue: '') String materialNumber,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'thumbNail', defaultValue: '') String thumbNail,
      @JsonKey(name: 'image', defaultValue: <String>[]) List<String> image});
}

/// @nodoc
class _$ProductImagesDtoCopyWithImpl<$Res, $Val extends ProductImagesDto>
    implements $ProductImagesDtoCopyWith<$Res> {
  _$ProductImagesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? name = null,
    Object? description = null,
    Object? thumbNail = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbNail: null == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImagesDtoImplCopyWith<$Res>
    implements $ProductImagesDtoCopyWith<$Res> {
  factory _$$ProductImagesDtoImplCopyWith(_$ProductImagesDtoImpl value,
          $Res Function(_$ProductImagesDtoImpl) then) =
      __$$ProductImagesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialID', defaultValue: '') String materialNumber,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'thumbNail', defaultValue: '') String thumbNail,
      @JsonKey(name: 'image', defaultValue: <String>[]) List<String> image});
}

/// @nodoc
class __$$ProductImagesDtoImplCopyWithImpl<$Res>
    extends _$ProductImagesDtoCopyWithImpl<$Res, _$ProductImagesDtoImpl>
    implements _$$ProductImagesDtoImplCopyWith<$Res> {
  __$$ProductImagesDtoImplCopyWithImpl(_$ProductImagesDtoImpl _value,
      $Res Function(_$ProductImagesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? name = null,
    Object? description = null,
    Object? thumbNail = null,
    Object? image = null,
  }) {
    return _then(_$ProductImagesDtoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbNail: null == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImagesDtoImpl extends _ProductImagesDto {
  const _$ProductImagesDtoImpl(
      {@JsonKey(name: 'materialID', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'thumbNail', defaultValue: '') required this.thumbNail,
      @JsonKey(name: 'image', defaultValue: <String>[])
      required final List<String> image})
      : _image = image,
        super._();

  factory _$ProductImagesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImagesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'materialID', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'thumbNail', defaultValue: '')
  final String thumbNail;
  final List<String> _image;
  @override
  @JsonKey(name: 'image', defaultValue: <String>[])
  List<String> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  @override
  String toString() {
    return 'ProductImagesDto(materialNumber: $materialNumber, name: $name, description: $description, thumbNail: $thumbNail, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImagesDtoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbNail, thumbNail) ||
                other.thumbNail == thumbNail) &&
            const DeepCollectionEquality().equals(other._image, _image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, name,
      description, thumbNail, const DeepCollectionEquality().hash(_image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImagesDtoImplCopyWith<_$ProductImagesDtoImpl> get copyWith =>
      __$$ProductImagesDtoImplCopyWithImpl<_$ProductImagesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImagesDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductImagesDto extends ProductImagesDto {
  const factory _ProductImagesDto(
      {@JsonKey(name: 'materialID', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'description', defaultValue: '')
      required final String description,
      @JsonKey(name: 'thumbNail', defaultValue: '')
      required final String thumbNail,
      @JsonKey(name: 'image', defaultValue: <String>[])
      required final List<String> image}) = _$ProductImagesDtoImpl;
  const _ProductImagesDto._() : super._();

  factory _ProductImagesDto.fromJson(Map<String, dynamic> json) =
      _$ProductImagesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'materialID', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'thumbNail', defaultValue: '')
  String get thumbNail;
  @override
  @JsonKey(name: 'image', defaultValue: <String>[])
  List<String> get image;
  @override
  @JsonKey(ignore: true)
  _$$ProductImagesDtoImplCopyWith<_$ProductImagesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
