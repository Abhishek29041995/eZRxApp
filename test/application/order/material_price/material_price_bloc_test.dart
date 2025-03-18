import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MaterialPriceRepositoryMock extends Mock
    implements MaterialPriceRepository {}

void main() {
  late final MaterialPriceRepository repository;

  late final Map<MaterialNumber, Price> mockPriceMap;

  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-code',
  );

  final fakeFOCMaterialQuery = [
    MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('1'),
      isFOCMaterial: true,
    ),
    MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('2'),
      isFOCMaterial: true,
    ),
  ];
  final materialPrice = {
    for (final material in fakeFOCMaterialQuery)
      material.materialNumber: Price.empty().copyWith(
        materialNumber: material.materialNumber,
        isValid: false,
      ),
  };

  final fakeMaterialQuery = [
    MaterialInfo.empty()
        .copyWith(materialNumber: MaterialNumber('000000000021038305')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
  ];

  final fakeMaterialNumberQuery = [
    MaterialNumber('000000000021038305'),
    MaterialNumber('2'),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = MaterialPriceRepositoryMock();
    final priceData = await MaterialPriceLocalDataSource().getPriceList();
    mockPriceMap = {
      for (final price in priceData)
        price.materialNumber: price.copyWith(
          zdp5MaxQuota: ZDP5Info('500'),
          zdp5RemainingQuota: ZDP5Info('50'),
        ),
    };
  });

  group('Material Price Bloc for materials', () {
    blocTest(
      'Initialize',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.initialized(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials query already have their price',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
        materialPrice: {
          for (final number in fakeMaterialQuery)
            number.materialNumber: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTierItem.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () {
        return [
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            isFetching: true,
            materialPrice: {
              for (final number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTierItem.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialPrice: {
              for (final number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTierItem.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
        ];
      },
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeFOCMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: materialPrice,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: materialPrice,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price failure',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
        ),
      ],
    );
  });

  group('Material Price Bloc for cart product', () {
    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials query already have their price',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
        materialPrice: {
          for (final number in fakeMaterialQuery)
            number.materialNumber: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTierItem.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () {
        return [
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            isFetching: true,
            materialPrice: {
              for (final number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTierItem.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialPrice: {
              for (final number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTierItem.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
        ];
      },
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeFOCMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: true,
          materialPrice: materialPrice,
        ),
        MaterialPriceState.initial().copyWith(
          materialPrice: materialPrice,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price failure',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Get Material Price For ZDP5 Material success when exceedQty is false',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        materialPrice: mockPriceMap,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPriceForZDP5Material(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumber: fakeMaterialNumberQuery.first,
            exceedQty: false,
          ),
        ).thenAnswer(
          (_) async => Right(Price.empty()),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceForZDP5Materials(
          materialInfo:
              fakeMaterialQuery.first.copyWith(quantity: MaterialQty(50)),
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: mockPriceMap,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Get Material Price For ZDP5 Material success when exceedQty is true',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        materialPrice: mockPriceMap,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPriceForZDP5Material(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumber: fakeMaterialNumberQuery.first,
            exceedQty: true,
          ),
        ).thenAnswer(
          (_) async => Right(Price.empty()),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceForZDP5Materials(
          materialInfo:
              fakeMaterialQuery.first.copyWith(quantity: MaterialQty(60)),
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: mockPriceMap,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Get Material Price For ZDP5 Material failure',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        materialPrice: mockPriceMap,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPriceForZDP5Material(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumber: fakeMaterialNumberQuery.first,
            exceedQty: true,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceForZDP5Materials(
          materialInfo:
              fakeMaterialQuery.first.copyWith(quantity: MaterialQty(60)),
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: mockPriceMap,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success for foc materials',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: [fakeMaterialQuery.first.copyWith(isFOCMaterial: true)],
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: {
            fakeMaterialQuery.first.materialNumber: Price.empty().copyWith(
              materialNumber: fakeMaterialQuery.first.materialNumber,
              isValid: false,
            ),
          },
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: {
            fakeMaterialQuery.first.materialNumber: Price.empty().copyWith(
              materialNumber: fakeMaterialQuery.first.materialNumber,
              isValid: false,
            ),
          },
        ),
      ],
    );
    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success for foc materials in cart',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeMYSalesOrganisation,
        salesConfigs: fakeMYSalesOrgConfigs,
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: [fakeMaterialQuery.first.copyWith(isFOCMaterial: true)],
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          isFetching: true,
          materialPrice: {
            fakeMaterialQuery.first.materialNumber: Price.empty().copyWith(
              materialNumber: fakeMaterialQuery.first.materialNumber,
              isValid: false,
            ),
          },
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          salesConfigs: fakeMYSalesOrgConfigs,
          materialPrice: {
            fakeMaterialQuery.first.materialNumber: Price.empty().copyWith(
              materialNumber: fakeMaterialQuery.first.materialNumber,
              isValid: false,
            ),
          },
        ),
      ],
    );

    test('Check display Offer Tag when final price not equal last price', () {
      final materialNumber = MaterialNumber('fake-number');
      final materialInfo =
          MaterialInfo.empty().copyWith(materialNumber: materialNumber);
      final state = MaterialPriceState.initial().copyWith(
        materialPrice: {
          materialNumber: Price.empty().copyWith(
            finalPrice: MaterialPrice(10),
            lastPrice: MaterialPrice(9),
          ),
        },
      );
      expect(
        state.displayOfferTag(materialInfo, fakeClientUser),
        true,
      );
    });

    test('Check display Offer Tag when has bonuses', () {
      final materialNumber = MaterialNumber('fake-number');
      final materialInfo = MaterialInfo.empty().copyWith(
        materialNumber: materialNumber,
        principalData: PrincipalData.empty()
            .copyWith(principalCode: PrincipalCode('105307')),
        stockInfos: [
          StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
        ],
      );
      final state = MaterialPriceState.initial().copyWith(
        salesOrganisation: fakeMYSalesOrganisation,
        materialPrice: {
          materialNumber: Price.empty().copyWith(
            bonuses: [PriceBonus.empty()],
          ),
        },
      );
      expect(
        state.displayOfferTag(materialInfo, fakeExternalSalesRepUser),
        true,
      );
    });
  });
}
