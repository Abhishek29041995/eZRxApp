import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

abstract class IDeepLinkingRepository {
  Either<ApiFailure, MaterialNumber> extractMaterialNumber({
    required Uri link,
  });

  Future<Either<ApiFailure, Unit>> initializeDeepLink();

  Stream<EzrxLink> watchDeepLinkValue();

  Either<ApiFailure, SearchKey> extractProductSearchKey({
    required Uri link,
  });

  Either<ApiFailure, OrderNumber> extractOrderNumber({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  });

  Either<ApiFailure, ReturnItem> extractReturnItem({
    required Uri link,
  });

  Either<ApiFailure, OrderItemParams> extractOrderItemParams({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  });

  Either<ApiFailure, PaymentParams> extractPaymentParams({
    required Uri link,
  });

  Either<ApiFailure, String> extractCreditId({
    required Uri link,
  });

  Either<ApiFailure, PaymentSummaryDetails> extractPaymentIdentifierInfo({
    required Uri link,
  });

  Either<ApiFailure, String> extractInvoiceNumber({
    required Uri link,
  });

  Either<ApiFailure, AppMarket> getCurrentMarket();

  Either<ApiFailure, String> extractResetPasswordKey({
    required Uri link,
  });

  MaterialFilter extractMaterialFilter({
    required Uri link,
    required MaterialFilter materialFilter,
  });

  Either<ApiFailure, String> extractChatUrl({
    required Uri link,
  });
}
