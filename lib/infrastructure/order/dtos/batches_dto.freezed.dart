// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batches_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchesDto _$BatchesDtoFromJson(Map<String, dynamic> json) {
  return _BatchesDto.fromJson(json);
}

/// @nodoc
mixin _$BatchesDto {
  @JsonKey(name: 'batchNumber', defaultValue: '')
  String get batchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchesDtoCopyWith<BatchesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchesDtoCopyWith<$Res> {
  factory $BatchesDtoCopyWith(
          BatchesDto value, $Res Function(BatchesDto) then) =
      _$BatchesDtoCopyWithImpl<$Res, BatchesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'batchNumber', defaultValue: '') String batchNumber,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate});
}

/// @nodoc
class _$BatchesDtoCopyWithImpl<$Res, $Val extends BatchesDto>
    implements $BatchesDtoCopyWith<$Res> {
  _$BatchesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNumber = null,
    Object? expiryDate = null,
  }) {
    return _then(_value.copyWith(
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchesDtoImplCopyWith<$Res>
    implements $BatchesDtoCopyWith<$Res> {
  factory _$$BatchesDtoImplCopyWith(
          _$BatchesDtoImpl value, $Res Function(_$BatchesDtoImpl) then) =
      __$$BatchesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'batchNumber', defaultValue: '') String batchNumber,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate});
}

/// @nodoc
class __$$BatchesDtoImplCopyWithImpl<$Res>
    extends _$BatchesDtoCopyWithImpl<$Res, _$BatchesDtoImpl>
    implements _$$BatchesDtoImplCopyWith<$Res> {
  __$$BatchesDtoImplCopyWithImpl(
      _$BatchesDtoImpl _value, $Res Function(_$BatchesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNumber = null,
    Object? expiryDate = null,
  }) {
    return _then(_$BatchesDtoImpl(
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchesDtoImpl extends _BatchesDto {
  const _$BatchesDtoImpl(
      {@JsonKey(name: 'batchNumber', defaultValue: '')
      required this.batchNumber,
      @JsonKey(name: 'expiryDate', defaultValue: '') required this.expiryDate})
      : super._();

  factory _$BatchesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchesDtoImplFromJson(json);

  @override
  @JsonKey(name: 'batchNumber', defaultValue: '')
  final String batchNumber;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  final String expiryDate;

  @override
  String toString() {
    return 'BatchesDto(batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchesDtoImpl &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, batchNumber, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchesDtoImplCopyWith<_$BatchesDtoImpl> get copyWith =>
      __$$BatchesDtoImplCopyWithImpl<_$BatchesDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchesDtoImplToJson(
      this,
    );
  }
}

abstract class _BatchesDto extends BatchesDto {
  const factory _BatchesDto(
      {@JsonKey(name: 'batchNumber', defaultValue: '')
      required final String batchNumber,
      @JsonKey(name: 'expiryDate', defaultValue: '')
      required final String expiryDate}) = _$BatchesDtoImpl;
  const _BatchesDto._() : super._();

  factory _BatchesDto.fromJson(Map<String, dynamic> json) =
      _$BatchesDtoImpl.fromJson;

  @override
  @JsonKey(name: 'batchNumber', defaultValue: '')
  String get batchNumber;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$BatchesDtoImplCopyWith<_$BatchesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
