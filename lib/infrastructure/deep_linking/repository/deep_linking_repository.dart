import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';

class DeepLinkingRepository implements IDeepLinkingRepository {
  final Config config;
  final DeviceStorage deviceStorage;
  final DeepLinkingService service;

  DeepLinkingRepository({
    required this.config,
    required this.deviceStorage,
    required this.service,
  });

  @override
  Either<ApiFailure, MaterialNumber> extractMaterialNumber({
    required Uri link,
  }) {
    final materialNumber = MaterialNumber(link.pathSegments.lastOrNull ?? '');
    final isValidLink = _validDomain(link) && materialNumber.isValid();

    return isValidLink
        ? Right(materialNumber)
        : const Left(ApiFailure.productDetailRoute());
  }

  @override
  Either<ApiFailure, SearchKey> extractProductSearchKey({
    required Uri link,
  }) {
    final parameters = EzrxLinkQueryParameter(link.queryParameters);
    final searchKey = SearchKey.search(parameters.extractMaterialNumber);

    return _validDomain(link)
        ? Right(searchKey)
        : const Left(ApiFailure.invalidDomain());
  }

  @override
  MaterialFilter extractMaterialFilter({
    required Uri link,
    required MaterialFilter materialFilter,
  }) {
    final parameters = EzrxLinkQueryParameter(link.queryParameters);

    //updated selected country list
    final countryListSelected = materialFilter.countryMapOptions.keys
        .where(
          (e) => parameters.countryList
              .any((countryName) => countryName == e.name),
        )
        .toList();

    return MaterialFilter(
      countryMapOptions: materialFilter.countryMapOptions,
      manufactureMapOptions: materialFilter.manufactureMapOptions,
      isFavourite: parameters.isFavorite,
      isProductOffer: parameters.isProductOffer,
      bundleOffers: parameters.isBundleOffer,
      manufactureListSelected: parameters.manufacturerList,
      countryListSelected: countryListSelected,
      sortBy: parameters.sortBy,
      isMarketPlace: parameters.isMarketPlace,
      comboOffers: parameters.isComboOffer,
      isTender: parameters.isTender,
      hasAccessToCovidMaterial: materialFilter.hasAccessToCovidMaterial,
      isCovidSelected: parameters.isCovid,
      brandList: materialFilter.brandList,
    );
  }

