// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnFilterDto _$ReturnFilterDtoFromJson(Map<String, dynamic> json) {
  return _ReturnFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnFilterDto {
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  String get refundTotalFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  String get refundTotalTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnType', includeIfNull: false)
  int? get returnType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnFilterDtoCopyWith<ReturnFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnFilterDtoCopyWith<$Res> {
  factory $ReturnFilterDtoCopyWith(
          ReturnFilterDto value, $Res Function(ReturnFilterDto) then) =
      _$ReturnFilterDtoCopyWithImpl<$Res, ReturnFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '') String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      List<String> statusList,
      @JsonKey(name: 'returnType', includeIfNull: false) int? returnType});
}

/// @nodoc
class _$ReturnFilterDtoCopyWithImpl<$Res, $Val extends ReturnFilterDto>
    implements $ReturnFilterDtoCopyWith<$Res> {
  _$ReturnFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalFrom = null,
    Object? refundTotalTo = null,
    Object? statusList = null,
    Object? returnType = freezed,
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
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as String,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      returnType: freezed == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnFilterDtoImplCopyWith<$Res>
    implements $ReturnFilterDtoCopyWith<$Res> {
  factory _$$ReturnFilterDtoImplCopyWith(_$ReturnFilterDtoImpl value,
          $Res Function(_$ReturnFilterDtoImpl) then) =
      __$$ReturnFilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '') String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      List<String> statusList,
      @JsonKey(name: 'returnType', includeIfNull: false) int? returnType});
}

/// @nodoc
class __$$ReturnFilterDtoImplCopyWithImpl<$Res>
    extends _$ReturnFilterDtoCopyWithImpl<$Res, _$ReturnFilterDtoImpl>
    implements _$$ReturnFilterDtoImplCopyWith<$Res> {
  __$$ReturnFilterDtoImplCopyWithImpl(
      _$ReturnFilterDtoImpl _value, $Res Function(_$ReturnFilterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalFrom = null,
    Object? refundTotalTo = null,
    Object? statusList = null,
    Object? returnType = freezed,
  }) {
    return _then(_$ReturnFilterDtoImpl(
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as String,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      returnType: freezed == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnFilterDtoImpl extends _ReturnFilterDto {
  const _$ReturnFilterDtoImpl(
      {@JsonKey(name: 'dateFrom', defaultValue: '') required this.dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      required this.refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '')
      required this.refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> statusList,
      @JsonKey(name: 'returnType', includeIfNull: false) this.returnType})
      : _statusList = statusList,
        super._();

  factory _$ReturnFilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnFilterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  final String dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  final String refundTotalFrom;
  @override
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  final String refundTotalTo;
  final List<String> _statusList;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  @override
  @JsonKey(name: 'returnType', includeIfNull: false)
  final int? returnType;

  @override
  String toString() {
    return 'ReturnFilterDto(dateFrom: $dateFrom, dateTo: $dateTo, refundTotalFrom: $refundTotalFrom, refundTotalTo: $refundTotalTo, statusList: $statusList, returnType: $returnType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnFilterDtoImpl &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.refundTotalFrom, refundTotalFrom) ||
                other.refundTotalFrom == refundTotalFrom) &&
            (identical(other.refundTotalTo, refundTotalTo) ||
                other.refundTotalTo == refundTotalTo) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            (identical(other.returnType, returnType) ||
                other.returnType == returnType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateFrom,
      dateTo,
      refundTotalFrom,
      refundTotalTo,
      const DeepCollectionEquality().hash(_statusList),
      returnType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnFilterDtoImplCopyWith<_$ReturnFilterDtoImpl> get copyWith =>
      __$$ReturnFilterDtoImplCopyWithImpl<_$ReturnFilterDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnFilterDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnFilterDto extends ReturnFilterDto {
  const factory _ReturnFilterDto(
      {@JsonKey(name: 'dateFrom', defaultValue: '')
      required final String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') required final String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      required final String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '')
      required final String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> statusList,
      @JsonKey(name: 'returnType', includeIfNull: false)
      final int? returnType}) = _$ReturnFilterDtoImpl;
  const _ReturnFilterDto._() : super._();

  factory _ReturnFilterDto.fromJson(Map<String, dynamic> json) =
      _$ReturnFilterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  String get refundTotalFrom;
  @override
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  String get refundTotalTo;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList;
  @override
  @JsonKey(name: 'returnType', includeIfNull: false)
  int? get returnType;
  @override
  @JsonKey(ignore: true)
  _$$ReturnFilterDtoImplCopyWith<_$ReturnFilterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
