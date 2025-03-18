// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerDocumentDetailDto _$CustomerDocumentDetailDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerDocumentDetailDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerDocumentDetailDto {
  @JsonKey(name: 'billingDocumentItem', defaultValue: '')
  String get billingDocumentItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
  String get salesDocumentItemType => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
  String get billingDocumentItemText => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingQuantity', defaultValue: '')
  String get billingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
  String get billingQuantityUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
  String get salesMeasureISOUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceSDDocument', defaultValue: '')
  String get referenceSDDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
  String get referenceSDDocumentItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
  String get referenceSDDocumentCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'grossAmount', defaultValue: 0.0)
  double get grossAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'netAmount', defaultValue: 0.0)
  double get netAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxAmount', defaultValue: 0.0)
  double get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDocumentDetailDtoCopyWith<CustomerDocumentDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentDetailDtoCopyWith<$Res> {
  factory $CustomerDocumentDetailDtoCopyWith(CustomerDocumentDetailDto value,
          $Res Function(CustomerDocumentDetailDto) then) =
      _$CustomerDocumentDetailDtoCopyWithImpl<$Res, CustomerDocumentDetailDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'billingDocumentItem', defaultValue: '')
      String billingDocumentItem,
      @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
      String salesDocumentItemType,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
      String billingDocumentItemText,
      @JsonKey(name: 'billingQuantity', defaultValue: '')
      String billingQuantity,
      @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
      String billingQuantityUnit,
      @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
      String salesMeasureISOUnit,
      @JsonKey(name: 'referenceSDDocument', defaultValue: '')
      String referenceSDDocument,
      @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
      String referenceSDDocumentItem,
      @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
      String referenceSDDocumentCategory,
      @JsonKey(name: 'grossAmount', defaultValue: 0.0) double grossAmount,
      @JsonKey(name: 'netAmount', defaultValue: 0.0) double netAmount,
      @JsonKey(name: 'taxAmount', defaultValue: 0.0) double taxAmount,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});
}

/// @nodoc
class _$CustomerDocumentDetailDtoCopyWithImpl<$Res,
        $Val extends CustomerDocumentDetailDto>
    implements $CustomerDocumentDetailDtoCopyWith<$Res> {
  _$CustomerDocumentDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billingDocumentItem = null,
    Object? salesDocumentItemType = null,
    Object? materialNumber = null,
    Object? billingDocumentItemText = null,
    Object? billingQuantity = null,
    Object? billingQuantityUnit = null,
    Object? salesMeasureISOUnit = null,
    Object? referenceSDDocument = null,
    Object? referenceSDDocumentItem = null,
    Object? referenceSDDocumentCategory = null,
    Object? grossAmount = null,
    Object? netAmount = null,
    Object? taxAmount = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? batches = null,
  }) {
    return _then(_value.copyWith(
      billingDocumentItem: null == billingDocumentItem
          ? _value.billingDocumentItem
          : billingDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      salesDocumentItemType: null == salesDocumentItemType
          ? _value.salesDocumentItemType
          : salesDocumentItemType // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      billingDocumentItemText: null == billingDocumentItemText
          ? _value.billingDocumentItemText
          : billingDocumentItemText // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantity: null == billingQuantity
          ? _value.billingQuantity
          : billingQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantityUnit: null == billingQuantityUnit
          ? _value.billingQuantityUnit
          : billingQuantityUnit // ignore: cast_nullable_to_non_nullable
              as String,
      salesMeasureISOUnit: null == salesMeasureISOUnit
          ? _value.salesMeasureISOUnit
          : salesMeasureISOUnit // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocument: null == referenceSDDocument
          ? _value.referenceSDDocument
          : referenceSDDocument // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocumentItem: null == referenceSDDocumentItem
          ? _value.referenceSDDocumentItem
          : referenceSDDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocumentCategory: null == referenceSDDocumentCategory
          ? _value.referenceSDDocumentCategory
          : referenceSDDocumentCategory // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      batches: null == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<BatchesDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerDocumentDetailDtoImplCopyWith<$Res>
    implements $CustomerDocumentDetailDtoCopyWith<$Res> {
  factory _$$CustomerDocumentDetailDtoImplCopyWith(
          _$CustomerDocumentDetailDtoImpl value,
          $Res Function(_$CustomerDocumentDetailDtoImpl) then) =
      __$$CustomerDocumentDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'billingDocumentItem', defaultValue: '')
      String billingDocumentItem,
      @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
      String salesDocumentItemType,
      @JsonKey(name: 'material', defaultValue: '') String materialNumber,
      @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
      String billingDocumentItemText,
      @JsonKey(name: 'billingQuantity', defaultValue: '')
      String billingQuantity,
      @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
      String billingQuantityUnit,
      @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
      String salesMeasureISOUnit,
      @JsonKey(name: 'referenceSDDocument', defaultValue: '')
      String referenceSDDocument,
      @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
      String referenceSDDocumentItem,
      @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
      String referenceSDDocumentCategory,
      @JsonKey(name: 'grossAmount', defaultValue: 0.0) double grossAmount,
      @JsonKey(name: 'netAmount', defaultValue: 0.0) double netAmount,
      @JsonKey(name: 'taxAmount', defaultValue: 0.0) double taxAmount,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      List<BatchesDto> batches});
}

