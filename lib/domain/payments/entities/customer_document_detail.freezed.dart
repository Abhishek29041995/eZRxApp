// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerDocumentDetail {
  String get billingDocumentItem => throw _privateConstructorUsedError;
  StringValue get salesDocumentItemType => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get billingDocumentItemText => throw _privateConstructorUsedError;
  IntegerValue get billingQuantity => throw _privateConstructorUsedError;
  String get billingQuantityUnit => throw _privateConstructorUsedError;
  String get salesMeasureISOUnit => throw _privateConstructorUsedError;
  String get referenceSDDocument => throw _privateConstructorUsedError;
  String get referenceSDDocumentItem => throw _privateConstructorUsedError;
  String get referenceSDDocumentCategory => throw _privateConstructorUsedError;
  double get grossAmount => throw _privateConstructorUsedError;
  double get netAmount => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  ProductImages get productImages => throw _privateConstructorUsedError;
  List<Batches> get batches => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerDocumentDetailCopyWith<CustomerDocumentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentDetailCopyWith<$Res> {
  factory $CustomerDocumentDetailCopyWith(CustomerDocumentDetail value,
          $Res Function(CustomerDocumentDetail) then) =
      _$CustomerDocumentDetailCopyWithImpl<$Res, CustomerDocumentDetail>;
  @useResult
  $Res call(
      {String billingDocumentItem,
      StringValue salesDocumentItemType,
      MaterialNumber materialNumber,
      String billingDocumentItemText,
      IntegerValue billingQuantity,
      String billingQuantityUnit,
      String salesMeasureISOUnit,
      String referenceSDDocument,
      String referenceSDDocumentItem,
      String referenceSDDocumentCategory,
      double grossAmount,
      double netAmount,
      double taxAmount,
      PrincipalData principalData,
      ProductImages productImages,
      List<Batches> batches});

  $PrincipalDataCopyWith<$Res> get principalData;
  $ProductImagesCopyWith<$Res> get productImages;
}

