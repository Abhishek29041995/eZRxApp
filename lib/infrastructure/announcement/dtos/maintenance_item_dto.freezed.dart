// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenanceItemDto _$MaintenanceItemDtoFromJson(Map<String, dynamic> json) {
  return _MaintenanceItemDto.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceItemDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'maxNumberOfItem',
      defaultValue: 0,
      readValue: JsonReadValueHelper.readMaximumOfItem)
  int get maxNumberOfItem => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'banners',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<MaintenanceBannerDto> get banners => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaintenanceItemDtoCopyWith<MaintenanceItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceItemDtoCopyWith<$Res> {
  factory $MaintenanceItemDtoCopyWith(
          MaintenanceItemDto value, $Res Function(MaintenanceItemDto) then) =
      _$MaintenanceItemDtoCopyWithImpl<$Res, MaintenanceItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(
          name: 'maxNumberOfItem',
          defaultValue: 0,
          readValue: JsonReadValueHelper.readMaximumOfItem)
      int maxNumberOfItem,
      @JsonKey(
          name: 'banners',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      List<MaintenanceBannerDto> banners});
}

/// @nodoc
class _$MaintenanceItemDtoCopyWithImpl<$Res, $Val extends MaintenanceItemDto>
    implements $MaintenanceItemDtoCopyWith<$Res> {
  _$MaintenanceItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? maxNumberOfItem = null,
    Object? banners = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumberOfItem: null == maxNumberOfItem
          ? _value.maxNumberOfItem
          : maxNumberOfItem // ignore: cast_nullable_to_non_nullable
              as int,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceBannerDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceItemDtoImplCopyWith<$Res>
    implements $MaintenanceItemDtoCopyWith<$Res> {
  factory _$$MaintenanceItemDtoImplCopyWith(_$MaintenanceItemDtoImpl value,
          $Res Function(_$MaintenanceItemDtoImpl) then) =
      __$$MaintenanceItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(
          name: 'maxNumberOfItem',
          defaultValue: 0,
          readValue: JsonReadValueHelper.readMaximumOfItem)
      int maxNumberOfItem,
      @JsonKey(
          name: 'banners',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      List<MaintenanceBannerDto> banners});
}

/// @nodoc
class __$$MaintenanceItemDtoImplCopyWithImpl<$Res>
    extends _$MaintenanceItemDtoCopyWithImpl<$Res, _$MaintenanceItemDtoImpl>
    implements _$$MaintenanceItemDtoImplCopyWith<$Res> {
  __$$MaintenanceItemDtoImplCopyWithImpl(_$MaintenanceItemDtoImpl _value,
      $Res Function(_$MaintenanceItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? maxNumberOfItem = null,
    Object? banners = null,
  }) {
    return _then(_$MaintenanceItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumberOfItem: null == maxNumberOfItem
          ? _value.maxNumberOfItem
          : maxNumberOfItem // ignore: cast_nullable_to_non_nullable
              as int,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceBannerDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MaintenanceItemDtoImpl extends _MaintenanceItemDto {
  const _$MaintenanceItemDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'displayName', defaultValue: '') required this.displayName,
      @JsonKey(
          name: 'maxNumberOfItem',
          defaultValue: 0,
          readValue: JsonReadValueHelper.readMaximumOfItem)
      required this.maxNumberOfItem,
      @JsonKey(
          name: 'banners',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      required final List<MaintenanceBannerDto> banners})
      : _banners = banners,
        super._();

  factory _$MaintenanceItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;
  @override
  @JsonKey(
      name: 'maxNumberOfItem',
      defaultValue: 0,
      readValue: JsonReadValueHelper.readMaximumOfItem)
  final int maxNumberOfItem;
  final List<MaintenanceBannerDto> _banners;
  @override
  @JsonKey(
      name: 'banners',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<MaintenanceBannerDto> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'MaintenanceItemDto(id: $id, name: $name, displayName: $displayName, maxNumberOfItem: $maxNumberOfItem, banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.maxNumberOfItem, maxNumberOfItem) ||
                other.maxNumberOfItem == maxNumberOfItem) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName,
      maxNumberOfItem, const DeepCollectionEquality().hash(_banners));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceItemDtoImplCopyWith<_$MaintenanceItemDtoImpl> get copyWith =>
      __$$MaintenanceItemDtoImplCopyWithImpl<_$MaintenanceItemDtoImpl>(
          this, _$identity);
}

