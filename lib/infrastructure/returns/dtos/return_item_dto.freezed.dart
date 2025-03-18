// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnItemDto _$ReturnItemDtoFromJson(Map<String, dynamic> json) {
  return _ReturnItemDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnItemDto {
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemQty', defaultValue: '0')
  String get itemQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialName', defaultValue: '')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceID', defaultValue: '')
  String get invoiceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName', defaultValue: '')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry', defaultValue: '')
  String get expiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'prsfd', defaultValue: '')
  String get prsfd => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  String get lineItemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  String get wareHouseStorageCondition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnItemDtoCopyWith<ReturnItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemDtoCopyWith<$Res> {
  factory $ReturnItemDtoCopyWith(
          ReturnItemDto value, $Res Function(ReturnItemDto) then) =
      _$ReturnItemDtoCopyWithImpl<$Res, ReturnItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId', defaultValue: '') String requestId,
      @JsonKey(name: 'requestDate', defaultValue: '') String requestDate,
      @JsonKey(name: 'itemQty', defaultValue: '0') String itemQty,
      @JsonKey(name: 'totalPrice', defaultValue: '') String totalPrice,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialName', defaultValue: '') String materialName,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'invoiceID', defaultValue: '') String invoiceID,
      @JsonKey(name: 'customerName', defaultValue: '') String customerName,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'expiry', defaultValue: '') String expiry,
      @JsonKey(name: 'prsfd', defaultValue: '') String prsfd,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'lineItemNumber', defaultValue: '') String lineItemNumber,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      String wareHouseStorageCondition});
}

/// @nodoc
class _$ReturnItemDtoCopyWithImpl<$Res, $Val extends ReturnItemDto>
    implements $ReturnItemDtoCopyWith<$Res> {
  _$ReturnItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? requestDate = null,
    Object? itemQty = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? materialNumber = null,
    Object? materialName = null,
    Object? defaultMaterialDescription = null,
    Object? orderNumber = null,
    Object? invoiceID = null,
    Object? customerName = null,
    Object? batch = null,
    Object? outsidePolicy = null,
    Object? expiry = null,
    Object? prsfd = null,
    Object? isMarketPlace = null,
    Object? lineItemNumber = null,
    Object? wareHouseStorageCondition = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      itemQty: null == itemQty
          ? _value.itemQty
          : itemQty // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceID: null == invoiceID
          ? _value.invoiceID
          : invoiceID // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      prsfd: null == prsfd
          ? _value.prsfd
          : prsfd // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItemNumber: null == lineItemNumber
          ? _value.lineItemNumber
          : lineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      wareHouseStorageCondition: null == wareHouseStorageCondition
          ? _value.wareHouseStorageCondition
          : wareHouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnItemDtoImplCopyWith<$Res>
    implements $ReturnItemDtoCopyWith<$Res> {
  factory _$$ReturnItemDtoImplCopyWith(
          _$ReturnItemDtoImpl value, $Res Function(_$ReturnItemDtoImpl) then) =
      __$$ReturnItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId', defaultValue: '') String requestId,
      @JsonKey(name: 'requestDate', defaultValue: '') String requestDate,
      @JsonKey(name: 'itemQty', defaultValue: '0') String itemQty,
      @JsonKey(name: 'totalPrice', defaultValue: '') String totalPrice,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialName', defaultValue: '') String materialName,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'invoiceID', defaultValue: '') String invoiceID,
      @JsonKey(name: 'customerName', defaultValue: '') String customerName,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'expiry', defaultValue: '') String expiry,
      @JsonKey(name: 'prsfd', defaultValue: '') String prsfd,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'lineItemNumber', defaultValue: '') String lineItemNumber,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      String wareHouseStorageCondition});
}