/// @nodoc
class _$CustomerDocumentDetailCopyWithImpl<$Res,
        $Val extends CustomerDocumentDetail>
    implements $CustomerDocumentDetailCopyWith<$Res> {
  _$CustomerDocumentDetailCopyWithImpl(this._value, this._then);

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
    Object? principalData = null,
    Object? productImages = null,
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
              as StringValue,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      billingDocumentItemText: null == billingDocumentItemText
          ? _value.billingDocumentItemText
          : billingDocumentItemText // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantity: null == billingQuantity
          ? _value.billingQuantity
          : billingQuantity // ignore: cast_nullable_to_non_nullable
              as IntegerValue,
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
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      batches: null == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batches>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductImagesCopyWith<$Res> get productImages {
    return $ProductImagesCopyWith<$Res>(_value.productImages, (value) {
      return _then(_value.copyWith(productImages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerDocumentDetailImplCopyWith<$Res>
    implements $CustomerDocumentDetailCopyWith<$Res> {
  factory _$$CustomerDocumentDetailImplCopyWith(
          _$CustomerDocumentDetailImpl value,
          $Res Function(_$CustomerDocumentDetailImpl) then) =
      __$$CustomerDocumentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String billingDocumentItem,
      StringValue salesDocumentItemType,
      MaterialNumber materialNumber,
      String billingDocumentItemText,
      IntegerValue billingQuantity,
      String billingQuantityUnit,
      String salesMeasureISOUnit,
      String referenceSDDocument,
      String referenceSDDocumentItem,
      String referenceSDDocumentCategory,
      double grossAmount,
      double netAmount,
      double taxAmount,
      PrincipalData principalData,
      ProductImages productImages,
      List<Batches> batches});

  @override
  $PrincipalDataCopyWith<$Res> get principalData;
  @override
  $ProductImagesCopyWith<$Res> get productImages;
}

/// @nodoc
class __$$CustomerDocumentDetailImplCopyWithImpl<$Res>
    extends _$CustomerDocumentDetailCopyWithImpl<$Res,
        _$CustomerDocumentDetailImpl>
    implements _$$CustomerDocumentDetailImplCopyWith<$Res> {
  __$$CustomerDocumentDetailImplCopyWithImpl(
      _$CustomerDocumentDetailImpl _value,
      $Res Function(_$CustomerDocumentDetailImpl) _then)
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
    Object? principalData = null,
    Object? productImages = null,
    Object? batches = null,
  }) {
    return _then(_$CustomerDocumentDetailImpl(
      billingDocumentItem: null == billingDocumentItem
          ? _value.billingDocumentItem
          : billingDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      salesDocumentItemType: null == salesDocumentItemType
          ? _value.salesDocumentItemType
          : salesDocumentItemType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      billingDocumentItemText: null == billingDocumentItemText
          ? _value.billingDocumentItemText
          : billingDocumentItemText // ignore: cast_nullable_to_non_nullable
              as String,
      billingQuantity: null == billingQuantity
          ? _value.billingQuantity
          : billingQuantity // ignore: cast_nullable_to_non_nullable
              as IntegerValue,
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
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as ProductImages,
      batches: null == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batches>,
    ));
  }
}

/// @nodoc

class _$CustomerDocumentDetailImpl extends _CustomerDocumentDetail {
  const _$CustomerDocumentDetailImpl(
      {required this.billingDocumentItem,
      required this.salesDocumentItemType,
      required this.materialNumber,
      required this.billingDocumentItemText,
      required this.billingQuantity,
      required this.billingQuantityUnit,
      required this.salesMeasureISOUnit,
      required this.referenceSDDocument,
      required this.referenceSDDocumentItem,
      required this.referenceSDDocumentCategory,
      required this.grossAmount,
      required this.netAmount,
      required this.taxAmount,
      required this.principalData,
      required this.productImages,
      required final List<Batches> batches})
      : _batches = batches,
        super._();

  @override
  final String billingDocumentItem;
  @override
  final StringValue salesDocumentItemType;
  @override
  final MaterialNumber materialNumber;
  @override
  final String billingDocumentItemText;
  @override
  final IntegerValue billingQuantity;
  @override
  final String billingQuantityUnit;
  @override
  final String salesMeasureISOUnit;
  @override
  final String referenceSDDocument;
  @override
  final String referenceSDDocumentItem;
  @override
  final String referenceSDDocumentCategory;
  @override
  final double grossAmount;
  @override
  final double netAmount;
  @override
  final double taxAmount;
  @override
  final PrincipalData principalData;
  @override
  final ProductImages productImages;
  final List<Batches> _batches;
  @override
  List<Batches> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  String toString() {
    return 'CustomerDocumentDetail(billingDocumentItem: $billingDocumentItem, salesDocumentItemType: $salesDocumentItemType, materialNumber: $materialNumber, billingDocumentItemText: $billingDocumentItemText, billingQuantity: $billingQuantity, billingQuantityUnit: $billingQuantityUnit, salesMeasureISOUnit: $salesMeasureISOUnit, referenceSDDocument: $referenceSDDocument, referenceSDDocumentItem: $referenceSDDocumentItem, referenceSDDocumentCategory: $referenceSDDocumentCategory, grossAmount: $grossAmount, netAmount: $netAmount, taxAmount: $taxAmount, principalData: $principalData, productImages: $productImages, batches: $batches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDocumentDetailImpl &&
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
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.productImages, productImages) ||
                other.productImages == productImages) &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

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
      principalData,
      productImages,
      const DeepCollectionEquality().hash(_batches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDocumentDetailImplCopyWith<_$CustomerDocumentDetailImpl>
      get copyWith => __$$CustomerDocumentDetailImplCopyWithImpl<
          _$CustomerDocumentDetailImpl>(this, _$identity);
}

abstract class _CustomerDocumentDetail extends CustomerDocumentDetail {
  const factory _CustomerDocumentDetail(
      {required final String billingDocumentItem,
      required final StringValue salesDocumentItemType,
      required final MaterialNumber materialNumber,
      required final String billingDocumentItemText,
      required final IntegerValue billingQuantity,
      required final String billingQuantityUnit,
      required final String salesMeasureISOUnit,
      required final String referenceSDDocument,
      required final String referenceSDDocumentItem,
      required final String referenceSDDocumentCategory,
      required final double grossAmount,
      required final double netAmount,
      required final double taxAmount,
      required final PrincipalData principalData,
      required final ProductImages productImages,
      required final List<Batches> batches}) = _$CustomerDocumentDetailImpl;
  const _CustomerDocumentDetail._() : super._();

  @override
  String get billingDocumentItem;
  @override
  StringValue get salesDocumentItemType;
  @override
  MaterialNumber get materialNumber;
  @override
  String get billingDocumentItemText;
  @override
  IntegerValue get billingQuantity;
  @override
  String get billingQuantityUnit;
  @override
  String get salesMeasureISOUnit;
  @override
  String get referenceSDDocument;
  @override
  String get referenceSDDocumentItem;
  @override
  String get referenceSDDocumentCategory;
  @override
  double get grossAmount;
  @override
  double get netAmount;
  @override
  double get taxAmount;
  @override
  PrincipalData get principalData;
  @override
  ProductImages get productImages;
  @override
  List<Batches> get batches;
  @override
  @JsonKey(ignore: true)
  _$$CustomerDocumentDetailImplCopyWith<_$CustomerDocumentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
