import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failures.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.other(String message) = _Other;
  const factory ApiFailure.serverError(String message) = _ServerError;
  const factory ApiFailure.poorConnection() = _PoorConnection;
  const factory ApiFailure.serverTimeout() = _ServerTimeout;

  //User failure
  const factory ApiFailure.userNotFound() = _UserNotFound;
  const factory ApiFailure.marketplaceTnCAcceptanceError() =
      _MarketPlaceTnCAcceptanceError;

  //Auth failure
  const factory ApiFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory ApiFailure.accountLocked() = _AccountLocked;
  const factory ApiFailure.accountExpired() = _AccountExpired;
  const factory ApiFailure.tokenExpired() = _TokenExpired;
  const factory ApiFailure.refreshTokenInvalid() = _RefreshTokenInvalid;
  const factory ApiFailure.authenticationFailed() = _AuthenticationFailed;
  const factory ApiFailure.cannotProxyLoginWithCurrentRole() =
      _CannotProxyLoginWithCurrentRole;
  const factory ApiFailure.cannotProxyLoginRootAdmin() =
      _CannotProxyLoginRootAdmin;
  const factory ApiFailure.cannotProxyLoginZPAdminWhenIsZPAdmin() =
      _CannotProxyLoginZPAdminWhenIsZPAdmin;
  const factory ApiFailure.cannotProxyLoginFromDiffferentSalesOrg() =
      _CannotProxyLoginFromDiffferentSalesOrg;
  const factory ApiFailure.passwordResetFail() = _PasswordResetFail;
  const factory ApiFailure.passwordResetKeyInvalid() = _PasswordResetKeyInvalid;

  // Bio failure
  const factory ApiFailure.deviceNotSupportBiometric() =
      _DeviceNotSupportBiometric;
  const factory ApiFailure.cannotCheckBiometrics() = _CannotCheckBiometrics;
  const factory ApiFailure.noSupportedBiometrics() = _NoSupportedBiometrics;
  const factory ApiFailure.invalidBiometric() = _InvalidBiometric;
  const factory ApiFailure.priceOverrideNotFound() = _PriceOverrideNotFound;

  // Cart failure
  const factory ApiFailure.productOutOfStock() = _ProductOutOfStock;

  // permission failure
  const factory ApiFailure.photoPermissionFailed() = _PhotoPermissionFailed;
  const factory ApiFailure.storagePermissionFailed() = _StoragePermissionFailed;

  //po attachment failure
  const factory ApiFailure.invalidFileFormat() = _InvalidFileFormat;
  const factory ApiFailure.uploadCountExcideLimit() = _UploadCountExcideLimit;

  //deep link route failure
  const factory ApiFailure.invalidDomain() = _InvalidDomain;
  const factory ApiFailure.productDetailRoute() = _ProductDetailRoute;
  const factory ApiFailure.orderDetailRoute() = _OrderDetailRoute;
  const factory ApiFailure.returnDetailRoute() = _ReturnDetailRoute;
  const factory ApiFailure.paymentDetailRoute() = _PaymentDetailRoute;
  const factory ApiFailure.invoiceDetailRoute() = _InvoiceDetailRoute;
  const factory ApiFailure.creditDetailRoute() = _CreditDetailRoute;
  const factory ApiFailure.submitTicketRoute() = _SubmitTicketRoute;
  const factory ApiFailure.languageChangeFail() = _LanguageChangeFail;
  const factory ApiFailure.scannedProductNotFound() = _ScannedProductNotFound;
  const factory ApiFailure.cameraPermissionFailed(bool permanentlyDenied) =
      _CameraPermissionFailed;
  const factory ApiFailure.userNameNotFound() = _UserNameNotFound;
  const factory ApiFailure.accountBlocked() = _AccountBlocked;
  const factory ApiFailure.uploadedFileSizeExceed() = _UploadedFileSizeExceed;
  const factory ApiFailure.paymentAdviceDeleteFailed(String adviceNumber) =
      _PaymentAdviceDeleteFailed;
  //reorder failure
  const factory ApiFailure.allReorderItemInvalid() = _AllReorderItemInvalid;
  const factory ApiFailure.reorderItemInvalid(String materialNumber) =
      _ReorderItemInvalid;
  const factory ApiFailure.maximumCartQuantityExceed(String maximumNumber) =
      _MaximumCartQuantityExceed;
  const factory ApiFailure.cartHasDifferentAddress() = _CartHasDifferentAddress;
  const factory ApiFailure.articleannuncementTagFetchingError() =
      _ArticleannuncementTagFetchingError;
  const factory ApiFailure.attachmentDownloadError() = _AttachmentDownloadError;
  const factory ApiFailure.openDownloadedFileError(String message) =
      _OpenDownloadedFileError;
  const factory ApiFailure.addAnimalHealthWithNormalProductToCart() =
      _AddAnimalHealthWithNormalProductToCart;
  const factory ApiFailure.missingzzHtmcs() = _MissingzzHtmcs;
  const factory ApiFailure.stockInfoNotAvailable() = _StockInfoNotAvailable;
  const factory ApiFailure.accountCreationIncomplete() =
      _AccountCreationIncomplete;
}

