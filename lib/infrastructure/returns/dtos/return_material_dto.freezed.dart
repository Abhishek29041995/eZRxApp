// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnMaterialDto _$ReturnMaterialDtoFromJson(Map<String, dynamic> json) {
  return _ReturnMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnMaterialDto {
  @JsonKey(name: 'balanceQuantity', defaultValue: '')
  String get balanceQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitPrice', defaultValue: '')
  String get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'eligibleForReturn', defaultValue: false)
  bool get eligibleForReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignmentNumber', defaultValue: '')
  String get assignmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceDate', defaultValue: '')
  String get priceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get bonusItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'targetQuantity', defaultValue: '')
  String get targetQuantity => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  String get wareHouseStorageCondition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnMaterialDtoCopyWith<ReturnMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnMaterialDtoCopyWith<$Res> {
  factory $ReturnMaterialDtoCopyWith(
          ReturnMaterialDto value, $Res Function(ReturnMaterialDto) then) =
      _$ReturnMaterialDtoCopyWithImpl<$Res, ReturnMaterialDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'balanceQuantity', defaultValue: '')
      String balanceQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '') String unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '') String totalPrice,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'eligibleForReturn', defaultValue: false)
      bool eligibleForReturn,
      @JsonKey(name: 'assignmentNumber', defaultValue: '')
      String assignmentNumber,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'priceDate', defaultValue: '') String priceDate,
      @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
      List<ReturnMaterialDto> bonusItems,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'targetQuantity', defaultValue: '') String targetQuantity,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      String wareHouseStorageCondition});
}

/// @nodoc
class _$ReturnMaterialDtoCopyWithImpl<$Res, $Val extends ReturnMaterialDto>
    implements $ReturnMaterialDtoCopyWith<$Res> {
  _$ReturnMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balanceQuantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? itemNumber = null,
    Object? batch = null,
    Object? eligibleForReturn = null,
    Object? assignmentNumber = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? expiryDate = null,
    Object? priceDate = null,
    Object? bonusItems = null,
    Object? outsidePolicy = null,
    Object? targetQuantity = null,
    Object? isMarketPlace = null,
    Object? wareHouseStorageCondition = null,
  }) {
    return _then(_value.copyWith(
      balanceQuantity: null == balanceQuantity
          ? _value.balanceQuantity
          : balanceQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      eligibleForReturn: null == eligibleForReturn
          ? _value.eligibleForReturn
          : eligibleForReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      assignmentNumber: null == assignmentNumber
          ? _value.assignmentNumber
          : assignmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      priceDate: null == priceDate
          ? _value.priceDate
          : priceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bonusItems: null == bonusItems
          ? _value.bonusItems
          : bonusItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterialDto>,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      targetQuantity: null == targetQuantity
          ? _value.targetQuantity
          : targetQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      wareHouseStorageCondition: null == wareHouseStorageCondition
          ? _value.wareHouseStorageCondition
          : wareHouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnMaterialDtoImplCopyWith<$Res>
    implements $ReturnMaterialDtoCopyWith<$Res> {
  factory _$$ReturnMaterialDtoImplCopyWith(_$ReturnMaterialDtoImpl value,
          $Res Function(_$ReturnMaterialDtoImpl) then) =
      __$$ReturnMaterialDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'balanceQuantity', defaultValue: '')
      String balanceQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '') String unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '') String totalPrice,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      String defaultMaterialDescription,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'eligibleForReturn', defaultValue: false)
      bool eligibleForReturn,
      @JsonKey(name: 'assignmentNumber', defaultValue: '')
      String assignmentNumber,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'priceDate', defaultValue: '') String priceDate,
      @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
      List<ReturnMaterialDto> bonusItems,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'targetQuantity', defaultValue: '') String targetQuantity,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      String wareHouseStorageCondition});
}