/// @nodoc
class __$$CustomerDocumentDetailDtoImplCopyWithImpl<$Res>
    extends _$CustomerDocumentDetailDtoCopyWithImpl<$Res,
        _$CustomerDocumentDetailDtoImpl>
    implements _$$CustomerDocumentDetailDtoImplCopyWith<$Res> {
  __$$CustomerDocumentDetailDtoImplCopyWithImpl(
      _$CustomerDocumentDetailDtoImpl _value,
      $Res Function(_$CustomerDocumentDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billingDocumentItem = null,
    Object? salesDocumentItemType = null,
    Object? materialNumber = null,
    Object? billingDocumentItemText = null,
    Object? billingQuantity = null,
    Object? billingQuantityUnit = null,
    Object? salesMeasureISOUnit = null,
    Object? referenceSDDocument = null,
    Object? referenceSDDocumentItem = null,
    Object? referenceSDDocumentCategory = null,
    Object? grossAmount = null,
    Object? netAmount = null,
    Object? taxAmount = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? batches = null,
  }) {
    return _then(_$CustomerDocumentDetailDtoImpl(
      billingDocumentItem: null == billingDocumentItem
          ? _value.billingDocumentItem
          : billingDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      salesDocumentItemType: null == salesDocumentItemType
          ? _value.salesDocumentItemType
          : salesDocumentItemType // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      billingDocumentItemText: null == billingDocumentItemText
          ? _value.billingDocumentItemText
          : billingDocumentItemText // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantity: null == billingQuantity
          ? _value.billingQuantity
          : billingQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantityUnit: null == billingQuantityUnit
          ? _value.billingQuantityUnit
          : billingQuantityUnit // ignore: cast_nullable_to_non_nullable
              as String,
      salesMeasureISOUnit: null == salesMeasureISOUnit
          ? _value.salesMeasureISOUnit
          : salesMeasureISOUnit // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocument: null == referenceSDDocument
          ? _value.referenceSDDocument
          : referenceSDDocument // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocumentItem: null == referenceSDDocumentItem
          ? _value.referenceSDDocumentItem
          : referenceSDDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      referenceSDDocumentCategory: null == referenceSDDocumentCategory
          ? _value.referenceSDDocumentCategory
          : referenceSDDocumentCategory // ignore: cast_nullable_to_non_nullable
              as String,
      grossAmount: null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      batches: null == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<BatchesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDocumentDetailDtoImpl extends _CustomerDocumentDetailDto {
  _$CustomerDocumentDetailDtoImpl(
      {@JsonKey(name: 'billingDocumentItem', defaultValue: '')
      required this.billingDocumentItem,
      @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
      required this.salesDocumentItemType,
      @JsonKey(name: 'material', defaultValue: '') required this.materialNumber,
      @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
      required this.billingDocumentItemText,
      @JsonKey(name: 'billingQuantity', defaultValue: '')
      required this.billingQuantity,
      @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
      required this.billingQuantityUnit,
      @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
      required this.salesMeasureISOUnit,
      @JsonKey(name: 'referenceSDDocument', defaultValue: '')
      required this.referenceSDDocument,
      @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
      required this.referenceSDDocumentItem,
      @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
      required this.referenceSDDocumentCategory,
      @JsonKey(name: 'grossAmount', defaultValue: 0.0)
      required this.grossAmount,
      @JsonKey(name: 'netAmount', defaultValue: 0.0) required this.netAmount,
      @JsonKey(name: 'taxAmount', defaultValue: 0.0) required this.taxAmount,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
      required final List<BatchesDto> batches})
      : _batches = batches,
        super._();

  factory _$CustomerDocumentDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDocumentDetailDtoImplFromJson(json);

  @override
  @JsonKey(name: 'billingDocumentItem', defaultValue: '')
  final String billingDocumentItem;
  @override
  @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
  final String salesDocumentItemType;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
  final String billingDocumentItemText;
  @override
  @JsonKey(name: 'billingQuantity', defaultValue: '')
  final String billingQuantity;
  @override
  @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
  final String billingQuantityUnit;
  @override
  @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
  final String salesMeasureISOUnit;
  @override
  @JsonKey(name: 'referenceSDDocument', defaultValue: '')
  final String referenceSDDocument;
  @override
  @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
  final String referenceSDDocumentItem;
  @override
  @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
  final String referenceSDDocumentCategory;
  @override
  @JsonKey(name: 'grossAmount', defaultValue: 0.0)
  final double grossAmount;
  @override
  @JsonKey(name: 'netAmount', defaultValue: 0.0)
  final double netAmount;
  @override
  @JsonKey(name: 'taxAmount', defaultValue: 0.0)
  final double taxAmount;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  final List<BatchesDto> _batches;
  @override
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  String toString() {
    return 'CustomerDocumentDetailDto(billingDocumentItem: $billingDocumentItem, salesDocumentItemType: $salesDocumentItemType, materialNumber: $materialNumber, billingDocumentItemText: $billingDocumentItemText, billingQuantity: $billingQuantity, billingQuantityUnit: $billingQuantityUnit, salesMeasureISOUnit: $salesMeasureISOUnit, referenceSDDocument: $referenceSDDocument, referenceSDDocumentItem: $referenceSDDocumentItem, referenceSDDocumentCategory: $referenceSDDocumentCategory, grossAmount: $grossAmount, netAmount: $netAmount, taxAmount: $taxAmount, principalName: $principalName, principalCode: $principalCode, batches: $batches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDocumentDetailDtoImpl &&
            (identical(other.billingDocumentItem, billingDocumentItem) ||
                other.billingDocumentItem == billingDocumentItem) &&
            (identical(other.salesDocumentItemType, salesDocumentItemType) ||
                other.salesDocumentItemType == salesDocumentItemType) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(
                    other.billingDocumentItemText, billingDocumentItemText) ||
                other.billingDocumentItemText == billingDocumentItemText) &&
            (identical(other.billingQuantity, billingQuantity) ||
                other.billingQuantity == billingQuantity) &&
            (identical(other.billingQuantityUnit, billingQuantityUnit) ||
                other.billingQuantityUnit == billingQuantityUnit) &&
            (identical(other.salesMeasureISOUnit, salesMeasureISOUnit) ||
                other.salesMeasureISOUnit == salesMeasureISOUnit) &&
            (identical(other.referenceSDDocument, referenceSDDocument) ||
                other.referenceSDDocument == referenceSDDocument) &&
            (identical(
                    other.referenceSDDocumentItem, referenceSDDocumentItem) ||
                other.referenceSDDocumentItem == referenceSDDocumentItem) &&
            (identical(other.referenceSDDocumentCategory,
                    referenceSDDocumentCategory) ||
                other.referenceSDDocumentCategory ==
                    referenceSDDocumentCategory) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      billingDocumentItem,
      salesDocumentItemType,
      materialNumber,
      billingDocumentItemText,
      billingQuantity,
      billingQuantityUnit,
      salesMeasureISOUnit,
      referenceSDDocument,
      referenceSDDocumentItem,
      referenceSDDocumentCategory,
      grossAmount,
      netAmount,
      taxAmount,
      principalName,
      principalCode,
      const DeepCollectionEquality().hash(_batches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDocumentDetailDtoImplCopyWith<_$CustomerDocumentDetailDtoImpl>
      get copyWith => __$$CustomerDocumentDetailDtoImplCopyWithImpl<
          _$CustomerDocumentDetailDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDocumentDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerDocumentDetailDto extends CustomerDocumentDetailDto {
  factory _CustomerDocumentDetailDto(
          {@JsonKey(name: 'billingDocumentItem', defaultValue: '')
          required final String billingDocumentItem,
          @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
          required final String salesDocumentItemType,
          @JsonKey(name: 'material', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
          required final String billingDocumentItemText,
          @JsonKey(name: 'billingQuantity', defaultValue: '')
          required final String billingQuantity,
          @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
          required final String billingQuantityUnit,
          @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
          required final String salesMeasureISOUnit,
          @JsonKey(name: 'referenceSDDocument', defaultValue: '')
          required final String referenceSDDocument,
          @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
          required final String referenceSDDocumentItem,
          @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
          required final String referenceSDDocumentCategory,
          @JsonKey(name: 'grossAmount', defaultValue: 0.0)
          required final double grossAmount,
          @JsonKey(name: 'netAmount', defaultValue: 0.0)
          required final double netAmount,
          @JsonKey(name: 'taxAmount', defaultValue: 0.0)
          required final double taxAmount,
          @JsonKey(name: 'principalName', defaultValue: '')
          required final String principalName,
          @JsonKey(name: 'principalCode', defaultValue: '')
          required final String principalCode,
          @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
          required final List<BatchesDto> batches}) =
      _$CustomerDocumentDetailDtoImpl;
  _CustomerDocumentDetailDto._() : super._();

  factory _CustomerDocumentDetailDto.fromJson(Map<String, dynamic> json) =
      _$CustomerDocumentDetailDtoImpl.fromJson;

  @override
  @JsonKey(name: 'billingDocumentItem', defaultValue: '')
  String get billingDocumentItem;
  @override
  @JsonKey(name: 'salesDocumentItemType', defaultValue: '')
  String get salesDocumentItemType;
  @override
  @JsonKey(name: 'material', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'billingDocumentItemText', defaultValue: '')
  String get billingDocumentItemText;
  @override
  @JsonKey(name: 'billingQuantity', defaultValue: '')
  String get billingQuantity;
  @override
  @JsonKey(name: 'billingQuantityUnit', defaultValue: '')
  String get billingQuantityUnit;
  @override
  @JsonKey(name: 'salesMeasureISOUnit', defaultValue: '')
  String get salesMeasureISOUnit;
  @override
  @JsonKey(name: 'referenceSDDocument', defaultValue: '')
  String get referenceSDDocument;
  @override
  @JsonKey(name: 'referenceSDDocumentItem', defaultValue: '')
  String get referenceSDDocumentItem;
  @override
  @JsonKey(name: 'referenceSDDocumentCategory', defaultValue: '')
  String get referenceSDDocumentCategory;
  @override
  @JsonKey(name: 'grossAmount', defaultValue: 0.0)
  double get grossAmount;
  @override
  @JsonKey(name: 'netAmount', defaultValue: 0.0)
  double get netAmount;
  @override
  @JsonKey(name: 'taxAmount', defaultValue: 0.0)
  double get taxAmount;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'batches', defaultValue: <BatchesDto>[])
  List<BatchesDto> get batches;
  @override
  @JsonKey(ignore: true)
  _$$CustomerDocumentDetailDtoImplCopyWith<_$CustomerDocumentDetailDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
