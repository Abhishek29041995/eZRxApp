import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';

class MaterialPriceLocalDataSourceMock extends Mock
    implements MaterialPriceLocalDataSource {}

class MaterialPriceRemoteDataSourceMock extends Mock
    implements MaterialPriceRemoteDataSource {}

void main() {
  late MaterialPriceRepository materialPriceRepository;
  late Config mockConfig;
  late MaterialPriceLocalDataSource materialPriceLocalDataSource;
  late MaterialPriceRemoteDataSource materialPriceRemoteDataSource;
  final mockCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');

  final mockShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-ship-code',
  );
  final fakeMaterialNumberQuery = [
    MaterialNumber('1'),
    MaterialNumber('2'),
  ];
  final fakePrice = Price.empty().copyWith(
    priceOverride: PriceOverrideValue(70.0),
    zdp8Override: Zdp8OverrideValue(12.0),
    materialNumber: MaterialNumber('123456'),
  );

  setUpAll(() {
    mockConfig = ConfigMock();
    materialPriceLocalDataSource = MaterialPriceLocalDataSourceMock();
    materialPriceRemoteDataSource = MaterialPriceRemoteDataSourceMock();

    materialPriceRepository = MaterialPriceRepository(
      config: mockConfig,
      localDataSource: materialPriceLocalDataSource,
      remoteDataSource: materialPriceRemoteDataSource,
    );
  });

  group('materialPriceRepository should - ', () {
    test('get materialPrice successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[]);

      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: fakeSGSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: fakeSGSalesOrgConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialPrice fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenThrow((invocation) async => MockException());
      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: fakeSGSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: fakeSGSalesOrgConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialPrice successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialPriceRemoteDataSource.getMaterialPriceList(
          salesOrgCode: 'fake-name',
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-code',
          materialNumbers: [],
          useNewEndpoint: false,
        ),
      ).thenAnswer((invocation) async => <Price>[]);

      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: fakeSGSalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: fakeSGSalesOrgConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialPrice fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await materialPriceRepository.getMaterialPrice(
        customerCodeInfo: mockCustomerCodeInfo.copyWith(customerCodeSoldTo: ''),
        salesOrganisation: fakeEmptySalesOrganisation,
        materialNumberList: fakeMaterialNumberQuery,
        salesConfigs: fakeSGSalesOrgConfigs,
        shipToInfo: mockShipToInfo,
        comboDealEligible: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });

  test('get materialPrice successfully', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    when(
      () => materialPriceRemoteDataSource.getMaterialPrice(
        salesOrgCode: 'fake-name',
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        salesDeal: [],
        useNewEndpoint: false,
      ),
    ).thenAnswer(
      (invocation) async => Price.empty().copyWith(
        finalPrice: MaterialPrice(123),
      ),
    );

    final result = await materialPriceRepository.getMaterialPrice(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: fakeSGSalesOrganisation,
      materialNumberList: [MaterialNumber('fake-number')],
      salesConfigs: fakeSGSalesOrgConfigs,
      shipToInfo: mockShipToInfo,
      comboDealEligible: false,
    );
    expect(
      result.isRight(),
      true,
    );
  });

  test('get materialPrice successfully with new data', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    final salesDeal = mockCustomerCodeInfo.salesDeals
        .map((e) => e.getOrDefaultValue(''))
        .toList();
    final materialNumber = MaterialNumber('fake-number');
    final price = Price.empty().copyWith(
      finalPrice: MaterialPrice(123),
      materialNumber: materialNumber,
    );

    when(
      () => materialPriceRemoteDataSource.getMaterialPrice(
        salesOrgCode: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
        customerCode: mockCustomerCodeInfo.customerCodeSoldTo,
        shipToCode: mockShipToInfo.shipToCustomerCode,
        materialNumber: 'fake-number',
        salesDeal: salesDeal,
        useNewEndpoint: false,
      ),
    ).thenAnswer(
      (invocation) async => price,
    );

    final result = await materialPriceRepository.getMaterialPrice(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: fakeSGSalesOrganisation,
      materialNumberList: [materialNumber],
      salesConfigs: fakeSGSalesOrgConfigs,
      shipToInfo: mockShipToInfo,
      comboDealEligible: false,
    );
    expect(result.isRight(), true);
    expect(
      (result as Right).value,
      equals({materialNumber: price}),
    );
  });

  test('get getMaterialPriceForZDP5 successfully', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => materialPriceRemoteDataSource.getMaterialPriceForZDP5(
        salesOrgCode: fakeVNSalesOrg.getValue(),
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        exceedQty: true,
        useNewEndpoint: false,
      ),
    ).thenAnswer(
      (invocation) async => Price.empty().copyWith(
        finalPrice: MaterialPrice(123),
        exceedQty: true,
      ),
    );

    final result =
        await materialPriceRepository.getMaterialPriceForZDP5Material(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: fakeVNSalesOrganisation,
      materialNumber: MaterialNumber('fake-number'),
      salesConfigs: fakeVNSalesOrgConfigs,
      shipToInfo: mockShipToInfo,
      exceedQty: true,
    );
    expect(
      result.isRight(),
      true,
    );
  });

  test('get getMaterialPriceForZDP5 failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => materialPriceRemoteDataSource.getMaterialPriceForZDP5(
        salesOrgCode: 'fake-name',
        customerCode: 'fake-customer-code',
        shipToCode: 'fake-ship-code',
        materialNumber: 'fake-number',
        exceedQty: true,
        useNewEndpoint: false,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result =
        await materialPriceRepository.getMaterialPriceForZDP5Material(
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrganisation: fakeSGSalesOrganisation,
      materialNumber: MaterialNumber('fake-number'),
      salesConfigs: fakeSGSalesOrgConfigs,
      shipToInfo: mockShipToInfo,
      exceedQty: true,
    );
    expect(
      result.isLeft(),
      true,
    );
  });

  group('materialPriceRepository should - ', () {
    test('get discountOverride successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[]);

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        false,
      );
    });
    test('get discountOverride fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenThrow((invocation) async => MockException());

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get discountOverride successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => materialPriceRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCode: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
          materialQuery: PriceDto.fromDomain(
            fakePrice,
          ).overrideQuery,
          useNewEndpoint: false,
        ),
      ).thenAnswer(
        (invocation) async => [fakePrice],
      );

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get discountOverride fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => materialPriceRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCode: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
          materialQuery: PriceDto.fromDomain(
            fakePrice,
          ).overrideQuery,
          useNewEndpoint: false,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
        'get discountOverride successfully locally with condition zdp8Override valid',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[Price.empty()]);

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(
        'get discountOverride successfully locally with condition zdp8Override inValid and data has correct material number',
        () async {
      final price = Price.empty().copyWith(
        materialNumber: MaterialNumber('123456'),
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList()).thenAnswer(
        (invocation) async => <Price>[price],
      );

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice.copyWith(zdp8Override: Zdp8OverrideValue(0)),
      );
      expect(result, Right(price));
    });

    test(
        'get discountOverride successfully locally with condition zdp8Override inValid and data has incorrect material number',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList()).thenAnswer(
        (invocation) async => <Price>[Price.empty()],
      );

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice.copyWith(zdp8Override: Zdp8OverrideValue(0)),
      );
      expect(
        result,
        Right(
          Price.empty().copyWith(
            materialNumber: MaterialNumber('123456'),
          ),
        ),
      );
    });

    test(
        'get discountOverride successfully locally with condition element and price material number same',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialPriceLocalDataSource.getPriceList()).thenAnswer(
        (invocation) async => <Price>[fakePrice],
      );

      final result = await materialPriceRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(
      'get Material Price With Zdp5 Discount locally',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialPriceLocalDataSource.getPriceList()).thenAnswer(
          (invocation) async => [fakePrice],
        );
        final result =
            await materialPriceRepository.getMaterialPriceWithZdp5Discount(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeSalesOrganisation,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'get Material Price With Zdp5 Discount locally failure',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialPriceLocalDataSource.getPriceList()).thenThrow(
          (invocation) async => MockException(),
        );
        final result =
            await materialPriceRepository.getMaterialPriceWithZdp5Discount(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeSalesOrganisation,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isLeft(), true);
      },
    );
    test(
      'get Material Price With Zdp5 Discount remote',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => materialPriceRemoteDataSource.getMaterialOverridePriceList(
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode:
                fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
            materialQuery: PriceDto.fromDomain(
              fakePrice,
            ).materialQueryWithExceedQty(true),
            useNewEndpoint: false,
          ),
        ).thenAnswer(
          (invocation) async => [fakePrice],
        );
        final result =
            await materialPriceRepository.getMaterialPriceWithZdp5Discount(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeSalesOrganisation,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'get Material Price With Zdp5 Discount remote failure',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => materialPriceRemoteDataSource.getMaterialOverridePriceList(
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode:
                fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
            materialQuery: PriceDto.fromDomain(
              fakePrice,
            ).materialQueryWithExceedQty(true),
            useNewEndpoint: false,
          ),
        ).thenThrow(
          (invocation) async => Exception('fake-error'),
        );
        final result =
            await materialPriceRepository.getMaterialPriceWithZdp5Discount(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeSalesOrganisation,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isLeft(), true);
      },
    );
  });
}
