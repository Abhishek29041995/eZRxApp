// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batches.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Batches {
  StringValue get batchNumber => throw _privateConstructorUsedError;
  DateTimeStringValue get expiryDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BatchesCopyWith<Batches> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchesCopyWith<$Res> {
  factory $BatchesCopyWith(Batches value, $Res Function(Batches) then) =
      _$BatchesCopyWithImpl<$Res, Batches>;
  @useResult
  $Res call({StringValue batchNumber, DateTimeStringValue expiryDate});
}

/// @nodoc
class _$BatchesCopyWithImpl<$Res, $Val extends Batches>
    implements $BatchesCopyWith<$Res> {
  _$BatchesCopyWithImpl(this._value, this._then);

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
              as StringValue,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchesImplCopyWith<$Res> implements $BatchesCopyWith<$Res> {
  factory _$$BatchesImplCopyWith(
          _$BatchesImpl value, $Res Function(_$BatchesImpl) then) =
      __$$BatchesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue batchNumber, DateTimeStringValue expiryDate});
}

/// @nodoc
class __$$BatchesImplCopyWithImpl<$Res>
    extends _$BatchesCopyWithImpl<$Res, _$BatchesImpl>
    implements _$$BatchesImplCopyWith<$Res> {
  __$$BatchesImplCopyWithImpl(
      _$BatchesImpl _value, $Res Function(_$BatchesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNumber = null,
    Object? expiryDate = null,
  }) {
    return _then(_$BatchesImpl(
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$BatchesImpl extends _Batches {
  _$BatchesImpl({required this.batchNumber, required this.expiryDate})
      : super._();

  @override
  final StringValue batchNumber;
  @override
  final DateTimeStringValue expiryDate;

  @override
  String toString() {
    return 'Batches(batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchesImpl &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, batchNumber, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchesImplCopyWith<_$BatchesImpl> get copyWith =>
      __$$BatchesImplCopyWithImpl<_$BatchesImpl>(this, _$identity);
}

abstract class _Batches extends Batches {
  factory _Batches(
      {required final StringValue batchNumber,
      required final DateTimeStringValue expiryDate}) = _$BatchesImpl;
  _Batches._() : super._();

  @override
  StringValue get batchNumber;
  @override
  DateTimeStringValue get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$BatchesImplCopyWith<_$BatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
