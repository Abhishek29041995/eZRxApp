import 'dart:ui';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_material.freezed.dart';

@freezed
class ReturnMaterial with _$ReturnMaterial {
  const ReturnMaterial._();

  const factory ReturnMaterial({
    required IntegerValue balanceQuantity,
    required IntegerValue targetQuantity,
    required RangeValue unitPrice,
    required RangeValue totalPrice,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String defaultMaterialDescription,
    required String itemNumber,
    required String batch,
    required bool eligibleForReturn,
    required String assignmentNumber,
    required PrincipalCode principalCode,
    required PrincipalName principalName,
    required DateTimeStringValue expiryDate,
    required DateTimeStringValue priceDate,
    required bool outsidePolicy,
    required List<ReturnMaterial> bonusItems,
    required bool isMarketPlace,
    required StorageCondition wareHouseStorageCondition,
  }) = _ReturnMaterial;

  factory ReturnMaterial.empty() => ReturnMaterial(
        balanceQuantity: IntegerValue(''),
        targetQuantity: IntegerValue(''),
        unitPrice: RangeValue(''),
        totalPrice: RangeValue(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        defaultMaterialDescription: '',
        itemNumber: '',
        batch: '',
        eligibleForReturn: false,
        assignmentNumber: '',
        principalCode: PrincipalCode(''),
        principalName: PrincipalName(''),
        expiryDate: DateTimeStringValue(''),
        priceDate: DateTimeStringValue(''),
        bonusItems: <ReturnMaterial>[],
        outsidePolicy: false,
        isMarketPlace: false,
        wareHouseStorageCondition: StorageCondition(''),
      );

  String get uuid => '$assignmentNumber$itemNumber';

  Color get activeColor => balanceQuantity.isGreaterThanZero
      ? ZPColors.textButtonColor
      : ZPColors.toggleOnDisableState;

  bool get editDetailsAllowed => balanceQuantity.isGreaterThanZero;

  bool displayOutSidePolicy(bool allowReturnsOutsidePolicy) =>
      outsidePolicy && allowReturnsOutsidePolicy;

  String get displayPrincipalOrSellerCode =>
      isMarketPlace ? 'Seller code' : 'Principal code';

  String get displayPrincipalOrSellerName =>
      isMarketPlace ? 'Seller name' : 'Principal name';

  String get displayBatch => isMarketPlace ? 'NA' : batch;

  String get displayMaterialDescription => materialDescription.isEmpty
      ? defaultMaterialDescription
      : materialDescription;

  String get displayExpiryDate => isMarketPlace ? 'NA' : expiryDate.dateString;

  ReturnItemDetails get validatedItemDetails =>
      ReturnItemDetails.empty().copyWith(
        materialNumber: materialNumber,
        itemNumber: itemNumber,
        assignmentNumber: assignmentNumber,
        batch: batch,
        unitPrice: unitPrice.doubleValue,
        balanceQty: balanceQuantity,
      );

  List<ReturnMaterial> get bonusItemsBelongToZPorMP => isMarketPlace
      ? bonusItems.map((e) => e.copyWith(isMarketPlace: true)).toList()
      : bonusItems;
}
