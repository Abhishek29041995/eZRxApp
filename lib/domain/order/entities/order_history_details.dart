import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details.freezed.dart';

@freezed
class OrderHistoryDetails with _$OrderHistoryDetails {
  const OrderHistoryDetails._();
  factory OrderHistoryDetails({
    required double totalTax,
    required double orderValue,
    required double deliveryFee,
    required double manualFee,
    required double totalValue,
    required double totalDiscount,
    required OrderStepValue processingStatus,
    required DateTimeStringValue requestedDeliveryDate,
    required DateTimeStringValue expectedDeliveryDate,
    required DocumentType type,
    required PhoneNumber telephoneNumber,
    required DateTimeStringValue createdDate,
    required String eZRXNumber,
    required StringValue orderBy,
    required StringValue referenceNotes,
    required OrderNumber
        orderNumber, //used for orderHistory api in view vy order section
    required String soldTo,
    required String shipTo,
    required CompanyName companyName,
    required StringValue poReference,
    required String shipToAddress,
    required String soldToAddress,
    required StringValue invoiceNumber,
    required String orderReason,
    required int itemCount,
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
    required OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
    required StringValue orderHistoryDetailsSpecialInstructions,
    required List<PoDocuments> orderHistoryDetailsPoDocuments,
    required bool isMarketPlace,
    required double taxRate,
  }) = _OrderHistoryDetails;

  factory OrderHistoryDetails.empty() => OrderHistoryDetails(
        totalTax: 0.0,
        deliveryFee: 0.0,
        manualFee: 0.0,
        totalDiscount: 0.0,
        totalValue: 0.0,
        processingStatus: OrderStepValue(''),
        requestedDeliveryDate: DateTimeStringValue(''),
        type: DocumentType(''),
        telephoneNumber: PhoneNumber(''),
        orderValue: 0.0,
        createdDate: DateTimeStringValue(''),
        expectedDeliveryDate: DateTimeStringValue(''),
        eZRXNumber: '',
        orderBy: StringValue(''),
        referenceNotes: StringValue(''),
        companyName: CompanyName(''),
        orderNumber: OrderNumber(''),
        poReference: StringValue(''),
        shipTo: '',
        soldTo: '',
        shipToAddress: '',
        soldToAddress: '',
        invoiceNumber: StringValue(''),
        orderReason: '',
        orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[],
        orderHistoryDetailsPaymentTerm: OrderHistoryDetailsPaymentTerm.empty(),
        orderHistoryDetailsSpecialInstructions: StringValue(''),
        orderHistoryDetailsPoDocuments: <PoDocuments>[],
        itemCount: 0,
        isMarketPlace: false,
        taxRate: 0,
      );

  bool get poDocumentsAvailable => orderHistoryDetailsPoDocuments.isNotEmpty;

  List<String> get poDocumentsName =>
      orderHistoryDetailsPoDocuments.map((obj) => obj.name).toList();

  List<MaterialQueryInfo> get allItemQueryInfo => items
      .map(
        (item) => item.orderItem.queryInfo,
      )
      .toList();

  List<OrderHistoryDetailsBonusAggregate> get items {
    final orderHistoryDetailsOrderItemsList =
        <OrderHistoryDetailsBonusAggregate>[];

    for (final items in orderHistoryDetailsOrderItem) {
      if (items.type.isMaterialTypeComm) {
        final orderHistoryDetailsOrderItem = OrderHistoryDetailsBonusAggregate(
          orderItem: items,
          details: items.details,
          tenderContractDetails: items.tenderContractDetails,
          bonusList: <OrderHistoryDetailsOrderItem>[],
        );

        orderHistoryDetailsOrderItemsList.add(orderHistoryDetailsOrderItem);
      } else {
        if (orderHistoryDetailsOrderItemsList.isNotEmpty) {
          orderHistoryDetailsOrderItemsList.last =
              orderHistoryDetailsOrderItemsList.last.copyWith(
            bonusList: List<OrderHistoryDetailsOrderItem>.from(
              orderHistoryDetailsOrderItemsList.last.bonusList,
            )..add(items),
          );
        }
      }
    }

    return orderHistoryDetailsOrderItemsList;
  }

  int get orderItemsCount => orderHistoryDetailsOrderItem.fold<int>(
        0,
        (previous, current) => previous + current.qty,
      );

