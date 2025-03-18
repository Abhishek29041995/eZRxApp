import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ConfigMock extends Mock implements Config {}

class ChatBotServiceMock extends Mock implements ChatBotService {}

class TokenStorageMock extends Mock implements TokenStorage {}

class DeviceStorageMock extends Mock implements DeviceStorage {}

class InternetAddressMock extends Mock implements InternetAddress {}

class DeepLinkServiceMock extends Mock implements DeepLinkingService {}

void main() {
  late Config configMock;
  late ChatBotService chatBotService;
  late TokenStorage tokenStorageMock;
  late DeviceStorage deviceStorageMock;
  late JWTDto jwtDto;
  late EmailAddress fakeEmail;
  late ChatBotRepository chatBotRepository;
  late Exception errorMock;
  late DeepLinkingService deepLinkingService;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = Config()..appFlavor = Flavor.uat;
      chatBotService = ChatBotServiceMock();
      tokenStorageMock = TokenStorageMock();
      deviceStorageMock = DeviceStorageMock();
      deepLinkingService = DeepLinkServiceMock();
      jwtDto = JWTDto(
        access: 'access_token',
        refresh: 'refresh_token',
      );
      fakeEmail = EmailAddress('fakeemail@zuelligpharma.com');
      errorMock = Exception('fake-error');
      chatBotRepository = ChatBotRepository(
        chatBotService: chatBotService,
        tokenStorage: tokenStorageMock,
        config: configMock..appFlavor = Flavor.uat,
        deviceStorage: deviceStorageMock,
        deepLinkingService: deepLinkingService,
      );
      when(
        () => deviceStorageMock.currentMarket(),
      ).thenReturn('my');
      when(() => tokenStorageMock.get())
          .thenAnswer((invocation) async => jwtDto);
    },
  );

  group('Chat Bot Repository', () {
    test('load chat bot remote success', () async {
      when(
        () => chatBotService.startChatbot(),
      ).thenAnswer(
        (invocation) async => true,
      );

      final result = await chatBotRepository.startChatbot();
      expect(result, const Right(true));
    });

    test('load chat bot remote failure', () async {
      when(
        () => chatBotService.startChatbot(),
      ).thenThrow(
        errorMock,
      );
      final result = await chatBotRepository.startChatbot();
      expect(result, Left(ApiFailure.other(errorMock.toString())));
    });

    test('pass payload to chat bot remote success', () async {
      final toDate = DateTime.now();
      final dateFormat = DateFormat('yyyyMMdd');
      final toDateStringValue = dateFormat.format(toDate);
      final fromDateStringValue = dateFormat
          .format(DateTime(toDate.year, toDate.month - 2, toDate.day));
      final payload = <String, Object>{
        'soldTo': fakeCustomerCodeInfo.customerCodeSoldTo,
        'shipTo': [fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode],
        'language': fakeClientUser.preferredLanguage.languageCode,
        'token': 'access_token',
        'username': fakeClientUser.username.getOrCrash(),
        'customerCode': fakeCustomerCodeInfo.customerCodeSoldTo,
        'market': fakeMYSalesOrganisation.salesOrg.country,
        'userRole': fakeClientUser.role.name,
        'salesorg': fakeMYSalesOrganisation.salesOrg.getOrCrash(),
        'locale': fakeClientUser.preferredLanguage.languageCumCountryCode,
        'fromDate': fromDateStringValue,
        'toDate': toDateStringValue,
        'currency': fakeMYSalesOrgConfigs.currency.code,
        'name': fakeClientUser.fullName.displayFullName,
        'email': fakeClientUser.copyWith(email: fakeEmail).email.getOrCrash(),
        'baseUrl': configMock.baseUrl(
          marketDomain: AppMarket(
            deviceStorageMock.currentMarket(),
          ).marketDomain,
        ),
      };
      when(
        () => chatBotService.passPayloadToBot(payload: payload),
      ).thenAnswer(
        (invocation) async => true,
      );

      when(() => chatBotService.setAuthToken(jwtDto.refresh))
          .thenAnswer((_) async => true);

      final result = await chatBotRepository.passPayloadToChatbot(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        user: fakeClientUser.copyWith(
          email: fakeEmail,
        ),
      );

      expect(result, equals(const Right(true)));
    });

    test('pass payload to chat bot remote failure', () async {
      final toDate = DateTime.now();
      final dateFormat = DateFormat('yyyyMMdd');
      final toDateStringValue = dateFormat.format(toDate);
      final fromDateStringValue = dateFormat
          .format(DateTime(toDate.year, toDate.month - 2, toDate.day));
      final payload = <String, Object>{
        'soldTo': fakeCustomerCodeInfo.customerCodeSoldTo,
        'shipTo': [fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode],
        'language': fakeClientUser.preferredLanguage.languageCode,
        'token': 'access_token',
        'username': fakeClientUser.username.getOrCrash(),
        'customerCode': fakeCustomerCodeInfo.customerCodeSoldTo,
        'market': fakeMYSalesOrganisation.salesOrg.country,
        'userRole': fakeClientUser.role.name,
        'salesorg': fakeMYSalesOrganisation.salesOrg.getOrCrash(),
        'locale': fakeClientUser.preferredLanguage.languageCumCountryCode,
        'fromDate': fromDateStringValue,
        'toDate': toDateStringValue,
        'currency': fakeMYSalesOrgConfigs.currency.code,
        'name': fakeClientUser.fullName.displayFullName,
        'email': fakeClientUser.copyWith(email: fakeEmail).email.getOrCrash(),
        'baseUrl': configMock.baseUrl(
          marketDomain: AppMarket(
            deviceStorageMock.currentMarket(),
          ).marketDomain,
        ),
      };
      when(
        () => chatBotService.passPayloadToBot(payload: payload),
      ).thenThrow(
        errorMock,
      );

      when(() => chatBotService.setAuthToken(jwtDto.refresh))
          .thenAnswer((_) async => true);

      final result = await chatBotRepository.passPayloadToChatbot(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        user: fakeClientUser.copyWith(
          email: fakeEmail,
        ),
      );

      expect(result, Left(ApiFailure.other(errorMock.toString())));
    });

    test('pass payload to reset chat bot remote success', () async {
      final market = AppMarket(
        deviceStorageMock.currentMarket(),
      );
      final marketDomain = market.marketDomain.toUpperCase();
      final payload = <String, Object>{
        'token': '',
        'username': '',
        'baseUrl': configMock.baseUrl(
          marketDomain: market.marketDomain,
        ),
        'market': marketDomain,
        'locale': market.locale,
        'currency': market.currency,
        'language': marketDomain,
      };
      when(
        () => chatBotService.passPayloadToBot(payload: payload),
      ).thenAnswer(
        (invocation) async => true,
      );

      when(() => chatBotService.setAuthToken(jwtDto.refresh))
          .thenAnswer((_) async => true);

      final result = await chatBotRepository.resetChatbot();
      expect(result, const Right(true));
    });

    test('pass payload to reset chat bot remote failure', () async {
      final market = AppMarket(
        deviceStorageMock.currentMarket(),
      );
      final marketDomain = market.marketDomain.toUpperCase();
      final payload = <String, Object>{
        'token': '',
        'username': '',
        'baseUrl': configMock.baseUrl(
          marketDomain: market.marketDomain,
        ),
        'market': marketDomain,
        'locale': market.locale,
        'currency': market.currency,
        'language': marketDomain,
      };
      when(
        () => chatBotService.passPayloadToBot(payload: payload),
      ).thenThrow(
        errorMock,
      );

      when(() => chatBotService.setAuthToken(jwtDto.refresh))
          .thenAnswer((_) async => true);

      final result = await chatBotRepository.resetChatbot();
      expect(result, Left(ApiFailure.other(errorMock.toString())));
    });
  });
}