abstract class _MaintenanceItemDto extends MaintenanceItemDto {
  const factory _MaintenanceItemDto(
          {@JsonKey(name: 'id', defaultValue: '') required final String id,
          @JsonKey(name: 'name', defaultValue: '') required final String name,
          @JsonKey(name: 'displayName', defaultValue: '')
          required final String displayName,
          @JsonKey(
              name: 'maxNumberOfItem',
              defaultValue: 0,
              readValue: JsonReadValueHelper.readMaximumOfItem)
          required final int maxNumberOfItem,
          @JsonKey(
              name: 'banners',
              defaultValue: [],
              readValue: JsonReadValueHelper.readValueList)
          required final List<MaintenanceBannerDto> banners}) =
      _$MaintenanceItemDtoImpl;
  const _MaintenanceItemDto._() : super._();

  factory _MaintenanceItemDto.fromJson(Map<String, dynamic> json) =
      _$MaintenanceItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(
      name: 'maxNumberOfItem',
      defaultValue: 0,
      readValue: JsonReadValueHelper.readMaximumOfItem)
  int get maxNumberOfItem;
  @override
  @JsonKey(
      name: 'banners',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<MaintenanceBannerDto> get banners;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceItemDtoImplCopyWith<_$MaintenanceItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaintenanceBannerDto _$MaintenanceBannerDtoFromJson(Map<String, dynamic> json) {
  return _MaintenanceBannerDto.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceBannerDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'template',
      defaultValue: '',
      readValue: JsonReadValueHelper.readName)
  String get template => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'content',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedDate')
  PublishedDateDto get publishedDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'hyperlink',
      defaultValue: '',
      readValue: JsonReadValueHelper.readHyperLink)
  String get hyperlink => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'type',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'applicableModules',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<ApplicableModulesDto> get applicableModules =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'enableCrossButton',
      defaultValue: false,
      readValue: JsonReadValueHelper.readValueBoolean)
  bool get enableCrossButton => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'login',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get loginType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenanceBannerDtoCopyWith<MaintenanceBannerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceBannerDtoCopyWith<$Res> {
  factory $MaintenanceBannerDtoCopyWith(MaintenanceBannerDto value,
          $Res Function(MaintenanceBannerDto) then) =
      _$MaintenanceBannerDtoCopyWithImpl<$Res, MaintenanceBannerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(
          name: 'template',
          defaultValue: '',
          readValue: JsonReadValueHelper.readName)
      String template,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(
          name: 'content',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String content,
      @JsonKey(name: 'publishedDate') PublishedDateDto publishedDate,
      @JsonKey(
          name: 'hyperlink',
          defaultValue: '',
          readValue: JsonReadValueHelper.readHyperLink)
      String hyperlink,
      @JsonKey(
          name: 'type',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String type,
      @JsonKey(
          name: 'applicableModules',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      List<ApplicableModulesDto> applicableModules,
      @JsonKey(
          name: 'enableCrossButton',
          defaultValue: false,
          readValue: JsonReadValueHelper.readValueBoolean)
      bool enableCrossButton,
      @JsonKey(
          name: 'login',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String loginType});

  $PublishedDateDtoCopyWith<$Res> get publishedDate;
}

/// @nodoc
class _$MaintenanceBannerDtoCopyWithImpl<$Res,
        $Val extends MaintenanceBannerDto>
    implements $MaintenanceBannerDtoCopyWith<$Res> {
  _$MaintenanceBannerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? template = null,
    Object? displayName = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? hyperlink = null,
    Object? type = null,
    Object? applicableModules = null,
    Object? enableCrossButton = null,
    Object? loginType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as PublishedDateDto,
      hyperlink: null == hyperlink
          ? _value.hyperlink
          : hyperlink // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applicableModules: null == applicableModules
          ? _value.applicableModules
          : applicableModules // ignore: cast_nullable_to_non_nullable
              as List<ApplicableModulesDto>,
      enableCrossButton: null == enableCrossButton
          ? _value.enableCrossButton
          : enableCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PublishedDateDtoCopyWith<$Res> get publishedDate {
    return $PublishedDateDtoCopyWith<$Res>(_value.publishedDate, (value) {
      return _then(_value.copyWith(publishedDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaintenanceBannerDtoImplCopyWith<$Res>
    implements $MaintenanceBannerDtoCopyWith<$Res> {
  factory _$$MaintenanceBannerDtoImplCopyWith(_$MaintenanceBannerDtoImpl value,
          $Res Function(_$MaintenanceBannerDtoImpl) then) =
      __$$MaintenanceBannerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(
          name: 'template',
          defaultValue: '',
          readValue: JsonReadValueHelper.readName)
      String template,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName,
      @JsonKey(
          name: 'content',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String content,
      @JsonKey(name: 'publishedDate') PublishedDateDto publishedDate,
      @JsonKey(
          name: 'hyperlink',
          defaultValue: '',
          readValue: JsonReadValueHelper.readHyperLink)
      String hyperlink,
      @JsonKey(
          name: 'type',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String type,
      @JsonKey(
          name: 'applicableModules',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      List<ApplicableModulesDto> applicableModules,
      @JsonKey(
          name: 'enableCrossButton',
          defaultValue: false,
          readValue: JsonReadValueHelper.readValueBoolean)
      bool enableCrossButton,
      @JsonKey(
          name: 'login',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      String loginType});

  @override
  $PublishedDateDtoCopyWith<$Res> get publishedDate;
}

/// @nodoc
class __$$MaintenanceBannerDtoImplCopyWithImpl<$Res>
    extends _$MaintenanceBannerDtoCopyWithImpl<$Res, _$MaintenanceBannerDtoImpl>
    implements _$$MaintenanceBannerDtoImplCopyWith<$Res> {
  __$$MaintenanceBannerDtoImplCopyWithImpl(_$MaintenanceBannerDtoImpl _value,
      $Res Function(_$MaintenanceBannerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? template = null,
    Object? displayName = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? hyperlink = null,
    Object? type = null,
    Object? applicableModules = null,
    Object? enableCrossButton = null,
    Object? loginType = null,
  }) {
    return _then(_$MaintenanceBannerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as PublishedDateDto,
      hyperlink: null == hyperlink
          ? _value.hyperlink
          : hyperlink // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applicableModules: null == applicableModules
          ? _value._applicableModules
          : applicableModules // ignore: cast_nullable_to_non_nullable
              as List<ApplicableModulesDto>,
      enableCrossButton: null == enableCrossButton
          ? _value.enableCrossButton
          : enableCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceBannerDtoImpl extends _MaintenanceBannerDto {
  const _$MaintenanceBannerDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(
          name: 'template',
          defaultValue: '',
          readValue: JsonReadValueHelper.readName)
      required this.template,
      @JsonKey(name: 'displayName', defaultValue: '') required this.displayName,
      @JsonKey(
          name: 'content',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required this.content,
      @JsonKey(name: 'publishedDate') required this.publishedDate,
      @JsonKey(
          name: 'hyperlink',
          defaultValue: '',
          readValue: JsonReadValueHelper.readHyperLink)
      required this.hyperlink,
      @JsonKey(
          name: 'type',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required this.type,
      @JsonKey(
          name: 'applicableModules',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      required final List<ApplicableModulesDto> applicableModules,
      @JsonKey(
          name: 'enableCrossButton',
          defaultValue: false,
          readValue: JsonReadValueHelper.readValueBoolean)
      required this.enableCrossButton,
      @JsonKey(
          name: 'login',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required this.loginType})
      : _applicableModules = applicableModules,
        super._();

  factory _$MaintenanceBannerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceBannerDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(
      name: 'template',
      defaultValue: '',
      readValue: JsonReadValueHelper.readName)
  final String template;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;
  @override
  @JsonKey(
      name: 'content',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  final String content;
  @override
  @JsonKey(name: 'publishedDate')
  final PublishedDateDto publishedDate;
  @override
  @JsonKey(
      name: 'hyperlink',
      defaultValue: '',
      readValue: JsonReadValueHelper.readHyperLink)
  final String hyperlink;
  @override
  @JsonKey(
      name: 'type',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  final String type;
  final List<ApplicableModulesDto> _applicableModules;
  @override
  @JsonKey(
      name: 'applicableModules',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<ApplicableModulesDto> get applicableModules {
    if (_applicableModules is EqualUnmodifiableListView)
      return _applicableModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableModules);
  }

  @override
  @JsonKey(
      name: 'enableCrossButton',
      defaultValue: false,
      readValue: JsonReadValueHelper.readValueBoolean)
  final bool enableCrossButton;
  @override
  @JsonKey(
      name: 'login',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  final String loginType;

  @override
  String toString() {
    return 'MaintenanceBannerDto(id: $id, name: $name, template: $template, displayName: $displayName, content: $content, publishedDate: $publishedDate, hyperlink: $hyperlink, type: $type, applicableModules: $applicableModules, enableCrossButton: $enableCrossButton, loginType: $loginType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceBannerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.hyperlink, hyperlink) ||
                other.hyperlink == hyperlink) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._applicableModules, _applicableModules) &&
            (identical(other.enableCrossButton, enableCrossButton) ||
                other.enableCrossButton == enableCrossButton) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      template,
      displayName,
      content,
      publishedDate,
      hyperlink,
      type,
      const DeepCollectionEquality().hash(_applicableModules),
      enableCrossButton,
      loginType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceBannerDtoImplCopyWith<_$MaintenanceBannerDtoImpl>
      get copyWith =>
          __$$MaintenanceBannerDtoImplCopyWithImpl<_$MaintenanceBannerDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceBannerDtoImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceBannerDto extends MaintenanceBannerDto {
  const factory _MaintenanceBannerDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(
          name: 'template',
          defaultValue: '',
          readValue: JsonReadValueHelper.readName)
      required final String template,
      @JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName,
      @JsonKey(
          name: 'content',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required final String content,
      @JsonKey(name: 'publishedDate')
      required final PublishedDateDto publishedDate,
      @JsonKey(
          name: 'hyperlink',
          defaultValue: '',
          readValue: JsonReadValueHelper.readHyperLink)
      required final String hyperlink,
      @JsonKey(
          name: 'type',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required final String type,
      @JsonKey(
          name: 'applicableModules',
          defaultValue: [],
          readValue: JsonReadValueHelper.readValueList)
      required final List<ApplicableModulesDto> applicableModules,
      @JsonKey(
          name: 'enableCrossButton',
          defaultValue: false,
          readValue: JsonReadValueHelper.readValueBoolean)
      required final bool enableCrossButton,
      @JsonKey(
          name: 'login',
          defaultValue: '',
          readValue: JsonReadValueHelper.readValueString)
      required final String loginType}) = _$MaintenanceBannerDtoImpl;
  const _MaintenanceBannerDto._() : super._();

  factory _MaintenanceBannerDto.fromJson(Map<String, dynamic> json) =
      _$MaintenanceBannerDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(
      name: 'template',
      defaultValue: '',
      readValue: JsonReadValueHelper.readName)
  String get template;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(
      name: 'content',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get content;
  @override
  @JsonKey(name: 'publishedDate')
  PublishedDateDto get publishedDate;
  @override
  @JsonKey(
      name: 'hyperlink',
      defaultValue: '',
      readValue: JsonReadValueHelper.readHyperLink)
  String get hyperlink;
  @override
  @JsonKey(
      name: 'type',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get type;
  @override
  @JsonKey(
      name: 'applicableModules',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList)
  List<ApplicableModulesDto> get applicableModules;
  @override
  @JsonKey(
      name: 'enableCrossButton',
      defaultValue: false,
      readValue: JsonReadValueHelper.readValueBoolean)
  bool get enableCrossButton;
  @override
  @JsonKey(
      name: 'login',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString)
  String get loginType;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceBannerDtoImplCopyWith<_$MaintenanceBannerDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApplicableModulesDto _$ApplicableModulesDtoFromJson(Map<String, dynamic> json) {
  return _ApplicableModulesDto.fromJson(json);
}

/// @nodoc
mixin _$ApplicableModulesDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicableModulesDtoCopyWith<ApplicableModulesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicableModulesDtoCopyWith<$Res> {
  factory $ApplicableModulesDtoCopyWith(ApplicableModulesDto value,
          $Res Function(ApplicableModulesDto) then) =
      _$ApplicableModulesDtoCopyWithImpl<$Res, ApplicableModulesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class _$ApplicableModulesDtoCopyWithImpl<$Res,
        $Val extends ApplicableModulesDto>
    implements $ApplicableModulesDtoCopyWith<$Res> {
  _$ApplicableModulesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicableModulesDtoImplCopyWith<$Res>
    implements $ApplicableModulesDtoCopyWith<$Res> {
  factory _$$ApplicableModulesDtoImplCopyWith(_$ApplicableModulesDtoImpl value,
          $Res Function(_$ApplicableModulesDtoImpl) then) =
      __$$ApplicableModulesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class __$$ApplicableModulesDtoImplCopyWithImpl<$Res>
    extends _$ApplicableModulesDtoCopyWithImpl<$Res, _$ApplicableModulesDtoImpl>
    implements _$$ApplicableModulesDtoImplCopyWith<$Res> {
  __$$ApplicableModulesDtoImplCopyWithImpl(_$ApplicableModulesDtoImpl _value,
      $Res Function(_$ApplicableModulesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$ApplicableModulesDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicableModulesDtoImpl extends _ApplicableModulesDto {
  const _$ApplicableModulesDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName})
      : super._();

  factory _$ApplicableModulesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicableModulesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;

  @override
  String toString() {
    return 'ApplicableModulesDto(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicableModulesDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicableModulesDtoImplCopyWith<_$ApplicableModulesDtoImpl>
      get copyWith =>
          __$$ApplicableModulesDtoImplCopyWithImpl<_$ApplicableModulesDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicableModulesDtoImplToJson(
      this,
    );
  }
}

abstract class _ApplicableModulesDto extends ApplicableModulesDto {
  const factory _ApplicableModulesDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName}) = _$ApplicableModulesDtoImpl;
  const _ApplicableModulesDto._() : super._();

  factory _ApplicableModulesDto.fromJson(Map<String, dynamic> json) =
      _$ApplicableModulesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$ApplicableModulesDtoImplCopyWith<_$ApplicableModulesDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PublishedDateDto _$PublishedDateDtoFromJson(Map<String, dynamic> json) {
  return _PublishedDateDto.fromJson(json);
}

/// @nodoc
mixin _$PublishedDateDto {
  @JsonKey(name: 'isoValue', defaultValue: '')
  String get isoValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'formattedDateValue', defaultValue: '')
  String get formattedDateValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishedDateDtoCopyWith<PublishedDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishedDateDtoCopyWith<$Res> {
  factory $PublishedDateDtoCopyWith(
          PublishedDateDto value, $Res Function(PublishedDateDto) then) =
      _$PublishedDateDtoCopyWithImpl<$Res, PublishedDateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isoValue', defaultValue: '') String isoValue,
      @JsonKey(name: 'formattedDateValue', defaultValue: '')
      String formattedDateValue});
}

/// @nodoc
class _$PublishedDateDtoCopyWithImpl<$Res, $Val extends PublishedDateDto>
    implements $PublishedDateDtoCopyWith<$Res> {
  _$PublishedDateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoValue = null,
    Object? formattedDateValue = null,
  }) {
    return _then(_value.copyWith(
      isoValue: null == isoValue
          ? _value.isoValue
          : isoValue // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDateValue: null == formattedDateValue
          ? _value.formattedDateValue
          : formattedDateValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublishedDateDtoImplCopyWith<$Res>
    implements $PublishedDateDtoCopyWith<$Res> {
  factory _$$PublishedDateDtoImplCopyWith(_$PublishedDateDtoImpl value,
          $Res Function(_$PublishedDateDtoImpl) then) =
      __$$PublishedDateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isoValue', defaultValue: '') String isoValue,
      @JsonKey(name: 'formattedDateValue', defaultValue: '')
      String formattedDateValue});
}

/// @nodoc
class __$$PublishedDateDtoImplCopyWithImpl<$Res>
    extends _$PublishedDateDtoCopyWithImpl<$Res, _$PublishedDateDtoImpl>
    implements _$$PublishedDateDtoImplCopyWith<$Res> {
  __$$PublishedDateDtoImplCopyWithImpl(_$PublishedDateDtoImpl _value,
      $Res Function(_$PublishedDateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoValue = null,
    Object? formattedDateValue = null,
  }) {
    return _then(_$PublishedDateDtoImpl(
      isoValue: null == isoValue
          ? _value.isoValue
          : isoValue // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDateValue: null == formattedDateValue
          ? _value.formattedDateValue
          : formattedDateValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublishedDateDtoImpl extends _PublishedDateDto {
  const _$PublishedDateDtoImpl(
      {@JsonKey(name: 'isoValue', defaultValue: '') required this.isoValue,
      @JsonKey(name: 'formattedDateValue', defaultValue: '')
      required this.formattedDateValue})
      : super._();

  factory _$PublishedDateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublishedDateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'isoValue', defaultValue: '')
  final String isoValue;
  @override
  @JsonKey(name: 'formattedDateValue', defaultValue: '')
  final String formattedDateValue;

  @override
  String toString() {
    return 'PublishedDateDto(isoValue: $isoValue, formattedDateValue: $formattedDateValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishedDateDtoImpl &&
            (identical(other.isoValue, isoValue) ||
                other.isoValue == isoValue) &&
            (identical(other.formattedDateValue, formattedDateValue) ||
                other.formattedDateValue == formattedDateValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isoValue, formattedDateValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishedDateDtoImplCopyWith<_$PublishedDateDtoImpl> get copyWith =>
      __$$PublishedDateDtoImplCopyWithImpl<_$PublishedDateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublishedDateDtoImplToJson(
      this,
    );
  }
}

abstract class _PublishedDateDto extends PublishedDateDto {
  const factory _PublishedDateDto(
      {@JsonKey(name: 'isoValue', defaultValue: '')
      required final String isoValue,
      @JsonKey(name: 'formattedDateValue', defaultValue: '')
      required final String formattedDateValue}) = _$PublishedDateDtoImpl;
  const _PublishedDateDto._() : super._();

  factory _PublishedDateDto.fromJson(Map<String, dynamic> json) =
      _$PublishedDateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'isoValue', defaultValue: '')
  String get isoValue;
  @override
  @JsonKey(name: 'formattedDateValue', defaultValue: '')
  String get formattedDateValue;
  @override
  @JsonKey(ignore: true)
  _$$PublishedDateDtoImplCopyWith<_$PublishedDateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
