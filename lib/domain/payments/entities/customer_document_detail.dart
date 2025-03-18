import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_details_group.dart';

part 'customer_document_detail.freezed.dart';

@freezed
class CustomerDocumentDetail with _$CustomerDocumentDetail {
  const CustomerDocumentDetail._();

  const factory CustomerDocumentDetail({
    required String billingDocumentItem,
    required StringValue salesDocumentItemType,
    required MaterialNumber materialNumber,
    required String billingDocumentItemText,
    required IntegerValue billingQuantity,
    required String billingQuantityUnit,
    required String salesMeasureISOUnit,
    required String referenceSDDocument,
    required String referenceSDDocumentItem,
    required String referenceSDDocumentCategory,
    required double grossAmount,
    required double netAmount,
    required double taxAmount,
    required PrincipalData principalData,
    required ProductImages productImages,
    required List<Batches> batches,
  }) = _CustomerDocumentDetail;

  factory CustomerDocumentDetail.empty() => CustomerDocumentDetail(
        billingDocumentItem: '',
        salesDocumentItemType: StringValue(''),
        materialNumber: MaterialNumber(''),
        billingDocumentItemText: '',
        billingQuantity: IntegerValue('0'),
        billingQuantityUnit: '',
        salesMeasureISOUnit: '',
        referenceSDDocument: '',
        referenceSDDocumentItem: '',
        referenceSDDocumentCategory: '',
        grossAmount: 0.0,
        netAmount: 0.0,
        taxAmount: 0.0,
        principalData: PrincipalData(
          principalName: PrincipalName(''),
          principalCode: PrincipalCode(''),
        ),
        productImages: ProductImages.empty(),
        batches: <Batches>[],
      );

  double get unitNetPrice => netAmount / billingQuantity.getOrDefaultValue(1);

  double get unitGrossPrice =>
      grossAmount / billingQuantity.getOrDefaultValue(1);

  bool get isNotFree => unitNetPrice != 0;

  String get netPriceText => isNotFree ? netAmount.toString() : 'FREE';

  double get taxPercent => isNotFree
      ? double.parse((taxAmount / netAmount * 100).toStringAsExponential(2))
      : 0;
}

extension CustomerDocumentDetailExtension on List<CustomerDocumentDetail> {
  List<CustomerDocumentDetailGroup> get groupList {
    return groupListsBy((item) => item.principalData.principalName)
        .entries
        .map(
          (entry) => CustomerDocumentDetailGroup(
            principalName: entry.key,
            items: entry.value,
          ),
        )
        .toList();
  }

  double get totalNetAmount =>
      fold<double>(0, (previousValue, e) => previousValue + e.netAmount);

  double get totalGrossAmount =>
      fold<double>(0, (previousValue, e) => previousValue + e.grossAmount);

  double get totalTaxAmount =>
      fold<double>(0, (previousValue, e) => previousValue + e.taxAmount);

  double get taxPercent {
    if (totalNetAmount == 0) return 0;

    return double.parse(
      (totalTaxAmount / totalNetAmount * 100).toStringAsExponential(2),
    );
  }

  List<CustomerDocumentDetail> get validItems =>
      where((item) => item.principalData.principalCode.isValid()).toList();
}
