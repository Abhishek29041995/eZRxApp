// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnnouncementDto _$AnnouncementDtoFromJson(Map<String, dynamic> json) {
  return _AnnouncementDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementDto {
  @JsonKey(name: 'active', defaultValue: false)
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'descriptionList', defaultValue: [])
  List<AnnouncementMessageDto> get descriptionList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'startTime', defaultValue: '')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'endTime', defaultValue: '')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'day', defaultValue: '')
  String get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'functionLabel', defaultValue: '')
  String get functionLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'isModuleSpecific', defaultValue: false)
  bool get isModuleSpecific => throw _privateConstructorUsedError;
  @_ModuleNameConverter()
  @JsonKey(name: 'moduleName', defaultValue: [])
  List<String> get moduleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'loginType', defaultValue: '')
  String get loginType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCrossButton', defaultValue: false)
  bool get isCrossButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementDtoCopyWith<AnnouncementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementDtoCopyWith<$Res> {
  factory $AnnouncementDtoCopyWith(
          AnnouncementDto value, $Res Function(AnnouncementDto) then) =
      _$AnnouncementDtoCopyWithImpl<$Res, AnnouncementDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'active', defaultValue: false) bool active,
      @JsonKey(name: 'descriptionList', defaultValue: [])
      List<AnnouncementMessageDto> descriptionList,
      @JsonKey(name: 'startTime', defaultValue: '') String startTime,
      @JsonKey(name: 'endTime', defaultValue: '') String endTime,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'day', defaultValue: '') String day,
      @JsonKey(name: 'functionLabel', defaultValue: '') String functionLabel,
      @JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'isModuleSpecific', defaultValue: false)
      bool isModuleSpecific,
      @_ModuleNameConverter()
      @JsonKey(name: 'moduleName', defaultValue: [])
      List<String> moduleName,
      @JsonKey(name: 'loginType', defaultValue: '') String loginType,
      @JsonKey(name: 'isCrossButton', defaultValue: false) bool isCrossButton});
}

/// @nodoc
class _$AnnouncementDtoCopyWithImpl<$Res, $Val extends AnnouncementDto>
    implements $AnnouncementDtoCopyWith<$Res> {
  _$AnnouncementDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? descriptionList = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? day = null,
    Object? functionLabel = null,
    Object? id = null,
    Object? isModuleSpecific = null,
    Object? moduleName = null,
    Object? loginType = null,
    Object? isCrossButton = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptionList: null == descriptionList
          ? _value.descriptionList
          : descriptionList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementMessageDto>,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      functionLabel: null == functionLabel
          ? _value.functionLabel
          : functionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isModuleSpecific: null == isModuleSpecific
          ? _value.isModuleSpecific
          : isModuleSpecific // ignore: cast_nullable_to_non_nullable
              as bool,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossButton: null == isCrossButton
          ? _value.isCrossButton
          : isCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementDtoImplCopyWith<$Res>
    implements $AnnouncementDtoCopyWith<$Res> {
  factory _$$AnnouncementDtoImplCopyWith(_$AnnouncementDtoImpl value,
          $Res Function(_$AnnouncementDtoImpl) then) =
      __$$AnnouncementDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active', defaultValue: false) bool active,
      @JsonKey(name: 'descriptionList', defaultValue: [])
      List<AnnouncementMessageDto> descriptionList,
      @JsonKey(name: 'startTime', defaultValue: '') String startTime,
      @JsonKey(name: 'endTime', defaultValue: '') String endTime,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'day', defaultValue: '') String day,
      @JsonKey(name: 'functionLabel', defaultValue: '') String functionLabel,
      @JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'isModuleSpecific', defaultValue: false)
      bool isModuleSpecific,
      @_ModuleNameConverter()
      @JsonKey(name: 'moduleName', defaultValue: [])
      List<String> moduleName,
      @JsonKey(name: 'loginType', defaultValue: '') String loginType,
      @JsonKey(name: 'isCrossButton', defaultValue: false) bool isCrossButton});
}

