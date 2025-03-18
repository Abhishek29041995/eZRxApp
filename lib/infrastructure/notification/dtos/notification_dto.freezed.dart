// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) {
  return _NotificationDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationDto {
  @JsonKey(name: 'pagination')
  PaginationDto get pagination => throw _privateConstructorUsedError;
  @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
  List<NotificationDataDto> get notificationData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDtoCopyWith<NotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDtoCopyWith<$Res> {
  factory $NotificationDtoCopyWith(
          NotificationDto value, $Res Function(NotificationDto) then) =
      _$NotificationDtoCopyWithImpl<$Res, NotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pagination') PaginationDto pagination,
      @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
      List<NotificationDataDto> notificationData});

  $PaginationDtoCopyWith<$Res> get pagination;
}

/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res, $Val extends NotificationDto>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? notificationData = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationDto,
      notificationData: null == notificationData
          ? _value.notificationData
          : notificationData // ignore: cast_nullable_to_non_nullable
              as List<NotificationDataDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationDtoCopyWith<$Res> get pagination {
    return $PaginationDtoCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationDtoImplCopyWith<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  factory _$$NotificationDtoImplCopyWith(_$NotificationDtoImpl value,
          $Res Function(_$NotificationDtoImpl) then) =
      __$$NotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pagination') PaginationDto pagination,
      @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
      List<NotificationDataDto> notificationData});

  @override
  $PaginationDtoCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$NotificationDtoImplCopyWithImpl<$Res>
    extends _$NotificationDtoCopyWithImpl<$Res, _$NotificationDtoImpl>
    implements _$$NotificationDtoImplCopyWith<$Res> {
  __$$NotificationDtoImplCopyWithImpl(
      _$NotificationDtoImpl _value, $Res Function(_$NotificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? notificationData = null,
  }) {
    return _then(_$NotificationDtoImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationDto,
      notificationData: null == notificationData
          ? _value._notificationData
          : notificationData // ignore: cast_nullable_to_non_nullable
              as List<NotificationDataDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDtoImpl extends _NotificationDto {
  const _$NotificationDtoImpl(
      {@JsonKey(name: 'pagination') required this.pagination,
      @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
      required final List<NotificationDataDto> notificationData})
      : _notificationData = notificationData,
        super._();

  factory _$NotificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'pagination')
  final PaginationDto pagination;
  final List<NotificationDataDto> _notificationData;
  @override
  @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
  List<NotificationDataDto> get notificationData {
    if (_notificationData is EqualUnmodifiableListView)
      return _notificationData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationData);
  }

  @override
  String toString() {
    return 'NotificationDto(pagination: $pagination, notificationData: $notificationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDtoImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality()
                .equals(other._notificationData, _notificationData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination,
      const DeepCollectionEquality().hash(_notificationData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDtoImplCopyWith<_$NotificationDtoImpl> get copyWith =>
      __$$NotificationDtoImplCopyWithImpl<_$NotificationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _NotificationDto extends NotificationDto {
  const factory _NotificationDto(
          {@JsonKey(name: 'pagination') required final PaginationDto pagination,
          @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
          required final List<NotificationDataDto> notificationData}) =
      _$NotificationDtoImpl;
  const _NotificationDto._() : super._();

  factory _NotificationDto.fromJson(Map<String, dynamic> json) =
      _$NotificationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'pagination')
  PaginationDto get pagination;
  @override
  @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
  List<NotificationDataDto> get notificationData;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDtoImplCopyWith<_$NotificationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
