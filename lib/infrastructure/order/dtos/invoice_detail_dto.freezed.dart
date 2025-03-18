// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceDetailDto _$InvoiceDetailDtoFromJson(Map<String, dynamic> json) {
  return _InvoiceDetailDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailDto {
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
  String get invoiceProcessingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
  num get invoiceTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
  num get invoiceTotalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceItems')
  List<OrderHistoryDetailsOrderItemDto> get invoiceItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDetailDtoCopyWith<InvoiceDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailDtoCopyWith<$Res> {
  factory $InvoiceDetailDtoCopyWith(
          InvoiceDetailDto value, $Res Function(InvoiceDetailDto) then) =
      _$InvoiceDetailDtoCopyWithImpl<$Res, InvoiceDetailDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '') String invoiceDate,
      @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
      String invoiceProcessingStatus,
      @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
      num invoiceTotalPrice,
      @JsonKey(name: 'invoiceTotalQty', defaultValue: 0) num invoiceTotalQty,
      @JsonKey(name: 'invoiceItems')
      List<OrderHistoryDetailsOrderItemDto> invoiceItems});
}

/// @nodoc
class _$InvoiceDetailDtoCopyWithImpl<$Res, $Val extends InvoiceDetailDto>
    implements $InvoiceDetailDtoCopyWith<$Res> {
  _$InvoiceDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceProcessingStatus = null,
    Object? invoiceTotalPrice = null,
    Object? invoiceTotalQty = null,
    Object? invoiceItems = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceProcessingStatus: null == invoiceProcessingStatus
          ? _value.invoiceProcessingStatus
          : invoiceProcessingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceTotalPrice: null == invoiceTotalPrice
          ? _value.invoiceTotalPrice
          : invoiceTotalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      invoiceTotalQty: null == invoiceTotalQty
          ? _value.invoiceTotalQty
          : invoiceTotalQty // ignore: cast_nullable_to_non_nullable
              as num,
      invoiceItems: null == invoiceItems
          ? _value.invoiceItems
          : invoiceItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailDtoImplCopyWith<$Res>
    implements $InvoiceDetailDtoCopyWith<$Res> {
  factory _$$InvoiceDetailDtoImplCopyWith(_$InvoiceDetailDtoImpl value,
          $Res Function(_$InvoiceDetailDtoImpl) then) =
      __$$InvoiceDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '') String invoiceDate,
      @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
      String invoiceProcessingStatus,
      @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
      num invoiceTotalPrice,
      @JsonKey(name: 'invoiceTotalQty', defaultValue: 0) num invoiceTotalQty,
      @JsonKey(name: 'invoiceItems')
      List<OrderHistoryDetailsOrderItemDto> invoiceItems});
}

