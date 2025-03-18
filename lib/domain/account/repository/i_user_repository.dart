import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IUserRepository {
  Future<Either<ApiFailure, User>> getUser();
  Future<Either<ApiFailure, SettingTc>> updateUserTc();
  Future<Either<ApiFailure, Unit>> updateUserMarketPlaceTc(
    MarketPlaceTnCAcceptance value,
  );
  Future<Either<ApiFailure, UpdateLanguageResponse>> updateLanguage({
    required Language language,
  });

  Future<Either<ApiFailure, bool>> updatePrivacyControl({
    required bool automatedPersonalisation,
    required bool viaEmails,
    required bool viaPushNotification,
    required bool viaSMS,
  });

  Future<Either<ApiFailure, DocumentType>> updateSelectedOrderType(
    DocumentType value,
  );
}