/// @nodoc
class __$$ReturnMaterialDtoImplCopyWithImpl<$Res>
    extends _$ReturnMaterialDtoCopyWithImpl<$Res, _$ReturnMaterialDtoImpl>
    implements _$$ReturnMaterialDtoImplCopyWith<$Res> {
  __$$ReturnMaterialDtoImplCopyWithImpl(_$ReturnMaterialDtoImpl _value,
      $Res Function(_$ReturnMaterialDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balanceQuantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
    Object? itemNumber = null,
    Object? batch = null,
    Object? eligibleForReturn = null,
    Object? assignmentNumber = null,
    Object? principalCode = null,
    Object? principalName = null,
    Object? expiryDate = null,
    Object? priceDate = null,
    Object? bonusItems = null,
    Object? outsidePolicy = null,
    Object? targetQuantity = null,
    Object? isMarketPlace = null,
    Object? wareHouseStorageCondition = null,
  }) {
    return _then(_$ReturnMaterialDtoImpl(
      balanceQuantity: null == balanceQuantity
          ? _value.balanceQuantity
          : balanceQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      eligibleForReturn: null == eligibleForReturn
          ? _value.eligibleForReturn
          : eligibleForReturn // ignore: cast_nullable_to_non_nullable
              as bool,
      assignmentNumber: null == assignmentNumber
          ? _value.assignmentNumber
          : assignmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      priceDate: null == priceDate
          ? _value.priceDate
          : priceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bonusItems: null == bonusItems
          ? _value._bonusItems
          : bonusItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterialDto>,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      targetQuantity: null == targetQuantity
          ? _value.targetQuantity
          : targetQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      wareHouseStorageCondition: null == wareHouseStorageCondition
          ? _value.wareHouseStorageCondition
          : wareHouseStorageCondition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnMaterialDtoImpl extends _ReturnMaterialDto {
  const _$ReturnMaterialDtoImpl(
      {@JsonKey(name: 'balanceQuantity', defaultValue: '')
      required this.balanceQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '') required this.unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '') required this.totalPrice,
      @JsonKey(name: 'material', defaultValue: '') required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
      required this.defaultMaterialDescription,
      @JsonKey(name: 'itemNumber', defaultValue: '') required this.itemNumber,
      @JsonKey(name: 'batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'eligibleForReturn', defaultValue: false)
      required this.eligibleForReturn,
      @JsonKey(name: 'assignmentNumber', defaultValue: '')
      required this.assignmentNumber,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'expiryDate', defaultValue: '') required this.expiryDate,
      @JsonKey(name: 'priceDate', defaultValue: '') required this.priceDate,
      @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
      required final List<ReturnMaterialDto> bonusItems,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
      required this.outsidePolicy,
      @JsonKey(name: 'targetQuantity', defaultValue: '')
      required this.targetQuantity,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace,
      @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
      required this.wareHouseStorageCondition})
      : _bonusItems = bonusItems,
        super._();

  factory _$ReturnMaterialDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnMaterialDtoImplFromJson(json);

  @override
  @JsonKey(name: 'balanceQuantity', defaultValue: '')
  final String balanceQuantity;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: '')
  final String unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  final String totalPrice;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  final String itemNumber;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'eligibleForReturn', defaultValue: false)
  final bool eligibleForReturn;
  @override
  @JsonKey(name: 'assignmentNumber', defaultValue: '')
  final String assignmentNumber;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'priceDate', defaultValue: '')
  final String priceDate;
  final List<ReturnMaterialDto> _bonusItems;
  @override
  @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get bonusItems {
    if (_bonusItems is EqualUnmodifiableListView) return _bonusItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusItems);
  }

  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  final bool outsidePolicy;
  @override
  @JsonKey(name: 'targetQuantity', defaultValue: '')
  final String targetQuantity;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  final String wareHouseStorageCondition;

  @override
  String toString() {
    return 'ReturnMaterialDto(balanceQuantity: $balanceQuantity, unitPrice: $unitPrice, totalPrice: $totalPrice, materialNumber: $materialNumber, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription, itemNumber: $itemNumber, batch: $batch, eligibleForReturn: $eligibleForReturn, assignmentNumber: $assignmentNumber, principalCode: $principalCode, principalName: $principalName, expiryDate: $expiryDate, priceDate: $priceDate, bonusItems: $bonusItems, outsidePolicy: $outsidePolicy, targetQuantity: $targetQuantity, isMarketPlace: $isMarketPlace, wareHouseStorageCondition: $wareHouseStorageCondition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnMaterialDtoImpl &&
            (identical(other.balanceQuantity, balanceQuantity) ||
                other.balanceQuantity == balanceQuantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.eligibleForReturn, eligibleForReturn) ||
                other.eligibleForReturn == eligibleForReturn) &&
            (identical(other.assignmentNumber, assignmentNumber) ||
                other.assignmentNumber == assignmentNumber) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.priceDate, priceDate) ||
                other.priceDate == priceDate) &&
            const DeepCollectionEquality()
                .equals(other._bonusItems, _bonusItems) &&
            (identical(other.outsidePolicy, outsidePolicy) ||
                other.outsidePolicy == outsidePolicy) &&
            (identical(other.targetQuantity, targetQuantity) ||
                other.targetQuantity == targetQuantity) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.wareHouseStorageCondition,
                    wareHouseStorageCondition) ||
                other.wareHouseStorageCondition == wareHouseStorageCondition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        balanceQuantity,
        unitPrice,
        totalPrice,
        materialNumber,
        materialDescription,
        defaultMaterialDescription,
        itemNumber,
        batch,
        eligibleForReturn,
        assignmentNumber,
        principalCode,
        principalName,
        expiryDate,
        priceDate,
        const DeepCollectionEquality().hash(_bonusItems),
        outsidePolicy,
        targetQuantity,
        isMarketPlace,
        wareHouseStorageCondition
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnMaterialDtoImplCopyWith<_$ReturnMaterialDtoImpl> get copyWith =>
      __$$ReturnMaterialDtoImplCopyWithImpl<_$ReturnMaterialDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnMaterialDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnMaterialDto extends ReturnMaterialDto {
  const factory _ReturnMaterialDto(
          {@JsonKey(name: 'balanceQuantity', defaultValue: '')
          required final String balanceQuantity,
          @JsonKey(name: 'unitPrice', defaultValue: '')
          required final String unitPrice,
          @JsonKey(name: 'totalPrice', defaultValue: '')
          required final String totalPrice,
          @JsonKey(name: 'material', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
          @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
          required final String defaultMaterialDescription,
          @JsonKey(name: 'itemNumber', defaultValue: '')
          required final String itemNumber,
          @JsonKey(name: 'batch', defaultValue: '') required final String batch,
          @JsonKey(name: 'eligibleForReturn', defaultValue: false)
          required final bool eligibleForReturn,
          @JsonKey(name: 'assignmentNumber', defaultValue: '')
          required final String assignmentNumber,
          @JsonKey(name: 'principalCode', defaultValue: '')
          required final String principalCode,
          @JsonKey(name: 'principalName', defaultValue: '')
          required final String principalName,
          @JsonKey(name: 'expiryDate', defaultValue: '')
          required final String expiryDate,
          @JsonKey(name: 'priceDate', defaultValue: '')
          required final String priceDate,
          @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
          required final List<ReturnMaterialDto> bonusItems,
          @JsonKey(name: 'outsidePolicy', defaultValue: false)
          required final bool outsidePolicy,
          @JsonKey(name: 'targetQuantity', defaultValue: '')
          required final String targetQuantity,
          @JsonKey(
              defaultValue: false,
              readValue: JsonReadValueHelper.mappingIsMarketPlace)
          required final bool isMarketPlace,
          @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
          required final String wareHouseStorageCondition}) =
      _$ReturnMaterialDtoImpl;
  const _ReturnMaterialDto._() : super._();

  factory _ReturnMaterialDto.fromJson(Map<String, dynamic> json) =
      _$ReturnMaterialDtoImpl.fromJson;

  @override
  @JsonKey(name: 'balanceQuantity', defaultValue: '')
  String get balanceQuantity;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: '')
  String get unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'eligibleForReturn', defaultValue: false)
  bool get eligibleForReturn;
  @override
  @JsonKey(name: 'assignmentNumber', defaultValue: '')
  String get assignmentNumber;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'priceDate', defaultValue: '')
  String get priceDate;
  @override
  @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
  List<ReturnMaterialDto> get bonusItems;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy;
  @override
  @JsonKey(name: 'targetQuantity', defaultValue: '')
  String get targetQuantity;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'wareHouseStorageCondition', defaultValue: '')
  String get wareHouseStorageCondition;
  @override
  @JsonKey(ignore: true)
  _$$ReturnMaterialDtoImplCopyWith<_$ReturnMaterialDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