  // Mapping bundle data in order success page
  OrderHistoryDetails copyWithMaterialInfo({
    required List<PriceAggregate> priceAggregates,
  }) =>
      copyWith(
        orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem.map((e) {
          final priceAggregate = priceAggregates.firstWhere(
            (element) =>
                element.getMaterialNumber == MaterialNumber(e.parentId),
            orElse: () => PriceAggregate.empty(),
          );

          return e.copyWith(
            material: MaterialInfo.empty().copyWith(
              materialNumber: priceAggregate.getMaterialNumber,
              bundle: priceAggregate.bundle,
              isMarketPlace: priceAggregate.materialInfo.isMarketPlace,
            ),
          );
        }).toList(),
      );

  OrderHistoryDetails copyWithStock({
    required List<MaterialStockInfo> stockInfoList,
    required List<PriceAggregate> priceAggregate,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem
            .map(
              (e) => e.copyWith(
                materialStockInfo: stockInfoList.firstWhere(
                  (element) => element.materialNumber == e.materialNumber,
                  orElse: () => MaterialStockInfo.empty(),
                ),
                priceAggregate: priceAggregate
                    .firstWhere(
                      (element) =>
                          element.getMaterialNumber == e.materialNumber,
                      orElse: () => PriceAggregate.empty(),
                    )
                    .copyWith(salesOrgConfig: salesOrganisationConfigs),
              ),
            )
            .toList(),
      );

  bool get isCovidMaterialAvailable =>
      orderHistoryDetailsOrderItem.any((element) => element.isCovid);

  TenderContractReason get getTenderReason => orderHistoryDetailsOrderItem
      .firstWhere(
        (element) => element.tenderContractDetails.orderReason.isNotEmpty,
        orElse: () => OrderHistoryDetailsOrderItem.empty(),
      )
      .tenderContractDetails
      .orderReason;

  bool get isTenderContractAvailable => orderHistoryDetailsOrderItem.any(
        (element) =>
            element.tenderContractDetails.contractNumber
                .isContractNumberNotEmpty &&
            element.tenderContractDetails.orderReason.isNotEmpty,
      );
  bool get isNotValidTenderContract => orderHistoryDetailsOrderItem.any(
        (element) =>
            element.tenderContractDetails.contractNumber
                .isContractNumberNotEmpty &&
            element.tenderContractDetails.isTenderExpired,
      );

  OrderHistoryDetails copyWithInvoiceNumber({
    required Map<StringValue, InvoiceData> invoiceDataMap,
  }) =>
      copyWith(
        orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem.map((e) {
          final hashId = e.gethashId(orderNumber: orderNumber);

          return e.copyWith(
            invoiceNumber:
                invoiceDataMap[hashId]?.invoiceNumber ?? e.invoiceNumber,
          );
        }).toList(),
      );

  StringValue getInvoiceNumber({
    required MaterialNumber materialNumber,
    required LineNumber lineNumber,
  }) =>
      orderHistoryDetailsOrderItem
          .firstWhere(
            (item) =>
                item.materialNumber == materialNumber &&
                item.lineNumber == lineNumber,
            orElse: () => OrderHistoryDetailsOrderItem.empty(),
          )
          .invoiceNumber;
}

extension ViewByOrderListExtension on List<OrderHistoryDetails> {
  double get subtotal => fold<double>(0, (sum, e) => sum + e.orderValue);

  double get grandTotal => fold<double>(0, (sum, e) => sum + e.totalValue);

  double get totalSaving => fold<double>(0, (sum, e) => sum + e.totalDiscount);

  double get manualFee => fold<double>(0, (sum, e) => sum + e.manualFee);

  double get smallOrderFee => fold<double>(0, (sum, e) => sum + e.deliveryFee);

  double get totalTax => fold<double>(0, (sum, e) => sum + e.totalTax);

  List<OrderHistoryDetailsOrderItem> get allItems =>
      map((e) => e.orderHistoryDetailsOrderItem).flattened.toList();

  List<OrderHistoryDetails> get zpOrderOnly =>
      where((e) => !e.isMarketPlace).toList();

  List<OrderHistoryDetails> get mpOrderOnly =>
      where((e) => e.isMarketPlace).toList();

  List<ViewByOrdersGroup> get getViewByOrderGroupList {
    return List<OrderHistoryDetails>.from(this)
        .groupListsBy((item) => item.createdDate.apiDateTimeString)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: DateTimeStringValue(entry.key),
            orderHeaders: entry.value,
            principalName: PrincipalName(''),
            viewByOrderItem: <OrderHistoryDetailsOrderItem>[],
            parentId: MaterialNumber(''),
          ),
        )
        .toList();
  }

  bool get containInQueueOrder => any((e) => e.processingStatus.isInQueue);
}