extension ApiFailureExt on ApiFailure {
  //ignore:long-method
  TRObject get failureMessage => map(
        other: (other) => TRObject(other.message),
        serverError: (serverError) => TRObject(serverError.message),
        poorConnection: (_) => const TRObject('Poor Internet connection'),
        serverTimeout: (_) => const TRObject('Server time out'),
        userNotFound: (_) => const TRObject('User not found.'),
        accountBlocked: (_) => const TRObject('This account is blocked'),
        invalidEmailAndPasswordCombination: (_) => const TRObject(
          'Incorrect username and/or password.',
        ),
        accountLocked: (_) => const TRObject('Account is Locked'),
        accountExpired: (_) => const TRObject('Account is Expired'),
        tokenExpired: (_) => const TRObject('Session token is Expired'),
        authenticationFailed: (_) => const TRObject('Your session has expired'),
        deviceNotSupportBiometric: (_) =>
            const TRObject('Device not support biometric'),
        cannotCheckBiometrics: (_) =>
            const TRObject('Unable to check your biometric'),
        noSupportedBiometrics: (_) => const TRObject('No supported biometric'),
        invalidBiometric: (_) => const TRObject('Incorrect biometric'),
        priceOverrideNotFound: (_) =>
            const TRObject('Price override not found!'),
        cannotProxyLoginWithCurrentRole: (_) => const TRObject(
          'Only Root Admin and ZP Admin can login on behalf',
        ),
        cannotProxyLoginRootAdmin: (_) => const TRObject(
          "Can't do a proxy login for ROOT user",
        ),
        cannotProxyLoginZPAdminWhenIsZPAdmin: (_) => const TRObject(
          "ZP Admin can't login on behalf of ZP Admin",
        ),
        cannotProxyLoginFromDiffferentSalesOrg: (_) => const TRObject(
          'ZP Admin can only login on behalf of users from the same Sales Org',
        ),
        productOutOfStock: (_) => const TRObject('Product Not Available'),
        photoPermissionFailed: (_) => const TRObject(
          'Please enable Photos permission from the app settings',
        ),
        storagePermissionFailed: (_) => const TRObject(
          'Please enable Storage permission from the app settings',
        ),
        invalidFileFormat: (_) => const TRObject(
          'Unable to upload file as either file format not supported or something wrong with the file',
        ),
        uploadCountExcideLimit: (_) =>
            const TRObject('Number of files exceeds the criteria'),
        invalidDomain: (_) => const TRObject("You don't have access"),
        productDetailRoute: (_) => const TRObject(
          'This product is not available on your account',
        ),
        orderDetailRoute: (_) =>
            const TRObject('This order is not available on your account'),
        returnDetailRoute: (_) => const TRObject(
          'This return request is not available on your account',
        ),
        paymentDetailRoute: (_) => const TRObject(
          'This payment advice is not available on your account',
        ),
        invoiceDetailRoute: (_) => const TRObject(
          'This invoice is not available on your account',
        ),
        creditDetailRoute: (_) => const TRObject(
          'This credit is not available on your account',
        ),
        passwordResetFail: (_) => const TRObject('Unable to reset password'),
        languageChangeFail: (_) => const TRObject('Unable to change language'),
        scannedProductNotFound: (_) => const TRObject(''),
        cameraPermissionFailed: (_) =>
            const TRObject('Camera Permission Denied'),
        userNameNotFound: (_) => const TRObject('Incorrect username'),
        uploadedFileSizeExceed: (_) => const TRObject(
          'Maximum file size should be 20MB',
        ),
        paymentAdviceDeleteFailed: (paymentAdvice) => TRObject(
          'PA #{adviceNumber} delete failed',
          arguments: {'adviceNumber': paymentAdvice.adviceNumber},
        ),
        allReorderItemInvalid: (_) => const TRObject(
          'All item(s) are invalid, please proceed with other order.',
        ),
        reorderItemInvalid: (value) => TRObject(
          "Invalid item {materialNumber} can't be added to cart.",
          arguments: {'materialNumber': value.materialNumber},
        ),
        maximumCartQuantityExceed: (maximumException) => TRObject(
          'In cart quantity should not be more than {maximumNumber}.',
          arguments: {'maximumNumber': maximumException.maximumNumber},
        ),
        cartHasDifferentAddress: (_) => const TRObject(
          'shipToAddress changed from existing cart. Delete the cart and then add new item',
        ),
        articleannuncementTagFetchingError: (_) => const TRObject(
          'Error while fetching announcement article tag list!',
        ),
        attachmentDownloadError: (_) => const TRObject('File download failed'),
        addAnimalHealthWithNormalProductToCart: (_) => const TRObject(''),
        marketplaceTnCAcceptanceError: (_) => const TRObject(
          'Unable to update acceptance status',
        ),
        openDownloadedFileError: (openFileError) =>
            TRObject(openFileError.message),
        missingzzHtmcs: (_MissingzzHtmcs value) => const TRObject(
          'Missing zzHtmcs parameter',
        ),
        stockInfoNotAvailable: (_) =>
            const TRObject('Unable to get stock info'),
        accountCreationIncomplete: (_) => const TRObject(
          'Your account creation is incomplete with missing sales organisation setup. Please contact the local customer service team for assistance.',
        ),
        submitTicketRoute: (_) => const TRObject(
          'Chat url is not available to submit ticket.',
        ),
        refreshTokenInvalid: (_) => const TRObject('Invalid Refresh Token'),
        passwordResetKeyInvalid: (_) => const TRObject(''),
      );
  String get nonTranslatedFailureMessage {
    var fullMessage = failureMessage.message;
    if (failureMessage.arguments.isEmpty) {
      return fullMessage;
    }
    failureMessage.arguments.forEach(
      (String key, String value) =>
          fullMessage = fullMessage.replaceAll(RegExp('{$key}'), value),
    );

    return fullMessage;
  }
}
