import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';

abstract class IOrderRepository {
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
  });

  Future<Either<ApiFailure, List<OrderHistoryDetails>>>
      getOrderConfirmationDetail({
    required SubmitOrderResponse orderResponse,
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required List<PriceAggregate> cartProducts,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs configs,
  });
}
