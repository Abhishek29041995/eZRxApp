// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_by_order_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceByOrderRequestDto _$InvoiceByOrderRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _InvoiceByOrderRequestDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceByOrderRequestDto {
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 0)
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get offset => throw _privateConstructorUsedError;
  @JsonKey(name: 'language', defaultValue: '')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceByOrderRequestDtoCopyWith<InvoiceByOrderRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceByOrderRequestDtoCopyWith<$Res> {
  factory $InvoiceByOrderRequestDtoCopyWith(InvoiceByOrderRequestDto value,
          $Res Function(InvoiceByOrderRequestDto) then) =
      _$InvoiceByOrderRequestDtoCopyWithImpl<$Res, InvoiceByOrderRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'first', defaultValue: 0) int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) int offset,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber});
}

/// @nodoc
class _$InvoiceByOrderRequestDtoCopyWithImpl<$Res,
        $Val extends InvoiceByOrderRequestDto>
    implements $InvoiceByOrderRequestDtoCopyWith<$Res> {
  _$InvoiceByOrderRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? language = null,
    Object? orderNumber = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceByOrderRequestDtoImplCopyWith<$Res>
    implements $InvoiceByOrderRequestDtoCopyWith<$Res> {
  factory _$$InvoiceByOrderRequestDtoImplCopyWith(
          _$InvoiceByOrderRequestDtoImpl value,
          $Res Function(_$InvoiceByOrderRequestDtoImpl) then) =
      __$$InvoiceByOrderRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'first', defaultValue: 0) int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) int offset,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber});
}

/// @nodoc
class __$$InvoiceByOrderRequestDtoImplCopyWithImpl<$Res>
    extends _$InvoiceByOrderRequestDtoCopyWithImpl<$Res,
        _$InvoiceByOrderRequestDtoImpl>
    implements _$$InvoiceByOrderRequestDtoImplCopyWith<$Res> {
  __$$InvoiceByOrderRequestDtoImplCopyWithImpl(
      _$InvoiceByOrderRequestDtoImpl _value,
      $Res Function(_$InvoiceByOrderRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? language = null,
    Object? orderNumber = null,
  }) {
    return _then(_$InvoiceByOrderRequestDtoImpl(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceByOrderRequestDtoImpl extends _InvoiceByOrderRequestDto {
  const _$InvoiceByOrderRequestDtoImpl(
      {@JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'first', defaultValue: 0) required this.pageSize,
      @JsonKey(name: 'after', defaultValue: 0) required this.offset,
      @JsonKey(name: 'language', defaultValue: '') required this.language,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required this.orderNumber})
      : super._();

  factory _$InvoiceByOrderRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceByOrderRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'first', defaultValue: 0)
  final int pageSize;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int offset;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  final String language;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;

  @override
  String toString() {
    return 'InvoiceByOrderRequestDto(soldTo: $soldTo, pageSize: $pageSize, offset: $offset, language: $language, orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceByOrderRequestDtoImpl &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, soldTo, pageSize, offset, language, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceByOrderRequestDtoImplCopyWith<_$InvoiceByOrderRequestDtoImpl>
      get copyWith => __$$InvoiceByOrderRequestDtoImplCopyWithImpl<
          _$InvoiceByOrderRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceByOrderRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _InvoiceByOrderRequestDto extends InvoiceByOrderRequestDto {
  const factory _InvoiceByOrderRequestDto(
      {@JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'first', defaultValue: 0) required final int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) required final int offset,
      @JsonKey(name: 'language', defaultValue: '')
      required final String language,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber}) = _$InvoiceByOrderRequestDtoImpl;
  const _InvoiceByOrderRequestDto._() : super._();

  factory _InvoiceByOrderRequestDto.fromJson(Map<String, dynamic> json) =
      _$InvoiceByOrderRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'first', defaultValue: 0)
  int get pageSize;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get offset;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  String get language;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceByOrderRequestDtoImplCopyWith<_$InvoiceByOrderRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
