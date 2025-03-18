import 'package:ezrxmobile/config.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/contact_us/repository/i_contact_us_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';

class ContactUsDetailsRepository extends IContactUsDetailsRepository {
  final ContactUsDetailsRemoteDataSource remoteDataSource;
  final ContactUsDetailsLocalDataSource localDataSource;
  final Config config;

  ContactUsDetailsRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, ContactUsDetails>> getContactUsDetails({
    required AppMarket market,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final contactUsDetails =
            await localDataSource.getContactUsDetails(market.country);

        return Right(contactUsDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final contactUsDetails = await remoteDataSource.getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: market.announcementLocale.languageCode,
        contactUsId: market.contactUsItemId,
        token: config.xGQLToken,
      );

      return Right(contactUsDetails);
    } catch (e) {
      return getContactUsStaticInfo(market: market);
    }
  }

  Future<Either<ApiFailure, ContactUsDetails>> getContactUsStaticInfo({
    required AppMarket market,
  }) async {
    try {
      final contactUs = await localDataSource.getContactUsDetails(
        market.country,
      );

      final email = config.getContactUsStaticEmail(market.country);

      return Right(
        contactUs.copyWith(
          postloginSendToEmail: email,
          preloginSendToEmail: email,
        ),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