/// @nodoc
class __$$AnnouncementDtoImplCopyWithImpl<$Res>
    extends _$AnnouncementDtoCopyWithImpl<$Res, _$AnnouncementDtoImpl>
    implements _$$AnnouncementDtoImplCopyWith<$Res> {
  __$$AnnouncementDtoImplCopyWithImpl(
      _$AnnouncementDtoImpl _value, $Res Function(_$AnnouncementDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? descriptionList = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? day = null,
    Object? functionLabel = null,
    Object? id = null,
    Object? isModuleSpecific = null,
    Object? moduleName = null,
    Object? loginType = null,
    Object? isCrossButton = null,
  }) {
    return _then(_$AnnouncementDtoImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      descriptionList: null == descriptionList
          ? _value._descriptionList
          : descriptionList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementMessageDto>,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      functionLabel: null == functionLabel
          ? _value.functionLabel
          : functionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isModuleSpecific: null == isModuleSpecific
          ? _value.isModuleSpecific
          : isModuleSpecific // ignore: cast_nullable_to_non_nullable
              as bool,
      moduleName: null == moduleName
          ? _value._moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossButton: null == isCrossButton
          ? _value.isCrossButton
          : isCrossButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AnnouncementDtoImpl extends _AnnouncementDto {
  const _$AnnouncementDtoImpl(
      {@JsonKey(name: 'active', defaultValue: false) required this.active,
      @JsonKey(name: 'descriptionList', defaultValue: [])
      required final List<AnnouncementMessageDto> descriptionList,
      @JsonKey(name: 'startTime', defaultValue: '') required this.startTime,
      @JsonKey(name: 'endTime', defaultValue: '') required this.endTime,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'day', defaultValue: '') required this.day,
      @JsonKey(name: 'functionLabel', defaultValue: '')
      required this.functionLabel,
      @JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'isModuleSpecific', defaultValue: false)
      required this.isModuleSpecific,
      @_ModuleNameConverter()
      @JsonKey(name: 'moduleName', defaultValue: [])
      required final List<String> moduleName,
      @JsonKey(name: 'loginType', defaultValue: '') required this.loginType,
      @JsonKey(name: 'isCrossButton', defaultValue: false)
      required this.isCrossButton})
      : _descriptionList = descriptionList,
        _moduleName = moduleName,
        super._();

  factory _$AnnouncementDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementDtoImplFromJson(json);

  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool active;
  final List<AnnouncementMessageDto> _descriptionList;
  @override
  @JsonKey(name: 'descriptionList', defaultValue: [])
  List<AnnouncementMessageDto> get descriptionList {
    if (_descriptionList is EqualUnmodifiableListView) return _descriptionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptionList);
  }

  @override
  @JsonKey(name: 'startTime', defaultValue: '')
  final String startTime;
  @override
  @JsonKey(name: 'endTime', defaultValue: '')
  final String endTime;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'day', defaultValue: '')
  final String day;
  @override
  @JsonKey(name: 'functionLabel', defaultValue: '')
  final String functionLabel;
  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'isModuleSpecific', defaultValue: false)
  final bool isModuleSpecific;
  final List<String> _moduleName;
  @override
  @_ModuleNameConverter()
  @JsonKey(name: 'moduleName', defaultValue: [])
  List<String> get moduleName {
    if (_moduleName is EqualUnmodifiableListView) return _moduleName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleName);
  }

  @override
  @JsonKey(name: 'loginType', defaultValue: '')
  final String loginType;
  @override
  @JsonKey(name: 'isCrossButton', defaultValue: false)
  final bool isCrossButton;

  @override
  String toString() {
    return 'AnnouncementDto(active: $active, descriptionList: $descriptionList, startTime: $startTime, endTime: $endTime, type: $type, day: $day, functionLabel: $functionLabel, id: $id, isModuleSpecific: $isModuleSpecific, moduleName: $moduleName, loginType: $loginType, isCrossButton: $isCrossButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementDtoImpl &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality()
                .equals(other._descriptionList, _descriptionList) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.functionLabel, functionLabel) ||
                other.functionLabel == functionLabel) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isModuleSpecific, isModuleSpecific) ||
                other.isModuleSpecific == isModuleSpecific) &&
            const DeepCollectionEquality()
                .equals(other._moduleName, _moduleName) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType) &&
            (identical(other.isCrossButton, isCrossButton) ||
                other.isCrossButton == isCrossButton));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      active,
      const DeepCollectionEquality().hash(_descriptionList),
      startTime,
      endTime,
      type,
      day,
      functionLabel,
      id,
      isModuleSpecific,
      const DeepCollectionEquality().hash(_moduleName),
      loginType,
      isCrossButton);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementDtoImplCopyWith<_$AnnouncementDtoImpl> get copyWith =>
      __$$AnnouncementDtoImplCopyWithImpl<_$AnnouncementDtoImpl>(
          this, _$identity);
}

