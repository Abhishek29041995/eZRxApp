import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bonus_sample_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/sales_rep_authorized_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_tender_contract_dto.dart';
import 'package:upgrader/upgrader.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;
  final ViewByOrderDetailsLocalDataSource orderDetailLocalDataSource;
  final ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final Encryption encryption;
  final DeviceStorage deviceStorage;
  final MaterialBannerStorage materialBannerStorage;
  final RemoteConfigService remoteConfigService;
  final MixpanelService mixpanelService;
  final ClevertapService clevertapService;
  final Upgrader upgrader;

  OrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.encryption,
    required this.orderDetailLocalDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
    required this.stockInfoRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.deviceStorage,
    required this.remoteConfigService,
    required this.materialBannerStorage,
    required this.mixpanelService,
    required this.clevertapService,
    required this.upgrader,
  });

  @override
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required double aplSmallOrderFee,
    required double zpSmallOrderFee,
    required double mpSmallOrderFee,
    required double totalTax,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
    required SalesOrganisationConfigs configs,
    required SalesRepAuthorizedDetails salesRepAuthorizedDetails,
    required String deliveryOption,
  }) async {
    final submitOrder = _getSubmitOrderRequest(
      shipToInfo: shipToInfo,
      user: user,
      data: data,
      cartProducts: cartProducts,
      orderValue: orderValue,
      totalTax: totalTax,
      mpSmallOrderFee: mpSmallOrderFee,
      zpSmallOrderFee: zpSmallOrderFee,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      configs: configs,
      salesRepAuthorizedDetails: salesRepAuthorizedDetails,
    );

    if (config.appFlavor == Flavor.mock) {
      try {
        final submitOrderResponse = await localDataSource.submitOrder();

        return Right(submitOrderResponse);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final submitOrderData = SubmitOrderDto.fromDomain(
        submitOrder,
      ).toJson();

      // If request without this field in ID market, API return error with message "Internal server error"
      // This field must be a null string when the order value is >= salesOrganisation.salesOrg.smallOrderThreshold, other wise the small order fee should go on this field
      if (salesOrganisation.salesOrg.isID) {
        if (orderValue >= salesOrganisation.salesOrg.smallOrderThreshold) {
          submitOrderData.addAll({'deliveryFee': 'null'});
        } else {
          submitOrderData.addAll({'deliveryFee': aplSmallOrderFee.toString()});
        }
      }
      if (deliveryOption.isNotEmpty) {
        submitOrderData.addAll({'deliveryOption': deliveryOption});
      }
      if (submitOrder.orderType.isNotEmpty) {
        submitOrderData.addAll({'orderType': submitOrder.orderType});
      }
      if (submitOrder.salesRepAuthorizedDetails.sendPayload) {
        submitOrderData.addAll(
          {
            'salesRepAuthorizedDetails':
                SalesRepAuthorizedDetailsDto.fromDomain(
              submitOrder.salesRepAuthorizedDetails,
            ).toJson(),
          },
        );
      }
      final encryptedData = encryption.encryptionData(
        data: submitOrderData,
        secretKey: config.orderEncryptionSecret,
      );
      final enableMarketPlace = remoteConfigService.enableMarketPlaceMarkets
          .contains(deviceStorage.currentMarket());

      final submitOrderResponse = await remoteDataSource.submitOrder(
        orderEncryption: encryptedData,
        enableMarketPlace: enableMarketPlace,
      );

      return Right(submitOrderResponse);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<OrderHistoryDetails>>>
      getOrderConfirmationDetail({
    required SubmitOrderResponse orderResponse,
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required List<PriceAggregate> cartProducts,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs configs,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result =
            await orderDetailLocalDataSource.getOrderHistoryDetailsList();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final enableMarketPlace = remoteConfigService.enableMarketPlaceMarkets
          .contains(deviceStorage.currentMarket());

      if (enableMarketPlace) {
        final orderHistoryDetailsList =
            await orderHistoryDetailsRemoteDataSource
                .getOrderHistoryDetailsList(
          orderNumbers: orderResponse.salesDocuments,
          language: user.preferredLanguage.languageCode,
          soldTo: customerCodeInfo.customerCodeSoldTo,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          shipTo: shipToInfo.shipToCustomerCode,
          market: deviceStorage.currentMarket(),
        );
        for (final orderHistoryDetails in orderHistoryDetailsList) {
          await _trackOrderSuccess(
            orderHistoryDetails,
            salesOrganisation,
            configs,
            customerCodeInfo,
            cartProducts,
            user,
            deviceStorage.currentMarket(),
          );
        }
        await materialBannerStorage.clear();

        return Right(
          orderHistoryDetailsList
              .map((e) => e.copyWithMaterialInfo(priceAggregates: cartProducts))
              .toList(),
        );
      }

      final orderHistoryDetails =
          await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
        searchKey: orderResponse.salesDocument,
        language: user.preferredLanguage.languageCode,
        soldTo: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        shipTo: shipToInfo.shipToCustomerCode,
        market: deviceStorage.currentMarket(),
      );
      await _trackOrderSuccess(
        orderHistoryDetails,
        salesOrganisation,
        configs,
        customerCodeInfo,
        cartProducts,
        user,
        deviceStorage.currentMarket(),
      );
      await materialBannerStorage.clear();

      return Right(
        [
          orderHistoryDetails.copyWithMaterialInfo(
            priceAggregates: cartProducts,
          ),
        ],
      );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  Future<void> _trackOrderSuccess(
    OrderHistoryDetails orderDetail,
    SalesOrganisation salesOrganisation,
    SalesOrganisationConfigs configs,
    CustomerCodeInfo customerCodeInfo,
    List<PriceAggregate> cartProducts,
    User user,
    String market,
  ) async {
    final orderQueueNumber = orderDetail.orderNumber.getOrDefaultValue('');

    mixpanelService.trackEvent(
      eventName: TrackingEvents.placeOrderSuccessOriginal,
      properties: {
        if (orderDetail.processingStatus.isInQueue)
          TrackingProps.queueNumber: orderQueueNumber,
        TrackingProps.orderNumber: orderQueueNumber,
        TrackingProps.grandTotal: orderDetail.totalValue,
        TrackingProps.totalQty: orderDetail.orderItemsCount,
        TrackingProps.requestDeliveryDate:
            orderDetail.requestedDeliveryDate.dateOrNaString,
        TrackingProps.lineNumber:
            orderDetail.orderHistoryDetailsOrderItem.length,
        TrackingProps.forceUpgradeVersionInfo:
            upgrader.state.versionInfo.toString(),
        TrackingProps.forceUpgradeAlertTooSoon: upgrader.isTooSoon(),
        TrackingProps.forceUpgradeIgnoredAlert:
            upgrader.alreadyIgnoredThisVersion(),
      },
    );

    clevertapService.trackEvent(
      eventName: TrackingEvents.placeOrderSuccessOriginal,
      properties: {
        if (orderDetail.processingStatus.isInQueue)
          TrackingProps.queueNumber: orderQueueNumber,
        TrackingProps.orderNumber: orderQueueNumber,
        TrackingProps.grandTotal: orderDetail.totalValue,
        TrackingProps.totalQty: orderDetail.orderItemsCount,
        TrackingProps.requestDeliveryDate:
            orderDetail.requestedDeliveryDate.dateOrNaString,
        TrackingProps.lineNumber:
            orderDetail.orderHistoryDetailsOrderItem.length,
        TrackingProps.market: market,
        TrackingProps.collectiveNumber: '',
        TrackingProps.poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        TrackingProps.poReference: orderDetail.poReference.displayNAIfEmpty,
        TrackingProps.purchaseOrderType: user.role.type.purchaseOrderType,
        TrackingProps.orderType: orderDetail.type.documentTypeCode,
        TrackingProps.specialInstruction:
            orderDetail.orderHistoryDetailsSpecialInstructions.displayNAIfEmpty,
        TrackingProps.telephone: orderDetail.telephoneNumber.validPhoneNumber,
        TrackingProps.blockOrder: configs.enablePrincipalList,
        TrackingProps.companyName: orderDetail.companyName.name,
        TrackingProps.customerNumber: orderDetail.soldTo,
        TrackingProps.customerNumberShipTo: orderDetail.shipTo,
        TrackingProps.salesOrg:
            salesOrganisation.salesOrg.getOrDefaultValue(''),
        TrackingProps.division: customerCodeInfo.division,
        TrackingProps.deliveryFee: orderDetail.deliveryFee,
        TrackingProps.language: user.settings.languagePreference.languageCode,
        TrackingProps.paymentMethod: 'Bank Transfer',
        TrackingProps.paymentTerm: orderDetail.orderHistoryDetailsPaymentTerm
            .paymentTermCode.displayPaymentTermCode,
        TrackingProps.poDocuments: orderDetail.poDocumentsName,
        TrackingProps.referenceNote: orderDetail.referenceNotes,
        TrackingProps.totalTax: orderDetail.totalTax,
        TrackingProps.username: user.username.getOrDefaultValue(''),
        TrackingProps.orderReason: orderDetail.orderReason,
      },
    );

    for (final item in cartProducts) {
      if (item.materialInfo.type.typeCombo) {
        // case 1: item is combo
        for (final comboItem in item.comboMaterials) {
          await _trackingOrderItem(
            orderNumber: orderQueueNumber,
            materialNumber: comboItem.productId.displayMatNo,
            productName: comboItem.materialDescription,
            productNumber: comboItem.productId.displayMatNo,
            productQty: comboItem.quantity,
            unitPrice: comboItem.finalIndividualPrice,
            grandTotal: comboItem.discountedSubTotalWithTax,
            productManufacturer: comboItem.principalData.principalName.name,
            tag: comboItem.materialInfo.tag,
            isOffer: comboItem.materialInfo.type.typeDealBonus,
            comment: comboItem.materialInfo.remarks,
            parentId: comboItem.materialInfo.parentID,
            type: comboItem.materialInfo.type.getValue(),
            promoStatus: false,
            promoType: comboItem.materialInfo.promoType,
            contract: {},
            override: false,
            principalCode:
                comboItem.principalData.principalCode.getOrDefaultValue(''),
            unitOfMeasurement: item.salesOrgConfig.currency.code,
            bonuses: [],
            market: market,
          );
        }
      } else if (item.materialInfo.type.typeBundle) {
        // case 2: item is bundle
        for (final bundleItem in item.bundle.materials) {
          final currentBundle = item.bundle;
          await _trackingOrderItem(
            orderNumber: orderQueueNumber,
            materialNumber:
                '${currentBundle.bundleCode}_${bundleItem.materialNumber.displayMatNo}',
            productName: bundleItem.displayDescription,
            productNumber: bundleItem.materialNumber.displayMatNo,
            productQty: bundleItem.quantity.intValue,
            unitPrice: currentBundle.currentBundleInfo.rate,
            grandTotal: currentBundle.currentBundleInfo.rate *
                bundleItem.quantity.intValue,
            productManufacturer: bundleItem.getManufactured,
            tag: bundleItem.tag,
            isOffer: bundleItem.type.typeDealBonus,
            comment: bundleItem.remarks,
            parentId: currentBundle.bundleCode,
            type: bundleItem.type.getValue(),
            promoStatus: false,
            promoType: bundleItem.promoType,
            contract: {},
            override: true,
            principalCode:
                bundleItem.principalData.principalCode.getOrDefaultValue(''),
            unitOfMeasurement: item.salesOrgConfig.currency.code,
            bonuses: [],
            market: market,
          );
        }
      } else {
        // case 3: normal order item
        await _trackingOrderItem(
          orderNumber: orderQueueNumber,
          materialNumber: item.getMaterialNumber.displayMatNo,
          productName: item.materialInfo.displayDescription,
          productNumber: item.getMaterialNumber.displayMatNo,
          productQty: item.quantity,
          unitPrice: item.unitPrice,
          grandTotal: item.finalPriceTotalWithTax,
          productManufacturer:
              item.materialInfo.principalData.principalName.name,
          tag: item.materialInfo.tag,
          isOffer: item.materialInfo.type.typeDealBonus,
          comment: item.materialInfo.remarks,
          parentId: item.materialInfo.parentID,
          type: item.materialInfo.type.getValue(),
          promoStatus: item.promoStatus,
          promoType: item.materialInfo.promoType,
          contract: SubmitTenderContractDto.fromDomain(
            item.toSubmitMaterialInfo().contract,
          ).toJson(),
          override: item.isMaterialItemOverride,
          principalCode: item.materialInfo.principalData.principalCode
              .getOrDefaultValue(''),
          unitOfMeasurement: item.salesOrgConfig.currency.code,
          bonuses: item.bonusSampleItems
              .map(
                (e) => BonusSampleItemDto.fromDomain(e).toJson(),
              )
              .toList(),
          market: market,
        );
      }
    }
  }

  Future<void> _trackingOrderItem({
    required String orderNumber,
    required String materialNumber,
    required String productName,
    required String productNumber,
    required int productQty,
    required double unitPrice,
    required double grandTotal,
    required String productManufacturer,
    required String tag,
    required bool isOffer,
    required String comment,
    required String parentId,
    required String type,
    required bool promoStatus,
    required String promoType,
    required Map contract,
    required bool override,
    required String principalCode,
    required String unitOfMeasurement,
    required List bonuses,
    required String market,
  }) async {
    late EZReachBanner bannerData;
    try {
      bannerData = (await materialBannerStorage.get(
        materialNumber: materialNumber,
      ))
          .toDomain();
    } catch (_) {
      bannerData = EZReachBanner.empty();
    }

    mixpanelService.trackEvent(
      eventName: TrackingEvents.successfulOrderItem,
      properties: {
        TrackingProps.orderNumber: orderNumber,
        TrackingProps.productName: productName,
        TrackingProps.productNumber: productNumber,
        TrackingProps.productQty: productQty,
        TrackingProps.grandTotal: grandTotal,
        TrackingProps.unitPrice: unitPrice,
        TrackingProps.productManufacturer: productManufacturer,
        TrackingProps.fromBanner: bannerData.isNotEmpty,
        TrackingProps.bannerId: bannerData.id,
        TrackingProps.bannerTitle: bannerData.title,
        TrackingProps.tag: tag,
      },
    );

    clevertapService.trackEvent(
      eventName: TrackingEvents.successfulOrderItem,
      properties: {
        TrackingProps.orderNumber: orderNumber,
        TrackingProps.productName: productName,
        TrackingProps.productNumber: productNumber,
        TrackingProps.productQty: productQty,
        TrackingProps.grandTotal: grandTotal,
        TrackingProps.unitPrice: unitPrice,
        TrackingProps.productManufacturer: productManufacturer,
        TrackingProps.fromBanner: bannerData.isNotEmpty,
        TrackingProps.bannerId: bannerData.id,
        TrackingProps.bannerTitle: bannerData.title,
        TrackingProps.tag: tag,
        TrackingProps.isOffer: isOffer,
        TrackingProps.comment: comment,
        TrackingProps.parentId: parentId,
        TrackingProps.type: type,
        TrackingProps.promoStatus: promoStatus,
        TrackingProps.promoType: promoType,
        TrackingProps.contract: contract,
        TrackingProps.override: override,
        TrackingProps.principalCode: principalCode,
        TrackingProps.unitOfMeasurement: unitOfMeasurement,
        TrackingProps.bonuses: bonuses,
        TrackingProps.market: market,
      },
    );
  }

  SubmitOrder _getSubmitOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required DeliveryInfoData data,
    required List<PriceAggregate> cartProducts,
    required double orderValue,
    required double totalTax,
    required double zpSmallOrderFee,
    required double mpSmallOrderFee,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required SalesRepAuthorizedDetails salesRepAuthorizedDetails,
  }) {
    return SubmitOrder(
      userName: data.contactPerson.getValue().isNotEmpty
          ? data.contactPerson.getValue()
          : user.username.getOrDefaultValue(''),
      poReference: data.poReference.getValue(),
      referenceNotes: data.referenceNote.getOrDefaultValue(''),
      specialInstructions: data.deliveryInstruction.getOrDefaultValue(''),
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      requestedDeliveryDate: data.deliveryDate.getOrDefaultValue(''),
      poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      telephone: data.mobileNumber.getOrDefaultValue(''),
      collectiveNumber: '',
      paymentTerms:
          cartProducts.tenderContractSubmitted.contractPaymentTerm.isNotEmpty
              ? cartProducts.tenderContractSubmitted.contractPaymentTerm
                  .getOrDefaultValue('')
              : data.paymentTerm.getPaymentTerm,
      customer: _getSubmitOrderCustomer(
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      ),
      blockOrder: configs.enablePrincipalList,
      // && cartItems.any((item) => item.checkSalesCutOff)
      products: _getMaterialInfoList(cartProducts: cartProducts),
      poDocuments: data.poDocuments
          .map((e) => e.copyWith(isPoison: data.poisonRefDocumentsIncluded))
          .toList(),
      orderValue: orderValue,
      totalTax: totalTax,
      language: user.settings.languagePreference.languageCode,
      paymentMethod: 'Bank Transfer',
      orderType: getOrderType(
        cartItems: cartProducts,
        customerCodeInfo: customerCodeInfo,
        salesOrg: salesOrganisation.salesOrg,
      ),
      purchaseOrderType: user.role.type.purchaseOrderType,
      smallOrderFeeDetail: SmallOrderFeeDetail(
        zpSmallOrderFee: zpSmallOrderFee,
        mpSmallOrderFee: mpSmallOrderFee,
        currency: configs.currency,
      ),
      orderReason: _getOrderReason(
        cartItems: cartProducts,
        customerCodeInfo: customerCodeInfo,
      ),
      salesRepAuthorizedDetails: salesRepAuthorizedDetails,
    );
  }
}

SubmitOrderCustomer _getSubmitOrderCustomer({
  required ShipToInfo shipToInfo,
  required SalesOrganisation salesOrganisation,
  required CustomerCodeInfo customerCodeInfo,
}) {
  return SubmitOrderCustomer.empty().copyWith(
    customerNumber: customerCodeInfo.customerCodeSoldTo,
    customerNumberShipTo: shipToInfo.shipToCustomerCode,
    division: customerCodeInfo.division,
    salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
  );
}

List<SubmitMaterialInfo> _getMaterialInfoList({
  required List<PriceAggregate> cartProducts,
}) =>
    cartProducts.expand<SubmitMaterialInfo>(
      (element) {
        if (element.materialInfo.type.typeMaterial) {
          return [element.toSubmitMaterialInfo()];
        }
        if (element.materialInfo.type.typeBundle) {
          return element.bundle.materials.map(
            (el) => PriceAggregate.empty()
                .copyWith(
                  materialInfo: el,
                  quantity: el.quantity.intValue,
                  salesOrgConfig: element.salesOrgConfig,
                  bundle: element.bundle,
                )
                .toSubmitMaterialInfo(),
          );
        }
        if (element.materialInfo.type.typeCombo) {
          return element.comboMaterials.map(
            (comboMaterial) => comboMaterial.toSubmitMaterialInfo(),
          );
        }

        return <SubmitMaterialInfo>[];
      },
    ).toList();

String getOrderType({
  required List<PriceAggregate> cartItems,
  required CustomerCodeInfo customerCodeInfo,
  required SalesOrg salesOrg,
}) {
  final hasFocMaterial =
      cartItems.any((element) => element.materialInfo.isFOCMaterial);

  if (hasFocMaterial) {
    if (salesOrg.isSg && customerCodeInfo.customerAttr7.isZEV) {
      return 'ZPFC';
    } else if (salesOrg.isPH && customerCodeInfo.customerGrp4.isVP) {
      return 'ZPVF';
    } else if (salesOrg.isPH && customerCodeInfo.customerGrp4.isVR) {
      return 'ZPFV';
    }
  }

  return '';
}

String _getOrderReason({
  required List<PriceAggregate> cartItems,
  required CustomerCodeInfo customerCodeInfo,
}) {
  if (cartItems.containCovidMaterial && customerCodeInfo.customerGrp4.isVR) {
    return '802';
  }

  return cartItems.tenderContractSubmitted.tenderOrderReason
      .getOrDefaultValue('');
}
