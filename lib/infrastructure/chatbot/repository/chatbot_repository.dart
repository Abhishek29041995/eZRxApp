import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:universal_io/io.dart';

class ChatBotRepository implements IChatBotRepository {
  final ChatBotService chatBotService;
  final DeepLinkingService deepLinkingService;
  final TokenStorage tokenStorage;
  final Config config;
  final DeviceStorage deviceStorage;

  ChatBotRepository({
    required this.chatBotService,
    required this.tokenStorage,
    required this.config,
    required this.deviceStorage,
    required this.deepLinkingService,
  });

  @override
  Future<Either<ApiFailure, bool>> startChatbot() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      final checkInternet =
          result.isNotEmpty && result.first.rawAddress.isNotEmpty;
      if (checkInternet) {
        return Right(await chatBotService.startChatbot());
      }

      return Left(
        FailureHandler.handleFailure(
          const ApiFailure.poorConnection(),
        ),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> passPayloadToChatbot({
    required SalesOrganisation salesOrganisation,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final toDate = DateTime.now();
      final dateFormat = DateFormat('yyyyMMdd');
      final toDateStringValue = dateFormat.format(toDate);
      final fromDateStringValue = dateFormat
          .format(DateTime(toDate.year, toDate.month - 2, toDate.day));
      final jwt = await tokenStorage.get();
      final payload = <String, Object>{
        'soldTo': customerCodeInfo.customerCodeSoldTo,
        'shipTo': [shipToInfo.shipToCustomerCode],
        'language': user.preferredLanguage.languageCode,
        'token': jwt.access,
        'username': user.username.getOrCrash(),
        'customerCode': customerCodeInfo.customerCodeSoldTo,
        'market': salesOrganisation.salesOrg.country,
        'userRole': user.role.name,
        'salesorg': salesOrganisation.salesOrg.getOrCrash(),
        'locale': user.preferredLanguage.languageCumCountryCode,
        'fromDate': fromDateStringValue,
        'toDate': toDateStringValue,
        'currency': salesOrganisationConfigs.currency.code,
        'name': user.fullName.displayFullName,
        'email': user.email.getOrCrash(),
        'baseUrl': config.baseUrl(
          marketDomain: AppMarket(deviceStorage.currentMarket()).marketDomain,
        ),
      };

      await chatBotService.setAuthToken(jwt.refresh);

      return Right(await chatBotService.passPayloadToBot(payload: payload));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> resetChatbot() async {
    try {
      final market = AppMarket(
        deviceStorage.currentMarket(),
      );
      final marketDomain = market.marketDomain.toUpperCase();
      final payload = <String, Object>{
        'token': '',
        'username': '',
        'baseUrl': config.baseUrl(
          marketDomain: AppMarket(deviceStorage.currentMarket()).marketDomain,
        ),
        'market': marketDomain,
        'locale': market.locale,
        'currency': market.currency,
        'language': marketDomain,
      };

      return Right(await chatBotService.passPayloadToBot(payload: payload));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  StreamSubscription processDeepLinkOnIncomingEvent() {
    return chatBotService.chatBotEventData().listen((event) {
      //This try/catch is required to handle data from chatbot because event data type can be both String and Map
      try {
        final eventCode = event['code'];
        final eventData = event['data'];
        if (eventCode == 'product_view_more' &&
            eventData.startsWith(config.customScheme)) {
          deepLinkingService.handleDeepLink(Uri.tryParse(eventData));
        }
      } catch (_) {}
    });
  }
}
