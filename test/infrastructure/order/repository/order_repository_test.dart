import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bonus_sample_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/sales_rep_authorized_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_tender_contract_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_encryption.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:upgrader/upgrader.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class MockConfig extends Mock implements Config {}

class ViewByOrderDetailsRemoteDataSourceMock extends Mock
    implements ViewByOrderDetailsRemoteDataSource {}

class EncryptionMock extends Mock implements Encryption {}

class ViewByOrderDetailsLocalDataSourceMock extends Mock
    implements ViewByOrderDetailsLocalDataSource {}

class OrderLocalDataSourceMock extends Mock implements OrderLocalDataSource {}

class OrderRemoteDataSourceMock extends Mock implements OrderRemoteDataSource {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

class MaterialBannerStorageMock extends Mock implements MaterialBannerStorage {}

void main() {
  late Config mockConfig;
  late Encryption encryption;
  late SubmitOrder submitOrderMock;
  late OrderRepository orderRepository;
  late DeviceStorage deviceStorage;
  late RemoteConfigService remoteConfigService;
  late DeliveryInfoData deliveryInfoData;
  late List<PriceAggregate> cartMaterials;
  late OrderEncryption orderEncryptionMock;
  late OrderLocalDataSource orderLocalDataSource;
  late SubmitOrderResponse submitOrderResponseMock;
  late OrderHistoryDetails orderHistoryDetailsMock;
  late OrderRemoteDataSource orderRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final mockShipToInfo = fakeCustomerCodeInfo.shipToInfos.first;
  late ViewByOrderDetailsLocalDataSource viewByOrderDetailsLocalDataSource;
  late ViewByOrderDetailsRemoteDataSource viewByOrderDetailsRemoteDataSource;
  const fakeMarketPlaceMarket = 'fake-marketplace-market';
  const fakeNormalMarket = 'fake-normal-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarketPlaceMarket];
  final fakeConfigValue =
      fakeEnableMarketPlaceMarkets.contains(fakeMarketPlaceMarket);
  const fakeSecretKey = 'fake-key';
  final fakeError = MockException(message: 'fake-exception');
  late MaterialBannerStorage materialBannerStorageMock;
  late MixpanelService mixpanelService;
  late ClevertapService clevertapService;
  final upgrader = Upgrader();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockConfig = MockConfig();
    orderLocalDataSource = OrderLocalDataSourceMock();
    orderRemoteDataSource = OrderRemoteDataSourceMock();
    materialBannerStorageMock = MaterialBannerStorageMock();
    deviceStorage = DeviceStorageMock();
    remoteConfigService = RemoteConfigServiceMock();
    viewByOrderDetailsLocalDataSource = ViewByOrderDetailsLocalDataSourceMock();
    viewByOrderDetailsRemoteDataSource =
        ViewByOrderDetailsRemoteDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    mixpanelService = MixpanelServiceMock();
    locator.registerLazySingleton<MixpanelService>(() => mixpanelService);
    clevertapService = ClevertapServiceMock();
    locator.registerLazySingleton<ClevertapService>(() => clevertapService);
    encryption = EncryptionMock();
    orderEncryptionMock = OrderEncryption(
      data: 'fake-data',
      hash: 'fake-hash',
    );
    orderRepository = OrderRepository(
      config: mockConfig,
      localDataSource: orderLocalDataSource,
      remoteDataSource: orderRemoteDataSource,
      encryption: encryption,
      orderDetailLocalDataSource: viewByOrderDetailsLocalDataSource,
      orderHistoryDetailsRemoteDataSource: viewByOrderDetailsRemoteDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      deviceStorage: deviceStorage,
      remoteConfigService: remoteConfigService,
      materialBannerStorage: materialBannerStorageMock,
      mixpanelService: mixpanelService,
      clevertapService: clevertapService,
      upgrader: upgrader,
    );
    final materialListResponse =
        await MaterialListLocalDataSource().getProductList();
    cartMaterials = materialListResponse.products
        .map(
          (e) => PriceAggregate.empty().copyWith(
            materialInfo: e.copyWith(isFOCMaterial: false),
            salesOrgConfig: fakeMYSalesOrgConfigs,
            quantity: 1,
          ),
        )
        .toList();
    deliveryInfoData = DeliveryInfoData.empty().copyWith(
      poReference: StringValue('CO REF'),
      contactPerson: StringValue('PERSON'),
      mobileNumber: PhoneNumber('123456'),
      paymentTerm: PaymentTerm(''),
      deliveryDate: DateTimeStringValue('01/02/2023'),
      deliveryInstruction: StringValue('test'),
      referenceNote: StringValue('note'),
    );

    submitOrderMock = SubmitOrder.empty().copyWith(
      purchaseOrderType: fakeClientUser.role.type.purchaseOrderType,
      paymentMethod: 'Bank Transfer',
      orderValue: 100.0,
      totalTax: 100.0,
      orderType: 'ZPOR',
      userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
          ? deliveryInfoData.contactPerson.getValue()
          : fakeClientUser.fullName.toString(),
      poReference: deliveryInfoData.poReference.getValue(),
      referenceNotes: deliveryInfoData.referenceNote.getValue(),
      specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
      companyName: CompanyName(mockShipToInfo.shipToName.toString()),
      requestedDeliveryDate: fakePHSalesOrgConfigs.enableFutureDeliveryDay
          ? deliveryInfoData.deliveryDate.getValue()
          : '',
      poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      telephone: deliveryInfoData.mobileNumber.getOrDefaultValue(''),
      collectiveNumber: '',
      paymentTerms:
          cartMaterials.first.tenderContract.contractPaymentTerm.getValue(),
      customer: SubmitOrderCustomer.empty().copyWith(
        customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
        customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
        division: fakeCustomerCodeInfo.division,
        salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
      ),
      language: 'EN',
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList,
      products: cartMaterials
          .expand(
            (element) => !element.materialInfo.type.typeBundle
                ? [element.toSubmitMaterialInfo()]
                : element.bundle.materials.map(
                    (el) => PriceAggregate.empty()
                        .copyWith(
                          materialInfo: el,
                          quantity: el.quantity.intValue,
                          salesOrgConfig: element.salesOrgConfig,
                          bundle: element.bundle,
                        )
                        .toSubmitMaterialInfo(),
                  ),
          )
          .toList(),
    );

    submitOrderResponseMock = await OrderLocalDataSource().submitOrder();
    orderHistoryDetailsMock =
        await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
    when(() => deviceStorage.currentMarket()).thenReturn(fakeMarketPlaceMarket);
    when(() => remoteConfigService.enableMarketPlaceMarkets)
        .thenReturn(fakeEnableMarketPlaceMarkets);
  });

  test('get submit order successfully locally ', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final cartMaterial = <PriceAggregate>[
      PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          principalData: PrincipalData.empty()
              .copyWith(principalCode: PrincipalCode('0000140332')),
        ),
        tenderContract: TenderContract.empty().copyWith(
          contractPaymentTerm: StringValue('term'),
          tenderOrderReason: TenderContractReason('reas'),
        ),
        salesOrgConfig: fakePHSalesOrgConfigs,
      ),
    ];

    final submitOrder = SubmitOrder.empty().copyWith(
      userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
          ? deliveryInfoData.contactPerson.getValue()
          : fakeClientUser.fullName.toString(),
      poReference: deliveryInfoData.poReference.getValue(),
      referenceNotes: deliveryInfoData.referenceNote.getValue(),
      specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
      companyName: CompanyName(mockShipToInfo.shipToName.toString()),
      requestedDeliveryDate: deliveryInfoData.deliveryDate.getValue(),
      poDate: deliveryInfoData.deliveryDate.getValue(),
      telephone: deliveryInfoData.mobileNumber.getOrDefaultValue(''),
      collectiveNumber: '',
      paymentTerms: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: StringValue('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        ),
      ].first.tenderContract.contractPaymentTerm.getValue(),
      customer: SubmitOrderCustomer.empty().copyWith(
        customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
        customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
        division: fakeCustomerCodeInfo.division,
        salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
      ),
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
          cartMaterial.any((item) => item.checkSalesCutOff),
      products: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: StringValue('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        ),
      ].map((e) => e.toSubmitMaterialInfo()).toList(),
    );

    when(() => orderLocalDataSource.submitOrder()).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterial,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );
    expect(
      result,
      Right(submitOrderResponseMock),
    );
    expect(submitOrder.blockOrder, false);
  });

  test(
    'get submit order successfully locally with payment term validation ',
    () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final cartMaterial = <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
            principalData: PrincipalData.empty()
                .copyWith(principalCode: PrincipalCode('0000140332')),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: StringValue('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
          salesOrgConfig: fakePHSalesOrgConfigs,
        ),
      ];

      final submitOrder = SubmitOrder.empty().copyWith(
        userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
            ? deliveryInfoData.contactPerson.getValue()
            : fakeClientUser.fullName.toString(),
        poReference: deliveryInfoData.poReference.getValue(),
        referenceNotes: deliveryInfoData.referenceNote.getValue(),
        specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: deliveryInfoData.deliveryDate.getValue(),
        poDate: deliveryInfoData.deliveryDate.getValue(),
        telephone: deliveryInfoData.mobileNumber.getOrDefaultValue(''),
        collectiveNumber: '',
        paymentTerms: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm: StringValue('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          ),
        ].first.tenderContract.contractPaymentTerm.getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: fakeCustomerCodeInfo.division,
          salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
        blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
            cartMaterial.any((item) => item.checkSalesCutOff),
        products: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm: StringValue('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          ),
        ].map((e) => e.toSubmitMaterialInfo()).toList(),
      );

      when(() => orderLocalDataSource.submitOrder()).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterial,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
      expect(submitOrder.blockOrder, false);
    },
  );
  test('get submit order fail locally ', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final cartMaterial = <PriceAggregate>[
      PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          principalData: PrincipalData.empty()
              .copyWith(principalCode: PrincipalCode('0000140332')),
        ),
      ),
    ];
    final submitOrder = SubmitOrder.empty().copyWith(
      userName: '',
      companyName: CompanyName('name'),
      customer: SubmitOrderCustomer.empty().copyWith(
        division: 'div',
        salesOrganisation: '2601',
      ),
      products: [
        SubmitMaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          quantity: 2,
        ),
      ],
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
          cartMaterial.any((item) => item.checkSalesCutOff),
    );

    when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

    final result = await orderRepository.submitOrder(
      shipToInfo: ShipToInfo.empty(),
      user: User.empty().copyWith(
        email: EmailAddress('awsib@gmail.com'),
        username: Username('user'),
      ),
      cartProducts: cartMaterial,
      grandTotal: 100.0,
      customerCodeInfo: CustomerCodeInfo.empty().copyWith(division: 'div'),
      salesOrganisation: fakeSGSalesOrganisation,
      data:
          DeliveryInfoData.empty().copyWith(paymentTerm: PaymentTerm('A004-')),
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );
    expect(
      result,
      Left(FailureHandler.handleFailure(fakeError)),
    );
    expect(submitOrder.blockOrder, false);
  });

  group('OrderRepository => submitOrder', () {
    test('get submit order successfully locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully locally bonus item success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials
            .map(
              (e) => e.copyWith(
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    principalData: PrincipalData(
                      principalName: PrincipalName('fake-principle-name'),
                      principalCode: PrincipalCode('fake-principle-code'),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully locally fail for bundle', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  type: MaterialInfoType.bundle(),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [e.materialInfo],
                ),
              ),
            )
            .toList(),
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test('get submit order successfully Remote fail ZPFC order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPFC',
              customer: submitOrderMock.customer.copyWith(
                salesOrganisation: fakeSGSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPFC'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerAttr7: CustomerAttr7('ZEV'),
        ),
        salesOrganisation: fakeSGSalesOrganisation,
        data: deliveryInfoData,
        configs: fakeSGSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote fail ZPVF order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPVF',
              customer: submitOrderMock.customer.copyWith(
                division: 'mock_div',
                salesOrganisation: fakePHSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPVF'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerGrp4: CustomerGrp4('VP'),
          status: Status('fake_status'),
          customerName: CustomerName.empty().copyWith(name1: 'cust1'),
          division: 'mock_div',
        ),
        salesOrganisation: fakePHSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote fail ZPFV order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPFV',
              customer: submitOrderMock.customer.copyWith(
                salesOrganisation: fakePHSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPFV'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo.copyWith(
          customerGrp4: CustomerGrp4('VR'),
        ),
        salesOrganisation: fakePHSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test(
      'get submit order successfully Remote success with bonus item',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        final bonusCartMaterial = cartMaterials
            .map(
              (e) => e.copyWith(
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    principalData: PrincipalData(
                      principalName: PrincipalName('fake-principle-name'),
                      principalCode: PrincipalCode('fake-principle-code'),
                    ),
                  ),
                ],
              ),
            )
            .toList();
        when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

        when(
          () => encryption.encryptionData(
            data: SubmitOrderDto.fromDomain(
              submitOrderMock.copyWith(
                products: bonusCartMaterial
                    .expand(
                      (element) => !element.materialInfo.type.typeBundle
                          ? [element.toSubmitMaterialInfo()]
                          : element.bundle.materials.map(
                              (el) => PriceAggregate.empty()
                                  .copyWith(
                                    materialInfo: el,
                                    quantity: el.quantity.intValue,
                                    salesOrgConfig: element.salesOrgConfig,
                                    bundle: element.bundle,
                                  )
                                  .toSubmitMaterialInfo(),
                            ),
                    )
                    .toList(),
              ),
            ).toJson(),
            secretKey: fakeSecretKey,
          ),
        ).thenReturn(orderEncryptionMock);
        when(
          () => orderRemoteDataSource.submitOrder(
            orderEncryption: orderEncryptionMock,
            enableMarketPlace: fakeConfigValue,
          ),
        ).thenAnswer(
          (invocation) async => submitOrderResponseMock,
        );

        final result = await orderRepository.submitOrder(
          shipToInfo: mockShipToInfo,
          user: fakeClientUser,
          cartProducts: bonusCartMaterial,
          grandTotal: 100.0,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          data: deliveryInfoData,
          configs: fakePHSalesOrgConfigs,
          orderValue: 100.0,
          totalTax: 100,
          aplSmallOrderFee: 12500.0,
          mpSmallOrderFee: 0,
          zpSmallOrderFee: 0,
          salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
          deliveryOption: '',
        );
        expect(
          result,
          Right(submitOrderResponseMock),
        );
      },
    );

    test('get submit order successfully Remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote success with combo', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final materialListResponse =
          await MaterialListLocalDataSource().getProductList();

      final cartMaterialsCombo = materialListResponse.products
          .map(
            (e) => PriceAggregate.empty().copyWith(
              materialInfo: e.copyWith(
                type: MaterialInfoType.combo(),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
              quantity: 1,
              comboMaterials: [
                ComboMaterialItem.empty().copyWith(
                  comboDealType: 'K1',
                  quantity: 1,
                  listPrice: 15,
                  mandatory: true,
                  minQty: 1,
                  rate: 40,
                  finalIndividualPrice: 9,
                  isComboEligible: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-combo'),
                    parentID: 'fake-material',
                    principalData: PrincipalData(
                      principalName: PrincipalName('fake-principal-name'),
                      principalCode: PrincipalCode('fake-principal-code'),
                    ),
                    type: MaterialInfoType.combo(),
                    remarks: 'fake-remark',
                    promoType: 'fake-promo-type',
                  ),
                ),
              ],
            ),
          )
          .toList();

      final submitOrderComboMock = SubmitOrder.empty().copyWith(
        purchaseOrderType: fakeClientUser.role.type.purchaseOrderType,
        paymentMethod: 'Bank Transfer',
        orderValue: 210.0,
        totalTax: 0.0,
        orderType: 'ZPOR',
        userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
            ? deliveryInfoData.contactPerson.getValue()
            : fakeClientUser.fullName.toString(),
        poReference: deliveryInfoData.poReference.getValue(),
        referenceNotes: deliveryInfoData.referenceNote.getValue(),
        specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: fakeVNSalesOrgConfigs.enableFutureDeliveryDay
            ? deliveryInfoData.deliveryDate.getValue()
            : '',
        poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        telephone: deliveryInfoData.mobileNumber.getOrDefaultValue(''),
        collectiveNumber: '',
        paymentTerms: cartMaterialsCombo
            .first.tenderContract.contractPaymentTerm
            .getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: fakeCustomerCodeInfo.division,
          salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
        language: 'EN',
        blockOrder: fakeVNSalesOrgConfigs.enablePrincipalList,
        products: cartMaterialsCombo
            .expand(
              (element) => element.comboMaterials.map(
                (comboMaterial) => comboMaterial.toSubmitMaterialInfo(),
              ),
            )
            .toList(),
      );
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderComboMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterialsCombo,
        grandTotal: 210.0,
        orderValue: 210.0,
        aplSmallOrderFee: 12500.0,
        totalTax: 0.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test(
      'submit order should contain deliveryFee as small order value string in ID market when order value <300000.00',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        final submitOrderMockIDMarket = submitOrderMock.copyWith(
          requestedDeliveryDate: fakeIDSalesOrgConfigs.enableFutureDeliveryDay
              ? deliveryInfoData.deliveryDate.getValue()
              : '',
          customer: submitOrderMock.customer.copyWith(
            salesOrganisation:
                fakeIDSalesOrganisation.salesOrg.getOrDefaultValue(''),
          ),
        );
        when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

        when(
          () => encryption.encryptionData(
            data: SubmitOrderDto.fromDomain(
              submitOrderMockIDMarket,
            ).toJson()
              ..addAll({'deliveryFee': '12500.0'}),
            secretKey: fakeSecretKey,
          ),
        ).thenReturn(orderEncryptionMock);
        when(
          () => orderRemoteDataSource.submitOrder(
            orderEncryption: orderEncryptionMock,
            enableMarketPlace: fakeConfigValue,
          ),
        ).thenAnswer(
          (invocation) async => submitOrderResponseMock,
        );

        final result = await orderRepository.submitOrder(
          shipToInfo: mockShipToInfo,
          user: fakeClientUser,
          cartProducts: cartMaterials,
          grandTotal: 100.0,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeIDSalesOrganisation,
          data: deliveryInfoData,
          configs: fakeIDSalesOrgConfigs,
          orderValue: 100.0,
          totalTax: 100,
          aplSmallOrderFee: 12500.0,
          mpSmallOrderFee: 0,
          zpSmallOrderFee: 0,
          salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
          deliveryOption: '',
        );

        expect(result, Right(submitOrderResponseMock));
      },
    );

    test('get submit order successfully Remote success with tender contract',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final materialListResponse =
          await MaterialListLocalDataSource().getProductList();

      final cartMaterialsTenderContract = materialListResponse.products
          .map(
            (e) => PriceAggregate.empty().copyWith(
              materialInfo: e.copyWith(
                type: MaterialInfoType.material(),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
              quantity: 1,
              tenderContract: TenderContract.empty().copyWith(
                contractPaymentTerm: StringValue('fake-payment-term'),
                tenderOrderReason: TenderContractReason('fake-reason'),
                contractNumber: TenderContractNumber('fake-number'),
              ),
            ),
          )
          .toList();
      final submitOrderTenderContractMock = SubmitOrder.empty().copyWith(
        purchaseOrderType: fakeClientUser.role.type.purchaseOrderType,
        paymentMethod: 'Bank Transfer',
        orderValue: 210.0,
        totalTax: 0.0,
        orderType: 'ZPOR',
        userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
            ? deliveryInfoData.contactPerson.getValue()
            : fakeClientUser.fullName.toString(),
        poReference: deliveryInfoData.poReference.getValue(),
        referenceNotes: deliveryInfoData.referenceNote.getValue(),
        specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: fakeVNSalesOrgConfigs.enableFutureDeliveryDay
            ? deliveryInfoData.deliveryDate.getValue()
            : '',
        poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        telephone: deliveryInfoData.mobileNumber.getOrDefaultValue(''),
        collectiveNumber: '',
        paymentTerms: 'fake-payment-term',
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: fakeCustomerCodeInfo.division,
          salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
        language: 'EN',
        blockOrder: fakeVNSalesOrgConfigs.enablePrincipalList,
        products: cartMaterialsTenderContract
            .expand(
              (element) => [element.toSubmitMaterialInfo()],
            )
            .toList(),
        orderReason: 'fake-reason',
      );
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderTenderContractMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterialsTenderContract,
        grandTotal: 210.0,
        orderValue: 210.0,
        aplSmallOrderFee: 12500.0,
        totalTax: 0.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test(
        'get submit order successfully Remote success for covid item when customer is Private Company',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              products: cartMaterials
                  .expand(
                    (element) => !element.materialInfo.type.typeBundle
                        ? [element.toSubmitMaterialInfo()]
                        : element.bundle.materials.map(
                            (el) => PriceAggregate.empty()
                                .copyWith(
                                  materialInfo: el,
                                  quantity: el.quantity.intValue,
                                  salesOrgConfig: element.salesOrgConfig,
                                  bundle: element.bundle,
                                  isCovid: true,
                                )
                                .toSubmitMaterialInfo(),
                          ),
                  )
                  .toList(),
              orderReason: '802',
              customer: SubmitOrderCustomer.empty().copyWith(
                customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
                customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
                division: fakeCustomerCodeInfo.division,
                salesOrganisation:
                    fakePHSalesOrganisation.salesOrg.getOrCrash(),
              ),
            ),
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
          enableMarketPlace: fakeConfigValue,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials
            .map(
              (e) => e.copyWith(
                isCovid: true,
              ),
            )
            .toList(),
        grandTotal: 100.0,
        customerCodeInfo:
            fakeCustomerCodeInfo.copyWith(customerGrp4: CustomerGrp4('VR')),
        salesOrganisation: fakePHSalesOrganisation,
        data: deliveryInfoData,
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        aplSmallOrderFee: 12500.0,
        mpSmallOrderFee: 0,
        zpSmallOrderFee: 0,
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
        deliveryOption: '',
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });
  });
  test(
      'submit order should contain deliveryFee as null string in ID market when order valye is >=300000.00',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final submitOrderMockIDMarket = submitOrderMock.copyWith(
      orderValue: 310000.00,
      customer: submitOrderMock.customer.copyWith(
        salesOrganisation:
            fakeIDSalesOrganisation.salesOrg.getOrDefaultValue(''),
      ),
    );

    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
    when(
      () => encryption.encryptionData(
        data: SubmitOrderDto.fromDomain(
          submitOrderMockIDMarket,
        ).toJson()
          ..addAll({'deliveryFee': 'null'}),
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeIDSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 310000.00,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  test(
      'submit order should send small order fee detail when having small order fee applied',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final submitOrderWithSmallOrderFee = submitOrderMock.copyWith(
      smallOrderFeeDetail: SmallOrderFeeDetail(
        mpSmallOrderFee: 200,
        zpSmallOrderFee: 100,
        currency: fakePHSalesOrgConfigs.currency,
      ),
    );
    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

    when(
      () => encryption.encryptionData(
        data: SubmitOrderDto.fromDomain(submitOrderWithSmallOrderFee).toJson(),
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer((_) async => submitOrderResponseMock);

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 200,
      zpSmallOrderFee: 100,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  test('submit order with salesrep authorized detail sendPayload', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final submitOrder = submitOrderMock.copyWith(
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty().copyWith(
        sendPayload: true,
      ),
    );
    final submitOrderWithSalesrepAuthorizedDetail =
        SubmitOrderDto.fromDomain(submitOrder).toJson()
          ..addAll(
            {
              'salesRepAuthorizedDetails':
                  SalesRepAuthorizedDetailsDto.fromDomain(
                submitOrder.salesRepAuthorizedDetails,
              ).toJson(),
            },
          );
    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

    when(
      () => encryption.encryptionData(
        data: submitOrderWithSalesrepAuthorizedDetail,
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer((_) async => submitOrderResponseMock);

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty().copyWith(
        sendPayload: true,
      ),
      deliveryOption: '',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  test('submit order with delivery option in payload', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

    final submitOrderWithSalesrepAuthorizedDetail =
        SubmitOrderDto.fromDomain(submitOrderMock).toJson()
          ..addAll({'deliveryOption': 'fake-option'});
    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
    when(
      () => encryption.encryptionData(
        data: submitOrderWithSalesrepAuthorizedDetail,
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer((_) async => submitOrderResponseMock);

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: 'fake-option',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  test('submit order with poison attachment included in payload', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final poAttachment = PoDocuments.empty().copyWith(url: 'fake-url');
    final submitOrderWithSalesrepAuthorizedDetail = SubmitOrderDto.fromDomain(
      submitOrderMock.copyWith(
        poDocuments: [poAttachment.copyWith(isPoison: true)],
      ),
    ).toJson();
    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
    when(
      () => encryption.encryptionData(
        data: submitOrderWithSalesrepAuthorizedDetail,
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer((_) async => submitOrderResponseMock);

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData.copyWith(
        poisonRefDocumentsIncluded: true,
        poDocuments: [poAttachment],
      ),
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  test(
      'submit order should contain deliveryFee as null string in ID market when order valye is >=300000.00',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final submitOrderMockIDMarket = submitOrderMock.copyWith(
      orderValue: 310000.00,
      customer: submitOrderMock.customer.copyWith(
        salesOrganisation:
            fakeIDSalesOrganisation.salesOrg.getOrDefaultValue(''),
      ),
    );

    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
    when(
      () => encryption.encryptionData(
        data: SubmitOrderDto.fromDomain(
          submitOrderMockIDMarket,
        ).toJson()
          ..addAll({'deliveryFee': 'null'}),
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
        enableMarketPlace: fakeConfigValue,
      ),
    ).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeIDSalesOrganisation,
      data: deliveryInfoData,
      configs: fakePHSalesOrgConfigs,
      orderValue: 310000.00,
      totalTax: 100,
      aplSmallOrderFee: 12500.0,
      mpSmallOrderFee: 0,
      zpSmallOrderFee: 0,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      deliveryOption: '',
    );

    expect(result, Right(submitOrderResponseMock));
  });

  group('OrderRepository => getOrderHistoryDetails', () {
    test('Locally success', () async {
      final orderList = [orderHistoryDetailsMock];
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => viewByOrderDetailsLocalDataSource.getOrderHistoryDetailsList())
          .thenAnswer((_) async => orderList);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );
      expect(
        result,
        Right(orderList),
      );
    });

    test('Locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => viewByOrderDetailsLocalDataSource.getOrderHistoryDetailsList())
          .thenThrow(fakeError);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('Remote success in non-marketplace market', () async {
      final item = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType.material(),
          materialNumber: MaterialNumber('fake-number'),
        ),
        bonusSampleItems: [
          BonusSampleItem.empty().copyWith(
            materialNumber: MaterialNumber('fake-number'),
            qty: MaterialQty(1),
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('fake-principal-code'),
              principalName: PrincipalName('fake-principal-name'),
            ),
            itemId: StringValue('fake-id'),
            type: MaterialInfoType.bonus(),
          ),
        ],
      );
      final cartProducts = [item];
      when(
        () => materialBannerStorageMock.get(
          materialNumber: item.getMaterialNumber.displayMatNo,
        ),
      ).thenAnswer(
        (invocation) async => EZReachBannerDto.fromDomain(
          EZReachBanner.empty(),
        ),
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeNormalMarket);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          searchKey: submitOrderResponseMock.salesDocument,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeNormalMarket,
        ),
      ).thenAnswer(
        (invocation) async => orderHistoryDetailsMock,
      );

      when(
        () => materialBannerStorageMock.clear(),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartProducts,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );

      verify(
        () => trackMixpanelEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: item.materialInfo.displayDescription,
            TrackingProps.productNumber: item.getMaterialNumber.displayMatNo,
            TrackingProps.productQty: item.quantity,
            TrackingProps.unitPrice: item.unitPrice,
            TrackingProps.grandTotal: item.finalPriceTotalWithTax,
            TrackingProps.productManufacturer:
                item.materialInfo.principalData.principalName.name,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: item.materialInfo.tag,
          },
        ),
      ).called(1);

      verify(
        () => trackClevertapEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: item.materialInfo.displayDescription,
            TrackingProps.productNumber: item.getMaterialNumber.displayMatNo,
            TrackingProps.productQty: item.quantity,
            TrackingProps.unitPrice: item.unitPrice,
            TrackingProps.grandTotal: item.finalPriceTotalWithTax,
            TrackingProps.productManufacturer:
                item.materialInfo.principalData.principalName.name,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: item.materialInfo.tag,
            TrackingProps.isOffer: item.materialInfo.type.typeDealBonus,
            TrackingProps.comment: item.materialInfo.remarks,
            TrackingProps.parentId: item.materialInfo.parentID,
            TrackingProps.type: item.materialInfo.type.getValue(),
            TrackingProps.promoStatus: item.promoStatus,
            TrackingProps.promoType: item.materialInfo.promoType,
            TrackingProps.contract: SubmitTenderContractDto.fromDomain(
              item.toSubmitMaterialInfo().contract,
            ).toJson(),
            TrackingProps.override: item.isMaterialItemOverride,
            TrackingProps.principalCode: item
                .materialInfo.principalData.principalCode
                .getOrDefaultValue(''),
            TrackingProps.unitOfMeasurement: item.salesOrgConfig.currency.code,
            TrackingProps.bonuses: item.bonusSampleItems
                .map(
                  (e) => BonusSampleItemDto.fromDomain(e).toJson(),
                )
                .toList(),
            TrackingProps.market: fakeNormalMarket,
          },
        ),
      ).called(1);

      expect(
        result.getOrElse(() => <OrderHistoryDetails>[]),
        equals([
          orderHistoryDetailsMock.copyWithMaterialInfo(
            priceAggregates: cartProducts,
          ),
        ]),
      );
    });

    test('Remote success in non-marketplace market with combo', () async {
      final comboItem = ComboMaterialItem.empty().copyWith(
        productId: MaterialNumber('fake-number'),
      );
      final item = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType.combo(),
        ),
        comboMaterials: [comboItem],
      );
      final cartProducts = [item];
      when(
        () => materialBannerStorageMock.get(
          materialNumber: comboItem.productId.displayMatNo,
        ),
      ).thenAnswer(
        (invocation) async => EZReachBannerDto.fromDomain(
          EZReachBanner.empty(),
        ),
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeNormalMarket);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          searchKey: submitOrderResponseMock.salesDocument,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeNormalMarket,
        ),
      ).thenAnswer(
        (invocation) async => orderHistoryDetailsMock,
      );

      when(
        () => materialBannerStorageMock.clear(),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartProducts,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );

      verify(
        () => trackMixpanelEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: comboItem.materialDescription,
            TrackingProps.productNumber: comboItem.productId.displayMatNo,
            TrackingProps.productQty: comboItem.quantity,
            TrackingProps.grandTotal: comboItem.discountedSubTotalWithTax,
            TrackingProps.unitPrice: comboItem.finalIndividualPrice,
            TrackingProps.productManufacturer:
                comboItem.principalData.principalName.name,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: comboItem.materialInfo.tag,
          },
        ),
      ).called(1);

      verify(
        () => trackClevertapEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: comboItem.materialDescription,
            TrackingProps.productNumber: comboItem.productId.displayMatNo,
            TrackingProps.productQty: comboItem.quantity,
            TrackingProps.unitPrice: comboItem.finalIndividualPrice,
            TrackingProps.grandTotal: comboItem.discountedSubTotalWithTax,
            TrackingProps.productManufacturer:
                comboItem.principalData.principalName.name,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: comboItem.materialInfo.tag,
            TrackingProps.isOffer: comboItem.materialInfo.type.typeDealBonus,
            TrackingProps.comment: comboItem.materialInfo.remarks,
            TrackingProps.parentId: comboItem.materialInfo.parentID,
            TrackingProps.type: comboItem.materialInfo.type.getValue(),
            TrackingProps.promoStatus: false,
            TrackingProps.promoType: comboItem.materialInfo.promoType,
            TrackingProps.contract: {},
            TrackingProps.override: false,
            TrackingProps.principalCode:
                comboItem.principalData.principalCode.getOrDefaultValue(''),
            TrackingProps.unitOfMeasurement: item.salesOrgConfig.currency.code,
            TrackingProps.bonuses: [],
            TrackingProps.market: fakeNormalMarket,
          },
        ),
      ).called(1);

      expect(
        result.getOrElse(() => <OrderHistoryDetails>[]),
        equals([
          orderHistoryDetailsMock.copyWithMaterialInfo(
            priceAggregates: cartProducts,
          ),
        ]),
      );
    });

    test('Remote success in non-marketplace market with bundle', () async {
      final bundleItem = MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number'),
      );
      final currentBundle = Bundle.empty().copyWith(materials: [bundleItem]);
      final item = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType.bundle(),
        ),
        bundle: currentBundle,
      );
      final cartProducts = [item];
      final materialNumber =
          '${currentBundle.bundleCode}_${bundleItem.materialNumber.displayMatNo}';
      when(
        () => materialBannerStorageMock.get(
          materialNumber: materialNumber,
        ),
      ).thenAnswer(
        (invocation) async => EZReachBannerDto.fromDomain(
          EZReachBanner.empty(),
        ),
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeNormalMarket);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          searchKey: submitOrderResponseMock.salesDocument,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeNormalMarket,
        ),
      ).thenAnswer(
        (invocation) async => orderHistoryDetailsMock,
      );

      when(
        () => materialBannerStorageMock.clear(),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartProducts,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );

      verify(
        () => trackMixpanelEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: bundleItem.displayDescription,
            TrackingProps.productNumber: bundleItem.materialNumber.displayMatNo,
            TrackingProps.productQty: bundleItem.quantity.intValue,
            TrackingProps.unitPrice: currentBundle.currentBundleInfo.rate,
            TrackingProps.grandTotal: currentBundle.currentBundleInfo.rate *
                bundleItem.quantity.intValue,
            TrackingProps.productManufacturer: bundleItem.getManufactured,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: bundleItem.tag,
          },
        ),
      ).called(1);

      verify(
        () => trackClevertapEvent(
          TrackingEvents.successfulOrderItem,
          props: {
            TrackingProps.orderNumber:
                orderHistoryDetailsMock.orderNumber.getOrDefaultValue(''),
            TrackingProps.productName: bundleItem.displayDescription,
            TrackingProps.productNumber: bundleItem.materialNumber.displayMatNo,
            TrackingProps.productQty: bundleItem.quantity.intValue,
            TrackingProps.unitPrice: currentBundle.currentBundleInfo.rate,
            TrackingProps.grandTotal: currentBundle.currentBundleInfo.rate *
                bundleItem.quantity.intValue,
            TrackingProps.productManufacturer: bundleItem.getManufactured,
            TrackingProps.fromBanner: false,
            TrackingProps.bannerId: '',
            TrackingProps.bannerTitle: '',
            TrackingProps.tag: bundleItem.tag,
            TrackingProps.isOffer: bundleItem.type.typeDealBonus,
            TrackingProps.comment: bundleItem.remarks,
            TrackingProps.parentId: currentBundle.bundleCode,
            TrackingProps.type: bundleItem.type.getValue(),
            TrackingProps.promoStatus: false,
            TrackingProps.promoType: bundleItem.promoType,
            TrackingProps.contract: {},
            TrackingProps.override: true,
            TrackingProps.principalCode:
                bundleItem.principalData.principalCode.getOrDefaultValue(''),
            TrackingProps.unitOfMeasurement: item.salesOrgConfig.currency.code,
            TrackingProps.bonuses: [],
            TrackingProps.market: fakeNormalMarket,
          },
        ),
      ).called(1);

      expect(
        result.getOrElse(() => <OrderHistoryDetails>[]),
        equals([
          orderHistoryDetailsMock.copyWithMaterialInfo(
            priceAggregates: cartProducts,
          ),
        ]),
      );
    });

    test('Remote fail in non-marketplace market', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorage.currentMarket()).thenReturn(fakeNormalMarket);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          searchKey: submitOrderResponseMock.salesDocument,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeNormalMarket,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts:
            cartMaterials.where((e) => !e.materialInfo.isMarketPlace).toList(),
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('Remote success in marketplace enabled market', () async {
      final orderHistoryList = await ViewByOrderDetailsLocalDataSource()
          .getOrderHistoryDetailsList();
      when(() => deviceStorage.currentMarket())
          .thenReturn(fakeMarketPlaceMarket);
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => materialBannerStorageMock.clear(),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetailsList(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          orderNumbers: submitOrderResponseMock.salesDocuments,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarketPlaceMarket,
        ),
      ).thenAnswer((_) async => orderHistoryList);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );

      for (final item in orderHistoryList) {
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.placeOrderSuccessOriginal,
            props: {
              if (item.processingStatus.isInQueue)
                TrackingProps.queueNumber:
                    item.orderNumber.getOrDefaultValue(''),
              TrackingProps.orderNumber: item.orderNumber.getOrDefaultValue(''),
              TrackingProps.grandTotal: item.totalValue,
              TrackingProps.totalQty: item.orderItemsCount,
              TrackingProps.requestDeliveryDate:
                  item.requestedDeliveryDate.dateOrNaString,
              TrackingProps.lineNumber:
                  item.orderHistoryDetailsOrderItem.length,
              TrackingProps.forceUpgradeVersionInfo:
                  upgrader.state.versionInfo.toString(),
              TrackingProps.forceUpgradeAlertTooSoon: upgrader.isTooSoon(),
              TrackingProps.forceUpgradeIgnoredAlert:
                  upgrader.alreadyIgnoredThisVersion(),
            },
          ),
        ).called(1);
      }

      expect(
        result.getOrElse(() => <OrderHistoryDetails>[]),
        equals(orderHistoryList),
      );
    });

    test('Remote fail in marketplace enabled market', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => deviceStorage.currentMarket())
          .thenReturn(fakeMarketPlaceMarket);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetailsList(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          orderNumbers: submitOrderResponseMock.salesDocuments,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
          market: fakeMarketPlaceMarket,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
        configs: fakeSalesOrganisationConfigs,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });
  });
}
