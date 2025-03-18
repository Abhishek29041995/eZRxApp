// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AboutUsDto _$AboutUsDtoFromJson(Map<String, dynamic> json) {
  return _AboutUsDto.fromJson(json);
}

/// @nodoc
mixin _$AboutUsDto {
  @JsonKey(readValue: bannerReadValue)
  BannerTemplateDto get banner => throw _privateConstructorUsedError;
  @JsonKey(readValue: certificationReadValue)
  SliderTemplateDto get certifications => throw _privateConstructorUsedError;
  @JsonKey(readValue: whoWeAreReadValue)
  HorizontalListTemplateDto get whoWeAre => throw _privateConstructorUsedError;
  @JsonKey(readValue: ourPartnerReadValue)
  MediaListTemplateDto get ourPartners => throw _privateConstructorUsedError;
  @JsonKey(readValue: contentSplitReadValue)
  List<ContentSplitTemplateDto> get contentSplit =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutUsDtoCopyWith<AboutUsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsDtoCopyWith<$Res> {
  factory $AboutUsDtoCopyWith(
          AboutUsDto value, $Res Function(AboutUsDto) then) =
      _$AboutUsDtoCopyWithImpl<$Res, AboutUsDto>;
  @useResult
  $Res call(
      {@JsonKey(readValue: bannerReadValue) BannerTemplateDto banner,
      @JsonKey(readValue: certificationReadValue)
      SliderTemplateDto certifications,
      @JsonKey(readValue: whoWeAreReadValue) HorizontalListTemplateDto whoWeAre,
      @JsonKey(readValue: ourPartnerReadValue) MediaListTemplateDto ourPartners,
      @JsonKey(readValue: contentSplitReadValue)
      List<ContentSplitTemplateDto> contentSplit});

  $BannerTemplateDtoCopyWith<$Res> get banner;
  $SliderTemplateDtoCopyWith<$Res> get certifications;
  $HorizontalListTemplateDtoCopyWith<$Res> get whoWeAre;
  $MediaListTemplateDtoCopyWith<$Res> get ourPartners;
}

/// @nodoc
class _$AboutUsDtoCopyWithImpl<$Res, $Val extends AboutUsDto>
    implements $AboutUsDtoCopyWith<$Res> {
  _$AboutUsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? certifications = null,
    Object? whoWeAre = null,
    Object? ourPartners = null,
    Object? contentSplit = null,
  }) {
    return _then(_value.copyWith(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerTemplateDto,
      certifications: null == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as SliderTemplateDto,
      whoWeAre: null == whoWeAre
          ? _value.whoWeAre
          : whoWeAre // ignore: cast_nullable_to_non_nullable
              as HorizontalListTemplateDto,
      ourPartners: null == ourPartners
          ? _value.ourPartners
          : ourPartners // ignore: cast_nullable_to_non_nullable
              as MediaListTemplateDto,
      contentSplit: null == contentSplit
          ? _value.contentSplit
          : contentSplit // ignore: cast_nullable_to_non_nullable
              as List<ContentSplitTemplateDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BannerTemplateDtoCopyWith<$Res> get banner {
    return $BannerTemplateDtoCopyWith<$Res>(_value.banner, (value) {
      return _then(_value.copyWith(banner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SliderTemplateDtoCopyWith<$Res> get certifications {
    return $SliderTemplateDtoCopyWith<$Res>(_value.certifications, (value) {
      return _then(_value.copyWith(certifications: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HorizontalListTemplateDtoCopyWith<$Res> get whoWeAre {
    return $HorizontalListTemplateDtoCopyWith<$Res>(_value.whoWeAre, (value) {
      return _then(_value.copyWith(whoWeAre: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaListTemplateDtoCopyWith<$Res> get ourPartners {
    return $MediaListTemplateDtoCopyWith<$Res>(_value.ourPartners, (value) {
      return _then(_value.copyWith(ourPartners: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutUsDtoImplCopyWith<$Res>
    implements $AboutUsDtoCopyWith<$Res> {
  factory _$$AboutUsDtoImplCopyWith(
          _$AboutUsDtoImpl value, $Res Function(_$AboutUsDtoImpl) then) =
      __$$AboutUsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: bannerReadValue) BannerTemplateDto banner,
      @JsonKey(readValue: certificationReadValue)
      SliderTemplateDto certifications,
      @JsonKey(readValue: whoWeAreReadValue) HorizontalListTemplateDto whoWeAre,
      @JsonKey(readValue: ourPartnerReadValue) MediaListTemplateDto ourPartners,
      @JsonKey(readValue: contentSplitReadValue)
      List<ContentSplitTemplateDto> contentSplit});

  @override
  $BannerTemplateDtoCopyWith<$Res> get banner;
  @override
  $SliderTemplateDtoCopyWith<$Res> get certifications;
  @override
  $HorizontalListTemplateDtoCopyWith<$Res> get whoWeAre;
  @override
  $MediaListTemplateDtoCopyWith<$Res> get ourPartners;
}

/// @nodoc
class __$$AboutUsDtoImplCopyWithImpl<$Res>
    extends _$AboutUsDtoCopyWithImpl<$Res, _$AboutUsDtoImpl>
    implements _$$AboutUsDtoImplCopyWith<$Res> {
  __$$AboutUsDtoImplCopyWithImpl(
      _$AboutUsDtoImpl _value, $Res Function(_$AboutUsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? certifications = null,
    Object? whoWeAre = null,
    Object? ourPartners = null,
    Object? contentSplit = null,
  }) {
    return _then(_$AboutUsDtoImpl(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerTemplateDto,
      certifications: null == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as SliderTemplateDto,
      whoWeAre: null == whoWeAre
          ? _value.whoWeAre
          : whoWeAre // ignore: cast_nullable_to_non_nullable
              as HorizontalListTemplateDto,
      ourPartners: null == ourPartners
          ? _value.ourPartners
          : ourPartners // ignore: cast_nullable_to_non_nullable
              as MediaListTemplateDto,
      contentSplit: null == contentSplit
          ? _value._contentSplit
          : contentSplit // ignore: cast_nullable_to_non_nullable
              as List<ContentSplitTemplateDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutUsDtoImpl extends _AboutUsDto {
  const _$AboutUsDtoImpl(
      {@JsonKey(readValue: bannerReadValue) required this.banner,
      @JsonKey(readValue: certificationReadValue) required this.certifications,
      @JsonKey(readValue: whoWeAreReadValue) required this.whoWeAre,
      @JsonKey(readValue: ourPartnerReadValue) required this.ourPartners,
      @JsonKey(readValue: contentSplitReadValue)
      required final List<ContentSplitTemplateDto> contentSplit})
      : _contentSplit = contentSplit,
        super._();

  factory _$AboutUsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutUsDtoImplFromJson(json);

  @override
  @JsonKey(readValue: bannerReadValue)
  final BannerTemplateDto banner;
  @override
  @JsonKey(readValue: certificationReadValue)
  final SliderTemplateDto certifications;
  @override
  @JsonKey(readValue: whoWeAreReadValue)
  final HorizontalListTemplateDto whoWeAre;
  @override
  @JsonKey(readValue: ourPartnerReadValue)
  final MediaListTemplateDto ourPartners;
  final List<ContentSplitTemplateDto> _contentSplit;
  @override
  @JsonKey(readValue: contentSplitReadValue)
  List<ContentSplitTemplateDto> get contentSplit {
    if (_contentSplit is EqualUnmodifiableListView) return _contentSplit;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentSplit);
  }

  @override
  String toString() {
    return 'AboutUsDto(banner: $banner, certifications: $certifications, whoWeAre: $whoWeAre, ourPartners: $ourPartners, contentSplit: $contentSplit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutUsDtoImpl &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.certifications, certifications) ||
                other.certifications == certifications) &&
            (identical(other.whoWeAre, whoWeAre) ||
                other.whoWeAre == whoWeAre) &&
            (identical(other.ourPartners, ourPartners) ||
                other.ourPartners == ourPartners) &&
            const DeepCollectionEquality()
                .equals(other._contentSplit, _contentSplit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, banner, certifications, whoWeAre,
      ourPartners, const DeepCollectionEquality().hash(_contentSplit));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutUsDtoImplCopyWith<_$AboutUsDtoImpl> get copyWith =>
      __$$AboutUsDtoImplCopyWithImpl<_$AboutUsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutUsDtoImplToJson(
      this,
    );
  }
}

abstract class _AboutUsDto extends AboutUsDto {
  const factory _AboutUsDto(
          {@JsonKey(readValue: bannerReadValue)
          required final BannerTemplateDto banner,
          @JsonKey(readValue: certificationReadValue)
          required final SliderTemplateDto certifications,
          @JsonKey(readValue: whoWeAreReadValue)
          required final HorizontalListTemplateDto whoWeAre,
          @JsonKey(readValue: ourPartnerReadValue)
          required final MediaListTemplateDto ourPartners,
          @JsonKey(readValue: contentSplitReadValue)
          required final List<ContentSplitTemplateDto> contentSplit}) =
      _$AboutUsDtoImpl;
  const _AboutUsDto._() : super._();

  factory _AboutUsDto.fromJson(Map<String, dynamic> json) =
      _$AboutUsDtoImpl.fromJson;

  @override
  @JsonKey(readValue: bannerReadValue)
  BannerTemplateDto get banner;
  @override
  @JsonKey(readValue: certificationReadValue)
  SliderTemplateDto get certifications;
  @override
  @JsonKey(readValue: whoWeAreReadValue)
  HorizontalListTemplateDto get whoWeAre;
  @override
  @JsonKey(readValue: ourPartnerReadValue)
  MediaListTemplateDto get ourPartners;
  @override
  @JsonKey(readValue: contentSplitReadValue)
  List<ContentSplitTemplateDto> get contentSplit;
  @override
  @JsonKey(ignore: true)
  _$$AboutUsDtoImplCopyWith<_$AboutUsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BannerTemplateDto _$BannerTemplateDtoFromJson(Map<String, dynamic> json) {
  return _BannerTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$BannerTemplateDto {
  @JsonKey(name: 'media', readValue: mediaReadValue)
  MediaValueDto get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
  String get buttonName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerTemplateDtoCopyWith<BannerTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerTemplateDtoCopyWith<$Res> {
  factory $BannerTemplateDtoCopyWith(
          BannerTemplateDto value, $Res Function(BannerTemplateDto) then) =
      _$BannerTemplateDtoCopyWithImpl<$Res, BannerTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'media', readValue: mediaReadValue) MediaValueDto media,
      @JsonKey(
          name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto content,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      String title,
      @JsonKey(
          name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
      String buttonName});

  $MediaValueDtoCopyWith<$Res> get media;
  $TemplateValueItemDtoCopyWith<$Res> get content;
}

/// @nodoc
class _$BannerTemplateDtoCopyWithImpl<$Res, $Val extends BannerTemplateDto>
    implements $BannerTemplateDtoCopyWith<$Res> {
  _$BannerTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = null,
    Object? content = null,
    Object? title = null,
    Object? buttonName = null,
  }) {
    return _then(_value.copyWith(
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaValueDto,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaValueDtoCopyWith<$Res> get media {
    return $MediaValueDtoCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get content {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BannerTemplateDtoImplCopyWith<$Res>
    implements $BannerTemplateDtoCopyWith<$Res> {
  factory _$$BannerTemplateDtoImplCopyWith(_$BannerTemplateDtoImpl value,
          $Res Function(_$BannerTemplateDtoImpl) then) =
      __$$BannerTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'media', readValue: mediaReadValue) MediaValueDto media,
      @JsonKey(
          name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto content,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      String title,
      @JsonKey(
          name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
      String buttonName});

  @override
  $MediaValueDtoCopyWith<$Res> get media;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get content;
}

/// @nodoc
class __$$BannerTemplateDtoImplCopyWithImpl<$Res>
    extends _$BannerTemplateDtoCopyWithImpl<$Res, _$BannerTemplateDtoImpl>
    implements _$$BannerTemplateDtoImplCopyWith<$Res> {
  __$$BannerTemplateDtoImplCopyWithImpl(_$BannerTemplateDtoImpl _value,
      $Res Function(_$BannerTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = null,
    Object? content = null,
    Object? title = null,
    Object? buttonName = null,
  }) {
    return _then(_$BannerTemplateDtoImpl(
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaValueDto,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerTemplateDtoImpl extends _BannerTemplateDto {
  _$BannerTemplateDtoImpl(
      {@JsonKey(name: 'media', readValue: mediaReadValue) required this.media,
      @JsonKey(
          name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.content,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      required this.title,
      @JsonKey(
          name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
      required this.buttonName})
      : super._();

  factory _$BannerTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerTemplateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'media', readValue: mediaReadValue)
  final MediaValueDto media;
  @override
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto content;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  final String title;
  @override
  @JsonKey(name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
  final String buttonName;

  @override
  String toString() {
    return 'BannerTemplateDto(media: $media, content: $content, title: $title, buttonName: $buttonName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerTemplateDtoImpl &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.buttonName, buttonName) ||
                other.buttonName == buttonName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, media, content, title, buttonName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerTemplateDtoImplCopyWith<_$BannerTemplateDtoImpl> get copyWith =>
      __$$BannerTemplateDtoImplCopyWithImpl<_$BannerTemplateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _BannerTemplateDto extends BannerTemplateDto {
  factory _BannerTemplateDto(
      {@JsonKey(name: 'media', readValue: mediaReadValue)
      required final MediaValueDto media,
      @JsonKey(
          name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto content,
      @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
      required final String title,
      @JsonKey(
          name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
      required final String buttonName}) = _$BannerTemplateDtoImpl;
  _BannerTemplateDto._() : super._();

  factory _BannerTemplateDto.fromJson(Map<String, dynamic> json) =
      _$BannerTemplateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'media', readValue: mediaReadValue)
  MediaValueDto get media;
  @override
  @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get content;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
  String get title;
  @override
  @JsonKey(name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
  String get buttonName;
  @override
  @JsonKey(ignore: true)
  _$$BannerTemplateDtoImplCopyWith<_$BannerTemplateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SliderTemplateDto _$SliderTemplateDtoFromJson(Map<String, dynamic> json) {
  return _SliderTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$SliderTemplateDto {
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'certificates', readValue: JsonReadValueHelper.readValueList)
  List<CertificationsDto> get certificates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderTemplateDtoCopyWith<SliderTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderTemplateDtoCopyWith<$Res> {
  factory $SliderTemplateDtoCopyWith(
          SliderTemplateDto value, $Res Function(SliderTemplateDto) then) =
      _$SliderTemplateDtoCopyWithImpl<$Res, SliderTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'certificates', readValue: JsonReadValueHelper.readValueList)
      List<CertificationsDto> certificates});

  $TemplateValueItemDtoCopyWith<$Res> get title;
}

/// @nodoc
class _$SliderTemplateDtoCopyWithImpl<$Res, $Val extends SliderTemplateDto>
    implements $SliderTemplateDtoCopyWith<$Res> {
  _$SliderTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? certificates = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificates: null == certificates
          ? _value.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CertificationsDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get title {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SliderTemplateDtoImplCopyWith<$Res>
    implements $SliderTemplateDtoCopyWith<$Res> {
  factory _$$SliderTemplateDtoImplCopyWith(_$SliderTemplateDtoImpl value,
          $Res Function(_$SliderTemplateDtoImpl) then) =
      __$$SliderTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'certificates', readValue: JsonReadValueHelper.readValueList)
      List<CertificationsDto> certificates});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get title;
}

/// @nodoc
class __$$SliderTemplateDtoImplCopyWithImpl<$Res>
    extends _$SliderTemplateDtoCopyWithImpl<$Res, _$SliderTemplateDtoImpl>
    implements _$$SliderTemplateDtoImplCopyWith<$Res> {
  __$$SliderTemplateDtoImplCopyWithImpl(_$SliderTemplateDtoImpl _value,
      $Res Function(_$SliderTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? certificates = null,
  }) {
    return _then(_$SliderTemplateDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificates: null == certificates
          ? _value._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CertificationsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderTemplateDtoImpl extends _SliderTemplateDto {
  _$SliderTemplateDtoImpl(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.title,
      @JsonKey(
          name: 'certificates', readValue: JsonReadValueHelper.readValueList)
      required final List<CertificationsDto> certificates})
      : _certificates = certificates,
        super._();

  factory _$SliderTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderTemplateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto title;
  final List<CertificationsDto> _certificates;
  @override
  @JsonKey(name: 'certificates', readValue: JsonReadValueHelper.readValueList)
  List<CertificationsDto> get certificates {
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificates);
  }

  @override
  String toString() {
    return 'SliderTemplateDto(title: $title, certificates: $certificates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderTemplateDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_certificates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderTemplateDtoImplCopyWith<_$SliderTemplateDtoImpl> get copyWith =>
      __$$SliderTemplateDtoImplCopyWithImpl<_$SliderTemplateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _SliderTemplateDto extends SliderTemplateDto {
  factory _SliderTemplateDto(
          {@JsonKey(
              name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto title,
          @JsonKey(
              name: 'certificates',
              readValue: JsonReadValueHelper.readValueList)
          required final List<CertificationsDto> certificates}) =
      _$SliderTemplateDtoImpl;
  _SliderTemplateDto._() : super._();

  factory _SliderTemplateDto.fromJson(Map<String, dynamic> json) =
      _$SliderTemplateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title;
  @override
  @JsonKey(name: 'certificates', readValue: JsonReadValueHelper.readValueList)
  List<CertificationsDto> get certificates;
  @override
  @JsonKey(ignore: true)
  _$$SliderTemplateDtoImplCopyWith<_$SliderTemplateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CertificationsDto _$CertificationsDtoFromJson(Map<String, dynamic> json) {
  return _CertificationsDto.fromJson(json);
}

/// @nodoc
mixin _$CertificationsDto {
  @JsonKey(
      name: 'certificationType',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationType =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'certificationName',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationName =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'certificationYear',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationYear =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CertificationsDtoCopyWith<CertificationsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificationsDtoCopyWith<$Res> {
  factory $CertificationsDtoCopyWith(
          CertificationsDto value, $Res Function(CertificationsDto) then) =
      _$CertificationsDtoCopyWithImpl<$Res, CertificationsDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'certificationType',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationType,
      @JsonKey(
          name: 'certificationName',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationName,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(
          name: 'certificationYear',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationYear});

  $TemplateValueItemDtoCopyWith<$Res> get certificationType;
  $TemplateValueItemDtoCopyWith<$Res> get certificationName;
  $TemplateValueItemDtoCopyWith<$Res> get description;
  $TemplateValueItemDtoCopyWith<$Res> get certificationYear;
}

/// @nodoc
class _$CertificationsDtoCopyWithImpl<$Res, $Val extends CertificationsDto>
    implements $CertificationsDtoCopyWith<$Res> {
  _$CertificationsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificationType = null,
    Object? certificationName = null,
    Object? description = null,
    Object? certificationYear = null,
  }) {
    return _then(_value.copyWith(
      certificationType: null == certificationType
          ? _value.certificationType
          : certificationType // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificationName: null == certificationName
          ? _value.certificationName
          : certificationName // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificationYear: null == certificationYear
          ? _value.certificationYear
          : certificationYear // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get certificationType {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.certificationType,
        (value) {
      return _then(_value.copyWith(certificationType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get certificationName {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.certificationName,
        (value) {
      return _then(_value.copyWith(certificationName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get description {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get certificationYear {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.certificationYear,
        (value) {
      return _then(_value.copyWith(certificationYear: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CertificationsDtoImplCopyWith<$Res>
    implements $CertificationsDtoCopyWith<$Res> {
  factory _$$CertificationsDtoImplCopyWith(_$CertificationsDtoImpl value,
          $Res Function(_$CertificationsDtoImpl) then) =
      __$$CertificationsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'certificationType',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationType,
      @JsonKey(
          name: 'certificationName',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationName,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(
          name: 'certificationYear',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto certificationYear});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get certificationType;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get certificationName;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get description;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get certificationYear;
}

/// @nodoc
class __$$CertificationsDtoImplCopyWithImpl<$Res>
    extends _$CertificationsDtoCopyWithImpl<$Res, _$CertificationsDtoImpl>
    implements _$$CertificationsDtoImplCopyWith<$Res> {
  __$$CertificationsDtoImplCopyWithImpl(_$CertificationsDtoImpl _value,
      $Res Function(_$CertificationsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificationType = null,
    Object? certificationName = null,
    Object? description = null,
    Object? certificationYear = null,
  }) {
    return _then(_$CertificationsDtoImpl(
      certificationType: null == certificationType
          ? _value.certificationType
          : certificationType // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificationName: null == certificationName
          ? _value.certificationName
          : certificationName // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      certificationYear: null == certificationYear
          ? _value.certificationYear
          : certificationYear // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificationsDtoImpl extends _CertificationsDto {
  _$CertificationsDtoImpl(
      {@JsonKey(
          name: 'certificationType',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.certificationType,
      @JsonKey(
          name: 'certificationName',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.certificationName,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.description,
      @JsonKey(
          name: 'certificationYear',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.certificationYear})
      : super._();

  factory _$CertificationsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificationsDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'certificationType',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto certificationType;
  @override
  @JsonKey(
      name: 'certificationName',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto certificationName;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto description;
  @override
  @JsonKey(
      name: 'certificationYear',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto certificationYear;

  @override
  String toString() {
    return 'CertificationsDto(certificationType: $certificationType, certificationName: $certificationName, description: $description, certificationYear: $certificationYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificationsDtoImpl &&
            (identical(other.certificationType, certificationType) ||
                other.certificationType == certificationType) &&
            (identical(other.certificationName, certificationName) ||
                other.certificationName == certificationName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.certificationYear, certificationYear) ||
                other.certificationYear == certificationYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, certificationType,
      certificationName, description, certificationYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificationsDtoImplCopyWith<_$CertificationsDtoImpl> get copyWith =>
      __$$CertificationsDtoImplCopyWithImpl<_$CertificationsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificationsDtoImplToJson(
      this,
    );
  }
}

abstract class _CertificationsDto extends CertificationsDto {
  factory _CertificationsDto(
          {@JsonKey(
              name: 'certificationType',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto certificationType,
          @JsonKey(
              name: 'certificationName',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto certificationName,
          @JsonKey(
              name: 'description',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto description,
          @JsonKey(
              name: 'certificationYear',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto certificationYear}) =
      _$CertificationsDtoImpl;
  _CertificationsDto._() : super._();

  factory _CertificationsDto.fromJson(Map<String, dynamic> json) =
      _$CertificationsDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'certificationType',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationType;
  @override
  @JsonKey(
      name: 'certificationName',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationName;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description;
  @override
  @JsonKey(
      name: 'certificationYear',
      readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get certificationYear;
  @override
  @JsonKey(ignore: true)
  _$$CertificationsDtoImplCopyWith<_$CertificationsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HorizontalListTemplateDto _$HorizontalListTemplateDtoFromJson(
    Map<String, dynamic> json) {
  return _HorizontalListTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$HorizontalListTemplateDto {
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
  List<HorizontalListTemplateItemDto> get achievements =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HorizontalListTemplateDtoCopyWith<HorizontalListTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HorizontalListTemplateDtoCopyWith<$Res> {
  factory $HorizontalListTemplateDtoCopyWith(HorizontalListTemplateDto value,
          $Res Function(HorizontalListTemplateDto) then) =
      _$HorizontalListTemplateDtoCopyWithImpl<$Res, HorizontalListTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
      List<HorizontalListTemplateItemDto> achievements});

  $TemplateValueItemDtoCopyWith<$Res> get title;
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class _$HorizontalListTemplateDtoCopyWithImpl<$Res,
        $Val extends HorizontalListTemplateDto>
    implements $HorizontalListTemplateDtoCopyWith<$Res> {
  _$HorizontalListTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? achievements = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<HorizontalListTemplateItemDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get title {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get description {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HorizontalListTemplateDtoImplCopyWith<$Res>
    implements $HorizontalListTemplateDtoCopyWith<$Res> {
  factory _$$HorizontalListTemplateDtoImplCopyWith(
          _$HorizontalListTemplateDtoImpl value,
          $Res Function(_$HorizontalListTemplateDtoImpl) then) =
      __$$HorizontalListTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
      List<HorizontalListTemplateItemDto> achievements});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get title;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class __$$HorizontalListTemplateDtoImplCopyWithImpl<$Res>
    extends _$HorizontalListTemplateDtoCopyWithImpl<$Res,
        _$HorizontalListTemplateDtoImpl>
    implements _$$HorizontalListTemplateDtoImplCopyWith<$Res> {
  __$$HorizontalListTemplateDtoImplCopyWithImpl(
      _$HorizontalListTemplateDtoImpl _value,
      $Res Function(_$HorizontalListTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? achievements = null,
  }) {
    return _then(_$HorizontalListTemplateDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<HorizontalListTemplateItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HorizontalListTemplateDtoImpl extends _HorizontalListTemplateDto {
  _$HorizontalListTemplateDtoImpl(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.description,
      @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
      required final List<HorizontalListTemplateItemDto> achievements})
      : _achievements = achievements,
        super._();

  factory _$HorizontalListTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HorizontalListTemplateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto title;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto description;
  final List<HorizontalListTemplateItemDto> _achievements;
  @override
  @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
  List<HorizontalListTemplateItemDto> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'HorizontalListTemplateDto(title: $title, description: $description, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HorizontalListTemplateDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_achievements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HorizontalListTemplateDtoImplCopyWith<_$HorizontalListTemplateDtoImpl>
      get copyWith => __$$HorizontalListTemplateDtoImplCopyWithImpl<
          _$HorizontalListTemplateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HorizontalListTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _HorizontalListTemplateDto extends HorizontalListTemplateDto {
  factory _HorizontalListTemplateDto(
          {@JsonKey(
              name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto title,
          @JsonKey(
              name: 'description',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto description,
          @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
          required final List<HorizontalListTemplateItemDto> achievements}) =
      _$HorizontalListTemplateDtoImpl;
  _HorizontalListTemplateDto._() : super._();

  factory _HorizontalListTemplateDto.fromJson(Map<String, dynamic> json) =
      _$HorizontalListTemplateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description;
  @override
  @JsonKey(name: 'list', readValue: JsonReadValueHelper.readValueList)
  List<HorizontalListTemplateItemDto> get achievements;
  @override
  @JsonKey(ignore: true)
  _$$HorizontalListTemplateDtoImplCopyWith<_$HorizontalListTemplateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HorizontalListTemplateItemDto _$HorizontalListTemplateItemDtoFromJson(
    Map<String, dynamic> json) {
  return _HorizontalListTemplateItemDto.fromJson(json);
}

/// @nodoc
mixin _$HorizontalListTemplateItemDto {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get subTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  TemplateValueItemDto get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HorizontalListTemplateItemDtoCopyWith<HorizontalListTemplateItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HorizontalListTemplateItemDtoCopyWith<$Res> {
  factory $HorizontalListTemplateItemDtoCopyWith(
          HorizontalListTemplateItemDto value,
          $Res Function(HorizontalListTemplateItemDto) then) =
      _$HorizontalListTemplateItemDtoCopyWithImpl<$Res,
          HorizontalListTemplateItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto subTitle,
      @JsonKey(name: 'description') TemplateValueItemDto description});

  $TemplateValueItemDtoCopyWith<$Res> get title;
  $TemplateValueItemDtoCopyWith<$Res> get subTitle;
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class _$HorizontalListTemplateItemDtoCopyWithImpl<$Res,
        $Val extends HorizontalListTemplateItemDto>
    implements $HorizontalListTemplateItemDtoCopyWith<$Res> {
  _$HorizontalListTemplateItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get title {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get subTitle {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.subTitle, (value) {
      return _then(_value.copyWith(subTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get description {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HorizontalListTemplateItemDtoImplCopyWith<$Res>
    implements $HorizontalListTemplateItemDtoCopyWith<$Res> {
  factory _$$HorizontalListTemplateItemDtoImplCopyWith(
          _$HorizontalListTemplateItemDtoImpl value,
          $Res Function(_$HorizontalListTemplateItemDtoImpl) then) =
      __$$HorizontalListTemplateItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto subTitle,
      @JsonKey(name: 'description') TemplateValueItemDto description});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get title;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get subTitle;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class __$$HorizontalListTemplateItemDtoImplCopyWithImpl<$Res>
    extends _$HorizontalListTemplateItemDtoCopyWithImpl<$Res,
        _$HorizontalListTemplateItemDtoImpl>
    implements _$$HorizontalListTemplateItemDtoImplCopyWith<$Res> {
  __$$HorizontalListTemplateItemDtoImplCopyWithImpl(
      _$HorizontalListTemplateItemDtoImpl _value,
      $Res Function(_$HorizontalListTemplateItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
  }) {
    return _then(_$HorizontalListTemplateItemDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HorizontalListTemplateItemDtoImpl
    extends _HorizontalListTemplateItemDto {
  _$HorizontalListTemplateItemDtoImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.subTitle,
      @JsonKey(name: 'description') required this.description})
      : super._();

  factory _$HorizontalListTemplateItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HorizontalListTemplateItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto title;
  @override
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto subTitle;
  @override
  @JsonKey(name: 'description')
  final TemplateValueItemDto description;

  @override
  String toString() {
    return 'HorizontalListTemplateItemDto(name: $name, title: $title, subTitle: $subTitle, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HorizontalListTemplateItemDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, title, subTitle, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HorizontalListTemplateItemDtoImplCopyWith<
          _$HorizontalListTemplateItemDtoImpl>
      get copyWith => __$$HorizontalListTemplateItemDtoImplCopyWithImpl<
          _$HorizontalListTemplateItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HorizontalListTemplateItemDtoImplToJson(
      this,
    );
  }
}

abstract class _HorizontalListTemplateItemDto
    extends HorizontalListTemplateItemDto {
  factory _HorizontalListTemplateItemDto(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto subTitle,
      @JsonKey(name: 'description')
      required final TemplateValueItemDto
          description}) = _$HorizontalListTemplateItemDtoImpl;
  _HorizontalListTemplateItemDto._() : super._();

  factory _HorizontalListTemplateItemDto.fromJson(Map<String, dynamic> json) =
      _$HorizontalListTemplateItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title;
  @override
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get subTitle;
  @override
  @JsonKey(name: 'description')
  TemplateValueItemDto get description;
  @override
  @JsonKey(ignore: true)
  _$$HorizontalListTemplateItemDtoImplCopyWith<
          _$HorizontalListTemplateItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContentSplitTemplateDto _$ContentSplitTemplateDtoFromJson(
    Map<String, dynamic> json) {
  return _ContentSplitTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$ContentSplitTemplateDto {
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get subTitle => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'media', readValue: mediaReadValue)
  MediaValueDto get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentSplitTemplateDtoCopyWith<ContentSplitTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentSplitTemplateDtoCopyWith<$Res> {
  factory $ContentSplitTemplateDtoCopyWith(ContentSplitTemplateDto value,
          $Res Function(ContentSplitTemplateDto) then) =
      _$ContentSplitTemplateDtoCopyWithImpl<$Res, ContentSplitTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto subTitle,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(name: 'media', readValue: mediaReadValue) MediaValueDto media});

  $TemplateValueItemDtoCopyWith<$Res> get title;
  $TemplateValueItemDtoCopyWith<$Res> get subTitle;
  $TemplateValueItemDtoCopyWith<$Res> get description;
  $MediaValueDtoCopyWith<$Res> get media;
}

/// @nodoc
class _$ContentSplitTemplateDtoCopyWithImpl<$Res,
        $Val extends ContentSplitTemplateDto>
    implements $ContentSplitTemplateDtoCopyWith<$Res> {
  _$ContentSplitTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaValueDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get title {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get subTitle {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.subTitle, (value) {
      return _then(_value.copyWith(subTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get description {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaValueDtoCopyWith<$Res> get media {
    return $MediaValueDtoCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentSplitTemplateDtoImplCopyWith<$Res>
    implements $ContentSplitTemplateDtoCopyWith<$Res> {
  factory _$$ContentSplitTemplateDtoImplCopyWith(
          _$ContentSplitTemplateDtoImpl value,
          $Res Function(_$ContentSplitTemplateDtoImpl) then) =
      __$$ContentSplitTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto subTitle,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(name: 'media', readValue: mediaReadValue) MediaValueDto media});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get title;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get subTitle;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get description;
  @override
  $MediaValueDtoCopyWith<$Res> get media;
}

/// @nodoc
class __$$ContentSplitTemplateDtoImplCopyWithImpl<$Res>
    extends _$ContentSplitTemplateDtoCopyWithImpl<$Res,
        _$ContentSplitTemplateDtoImpl>
    implements _$$ContentSplitTemplateDtoImplCopyWith<$Res> {
  __$$ContentSplitTemplateDtoImplCopyWithImpl(
      _$ContentSplitTemplateDtoImpl _value,
      $Res Function(_$ContentSplitTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? media = null,
  }) {
    return _then(_$ContentSplitTemplateDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaValueDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentSplitTemplateDtoImpl extends _ContentSplitTemplateDto {
  const _$ContentSplitTemplateDtoImpl(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.subTitle,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.description,
      @JsonKey(name: 'media', readValue: mediaReadValue) required this.media})
      : super._();

  factory _$ContentSplitTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentSplitTemplateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto title;
  @override
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto subTitle;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto description;
  @override
  @JsonKey(name: 'media', readValue: mediaReadValue)
  final MediaValueDto media;

  @override
  String toString() {
    return 'ContentSplitTemplateDto(title: $title, subTitle: $subTitle, description: $description, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentSplitTemplateDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subTitle, description, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentSplitTemplateDtoImplCopyWith<_$ContentSplitTemplateDtoImpl>
      get copyWith => __$$ContentSplitTemplateDtoImplCopyWithImpl<
          _$ContentSplitTemplateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentSplitTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _ContentSplitTemplateDto extends ContentSplitTemplateDto {
  const factory _ContentSplitTemplateDto(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto title,
      @JsonKey(
          name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto subTitle,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required final TemplateValueItemDto description,
      @JsonKey(name: 'media', readValue: mediaReadValue)
      required final MediaValueDto media}) = _$ContentSplitTemplateDtoImpl;
  const _ContentSplitTemplateDto._() : super._();

  factory _ContentSplitTemplateDto.fromJson(Map<String, dynamic> json) =
      _$ContentSplitTemplateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title;
  @override
  @JsonKey(name: 'subTitle', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get subTitle;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description;
  @override
  @JsonKey(name: 'media', readValue: mediaReadValue)
  MediaValueDto get media;
  @override
  @JsonKey(ignore: true)
  _$$ContentSplitTemplateDtoImplCopyWith<_$ContentSplitTemplateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MediaListTemplateDto _$MediaListTemplateDtoFromJson(Map<String, dynamic> json) {
  return _MediaListTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$MediaListTemplateDto {
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'mediaItems',
      defaultValue: <MediaItemDto>[],
      readValue: JsonReadValueHelper.readValueList)
  List<MediaItemDto> get mediaItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaListTemplateDtoCopyWith<MediaListTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListTemplateDtoCopyWith<$Res> {
  factory $MediaListTemplateDtoCopyWith(MediaListTemplateDto value,
          $Res Function(MediaListTemplateDto) then) =
      _$MediaListTemplateDtoCopyWithImpl<$Res, MediaListTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(
          name: 'mediaItems',
          defaultValue: <MediaItemDto>[],
          readValue: JsonReadValueHelper.readValueList)
      List<MediaItemDto> mediaItems});

  $TemplateValueItemDtoCopyWith<$Res> get title;
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class _$MediaListTemplateDtoCopyWithImpl<$Res,
        $Val extends MediaListTemplateDto>
    implements $MediaListTemplateDtoCopyWith<$Res> {
  _$MediaListTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? mediaItems = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      mediaItems: null == mediaItems
          ? _value.mediaItems
          : mediaItems // ignore: cast_nullable_to_non_nullable
              as List<MediaItemDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get title {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get description {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaListTemplateDtoImplCopyWith<$Res>
    implements $MediaListTemplateDtoCopyWith<$Res> {
  factory _$$MediaListTemplateDtoImplCopyWith(_$MediaListTemplateDtoImpl value,
          $Res Function(_$MediaListTemplateDtoImpl) then) =
      __$$MediaListTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      TemplateValueItemDto description,
      @JsonKey(
          name: 'mediaItems',
          defaultValue: <MediaItemDto>[],
          readValue: JsonReadValueHelper.readValueList)
      List<MediaItemDto> mediaItems});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get title;
  @override
  $TemplateValueItemDtoCopyWith<$Res> get description;
}

/// @nodoc
class __$$MediaListTemplateDtoImplCopyWithImpl<$Res>
    extends _$MediaListTemplateDtoCopyWithImpl<$Res, _$MediaListTemplateDtoImpl>
    implements _$$MediaListTemplateDtoImplCopyWith<$Res> {
  __$$MediaListTemplateDtoImplCopyWithImpl(_$MediaListTemplateDtoImpl _value,
      $Res Function(_$MediaListTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? mediaItems = null,
  }) {
    return _then(_$MediaListTemplateDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
      mediaItems: null == mediaItems
          ? _value._mediaItems
          : mediaItems // ignore: cast_nullable_to_non_nullable
              as List<MediaItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListTemplateDtoImpl extends _MediaListTemplateDto {
  const _$MediaListTemplateDtoImpl(
      {@JsonKey(
          name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.title,
      @JsonKey(
          name: 'description',
          readValue: JsonReadValueHelper.readValueMapDynamic)
      required this.description,
      @JsonKey(
          name: 'mediaItems',
          defaultValue: <MediaItemDto>[],
          readValue: JsonReadValueHelper.readValueList)
      required final List<MediaItemDto> mediaItems})
      : _mediaItems = mediaItems,
        super._();

  factory _$MediaListTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListTemplateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto title;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  final TemplateValueItemDto description;
  final List<MediaItemDto> _mediaItems;
  @override
  @JsonKey(
      name: 'mediaItems',
      defaultValue: <MediaItemDto>[],
      readValue: JsonReadValueHelper.readValueList)
  List<MediaItemDto> get mediaItems {
    if (_mediaItems is EqualUnmodifiableListView) return _mediaItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaItems);
  }

  @override
  String toString() {
    return 'MediaListTemplateDto(title: $title, description: $description, mediaItems: $mediaItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListTemplateDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._mediaItems, _mediaItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_mediaItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListTemplateDtoImplCopyWith<_$MediaListTemplateDtoImpl>
      get copyWith =>
          __$$MediaListTemplateDtoImplCopyWithImpl<_$MediaListTemplateDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaListTemplateDto extends MediaListTemplateDto {
  const factory _MediaListTemplateDto(
          {@JsonKey(
              name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto title,
          @JsonKey(
              name: 'description',
              readValue: JsonReadValueHelper.readValueMapDynamic)
          required final TemplateValueItemDto description,
          @JsonKey(
              name: 'mediaItems',
              defaultValue: <MediaItemDto>[],
              readValue: JsonReadValueHelper.readValueList)
          required final List<MediaItemDto> mediaItems}) =
      _$MediaListTemplateDtoImpl;
  const _MediaListTemplateDto._() : super._();

  factory _MediaListTemplateDto.fromJson(Map<String, dynamic> json) =
      _$MediaListTemplateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get title;
  @override
  @JsonKey(
      name: 'description', readValue: JsonReadValueHelper.readValueMapDynamic)
  TemplateValueItemDto get description;
  @override
  @JsonKey(
      name: 'mediaItems',
      defaultValue: <MediaItemDto>[],
      readValue: JsonReadValueHelper.readValueList)
  List<MediaItemDto> get mediaItems;
  @override
  @JsonKey(ignore: true)
  _$$MediaListTemplateDtoImplCopyWith<_$MediaListTemplateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MediaItemDto _$MediaItemDtoFromJson(Map<String, dynamic> json) {
  return _MediaItemDto.fromJson(json);
}

/// @nodoc
mixin _$MediaItemDto {
  @JsonKey(name: 'url')
  TemplateValueItemDto get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaItemDtoCopyWith<MediaItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaItemDtoCopyWith<$Res> {
  factory $MediaItemDtoCopyWith(
          MediaItemDto value, $Res Function(MediaItemDto) then) =
      _$MediaItemDtoCopyWithImpl<$Res, MediaItemDto>;
  @useResult
  $Res call({@JsonKey(name: 'url') TemplateValueItemDto url});

  $TemplateValueItemDtoCopyWith<$Res> get url;
}

/// @nodoc
class _$MediaItemDtoCopyWithImpl<$Res, $Val extends MediaItemDto>
    implements $MediaItemDtoCopyWith<$Res> {
  _$MediaItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateValueItemDtoCopyWith<$Res> get url {
    return $TemplateValueItemDtoCopyWith<$Res>(_value.url, (value) {
      return _then(_value.copyWith(url: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaItemDtoImplCopyWith<$Res>
    implements $MediaItemDtoCopyWith<$Res> {
  factory _$$MediaItemDtoImplCopyWith(
          _$MediaItemDtoImpl value, $Res Function(_$MediaItemDtoImpl) then) =
      __$$MediaItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'url') TemplateValueItemDto url});

  @override
  $TemplateValueItemDtoCopyWith<$Res> get url;
}

/// @nodoc
class __$$MediaItemDtoImplCopyWithImpl<$Res>
    extends _$MediaItemDtoCopyWithImpl<$Res, _$MediaItemDtoImpl>
    implements _$$MediaItemDtoImplCopyWith<$Res> {
  __$$MediaItemDtoImplCopyWithImpl(
      _$MediaItemDtoImpl _value, $Res Function(_$MediaItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$MediaItemDtoImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as TemplateValueItemDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaItemDtoImpl extends _MediaItemDto {
  _$MediaItemDtoImpl({@JsonKey(name: 'url') required this.url}) : super._();

  factory _$MediaItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final TemplateValueItemDto url;

  @override
  String toString() {
    return 'MediaItemDto(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaItemDtoImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaItemDtoImplCopyWith<_$MediaItemDtoImpl> get copyWith =>
      __$$MediaItemDtoImplCopyWithImpl<_$MediaItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaItemDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaItemDto extends MediaItemDto {
  factory _MediaItemDto(
          {@JsonKey(name: 'url') required final TemplateValueItemDto url}) =
      _$MediaItemDtoImpl;
  _MediaItemDto._() : super._();

  factory _MediaItemDto.fromJson(Map<String, dynamic> json) =
      _$MediaItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  TemplateValueItemDto get url;
  @override
  @JsonKey(ignore: true)
  _$$MediaItemDtoImplCopyWith<_$MediaItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaValueDto _$MediaValueDtoFromJson(Map<String, dynamic> json) {
  return _MediaValueDto.fromJson(json);
}

/// @nodoc
mixin _$MediaValueDto {
  @JsonKey(name: 'src', defaultValue: '')
  String get src => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaValueDtoCopyWith<MediaValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaValueDtoCopyWith<$Res> {
  factory $MediaValueDtoCopyWith(
          MediaValueDto value, $Res Function(MediaValueDto) then) =
      _$MediaValueDtoCopyWithImpl<$Res, MediaValueDto>;
  @useResult
  $Res call({@JsonKey(name: 'src', defaultValue: '') String src});
}

/// @nodoc
class _$MediaValueDtoCopyWithImpl<$Res, $Val extends MediaValueDto>
    implements $MediaValueDtoCopyWith<$Res> {
  _$MediaValueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_value.copyWith(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaValueDtoImplCopyWith<$Res>
    implements $MediaValueDtoCopyWith<$Res> {
  factory _$$MediaValueDtoImplCopyWith(
          _$MediaValueDtoImpl value, $Res Function(_$MediaValueDtoImpl) then) =
      __$$MediaValueDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'src', defaultValue: '') String src});
}

/// @nodoc
class __$$MediaValueDtoImplCopyWithImpl<$Res>
    extends _$MediaValueDtoCopyWithImpl<$Res, _$MediaValueDtoImpl>
    implements _$$MediaValueDtoImplCopyWith<$Res> {
  __$$MediaValueDtoImplCopyWithImpl(
      _$MediaValueDtoImpl _value, $Res Function(_$MediaValueDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$MediaValueDtoImpl(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaValueDtoImpl extends _MediaValueDto {
  _$MediaValueDtoImpl(
      {@JsonKey(name: 'src', defaultValue: '') required this.src})
      : super._();

  factory _$MediaValueDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaValueDtoImplFromJson(json);

  @override
  @JsonKey(name: 'src', defaultValue: '')
  final String src;

  @override
  String toString() {
    return 'MediaValueDto(src: $src)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaValueDtoImpl &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaValueDtoImplCopyWith<_$MediaValueDtoImpl> get copyWith =>
      __$$MediaValueDtoImplCopyWithImpl<_$MediaValueDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaValueDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaValueDto extends MediaValueDto {
  factory _MediaValueDto(
          {@JsonKey(name: 'src', defaultValue: '') required final String src}) =
      _$MediaValueDtoImpl;
  _MediaValueDto._() : super._();

  factory _MediaValueDto.fromJson(Map<String, dynamic> json) =
      _$MediaValueDtoImpl.fromJson;

  @override
  @JsonKey(name: 'src', defaultValue: '')
  String get src;
  @override
  @JsonKey(ignore: true)
  _$$MediaValueDtoImplCopyWith<_$MediaValueDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateValueItemDto _$TemplateValueItemDtoFromJson(Map<String, dynamic> json) {
  return _TemplateValueItemDto.fromJson(json);
}

/// @nodoc
mixin _$TemplateValueItemDto {
  @JsonKey(name: 'value', defaultValue: '')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateValueItemDtoCopyWith<TemplateValueItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateValueItemDtoCopyWith<$Res> {
  factory $TemplateValueItemDtoCopyWith(TemplateValueItemDto value,
          $Res Function(TemplateValueItemDto) then) =
      _$TemplateValueItemDtoCopyWithImpl<$Res, TemplateValueItemDto>;
  @useResult
  $Res call({@JsonKey(name: 'value', defaultValue: '') String value});
}

/// @nodoc
class _$TemplateValueItemDtoCopyWithImpl<$Res,
        $Val extends TemplateValueItemDto>
    implements $TemplateValueItemDtoCopyWith<$Res> {
  _$TemplateValueItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateValueItemDtoImplCopyWith<$Res>
    implements $TemplateValueItemDtoCopyWith<$Res> {
  factory _$$TemplateValueItemDtoImplCopyWith(_$TemplateValueItemDtoImpl value,
          $Res Function(_$TemplateValueItemDtoImpl) then) =
      __$$TemplateValueItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'value', defaultValue: '') String value});
}

/// @nodoc
class __$$TemplateValueItemDtoImplCopyWithImpl<$Res>
    extends _$TemplateValueItemDtoCopyWithImpl<$Res, _$TemplateValueItemDtoImpl>
    implements _$$TemplateValueItemDtoImplCopyWith<$Res> {
  __$$TemplateValueItemDtoImplCopyWithImpl(_$TemplateValueItemDtoImpl _value,
      $Res Function(_$TemplateValueItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$TemplateValueItemDtoImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateValueItemDtoImpl implements _TemplateValueItemDto {
  const _$TemplateValueItemDtoImpl(
      {@JsonKey(name: 'value', defaultValue: '') required this.value});

  factory _$TemplateValueItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateValueItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'value', defaultValue: '')
  final String value;

  @override
  String toString() {
    return 'TemplateValueItemDto(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateValueItemDtoImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateValueItemDtoImplCopyWith<_$TemplateValueItemDtoImpl>
      get copyWith =>
          __$$TemplateValueItemDtoImplCopyWithImpl<_$TemplateValueItemDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateValueItemDtoImplToJson(
      this,
    );
  }
}

abstract class _TemplateValueItemDto implements TemplateValueItemDto {
  const factory _TemplateValueItemDto(
      {@JsonKey(name: 'value', defaultValue: '')
      required final String value}) = _$TemplateValueItemDtoImpl;

  factory _TemplateValueItemDto.fromJson(Map<String, dynamic> json) =
      _$TemplateValueItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'value', defaultValue: '')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$TemplateValueItemDtoImplCopyWith<_$TemplateValueItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
