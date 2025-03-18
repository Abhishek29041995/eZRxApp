import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import '../../../common_mock_data/mock_other.dart';

class MockConfig extends Mock implements Config {}

class PriceOverrideLocalDataSourceMock extends Mock
    implements PriceOverrideLocalDataSource {}

class PriceOverrideRemoteDataSourceMock extends Mock
    implements PriceOverrideRemoteDataSource {}

void main() {
  late PriceOverrideRepository priceOverrideRepository;
  late Config mockConfig;
  late PriceOverrideLocalDataSource priceOverrideLocalDataSource;
  late PriceOverrideRemoteDataSource priceOverrideRemoteDataSource;
  late MixpanelService mixpanelService;
  final mockSalesOrganisation = SalesOrganisation.empty();

  final mockCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: '100000345',
    customerAttr7: CustomerAttr7('ZEV'),
    customerGrp4: CustomerGrp4('VR'),
    status: Status('fake_status'),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    priceOverrideLocalDataSource = PriceOverrideLocalDataSourceMock();
    priceOverrideRemoteDataSource = PriceOverrideRemoteDataSourceMock();
    mixpanelService = MixpanelServiceMock();
    locator.registerLazySingleton<MixpanelService>(() => mixpanelService);
    priceOverrideRepository = PriceOverrideRepository(
      config: mockConfig,
      localDataSource: priceOverrideLocalDataSource,
      remoteDataSource: priceOverrideRemoteDataSource,
      mixpanelService: mixpanelService,
    );
  });

  group('priceOverrideRepository should - ', () {
    test('get priceOverrideRepository successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => priceOverrideLocalDataSource.getOverridePrice())
          .thenAnswer((invocation) async => Price.empty());

      final result = await priceOverrideRepository.updateItemPrice(
        item: PriceAggregate.empty().copyWith(
          price:
              Price.empty().copyWith(priceOverride: PriceOverrideValue(70.0)),
        ),
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get priceOverrideRepository fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => priceOverrideLocalDataSource.getOverridePrice())
          .thenThrow((invocation) async => MockException());

      final result = await priceOverrideRepository.updateItemPrice(
        item: PriceAggregate.empty(),
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get priceOverrideRepository successfully remote', () async {
      final counterOfferValue = CounterOfferValue('70.0');
      final fakeCounterOfferComment = StringValue('fake-Comment');
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => priceOverrideRemoteDataSource.getOverridePrice(
          custCode: '100000345',
          salesOrg: '2601',
          materialQuery: PriceDto.fromDomain(
            Price.empty().copyWith(
              priceOverride: PriceOverrideValue(70.0),
              zdp8Override: Zdp8OverrideValue(12.0),
              materialNumber: MaterialNumber('123456'),
              isPriceOverride: true,
            ),
          ).priceOverrideQuery(70, 0.0),
        ),
      ).thenAnswer(
        (invocation) async => Price.empty().copyWith(
          priceOverride: PriceOverrideValue(70),
          materialNumber: MaterialNumber('00000102345'),
          zdp8Override: Zdp8OverrideValue(12.0),
          isPriceOverride: true,
        ),
      );

      final result = await priceOverrideRepository.updateItemPrice(
        item: PriceAggregate.empty().copyWith(
          discountedMaterialCount: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('123456'),
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: counterOfferValue,
              comment: fakeCounterOfferComment,
            ),
          ),
          price: Price.empty().copyWith(
            priceOverride: PriceOverrideValue(70),
            materialNumber: MaterialNumber('123456'),
            zdp8Override: Zdp8OverrideValue(12.0),
          ),
        ),
        salesOrganisation:
            mockSalesOrganisation.copyWith(salesOrg: SalesOrg('2601')),
        customerCodeInfo:
            mockCustomerCodeInfo.copyWith(customerCodeSoldTo: '100000345'),
      );

      expect(
        result.isRight(),
        true,
      );

      verify(
        () => mixpanelService.trackEvent(
          eventName: TrackingEvents.requestCounterOffer,
          properties: {
            TrackingProps.counterOfferPrice: counterOfferValue.doubleValue,
            TrackingProps.counterOfferRemarks:
                fakeCounterOfferComment.getOrDefaultValue(''),
          },
        ),
      ).called(1);
    });
    test('get priceOverrideRepository fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => priceOverrideRemoteDataSource.getOverridePrice(
          custCode: '',
          salesOrg: '',
          materialQuery: PriceDto.fromDomain(PriceAggregate.empty().price)
              .priceOverrideQuery(0.0, 0.0),
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await priceOverrideRepository.updateItemPrice(
        item: PriceAggregate.empty(),
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
        'get priceOverrideRepository successfully locally copy with item material number',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => priceOverrideLocalDataSource.getOverridePrice()).thenAnswer(
        (invocation) async =>
            Price.empty().copyWith(materialNumber: MaterialNumber('123456')),
      );

      final result = await priceOverrideRepository.updateItemPrice(
        item: PriceAggregate.empty().copyWith(
          price:
              Price.empty().copyWith(priceOverride: PriceOverrideValue(70.0)),
        ),
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
  });
}