  @override
  Either<ApiFailure, OrderNumber> extractOrderNumber({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final orderNumber = OrderNumber(link.queryParameters['orderNumber'] ?? '');
    final customerCode = link.queryParameters['SoldTo'];
    final shipToCode = link.queryParameters['ShipTo'];

    final isValidCustomerCode = customerCode == null ||
        customerCode == selectedCustomerCode.customerCodeSoldTo;
    final isValidShipToCode =
        shipToCode == null || shipToCode == selectedShipTo.shipToCustomerCode;

    final isValidLink = _validDomain(link) &&
        isValidCustomerCode &&
        isValidShipToCode &&
        orderNumber.isValid();

    return isValidLink
        ? Right(orderNumber)
        : const Left(ApiFailure.orderDetailRoute());
  }

  @override
  Either<ApiFailure, OrderItemParams> extractOrderItemParams({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final orderNumber = OrderNumber(link.queryParameters['orderNumber'] ?? '');
    final lineNumber = LineNumber(link.queryParameters['lineNumber'] ?? '');
    final customerCode = link.queryParameters['SoldTo'];
    final shipToCode = link.queryParameters['ShipTo'];

    final isValidCustomerCode = customerCode == null ||
        customerCode == selectedCustomerCode.customerCodeSoldTo;
    final isValidShipToCode =
        shipToCode == null || shipToCode == selectedShipTo.shipToCustomerCode;

    final isValidLink = _validDomain(link) &&
        isValidCustomerCode &&
        isValidShipToCode &&
        orderNumber.isValid() &&
        lineNumber.isValid();

    return isValidLink
        ? Right(
            OrderItemParams(lineNumber: lineNumber, orderNumber: orderNumber),
          )
        : const Left(ApiFailure.orderDetailRoute());
  }

  @override
  Either<ApiFailure, PaymentParams> extractPaymentParams({
    required Uri link,
  }) {
    final tab = PaymentTab(link.queryParameters['tab'] ?? '');
    final subTab = PaymentSubTab(link.queryParameters['subtab'] ?? '');

    final isValidLink = _validDomain(link);

    return isValidLink
        ? Right(
            PaymentParams(tab: tab, subTab: subTab),
          )
        : const Left(ApiFailure.invalidDomain());
  }

  @override
  Either<ApiFailure, String> extractCreditId({
    required Uri link,
  }) {
    final creditId = link.queryParameters['creditNoteNumber'] ?? '';

    final isValidLink = _validDomain(link) && creditId.isNotEmpty;

    return isValidLink
        ? Right(creditId)
        : const Left(ApiFailure.creditDetailRoute());
  }

  @override
  Either<ApiFailure, ReturnItem> extractReturnItem({
    required Uri link,
  }) {
    final returnId = link.queryParameters['requestID'] ?? '';
    final invoiceId = link.queryParameters['invoice'] ?? '';
    final lineItemNumber = link.queryParameters['lineItemNumber'] ?? '';

    final isValidLink = _validDomain(link) && returnId.isNotEmpty;

    return isValidLink
        ? Right(
            ReturnItem.empty().copyWith(
              requestId: returnId,
              invoiceID: invoiceId,
              lineNumber: lineItemNumber,
            ),
          )
        : const Left(ApiFailure.returnDetailRoute());
  }

  @override
  Either<ApiFailure, PaymentSummaryDetails> extractPaymentIdentifierInfo({
    required Uri link,
  }) {
    final paymentBatchAdditionalInfo =
        StringValue(link.queryParameters['paymentBatchAdditionalInfo'] ?? '');
    final paymentID = StringValue(
      utf8.decode((link.queryParameters['paymentID'] ?? '').codeUnits),
    );
    final zzAdvice = StringValue(link.queryParameters['zzAdvice'] ?? '');
    final isValidLink = _validDomain(link) &&
        (paymentBatchAdditionalInfo.isValid() ||
            paymentID.isValid() ||
            zzAdvice.isValid());

    return isValidLink
        ? Right(
            PaymentSummaryDetails.empty().copyWith(
              paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
              paymentID: paymentID,
              zzAdvice: zzAdvice,
            ),
          )
        : const Left(ApiFailure.paymentDetailRoute());
  }

  @override
  Either<ApiFailure, String> extractInvoiceNumber({required Uri link}) {
    final invoiceNumber = link.queryParameters['invoiceNumber'] ?? '';
    final isValidLink = _validDomain(link) && invoiceNumber.isNotEmpty;

    return isValidLink
        ? Right(invoiceNumber)
        : const Left(ApiFailure.invoiceDetailRoute());
  }

  @override
  Either<ApiFailure, AppMarket> getCurrentMarket() {
    try {
      final currentMarket = deviceStorage.currentMarket();

      return Right(AppMarket(currentMarket));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Either<ApiFailure, String> extractResetPasswordKey({
    required Uri link,
  }) {
    try {
      final uri = Uri.tryParse(Uri.decodeFull(link.toString()));

      final queryParameters = uri?.queryParameters ?? {};
      if ((queryParameters['key'] ?? '').isEmpty) {
        return const Left(ApiFailure.passwordResetFail());
      }

      return Right(queryParameters['key']!);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initializeDeepLink() async {
    try {
      await service.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Stream<EzrxLink> watchDeepLinkValue() => service.getStream;

  @override
  Either<ApiFailure, String> extractChatUrl({required Uri link}) {
    final chatUrl = link.queryParameters['chatURL'] ??
        link.queryParameters.values.firstOrNull ??
        '';
    final isValidLink = _validDomain(link) && chatUrl.isNotEmpty;

    return isValidLink
        ? Right(chatUrl)
        : const Left(ApiFailure.submitTicketRoute());
  }

  bool _validDomain(Uri link) {
    final domain = link.host;
    final availableMarketDomain =
        getCurrentMarket().getOrElse(() => AppMarket('')).availableMarketDomain;

    return availableMarketDomain.any(
      (marketDomain) =>
          config.baseUrl(marketDomain: marketDomain).contains(domain),
    );
  }
}