/// @nodoc
class __$$InvoiceDetailDtoImplCopyWithImpl<$Res>
    extends _$InvoiceDetailDtoCopyWithImpl<$Res, _$InvoiceDetailDtoImpl>
    implements _$$InvoiceDetailDtoImplCopyWith<$Res> {
  __$$InvoiceDetailDtoImplCopyWithImpl(_$InvoiceDetailDtoImpl _value,
      $Res Function(_$InvoiceDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceProcessingStatus = null,
    Object? invoiceTotalPrice = null,
    Object? invoiceTotalQty = null,
    Object? invoiceItems = null,
  }) {
    return _then(_$InvoiceDetailDtoImpl(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceProcessingStatus: null == invoiceProcessingStatus
          ? _value.invoiceProcessingStatus
          : invoiceProcessingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceTotalPrice: null == invoiceTotalPrice
          ? _value.invoiceTotalPrice
          : invoiceTotalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      invoiceTotalQty: null == invoiceTotalQty
          ? _value.invoiceTotalQty
          : invoiceTotalQty // ignore: cast_nullable_to_non_nullable
              as num,
      invoiceItems: null == invoiceItems
          ? _value._invoiceItems
          : invoiceItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailDtoImpl extends _InvoiceDetailDto {
  const _$InvoiceDetailDtoImpl(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '') required this.invoiceDate,
      @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
      required this.invoiceProcessingStatus,
      @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
      required this.invoiceTotalPrice,
      @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
      required this.invoiceTotalQty,
      @JsonKey(name: 'invoiceItems')
      required final List<OrderHistoryDetailsOrderItemDto> invoiceItems})
      : _invoiceItems = invoiceItems,
        super._();

  factory _$InvoiceDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailDtoImplFromJson(json);

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  final String invoiceDate;
  @override
  @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
  final String invoiceProcessingStatus;
  @override
  @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
  final num invoiceTotalPrice;
  @override
  @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
  final num invoiceTotalQty;
  final List<OrderHistoryDetailsOrderItemDto> _invoiceItems;
  @override
  @JsonKey(name: 'invoiceItems')
  List<OrderHistoryDetailsOrderItemDto> get invoiceItems {
    if (_invoiceItems is EqualUnmodifiableListView) return _invoiceItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceItems);
  }

  @override
  String toString() {
    return 'InvoiceDetailDto(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceProcessingStatus: $invoiceProcessingStatus, invoiceTotalPrice: $invoiceTotalPrice, invoiceTotalQty: $invoiceTotalQty, invoiceItems: $invoiceItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailDtoImpl &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(
                    other.invoiceProcessingStatus, invoiceProcessingStatus) ||
                other.invoiceProcessingStatus == invoiceProcessingStatus) &&
            (identical(other.invoiceTotalPrice, invoiceTotalPrice) ||
                other.invoiceTotalPrice == invoiceTotalPrice) &&
            (identical(other.invoiceTotalQty, invoiceTotalQty) ||
                other.invoiceTotalQty == invoiceTotalQty) &&
            const DeepCollectionEquality()
                .equals(other._invoiceItems, _invoiceItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNumber,
      invoiceDate,
      invoiceProcessingStatus,
      invoiceTotalPrice,
      invoiceTotalQty,
      const DeepCollectionEquality().hash(_invoiceItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailDtoImplCopyWith<_$InvoiceDetailDtoImpl> get copyWith =>
      __$$InvoiceDetailDtoImplCopyWithImpl<_$InvoiceDetailDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDetailDto extends InvoiceDetailDto {
  const factory _InvoiceDetailDto(
          {@JsonKey(name: 'invoiceNumber', defaultValue: '')
          required final String invoiceNumber,
          @JsonKey(name: 'invoiceDate', defaultValue: '')
          required final String invoiceDate,
          @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
          required final String invoiceProcessingStatus,
          @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
          required final num invoiceTotalPrice,
          @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
          required final num invoiceTotalQty,
          @JsonKey(name: 'invoiceItems')
          required final List<OrderHistoryDetailsOrderItemDto> invoiceItems}) =
      _$InvoiceDetailDtoImpl;
  const _InvoiceDetailDto._() : super._();

  factory _InvoiceDetailDto.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailDtoImpl.fromJson;

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate;
  @override
  @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
  String get invoiceProcessingStatus;
  @override
  @JsonKey(name: 'invoiceTotalPrice', defaultValue: 0)
  num get invoiceTotalPrice;
  @override
  @JsonKey(name: 'invoiceTotalQty', defaultValue: 0)
  num get invoiceTotalQty;
  @override
  @JsonKey(name: 'invoiceItems')
  List<OrderHistoryDetailsOrderItemDto> get invoiceItems;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailDtoImplCopyWith<_$InvoiceDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceDetailResponseDto _$InvoiceDetailResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _InvoiceDetailResponseDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailResponseDto {
  @JsonKey(name: 'invoiceCount', defaultValue: 0)
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
  List<InvoiceDetailDto> get invoiceDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDetailResponseDtoCopyWith<InvoiceDetailResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailResponseDtoCopyWith<$Res> {
  factory $InvoiceDetailResponseDtoCopyWith(InvoiceDetailResponseDto value,
          $Res Function(InvoiceDetailResponseDto) then) =
      _$InvoiceDetailResponseDtoCopyWithImpl<$Res, InvoiceDetailResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceCount', defaultValue: 0) int count,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
      List<InvoiceDetailDto> invoiceDetails});
}

/// @nodoc
class _$InvoiceDetailResponseDtoCopyWithImpl<$Res,
        $Val extends InvoiceDetailResponseDto>
    implements $InvoiceDetailResponseDtoCopyWith<$Res> {
  _$InvoiceDetailResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetailDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailResponseDtoImplCopyWith<$Res>
    implements $InvoiceDetailResponseDtoCopyWith<$Res> {
  factory _$$InvoiceDetailResponseDtoImplCopyWith(
          _$InvoiceDetailResponseDtoImpl value,
          $Res Function(_$InvoiceDetailResponseDtoImpl) then) =
      __$$InvoiceDetailResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceCount', defaultValue: 0) int count,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
      List<InvoiceDetailDto> invoiceDetails});
}

/// @nodoc
class __$$InvoiceDetailResponseDtoImplCopyWithImpl<$Res>
    extends _$InvoiceDetailResponseDtoCopyWithImpl<$Res,
        _$InvoiceDetailResponseDtoImpl>
    implements _$$InvoiceDetailResponseDtoImplCopyWith<$Res> {
  __$$InvoiceDetailResponseDtoImplCopyWithImpl(
      _$InvoiceDetailResponseDtoImpl _value,
      $Res Function(_$InvoiceDetailResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_$InvoiceDetailResponseDtoImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetailDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailResponseDtoImpl extends _InvoiceDetailResponseDto {
  _$InvoiceDetailResponseDtoImpl(
      {@JsonKey(name: 'invoiceCount', defaultValue: 0) required this.count,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
      required final List<InvoiceDetailDto> invoiceDetails})
      : _invoiceDetails = invoiceDetails,
        super._();

  factory _$InvoiceDetailResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'invoiceCount', defaultValue: 0)
  final int count;
  final List<InvoiceDetailDto> _invoiceDetails;
  @override
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
  List<InvoiceDetailDto> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  String toString() {
    return 'InvoiceDetailResponseDto(count: $count, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailResponseDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_invoiceDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailResponseDtoImplCopyWith<_$InvoiceDetailResponseDtoImpl>
      get copyWith => __$$InvoiceDetailResponseDtoImplCopyWithImpl<
          _$InvoiceDetailResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDetailResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDetailResponseDto extends InvoiceDetailResponseDto {
  factory _InvoiceDetailResponseDto(
      {@JsonKey(name: 'invoiceCount', defaultValue: 0) required final int count,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
      required final List<InvoiceDetailDto>
          invoiceDetails}) = _$InvoiceDetailResponseDtoImpl;
  _InvoiceDetailResponseDto._() : super._();

  factory _InvoiceDetailResponseDto.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'invoiceCount', defaultValue: 0)
  int get count;
  @override
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailDto>[])
  List<InvoiceDetailDto> get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailResponseDtoImplCopyWith<_$InvoiceDetailResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
