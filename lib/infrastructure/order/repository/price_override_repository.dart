import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/repository/i_price_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

class PriceOverrideRepository implements IPriceOverrideRepository {
  final Config config;
  final PriceOverrideLocalDataSource localDataSource;
  final PriceOverrideRemoteDataSource remoteDataSource;
  final MixpanelService mixpanelService;
  PriceOverrideRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.mixpanelService,
  });
  @override
  Future<Either<ApiFailure, Price>> updateItemPrice({
    required PriceAggregate item,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final price = await localDataSource.getOverridePrice();

        return Right(
          price.copyWith(materialNumber: item.getMaterialNumber),
        );
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    final newPrice =
        item.materialInfo.counterOfferDetails.counterOfferPrice.doubleValue;
    final newDiscount = item.materialInfo.counterOfferDetails
        .discountOverridePercentage.doubleValue;
    try {
      final price = await remoteDataSource.getOverridePrice(
        custCode: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        materialQuery: PriceDto.fromDomain(item.price)
            .priceOverrideQuery(newPrice, newDiscount),
      );
      mixpanelService.trackEvent(
        eventName: TrackingEvents.requestCounterOffer,
        properties: {
          TrackingProps.counterOfferPrice: newPrice,
          TrackingProps.counterOfferRemarks: item
              .materialInfo.counterOfferDetails.comment
              .getOrDefaultValue(''),
        },
      );

      return Right(price);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
