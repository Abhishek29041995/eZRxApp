// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_items_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnItemsFilterDto _$ReturnItemsFilterDtoFromJson(Map<String, dynamic> json) {
  return _ReturnItemsFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnItemsFilterDto {
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnItemsFilterDtoCopyWith<ReturnItemsFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemsFilterDtoCopyWith<$Res> {
  factory $ReturnItemsFilterDtoCopyWith(ReturnItemsFilterDto value,
          $Res Function(ReturnItemsFilterDto) then) =
      _$ReturnItemsFilterDtoCopyWithImpl<$Res, ReturnItemsFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo});
}

/// @nodoc
class _$ReturnItemsFilterDtoCopyWithImpl<$Res,
        $Val extends ReturnItemsFilterDto>
    implements $ReturnItemsFilterDtoCopyWith<$Res> {
  _$ReturnItemsFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
  }) {
    return _then(_value.copyWith(
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnItemsFilterDtoImplCopyWith<$Res>
    implements $ReturnItemsFilterDtoCopyWith<$Res> {
  factory _$$ReturnItemsFilterDtoImplCopyWith(_$ReturnItemsFilterDtoImpl value,
          $Res Function(_$ReturnItemsFilterDtoImpl) then) =
      __$$ReturnItemsFilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo});
}

/// @nodoc
class __$$ReturnItemsFilterDtoImplCopyWithImpl<$Res>
    extends _$ReturnItemsFilterDtoCopyWithImpl<$Res, _$ReturnItemsFilterDtoImpl>
    implements _$$ReturnItemsFilterDtoImplCopyWith<$Res> {
  __$$ReturnItemsFilterDtoImplCopyWithImpl(_$ReturnItemsFilterDtoImpl _value,
      $Res Function(_$ReturnItemsFilterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
  }) {
    return _then(_$ReturnItemsFilterDtoImpl(
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnItemsFilterDtoImpl extends _ReturnItemsFilterDto {
  const _$ReturnItemsFilterDtoImpl(
      {@JsonKey(name: 'dateFrom', defaultValue: '') required this.dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') required this.dateTo})
      : super._();

  factory _$ReturnItemsFilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnItemsFilterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  final String dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  final String dateTo;

  @override
  String toString() {
    return 'ReturnItemsFilterDto(dateFrom: $dateFrom, dateTo: $dateTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnItemsFilterDtoImpl &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateFrom, dateTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnItemsFilterDtoImplCopyWith<_$ReturnItemsFilterDtoImpl>
      get copyWith =>
          __$$ReturnItemsFilterDtoImplCopyWithImpl<_$ReturnItemsFilterDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnItemsFilterDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnItemsFilterDto extends ReturnItemsFilterDto {
  const factory _ReturnItemsFilterDto(
      {@JsonKey(name: 'dateFrom', defaultValue: '')
      required final String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '')
      required final String dateTo}) = _$ReturnItemsFilterDtoImpl;
  const _ReturnItemsFilterDto._() : super._();

  factory _ReturnItemsFilterDto.fromJson(Map<String, dynamic> json) =
      _$ReturnItemsFilterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(ignore: true)
  _$$ReturnItemsFilterDtoImplCopyWith<_$ReturnItemsFilterDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
