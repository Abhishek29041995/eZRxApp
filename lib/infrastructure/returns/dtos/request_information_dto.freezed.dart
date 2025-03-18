// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestInformationDto _$RequestInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _RequestInformationDto.fromJson(json);
}

/// @nodoc
mixin _$RequestInformationDto {
  @JsonKey(name: 'requestHeader')
  RequestInformationHeaderDto get requestHeader =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get requestInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestInformationDtoCopyWith<RequestInformationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestInformationDtoCopyWith<$Res> {
  factory $RequestInformationDtoCopyWith(RequestInformationDto value,
          $Res Function(RequestInformationDto) then) =
      _$RequestInformationDtoCopyWithImpl<$Res, RequestInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader')
      RequestInformationHeaderDto requestHeader,
      @JsonKey(
          name: 'requestInformationV2',
          defaultValue: <ReturnRequestInformationDto>[])
      List<ReturnRequestInformationDto> requestInformation});

  $RequestInformationHeaderDtoCopyWith<$Res> get requestHeader;
}

/// @nodoc
class _$RequestInformationDtoCopyWithImpl<$Res,
        $Val extends RequestInformationDto>
    implements $RequestInformationDtoCopyWith<$Res> {
  _$RequestInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_value.copyWith(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as RequestInformationHeaderDto,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformationDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestInformationHeaderDtoCopyWith<$Res> get requestHeader {
    return $RequestInformationHeaderDtoCopyWith<$Res>(_value.requestHeader,
        (value) {
      return _then(_value.copyWith(requestHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestInformationDtoImplCopyWith<$Res>
    implements $RequestInformationDtoCopyWith<$Res> {
  factory _$$RequestInformationDtoImplCopyWith(
          _$RequestInformationDtoImpl value,
          $Res Function(_$RequestInformationDtoImpl) then) =
      __$$RequestInformationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestHeader')
      RequestInformationHeaderDto requestHeader,
      @JsonKey(
          name: 'requestInformationV2',
          defaultValue: <ReturnRequestInformationDto>[])
      List<ReturnRequestInformationDto> requestInformation});

  @override
  $RequestInformationHeaderDtoCopyWith<$Res> get requestHeader;
}

/// @nodoc
class __$$RequestInformationDtoImplCopyWithImpl<$Res>
    extends _$RequestInformationDtoCopyWithImpl<$Res,
        _$RequestInformationDtoImpl>
    implements _$$RequestInformationDtoImplCopyWith<$Res> {
  __$$RequestInformationDtoImplCopyWithImpl(_$RequestInformationDtoImpl _value,
      $Res Function(_$RequestInformationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestHeader = null,
    Object? requestInformation = null,
  }) {
    return _then(_$RequestInformationDtoImpl(
      requestHeader: null == requestHeader
          ? _value.requestHeader
          : requestHeader // ignore: cast_nullable_to_non_nullable
              as RequestInformationHeaderDto,
      requestInformation: null == requestInformation
          ? _value._requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestInformationDtoImpl extends _RequestInformationDto {
  _$RequestInformationDtoImpl(
      {@JsonKey(name: 'requestHeader') required this.requestHeader,
      @JsonKey(
          name: 'requestInformationV2',
          defaultValue: <ReturnRequestInformationDto>[])
      required final List<ReturnRequestInformationDto> requestInformation})
      : _requestInformation = requestInformation,
        super._();

  factory _$RequestInformationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestInformationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'requestHeader')
  final RequestInformationHeaderDto requestHeader;
  final List<ReturnRequestInformationDto> _requestInformation;
  @override
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get requestInformation {
    if (_requestInformation is EqualUnmodifiableListView)
      return _requestInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInformation);
  }

  @override
  String toString() {
    return 'RequestInformationDto(requestHeader: $requestHeader, requestInformation: $requestInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestInformationDtoImpl &&
            (identical(other.requestHeader, requestHeader) ||
                other.requestHeader == requestHeader) &&
            const DeepCollectionEquality()
                .equals(other._requestInformation, _requestInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestHeader,
      const DeepCollectionEquality().hash(_requestInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestInformationDtoImplCopyWith<_$RequestInformationDtoImpl>
      get copyWith => __$$RequestInformationDtoImplCopyWithImpl<
          _$RequestInformationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestInformationDtoImplToJson(
      this,
    );
  }
}

abstract class _RequestInformationDto extends RequestInformationDto {
  factory _RequestInformationDto(
      {@JsonKey(name: 'requestHeader')
      required final RequestInformationHeaderDto requestHeader,
      @JsonKey(
          name: 'requestInformationV2',
          defaultValue: <ReturnRequestInformationDto>[])
      required final List<ReturnRequestInformationDto>
          requestInformation}) = _$RequestInformationDtoImpl;
  _RequestInformationDto._() : super._();

  factory _RequestInformationDto.fromJson(Map<String, dynamic> json) =
      _$RequestInformationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'requestHeader')
  RequestInformationHeaderDto get requestHeader;
  @override
  @JsonKey(
      name: 'requestInformationV2',
      defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get requestInformation;
  @override
  @JsonKey(ignore: true)
  _$$RequestInformationDtoImplCopyWith<_$RequestInformationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