/// @nodoc
class __$$ReturnItemDtoImplCopyWithImpl<$Res>
    extends _$ReturnItemDtoCopyWithImpl<$Res, _$ReturnItemDtoImpl>
    implements _$$ReturnItemDtoImplCopyWith<$Res> {
  __$$ReturnItemDtoImplCopyWithImpl(
      _$ReturnItemDtoImpl _value, $Res Function(_$ReturnItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? requestDate = null,
    Object? itemQty = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? materialNumber = null,
    Object? materialName = null,
    Object? defaultMaterialDescription = null,
    Object? orderNumber = null,
    Object? invoiceID = null,
    Object? customerName = null,
    Object? batch = null,
    Object? outsidePolicy = null,
    Object? expiry = null,
    Object? prsfd = null,
    Object? isMarketPlace = null,
    Object? lineItemNumber = null,
    Object? wareHouseStorageCondition = null,
  }) {
    return _then(_$ReturnItemDtoImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      itemQty: null == itemQty
          ? _value.itemQty
          : itemQty // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceID: null == invoiceID
          ? _value.invoiceID
          : invoiceID // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      prsfd: null == prsfd
          ? _value.prsfd
          : prsfd // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItemNumber: null == lineItemNumber
          ? _value.lineItemNumber
          : lineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      wareHouseStorageCondition: null == wareHouseStorageCondition
          ? _value.wareHouseStorageCondition
          : wareHouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnItemDtoImpl extends _ReturnItemDto {
  const _$ReturnItemDtoImpl(
      {@JsonKey(name: 'requestId', defaultValue: '') required this.requestId,
      @JsonKey(name: 'requestDate', defaultValue: '') required this.requestDate,
      @JsonKey(name: 'itemQty', defaultValue: '0') required this.itemQty,
      @JsonKey(name: 'totalPrice', defaultValue: '') required this.totalPrice,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'materialName', defaultValue: '')
      required this.materialName,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'orderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'invoiceID', defaultValue: '') required this.invoiceID,
      @JsonKey(name: 'customerName', defaultValue: '')
      required this.customerName,
      @JsonKey(name: 'batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
      required this.outsidePolicy,
      @JsonKey(name: 'expiry', defaultValue: '') required this.expiry,
      @JsonKey(name: 'prsfd', defaultValue: '') required this.prsfd,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'lineItemNumber', defaultValue: '')
      required this.lineItemNumber,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      required this.wareHouseStorageCondition})
      : super._();

  factory _$ReturnItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  final String requestId;
  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  final String requestDate;
  @override
  @JsonKey(name: 'itemQty', defaultValue: '0')
  final String itemQty;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  final String totalPrice;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialName', defaultValue: '')
  final String materialName;
  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'invoiceID', defaultValue: '')
  final String invoiceID;
  @override
  @JsonKey(name: 'customerName', defaultValue: '')
  final String customerName;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  final bool outsidePolicy;
  @override
  @JsonKey(name: 'expiry', defaultValue: '')
  final String expiry;
  @override
  @JsonKey(name: 'prsfd', defaultValue: '')
  final String prsfd;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  final String lineItemNumber;
  @override
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  final String wareHouseStorageCondition;

  @override
  String toString() {
    return 'ReturnItemDto(requestId: $requestId, requestDate: $requestDate, itemQty: $itemQty, totalPrice: $totalPrice, status: $status, materialNumber: $materialNumber, materialName: $materialName, defaultMaterialDescription: $defaultMaterialDescription, orderNumber: $orderNumber, invoiceID: $invoiceID, customerName: $customerName, batch: $batch, outsidePolicy: $outsidePolicy, expiry: $expiry, prsfd: $prsfd, isMarketPlace: $isMarketPlace, lineItemNumber: $lineItemNumber, wareHouseStorageCondition: $wareHouseStorageCondition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnItemDtoImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.itemQty, itemQty) || other.itemQty == itemQty) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.invoiceID, invoiceID) ||
                other.invoiceID == invoiceID) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.outsidePolicy, outsidePolicy) ||
                other.outsidePolicy == outsidePolicy) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.prsfd, prsfd) || other.prsfd == prsfd) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.lineItemNumber, lineItemNumber) ||
                other.lineItemNumber == lineItemNumber) &&
            (identical(other.wareHouseStorageCondition,
                    wareHouseStorageCondition) ||
                other.wareHouseStorageCondition == wareHouseStorageCondition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      requestDate,
      itemQty,
      totalPrice,
      status,
      materialNumber,
      materialName,
      defaultMaterialDescription,
      orderNumber,
      invoiceID,
      customerName,
      batch,
      outsidePolicy,
      expiry,
      prsfd,
      isMarketPlace,
      lineItemNumber,
      wareHouseStorageCondition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnItemDtoImplCopyWith<_$ReturnItemDtoImpl> get copyWith =>
      __$$ReturnItemDtoImplCopyWithImpl<_$ReturnItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnItemDto extends ReturnItemDto {
  const factory _ReturnItemDto(
      {@JsonKey(name: 'requestId', defaultValue: '')
      required final String requestId,
      @JsonKey(name: 'requestDate', defaultValue: '')
      required final String requestDate,
      @JsonKey(name: 'itemQty', defaultValue: '0')
      required final String itemQty,
      @JsonKey(name: 'totalPrice', defaultValue: '')
      required final String totalPrice,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'materialName', defaultValue: '')
      required final String materialName,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required final String defaultMaterialDescription,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'invoiceID', defaultValue: '')
      required final String invoiceID,
      @JsonKey(name: 'customerName', defaultValue: '')
      required final String customerName,
      @JsonKey(name: 'batch', defaultValue: '') required final String batch,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
      required final bool outsidePolicy,
      @JsonKey(name: 'expiry', defaultValue: '') required final String expiry,
      @JsonKey(name: 'prsfd', defaultValue: '') required final String prsfd,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace,
      @JsonKey(name: 'lineItemNumber', defaultValue: '')
      required final String lineItemNumber,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      required final String wareHouseStorageCondition}) = _$ReturnItemDtoImpl;
  const _ReturnItemDto._() : super._();

  factory _ReturnItemDto.fromJson(Map<String, dynamic> json) =
      _$ReturnItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId;
  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate;
  @override
  @JsonKey(name: 'itemQty', defaultValue: '0')
  String get itemQty;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialName', defaultValue: '')
  String get materialName;
  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'invoiceID', defaultValue: '')
  String get invoiceID;
  @override
  @JsonKey(name: 'customerName', defaultValue: '')
  String get customerName;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy;
  @override
  @JsonKey(name: 'expiry', defaultValue: '')
  String get expiry;
  @override
  @JsonKey(name: 'prsfd', defaultValue: '')
  String get prsfd;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  String get lineItemNumber;
  @override
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  String get wareHouseStorageCondition;
  @override
  @JsonKey(ignore: true)
  _$$ReturnItemDtoImplCopyWith<_$ReturnItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
