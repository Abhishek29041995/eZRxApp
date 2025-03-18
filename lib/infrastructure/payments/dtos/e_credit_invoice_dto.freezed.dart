// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_credit_invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ECreditInvoiceDto _$ECreditInvoiceDtoFromJson(Map<String, dynamic> json) {
  return _ECreditInvoiceDto.fromJson(json);
}

/// @nodoc
mixin _$ECreditInvoiceDto {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ECreditInvoiceDtoCopyWith<ECreditInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ECreditInvoiceDtoCopyWith<$Res> {
  factory $ECreditInvoiceDtoCopyWith(
          ECreditInvoiceDto value, $Res Function(ECreditInvoiceDto) then) =
      _$ECreditInvoiceDtoCopyWithImpl<$Res, ECreditInvoiceDto>;
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class _$ECreditInvoiceDtoCopyWithImpl<$Res, $Val extends ECreditInvoiceDto>
    implements $ECreditInvoiceDtoCopyWith<$Res> {
  _$ECreditInvoiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ECreditInvoiceDtoImplCopyWith<$Res>
    implements $ECreditInvoiceDtoCopyWith<$Res> {
  factory _$$ECreditInvoiceDtoImplCopyWith(_$ECreditInvoiceDtoImpl value,
          $Res Function(_$ECreditInvoiceDtoImpl) then) =
      __$$ECreditInvoiceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class __$$ECreditInvoiceDtoImplCopyWithImpl<$Res>
    extends _$ECreditInvoiceDtoCopyWithImpl<$Res, _$ECreditInvoiceDtoImpl>
    implements _$$ECreditInvoiceDtoImplCopyWith<$Res> {
  __$$ECreditInvoiceDtoImplCopyWithImpl(_$ECreditInvoiceDtoImpl _value,
      $Res Function(_$ECreditInvoiceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ECreditInvoiceDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ECreditInvoiceDtoImpl extends _ECreditInvoiceDto {
  _$ECreditInvoiceDtoImpl(
      {@JsonKey(name: 'name', defaultValue: '') required this.name})
      : super._();

  factory _$ECreditInvoiceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ECreditInvoiceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'ECreditInvoiceDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ECreditInvoiceDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ECreditInvoiceDtoImplCopyWith<_$ECreditInvoiceDtoImpl> get copyWith =>
      __$$ECreditInvoiceDtoImplCopyWithImpl<_$ECreditInvoiceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ECreditInvoiceDtoImplToJson(
      this,
    );
  }
}

abstract class _ECreditInvoiceDto extends ECreditInvoiceDto {
  factory _ECreditInvoiceDto(
      {@JsonKey(name: 'name', defaultValue: '')
      required final String name}) = _$ECreditInvoiceDtoImpl;
  _ECreditInvoiceDto._() : super._();

  factory _ECreditInvoiceDto.fromJson(Map<String, dynamic> json) =
      _$ECreditInvoiceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ECreditInvoiceDtoImplCopyWith<_$ECreditInvoiceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
