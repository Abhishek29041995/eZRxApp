import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

class MaterialPriceRepository implements IMaterialPriceRepository {
  final Config config;
  final MaterialPriceLocalDataSource localDataSource;
  final MaterialPriceRemoteDataSource remoteDataSource;

  MaterialPriceRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, Price>>> getMaterialPrice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required List<MaterialNumber> materialNumberList,
    required bool comboDealEligible,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final priceData = await localDataSource.getPriceList();

        return Right(
          {
            for (final price in priceData) price.materialNumber: price,
          },
        );
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final queryMaterialNumbers =
          materialNumberList.map((e) => e.getOrCrash()).toList();
      final salesDeal = customerCodeInfo.salesDeals
          .map((e) => e.getOrDefaultValue(''))
          .toList();
      final priceData = <MaterialNumber, Price>{};

      await Future.wait(
        queryMaterialNumbers.map((e) async {
          final price = await getPrice(
            salesOrgCode: salesOrgCode,
            customerCode: customerCode,
            materialNumber: e,
            shipToCode: shipToInfo.shipToCustomerCode,
            salesDeal: salesDeal,
            useNewEndpoint: salesOrganisation.salesOrg.isHK,
          );
          price.fold(
            (failure) {},
            (price) => priceData.addAll({price.materialNumber: price}),
          );
        }),
      );

      return Right(
        priceData,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Price>> getMaterialPriceForZDP5Material({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required MaterialNumber materialNumber,
    required bool exceedQty,
  }) async {
    try {
      final price = await remoteDataSource.getMaterialPriceForZDP5(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        materialNumber: materialNumber.getOrCrash(),
        exceedQty: exceedQty,
        useNewEndpoint: salesOrganisation.salesOrg.isHK,
      );

      return Right(
        price,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, Price>> getPrice({
    required String salesOrgCode,
    required String customerCode,
    required String materialNumber,
    required String shipToCode,
    required List<String> salesDeal,
    required bool useNewEndpoint,
  }) async {
    try {
      final price = await remoteDataSource.getMaterialPrice(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        materialNumber: materialNumber,
        shipToCode: shipToCode,
        salesDeal: salesDeal,
        useNewEndpoint: useNewEndpoint,
      );

      return Right(
        price,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Price>> getMaterialPriceWithOverride({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Price price,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final priceData = await localDataSource.getPriceList();

        return price.zdp8Override.isValid()
            ? Right(
                priceData.first.copyWith(materialNumber: price.materialNumber),
              )
            : Right(
                priceData
                    .firstWhere(
                      (element) =>
                          element.materialNumber == price.materialNumber,
                      orElse: () => priceData.first,
                    )
                    .copyWith(materialNumber: price.materialNumber),
              );
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToInfo.shipToCustomerCode;

      final priceData = await remoteDataSource.getMaterialOverridePriceList(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        materialQuery: PriceDto.fromDomain(price).overrideQuery,
        shipToCode: shipToCode,
        useNewEndpoint: salesOrganisation.salesOrg.isHK,
      );

      return Right(priceData.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Price>> getMaterialPriceWithZdp5Discount({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Price price,
    required bool exceedQuantity,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final priceData = await localDataSource.getPriceList();

        return Right(priceData.first);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToInfo.shipToCustomerCode;

      final priceData = await remoteDataSource.getMaterialOverridePriceList(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        shipToCode: shipToCode,
        materialQuery: PriceDto.fromDomain(price)
            .materialQueryWithExceedQty(exceedQuantity),
        useNewEndpoint: salesOrganisation.salesOrg.isHK,
      );

      return Right(priceData.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