abstract class _AnnouncementDto extends AnnouncementDto {
  const factory _AnnouncementDto(
      {@JsonKey(name: 'active', defaultValue: false) required final bool active,
      @JsonKey(name: 'descriptionList', defaultValue: [])
      required final List<AnnouncementMessageDto> descriptionList,
      @JsonKey(name: 'startTime', defaultValue: '')
      required final String startTime,
      @JsonKey(name: 'endTime', defaultValue: '') required final String endTime,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'day', defaultValue: '') required final String day,
      @JsonKey(name: 'functionLabel', defaultValue: '')
      required final String functionLabel,
      @JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'isModuleSpecific', defaultValue: false)
      required final bool isModuleSpecific,
      @_ModuleNameConverter()
      @JsonKey(name: 'moduleName', defaultValue: [])
      required final List<String> moduleName,
      @JsonKey(name: 'loginType', defaultValue: '')
      required final String loginType,
      @JsonKey(name: 'isCrossButton', defaultValue: false)
      required final bool isCrossButton}) = _$AnnouncementDtoImpl;
  const _AnnouncementDto._() : super._();

  factory _AnnouncementDto.fromJson(Map<String, dynamic> json) =
      _$AnnouncementDtoImpl.fromJson;

  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool get active;
  @override
  @JsonKey(name: 'descriptionList', defaultValue: [])
  List<AnnouncementMessageDto> get descriptionList;
  @override
  @JsonKey(name: 'startTime', defaultValue: '')
  String get startTime;
  @override
  @JsonKey(name: 'endTime', defaultValue: '')
  String get endTime;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'day', defaultValue: '')
  String get day;
  @override
  @JsonKey(name: 'functionLabel', defaultValue: '')
  String get functionLabel;
  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'isModuleSpecific', defaultValue: false)
  bool get isModuleSpecific;
  @override
  @_ModuleNameConverter()
  @JsonKey(name: 'moduleName', defaultValue: [])
  List<String> get moduleName;
  @override
  @JsonKey(name: 'loginType', defaultValue: '')
  String get loginType;
  @override
  @JsonKey(name: 'isCrossButton', defaultValue: false)
  bool get isCrossButton;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementDtoImplCopyWith<_$AnnouncementDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnnouncementMessageDto _$AnnouncementMessageDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementMessageDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementMessageDto {
  @JsonKey(name: 'languageCode', defaultValue: '')
  String get languageCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'language', defaultValue: '')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'announcement', defaultValue: '')
  String get announcement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementMessageDtoCopyWith<AnnouncementMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementMessageDtoCopyWith<$Res> {
  factory $AnnouncementMessageDtoCopyWith(AnnouncementMessageDto value,
          $Res Function(AnnouncementMessageDto) then) =
      _$AnnouncementMessageDtoCopyWithImpl<$Res, AnnouncementMessageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'languageCode', defaultValue: '') String languageCode,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'announcement', defaultValue: '') String announcement});
}

/// @nodoc
class _$AnnouncementMessageDtoCopyWithImpl<$Res,
        $Val extends AnnouncementMessageDto>
    implements $AnnouncementMessageDtoCopyWith<$Res> {
  _$AnnouncementMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? language = null,
    Object? announcement = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      announcement: null == announcement
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementMessageDtoImplCopyWith<$Res>
    implements $AnnouncementMessageDtoCopyWith<$Res> {
  factory _$$AnnouncementMessageDtoImplCopyWith(
          _$AnnouncementMessageDtoImpl value,
          $Res Function(_$AnnouncementMessageDtoImpl) then) =
      __$$AnnouncementMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'languageCode', defaultValue: '') String languageCode,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'announcement', defaultValue: '') String announcement});
}

/// @nodoc
class __$$AnnouncementMessageDtoImplCopyWithImpl<$Res>
    extends _$AnnouncementMessageDtoCopyWithImpl<$Res,
        _$AnnouncementMessageDtoImpl>
    implements _$$AnnouncementMessageDtoImplCopyWith<$Res> {
  __$$AnnouncementMessageDtoImplCopyWithImpl(
      _$AnnouncementMessageDtoImpl _value,
      $Res Function(_$AnnouncementMessageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? language = null,
    Object? announcement = null,
  }) {
    return _then(_$AnnouncementMessageDtoImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      announcement: null == announcement
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementMessageDtoImpl extends _AnnouncementMessageDto {
  const _$AnnouncementMessageDtoImpl(
      {@JsonKey(name: 'languageCode', defaultValue: '')
      required this.languageCode,
      @JsonKey(name: 'language', defaultValue: '') required this.language,
      @JsonKey(name: 'announcement', defaultValue: '')
      required this.announcement})
      : super._();

  factory _$AnnouncementMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementMessageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'languageCode', defaultValue: '')
  final String languageCode;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  final String language;
  @override
  @JsonKey(name: 'announcement', defaultValue: '')
  final String announcement;

  @override
  String toString() {
    return 'AnnouncementMessageDto(languageCode: $languageCode, language: $language, announcement: $announcement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementMessageDtoImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.announcement, announcement) ||
                other.announcement == announcement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageCode, language, announcement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementMessageDtoImplCopyWith<_$AnnouncementMessageDtoImpl>
      get copyWith => __$$AnnouncementMessageDtoImplCopyWithImpl<
          _$AnnouncementMessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementMessageDtoImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementMessageDto extends AnnouncementMessageDto {
  const factory _AnnouncementMessageDto(
      {@JsonKey(name: 'languageCode', defaultValue: '')
      required final String languageCode,
      @JsonKey(name: 'language', defaultValue: '')
      required final String language,
      @JsonKey(name: 'announcement', defaultValue: '')
      required final String announcement}) = _$AnnouncementMessageDtoImpl;
  const _AnnouncementMessageDto._() : super._();

  factory _AnnouncementMessageDto.fromJson(Map<String, dynamic> json) =
      _$AnnouncementMessageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'languageCode', defaultValue: '')
  String get languageCode;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  String get language;
  @override
  @JsonKey(name: 'announcement', defaultValue: '')
  String get announcement;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementMessageDtoImplCopyWith<_$AnnouncementMessageDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
