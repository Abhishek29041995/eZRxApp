import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAuthRepository {
  Future<Either<ApiFailure, Login>> login({
    required Username username,
    required Password password,
    // required String fcmToken, // not a good design fcm will expired
  });
  Future<Either<ApiFailure, Login>> getEZRXJWT(JWT oktaAccessToken);
  Future<Either<ApiFailure, Login>> getAccessToken(JWT refreshToken);
  Future<Either<ApiFailure, Unit>> storeJWT({
    required JWT access,
    required JWT refresh,
  });
  Future<Either<ApiFailure, JWT>> getRefreshToken();
  Future<Either<ApiFailure, Unit>> initTokenStorage();
  Future<Either<ApiFailure, Unit>> initOkta();
  Future<Either<ApiFailure, Unit>> tokenValid();
  Future<Either<ApiFailure, Unit>> loginWithOkta();
  Future<Either<ApiFailure, JWT>> getOktaAccessToken();
  Future<Either<ApiFailure, Unit>> logout();
  Future<Either<ApiFailure, Unit>> initCredStorage();
  Future<Either<ApiFailure, Unit>> storeCredential({
    required Username username,
    required Password password,
  });
  Future<Either<ApiFailure, Unit>> deleteCredential();
  Future<Either<ApiFailure, Cred>> loadCredential();
  Future<Either<ApiFailure, Login>> proxyLogin({
    required Username username,
  });
  Future<Either<ApiFailure, bool>> doBiometricAuthentication();
  Future<Either<ApiFailure, bool>> canBeAuthenticatedAndBioAvailable();
  Either<ApiFailure, bool> isBiometricEnabled();
  Future<Either<ApiFailure, Unit>> putBiometricEnabledState({
    required bool isBiometricEnable,
  });

  Future<Either<ApiFailure, bool>> canShowBiometricToggle();
  Future<Either<ApiFailure, bool>> checkBiometricPermission();
}
