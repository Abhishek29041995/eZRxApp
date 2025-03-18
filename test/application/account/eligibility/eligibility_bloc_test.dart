import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/connectivity/repository/connectivity_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/repository/mixpanel_repository.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';

class ChatBotRepositoryMock extends Mock implements ChatBotRepository {}

class MixpanelRepoMock extends Mock implements MixpanelRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

class ConnectivityRepositoryMock extends Mock
    implements ConnectivityRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: [],
    ),
  ];
  final fakeBillToInfo =
      BillToInfo.empty().copyWith(billToCustomerCode: 'customer1234');
  final fakeCustomerInfo = CustomerCodeInfo.empty().copyWith(
    shipToInfos: [fakeShipToInfo],
    billToInfos: [fakeBillToInfo],
    customerCodeSoldTo: 'customer123',
  );
  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client_admin'),
    ),
    enableOrderType: true,
  );
  final fakeSaleOrg = fakeSGSalesOrganisation.copyWith(
    customerInfos: fakeSalesOrgCustomerInfos,
    salesOrg: SalesOrg('fake-1234'),
  );
  final fakeSaleOrgConfig = fakeSalesOrganisationConfigs.copyWith(
    salesOrg: SalesOrg('2601'),
    enableIRN: false,
    enableDefaultMD: false,
    disableProcessingStatus: false,
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableTaxClassification: false,
    enableVat: false,
    enableTaxAtTotalLevelOnly: false,
    enableZDP5: false,
    vatValue: 0,
    materialWithoutPrice: false,
    enableCollectiveNumber: false,
    enableFutureDeliveryDay: false,
    enableMobileNumber: false,
    enablePaymentTerms: false,
    enableReferenceNote: false,
    enableSpecialInstructions: false,
    futureDeliveryDay: FutureDeliveryDay(''),
    enableGMC: false,
    enableListPrice: false,
    priceOverride: false,
    disablePaymentTermsDisplay: false,
    disablePayment: false,
    disableDeliveryDate: false,
    enableBillTo: true,
    showPOAttachment: false,
    addOosMaterials: OosMaterial(false),
    expiryDateDisplay: false,
    hideStockDisplay: false,
    oosValue: OosValue(0),
    enableRemarks: false,
    enableOHPrice: true,
    poNumberRequired: PoNumberRequired(false),
    enableTaxDisplay: false,
    netPriceOverride: false,
    batchNumDisplay: false,
    displayOrderDiscount: false,
    minOrderAmount: 0,
    enableZDP8Override: false,
    disableReturnsAccessSR: false,
    disableReturnsAccess: false,
    enableGreenDelivery: false,
    greenDeliveryDelayInDays: 0,
    enableComboDeals: false,
    greenDeliveryUserRole: GreenDeliveryUserRole(0),
    comboDealsUserRole: ComboDealUserRole(0),
    enableGMN: false,
    displayItemTaxBreakdown: false,
    displaySubtotalTaxBreakdown: false,
    disableOverrideFieldCustomer: false,
    disableOverrideFieldSR: false,
    enablePOAttachmentRequired: false,
    hideCredit: false,
    allowReturnsOutsidePolicy: false,
  );
  final chatBotRepositoryMock = ChatBotRepositoryMock();
  final mixpanelRepositoryMock = MixpanelRepoMock();
  final customerCodeRepositoryMock = CustomerCodeRepositoryMock();
  final stockInfoRepositoryMock = StockInfoRepositoryMock();
  final connectivityRepositoryMock = ConnectivityRepositoryMock();

  final config = Config()..appFlavor = Flavor.mock;
  late CustomerInformation customerMockData;

  setUpAll(() async {
    customerMockData =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });

  setUp(() {
    when(() => stockInfoRepositoryMock.watchStockApiStatus())
        .thenAnswer((_) => Stream.fromIterable([]));

    when(() => connectivityRepositoryMock.initializeConnectivity())
        .thenAnswer((_) async => const Right(unit));

    when(() => connectivityRepositoryMock.watchNetworkAvailability())
        .thenAnswer((_) => Stream.fromIterable([]));
  });

  group('Eligibility Bloc', () {
    blocTest(
      'Eligibility Bloc Initial',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.initialized());
      },
      expect: () => [EligibilityState.initial()],
    );

    blocTest(
      'Eligibility Update',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(
          () => chatBotRepositoryMock.passPayloadToChatbot(
            customerCodeInfo: fakeCustomerInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSaleOrgConfig,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      seed: () => EligibilityState.initial().copyWith(
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.update(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSaleOrgConfig,
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest(
      'Eligibility Customer Code Selected',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        user: fakeUser,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.storeCustomerInfo(
            customerCode: fakeCustomerInfo.customerCodeSoldTo,
            shippingAddress:
                fakeCustomerInfo.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.selectedCustomerCode(
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeCustomerInfo.shipToInfos.first,
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          user: fakeUser,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeCustomerInfo.shipToInfos.first,
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ],
    );

    blocTest(
      'Eligibility Customer Code Selected failure',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        user: fakeUser,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.storeCustomerInfo(
            customerCode: fakeCustomerInfo.customerCodeSoldTo,
            shippingAddress:
                fakeCustomerInfo.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.selectedCustomerCode(
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeCustomerInfo.shipToInfos.first,
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          user: fakeUser,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.poorConnection())),
        ),
      ],
    );

    test('Check if state does not have DefaultShipToInfo', () {
      final state = EligibilityState.initial();
      expect(state.haveShipTo, false);
      expect(state.shipToInfo, ShipToInfo.empty());
    });

    blocTest(
      'loadStoredCustomerCode - Customer Code Storage returns success and Get Customer Code returns success with populated list',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.storeCustomerInfo(
            customerCode:
                customerMockData.soldToInformation.first.customerCodeSoldTo,
            shippingAddress: customerMockData
                .soldToInformation.first.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));

        when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
            .thenAnswer(
          (_) async => const Right(
            AccountSelector(
              salesOrg: 'mockSalesOrg',
              customerCode: 'mockCustomerCode',
              shippingAddress: 'mockShippingAddress',
            ),
          ),
        );

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('mockShippingAddress'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(customerMockData),
        );

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search(
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          const EligibilityEvent.loadStoredCustomerCode(),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: true,
          preSelectShipTo: false,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: false,
          customerCodeInfo: customerMockData.soldToInformation.first,
          preSelectShipTo: true,
          shipToInfo:
              customerMockData.soldToInformation.first.shipToInfos.first,
        ),
      ],
    );

    blocTest(
      'loadStoredCustomerCode - Customer Code Storage returns empty',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
      ),
      setUp: () {
        when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
            .thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            hideCustomer: false,
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: 10,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (bloc) => bloc.add(const EligibilityEvent.loadStoredCustomerCode()),
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: true,
          preSelectShipTo: false,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: false,
          preSelectShipTo: false,
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ],
    );

    blocTest(
      'loadStoredCustomerCode - Customer Code Storage returns success and Get Customer Code returns failure',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
      ),
      setUp: () {
        when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
            .thenAnswer(
          (_) async => const Right(
            AccountSelector(
              salesOrg: 'mockSalesOrg',
              customerCode: 'mockCustomerCode',
              shippingAddress: 'mockShippingAddress',
            ),
          ),
        );

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.search('mockShippingAddress'),
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: config.pageSize,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            hideCustomer: false,
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: 10,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (bloc) => bloc.add(const EligibilityEvent.loadStoredCustomerCode()),
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: true,
          preSelectShipTo: false,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: false,
          preSelectShipTo: false,
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ],
    );

    blocTest(
      'Eligibility Bloc watch connecivity with network unavailable',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => connectivityRepositoryMock.watchNetworkAvailability())
            .thenAnswer((_) => Stream.fromIterable([false]));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.watchConnectivityStatus());
      },
      expect: () => [
        EligibilityState.initial().copyWith(isNetworkAvailable: false),
      ],
    );

    blocTest(
      'Eligibility Bloc watch connecivity with network available',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => connectivityRepositoryMock.watchNetworkAvailability())
            .thenAnswer((_) => Stream.fromIterable([true]));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.watchConnectivityStatus());
      },
      expect: () => [
        EligibilityState.initial(),
      ],
    );

    blocTest(
      'Eligibility Bloc watch connecivity with network available and then unavailable',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => connectivityRepositoryMock.watchNetworkAvailability())
            .thenAnswer((_) => Stream.fromIterable([true, false]));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.watchConnectivityStatus());
      },
      expect: () => [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(isNetworkAvailable: false),
      ],
    );

    blocTest(
      'Eligibility Bloc watch connecivity with network available and then unavailable then available',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => connectivityRepositoryMock.watchNetworkAvailability())
            .thenAnswer((_) => Stream.fromIterable([true, false, true]));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.watchConnectivityStatus());
      },
      expect: () => [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(isNetworkAvailable: false),
        EligibilityState.initial(),
      ],
    );

    blocTest(
      'Update customer config event',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        EligibilityEvent.updatedCustomerCodeConfig(
          customerCodeConfig:
              CustomerCodeConfig.empty().copyWith(customerCode: 'fake-code'),
        ),
      ),
      expect: () => [
        EligibilityState.initial().copyWith(
          customerCodeConfig:
              CustomerCodeConfig.empty().copyWith(customerCode: 'fake-code'),
        ),
      ],
    );

    blocTest(
      'Update stock availbility event',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        const EligibilityEvent.updateStockInfoAvailability(
          isStockInfoNotAvailable: true,
        ),
      ),
      expect: () => [
        EligibilityState.initial().copyWith(isStockInfoNotAvailable: true),
      ],
    );

    blocTest(
      'Watch stock availbility event',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => stockInfoRepositoryMock.watchStockApiStatus())
            .thenAnswer((_) => Stream.fromIterable([false]));
      },
      act: (bloc) => bloc.add(const EligibilityEvent.watchStockApiStatus()),
      expect: () => [
        EligibilityState.initial().copyWith(isStockInfoNotAvailable: false),
      ],
    );

    blocTest(
      'Watch connectivity event when initialize failure',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      setUp: () {
        when(() => connectivityRepositoryMock.initializeConnectivity())
            .thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (bloc) => bloc.add(const EligibilityEvent.watchConnectivityStatus()),
      expect: () => [
        EligibilityState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.poorConnection())),
        ),
      ],
    );

    blocTest(
      'FetchAndPreSelectCustomerCode event when get customer code failure',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        user: fakeUser,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            hideCustomer: false,
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: 10,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (bloc) =>
          bloc.add(const EligibilityEvent.fetchAndPreSelectCustomerCode()),
      expect: () => [
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          user: fakeUser,
          isLoadingCustomerCode: false,
          preSelectShipTo: false,
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ],
    );

    blocTest(
      'FetchAndPreSelectCustomerCode event when get customer code success and there is 1 ship to',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
        stockRepository: stockInfoRepositoryMock,
        connectivityRepository: connectivityRepositoryMock,
      ),
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        user: fakeUser,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            hideCustomer: false,
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: 10,
          ),
        ).thenAnswer(
          (_) async => Right(
            customerMockData.copyWith(
              soldToInformation: [
                customerMockData.soldToInformation.first.copyWith(
                  shipToInfos: [
                    customerMockData.soldToInformation.first.shipToInfos.first,
                  ],
                ),
              ],
            ),
          ),
        );
      },
      act: (bloc) =>
          bloc.add(const EligibilityEvent.fetchAndPreSelectCustomerCode()),
      expect: () => [
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          user: fakeUser,
          isLoadingCustomerCode: false,
          preSelectShipTo: true,
          shipToInfo:
              customerMockData.soldToInformation.first.shipToInfos.first,
          customerCodeInfo: customerMockData.soldToInformation.first.copyWith(
            shipToInfos: [
              customerMockData.soldToInformation.first.shipToInfos.first,
            ],
          ),
        ),
      ],
    );
  });

  blocTest(
    'loadStoredCustomerCode - Customer Code Storage returns success and offset is sent as 0 to fetch customerCodeList',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
      stockRepository: stockInfoRepositoryMock,
      connectivityRepository: connectivityRepositoryMock,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: 'mockCustomerCode',
            shippingAddress: 'mockShippingAddress',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          searchKey: SearchKey.search('mockShippingAddress'),
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: config.pageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.first,
        preSelectShipTo: true,
        shipToInfo: customerMockData.soldToInformation.first.shipToInfos.first,
      ),
    ],
  );

  blocTest(
    'loadStoredCustomerCode - last saved customer code is not at the first index of customerCodeInfoList',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
      stockRepository: stockInfoRepositoryMock,
      connectivityRepository: connectivityRepositoryMock,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: '0000002011',
            shippingAddress: 'mockShippingAddress',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          searchKey: SearchKey.search('mockShippingAddress'),
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: config.pageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.firstWhere(
          (element) => element.customerCodeSoldTo == '0000002011',
        ),
        preSelectShipTo: true,
        shipToInfo: customerMockData.soldToInformation.first.shipToInfos.first,
      ),
    ],
  );

  blocTest(
    'loadStoredCustomerCode - last saved customer code is not at the first index of customerCodeInfoList && shippingAddress Equals',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
      stockRepository: stockInfoRepositoryMock,
      connectivityRepository: connectivityRepositoryMock,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: '0000002011',
            shippingAddress: '0000002011',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          searchKey: SearchKey.search('0000002011'),
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: config.pageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.firstWhere(
          (element) => element.customerCodeSoldTo == '0000002011',
        ),
        preSelectShipTo: true,
        shipToInfo:
            customerMockData.soldToInformation.first.shipToInfos.firstWhere(
          (element) => element.shipToCustomerCode == '0000002011',
        ),
      ),
    ],
  );

  test(
    'Check pnpValueMaterial for eligibility state returns empty string if user role type is not SalesRep',
    () {
      final eligibilityState =
          EligibilityState.initial().copyWith(user: fakeUser);
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, '');
    },
  );

  test(
    'Check pnpValueMaterial for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, 'include');
    },
  );

  test(
    'Check pnpValueMaterial for eligibility state returns include if user role type is not SalesRep and isOrderTypeEnable is true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2900'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, 'include');
    },
  );

  test(
      'Check pnpValueCovidMaterial for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
      () {
    final eligibilityState =
        EligibilityState.initial().copyWith(user: fakeUser);
    final pickAndPackValue = eligibilityState.getPNPValueCovidMaterial;
    expect(pickAndPackValue, '');
  });

  test(
    'Check pnpValueCovidMaterial for eligibility state returns `only` if user role type is SalesRep and salesOrg is not SG',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2900'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueCovidMaterial;
      expect(pickAndPackValue, 'only');
    },
  );

  test(
      'Check pnpValueBonusMaterialSearch for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
      () {
    final eligibilityState =
        EligibilityState.initial().copyWith(user: fakeUser);
    final pickAndPackValue = eligibilityState.getPNPValueBonusMaterialSearch;
    expect(pickAndPackValue, '');
  });

  test(
    'Check pnpValueBonusMaterialSearch for eligibility state returns `include` if user role type is SalesRep and salesOrg is SG or MY',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      final pickAndPackValueSG =
          eligibilityState.getPNPValueBonusMaterialSearch;
      expect(pickAndPackValueSG, 'include');

      final newEligibilityState = eligibilityState.copyWith(
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );

      final pickAndPackValueMY =
          newEligibilityState.getPNPValueBonusMaterialSearch;
      expect(pickAndPackValueMY, 'include');
    },
  );

  test(
    'eligibility state isBillToInfo should return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeIDSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, true);
    },
  );

  test(
    'eligibility state validateOutOfStockValue should return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final isOosValueZero = eligibilityState.validateOutOfStockValue;
      expect(isOosValueZero, true);
    },
  );

  test(
    'eligibility state doNotAllowOutOfStockMaterials should return false for sales rep user and addOosMaterials as true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig.copyWith(
          addOosMaterials: OosMaterial(true),
        ),
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final doNotAllowOutOfStockMaterials =
          eligibilityState.doNotAllowOutOfStockMaterials;
      expect(doNotAllowOutOfStockMaterials, false);
    },
  );

  test(
    'eligibility state displayOrderDiscount should return false',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final displayOrderDiscount =
          eligibilityState.salesOrgConfigs.displayOrderDiscount;
      expect(displayOrderDiscount, false);
    },
  );

  test(
    'eligibility state enableRemarks return false',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final enableRemarks = eligibilityState.salesOrgConfigs.enableRemarks;
      expect(enableRemarks, false);
    },
  );

  test(
    'eligibility state isBillToInfo should return false when customerCodeSoldTo and billToCustomerCode is same',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerCodeSoldTo: 'customer1234'),
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, false);
    },
  );

  test(
    'eligibility state isBillToInfo should return false when billToInfos is empty',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo.copyWith(
          billToInfos: [],
        ),
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, false);
    },
  );

  test(
    'disablePaymentTermsDisplayForCustomer',
    () {
      var eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      );

      expect(eligibilityState.disablePaymentTermsDisplayForCustomer, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
      );
      expect(eligibilityState.disablePaymentTermsDisplayForCustomer, false);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('root_admin')),
        ),
      );
      expect(eligibilityState.disablePaymentTermsDisplayForCustomer, false);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('root_admin')),
        ),
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      );
      expect(eligibilityState.disablePaymentTermsDisplayForCustomer, false);
    },
  );

  test(
    'isPaymentEnable',
    () {
      var eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin.copyWith(disablePaymentAccess: true),
        salesOrgConfigs: fakeKHSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientUser.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeSalesRepUser.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          paymentTerm: PaymentTermCode('C024'),
        ),
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          paymentTerm: PaymentTermCode('A007'),
        ),
      );

      expect(eligibilityState.isPaymentEnabled, false);
    },
  );

  group('Customer config - ', () {
    test(
      'isPaymentEnable is true if disablePayments is false',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            disablePayment: false,
          ),
          customerCodeConfig: CustomerCodeConfig.empty().copyWith(
            disablePayments: false,
          ),
          user: fakeClientUser.copyWith(
            disablePaymentAccess: false,
          ),
        );

        expect(eligibilityState.isPaymentEnabled, true);
      },
    );

    test(
      'isPaymentEnable is false if disablePayments is true',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            disablePayment: false,
          ),
          customerCodeConfig: CustomerCodeConfig.empty().copyWith(
            disablePayments: true,
          ),
          user: fakeClientUser,
        );

        expect(eligibilityState.isPaymentEnabled, false);
      },
    );
  });

  test(
    'disable payment for rootadmin when disablePayment on',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);
    },
  );
  test(
    'isSalesRepAndBonusEligible',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          hasBonusOverride: true,
        ),
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );

      expect(eligibilityState.isSalesRepAndBonusEligible, true);
    },
  );

  test(
    'isBundleMaterialEnable',
    () {
      final eligibilityState = EligibilityState.initial();

      expect(eligibilityState.isBundleMaterialEnable, true);
    },
  );

  test(
    'isCovidMaterialEnable for sg market',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerAttr7: CustomerAttr7('ZEV')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for sg market for root admin',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrganisation: fakeSaleOrg,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerAttr7: CustomerAttr7('ZEV')),
      );

      expect(eligibilityState.canOrderCovidMaterial, false);
    },
  );
  test(
    'isCovidMaterialEnable for PH market for VR',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VR')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for PH market for VP',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VP')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for PH market',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VR')),
      );

      expect(eligibilityState.canOrderCovidMaterial, false);
    },
  );

  group(
    'Combo Deal Eligible -',
    () {
      test(
        'non eligible when salesConfig disable combo deal',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
              enableComboDeals: false,
            ),
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );

      test(
        'non eligible when customerCode combo deal eligibility return false',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
              enableComboDeals: true,
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: false,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );

      test(
        'eligible when salesOrg enable combo deal, customerCode eligible and combo deal role is all user',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(1),
            ),
            customerCodeInfo: fakeCustomerInfo.copyWith(
              salesDeals: [SalesDealNumber('0000000000')],
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, true);
        },
      );

      test(
        'eligible when user is non sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is customer only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(2),
            ),
            customerCodeInfo: fakeCustomerInfo.copyWith(
              salesDeals: [SalesDealNumber('0000000000')],
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, true);
        },
      );

      test(
        'non eligible when user is non sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is sale rep only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(3),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: true,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );

      test(
        'eligible when user is sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is sales rep only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeSalesRepUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(3),
            ),
            customerCodeInfo: fakeCustomerInfo.copyWith(
              salesDeals: [SalesDealNumber('0000000000')],
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, true);
        },
      );

      test(
        'Customer Code Account Suspended',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('z1'),
            ),
          );

          expect(eligibilityState.isAccountSuspended, true);
        },
      );
      test(
        'ShipsTo Code Account Suspended',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              status: Status('z1'),
            ),
          );

          expect(eligibilityState.isAccountSuspended, true);
        },
      );
    },
  );

  group('Override ', () {
    test(
      'bonus override none sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(priceOverride: true),
        );
        expect(eligibilityState.isBonusOverrideEnable, true);
      },
    );

    test(
      'bonus override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            hasBonusOverride: true,
          ),
        );

        expect(eligibilityState.isBonusOverrideEnable, true);
      },
    );

    test('isBonusSampleItemVisible getter', () {
      expect(
        EligibilityState.initial()
            .copyWith(
              user:
                  fakeClient.copyWith(selectedOrderType: DocumentType('fake')),
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .isBonusSampleItemVisible,
        true,
      );

      expect(
        EligibilityState.initial()
            .copyWith(
              user:
                  fakeClient.copyWith(selectedOrderType: DocumentType('zpfb')),
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .isBonusSampleItemVisible,
        false,
      );

      expect(
        EligibilityState.initial()
            .copyWith(
              user:
                  fakeClient.copyWith(selectedOrderType: DocumentType('fake')),
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            )
            .isBonusSampleItemVisible,
        false,
      );
    });

    test(
      'ZDP8Override Override',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(enableZDP8Override: true),
        );

        expect(eligibilityState.isZDP8Override, true);
      },
    );
    test(
      'isPriceOverrideEnable Override none sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(priceOverride: true),
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );

    test(
      'isPriceOverrideEnable Override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            hasPriceOverride: true,
          ),
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );

    test('isCounterOfferVisible getter', () {
      expect(
        EligibilityState.initial()
            .copyWith(
              user: fakeClientUser,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .isCounterOfferVisible,
        true,
      );

      expect(
        EligibilityState.initial()
            .copyWith(
              user: fakeSalesRepUser.copyWith(
                hasBonusOverride: true,
                selectedOrderType: DocumentType('fake'),
              ),
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .isCounterOfferVisible,
        false,
      );
    });
  });

  group('Return', () {
    test(
      'Return disable for any user with customer config code return disable true',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          customerCodeConfig: CustomerCodeConfig.empty().copyWith(
            disableReturns: true,
          ),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
    test(
      'Return disable for any user with disableReturns',
      () {
        final eligibilityState = EligibilityState.initial()
            .copyWith(user: fakeUser.copyWith(disableReturns: true));

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
    test(
      'Return disable for sales rep user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccessSR: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );

    test(
      'Return disable for customer user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
        );

        expect(eligibilityState.isReturnsEnable, true);
      },
    );

    test(
      'Return enable',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccess: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );

    test(
      'disable returns access enable for rootadmin account',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeRootAdminUser,
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccess: true),
        );

        expect(eligibilityState.isReturnsEnable, true);
      },
    );
  });

  group('showGreenDeliveryBox', () {
    test(
      'showGreenDeliveryBox salesOrgConfigs disable',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: false,
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, false);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole all user',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(1),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole customer',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(2),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole sales rep',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(3),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'outOfStockProductStatus- Out of stock Test',
      () {
        expect(
          EligibilityState.initial()
              .copyWith(user: fakeSalesRepUser)
              .outOfStockProductStatus,
          StatusType('Out of stock'),
        );

        expect(
          EligibilityState.initial()
              .copyWith(user: fakeClient)
              .outOfStockProductStatus,
          StatusType('Out of stock'),
        );
      },
    );

    test(
      'outOfStockProductStatus- OOS-Preorder',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeSalesRepUser,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        );

        expect(
          eligibilityState.outOfStockProductStatus,
          StatusType('OOS-Preorder'),
        );
      },
    );
  });

  group('Marketplace', () {
    group('isMarketPlaceEnabled getter', () {
      test('return false when sales org disables marketplace', () {
        final state = EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeSGSalesOrgConfigs);

        expect(state.isMarketPlaceEnabled, false);
      });

      test('return false when region disables marketplace', () {
        final state = EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        );

        expect(state.isMarketPlaceEnabled, false);
      });

      test('return false when role can not access marketplace', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeInternalSalesRepUser,
        );

        expect(state.isMarketPlaceEnabled, false);
      });

      test('return true when role can access marketplace', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser,
        );

        expect(state.isMarketPlaceEnabled, true);
      });
    });

    group('showMarketPlaceProduct getter', () {
      test('return false when marketplace disabled', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeInternalSalesRepUser,
        );

        expect(state.marketPlaceEligible, false);
      });

      test('return false when marketplace is enable + user not accept TnC', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser,
        );

        expect(state.marketPlaceEligible, false);
      });

      test('return true when marketplace is enable + user accept TnC', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUserAccessMarketPlace,
        );

        expect(state.marketPlaceEligible, true);
      });
    });

    group('showMarketPlaceTnc getter', () {
      test('return false when user have not accepted normal TnC', () {
        final state = EligibilityState.initial().copyWith(
          user: fakeClientUser,
        );

        expect(state.showMarketPlaceTnc, false);
      });

      test('return false when accepted normal TnC and marketplace disable', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeExternalSalesRepUser.copyWith(acceptPrivacyPolicy: true),
        );

        expect(state.showMarketPlaceTnc, false);
      });

      test(
          'return false when accepted normal TnC + marketplace enable + acceptance status is accepted/rejected',
          () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUserAccessMarketPlace.copyWith(
            acceptPrivacyPolicy: true,
          ),
        );

        expect(
          state.copyWith
              .user(acceptMPTC: MarketPlaceTnCAcceptance.accept())
              .showMarketPlaceTnc,
          false,
        );

        expect(
          state.copyWith
              .user(acceptMPTC: MarketPlaceTnCAcceptance.reject())
              .showMarketPlaceTnc,
          false,
        );

        expect(
          state.copyWith
              .user(acceptMPTC: MarketPlaceTnCAcceptance(''))
              .showMarketPlaceTnc,
          false,
        );
      });

      test(
          'return false when accepted normal TnC + marketplace enable + acceptance status is unknown',
          () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUserAccessMarketPlace.copyWith(
            acceptPrivacyPolicy: true,
          ),
        );

        expect(
          state.copyWith
              .user(acceptMPTC: MarketPlaceTnCAcceptance.unknown())
              .showMarketPlaceTnc,
          true,
        );
      });
    });

    group('showMarketPlace payment getter', () {
      test('return false when user does not accept TnC', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          user: fakeClient,
        );

        expect(state.marketPlacePaymentEligible, false);
      });

      test('return false when customer code does not enable marketplace', () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerInfo,
          user: fakeClientUserAccessMarketPlace,
        );

        expect(state.marketPlacePaymentEligible, false);
      });

      test(
          'return true when customer code enables marketplace + user accept TnC',
          () {
        final state = EligibilityState.initial().copyWith(
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          user: fakeClientUserAccessMarketPlace,
        );

        expect(state.marketPlacePaymentEligible, true);
      });
    });

    test('productManufacturerFilterTitle getter', () {
      expect(
        EligibilityState.initial()
            .copyWith(
              customerCodeInfo: fakeMarketPlaceCustomerCode,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              user: fakeClientUserAccessMarketPlace,
            )
            .productManufacturerFilterTitle,
        'Manufacturers & Sellers',
      );

      expect(
        EligibilityState.initial()
            .copyWith(
              customerCodeInfo: fakeMarketPlaceCustomerCode,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .productManufacturerFilterTitle,
        'Manufacturer',
      );
    });

    test('atLeastOneStockItemInStockMessage getter', () {
      expect(
        EligibilityState.initial()
            .copyWith(
              customerCodeInfo: fakeMarketPlaceCustomerCode,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              user: fakeClientUserAccessMarketPlace,
            )
            .atLeastOneStockItemInStockMessage,
        'To proceed, at least one (1) ZP or MP item must be in stock.',
      );

      expect(
        EligibilityState.initial()
            .copyWith(
              customerCodeInfo: fakeMarketPlaceCustomerCode,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            )
            .atLeastOneStockItemInStockMessage,
        'To proceed, at least one (1) item must be in stock.',
      );
    });
  });

  test('isRefresh function', () {
    // When customer code changed
    expect(
      EligibilityState.initial().isRefreshed(
        EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
      ),
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(isLoadingCustomerCode: true)
          .isRefreshed(
            EligibilityState.initial(),
          ),
      false,
    );

    // When Ship to code changed
    expect(
      EligibilityState.initial().isRefreshed(
        EligibilityState.initial().copyWith(shipToInfo: fakeShipToInfo),
      ),
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(shipToInfo: fakeShipToInfo)
          .isRefreshed(EligibilityState.initial()),
      true,
    );

    //When Language changed
    expect(
      EligibilityState.initial().copyWith(user: fakeClientUser).isRefreshed(
            EligibilityState.initial().copyWith(user: fakeClient),
          ),
      false,
    );
  });

  test('paymentHomeItemWidthRatio getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakePHSalesOrganisation)
          .paymentHomeItemWidthRatio,
      0.45,
    );

    expect(
      EligibilityState.initial()
          .copyWith(salesOrgConfigs: fakeIDSalesOrgConfigs)
          .paymentHomeItemWidthRatio,
      0.45,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .paymentHomeItemWidthRatio,
      0.3,
    );
  });

  test('customerBlockOrSuspended getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakeIDSalesOrganisation)
          .copyWith
          .shipToInfo(customerBlock: CustomerBlock('blocked'))
          .customerBlockOrSuspended,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakeIDSalesOrganisation)
          .copyWith
          .shipToInfo(customerBlock: CustomerBlock(''))
          .customerBlockOrSuspended,
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakeMYSalesOrganisation)
          .copyWith
          .shipToInfo(customerBlock: CustomerBlock('blocked'))
          .customerBlockOrSuspended,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakeMYSalesOrganisation)
          .copyWith
          .shipToInfo(status: Status('01'))
          .customerBlockOrSuspended,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(salesOrganisation: fakeMYSalesOrganisation)
          .copyWith
          .shipToInfo(status: Status(''))
          .customerBlockOrSuspended,
      false,
    );
  });

  blocTest(
    'Test RegisterChatBot mixpanel registerSuperProps success',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
      stockRepository: stockInfoRepositoryMock,
      connectivityRepository: connectivityRepositoryMock,
    ),
    setUp: () {
      when(
        () => chatBotRepositoryMock.passPayloadToChatbot(
          customerCodeInfo: fakeCustomerInfo,
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
          salesOrganisationConfigs: fakeSaleOrgConfig,
        ),
      ).thenAnswer(
        (invocation) async => const Right(true),
      );

      when(
        () => mixpanelRepositoryMock.registerSuperProps(
          customerCodeInfo: fakeCustomerInfo,
          salesOrg: fakeSaleOrg.salesOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
        ),
      ).thenAnswer(
        (invocation) async => const Right(true),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      salesOrgConfigs: fakeSaleOrgConfig,
      customerCodeInfo: fakeCustomerInfo,
      shipToInfo: fakeShipToInfo,
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.registerChatBot(),
      );
    },
    expect: () => [],
  );

  blocTest(
    'Test RegisterChatBot mixpanel registerSuperProps failure',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
      stockRepository: stockInfoRepositoryMock,
      connectivityRepository: connectivityRepositoryMock,
    ),
    setUp: () {
      when(
        () => chatBotRepositoryMock.passPayloadToChatbot(
          customerCodeInfo: fakeCustomerInfo,
          salesOrganisation: fakeSaleOrg,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
          salesOrganisationConfigs: fakeSaleOrgConfig,
        ),
      ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));

      when(
        () => mixpanelRepositoryMock.registerSuperProps(
          customerCodeInfo: fakeCustomerInfo,
          salesOrg: fakeSaleOrg.salesOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
        ),
      ).thenAnswer((_) async => const Right(true));
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      salesOrgConfigs: fakeSaleOrgConfig,
      customerCodeInfo: fakeCustomerInfo,
      shipToInfo: fakeShipToInfo,
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.registerChatBot(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
        failureOrSuccessOption:
            optionOf(const Left(ApiFailure.poorConnection())),
      ),
    ],
  );

  test('haveShipTo getter', () {
    expect(EligibilityState.initial().haveShipTo, false);
    expect(
      EligibilityState.initial()
          .copyWith(shipToInfo: fakeShipToInfo)
          .haveShipTo,
      true,
    );
  });

  test('displayShipToCustomerCode getter', () {
    expect(EligibilityState.initial().displayShipToCustomerCode, 'NA');
    expect(
      EligibilityState.initial()
          .copyWith(shipToInfo: fakeShipToInfo)
          .displayShipToCustomerCode,
      '123',
    );
  });

  test('haveCustomerCodeInfo getter', () {
    expect(EligibilityState.initial().haveCustomerCodeInfo, false);
    expect(
      EligibilityState.initial()
          .copyWith(customerCodeInfo: fakeCustomerInfo)
          .haveCustomerCodeInfo,
      true,
    );
  });

  test('displayShipTo getter', () {
    expect(EligibilityState.initial().displayShipTo, 'NA');
    expect(
      EligibilityState.initial()
          .copyWith(
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeShipToInfo,
          )
          .displayShipTo,
      'fake-name1 fake-name2 fake-name3 fake-name4  ',
    );
  });

  test('isMYExternalSalesRepUser getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeClient,
          )
          .isMYExternalSalesRepUser,
      false,
    );
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            user: fakeExternalSalesRepUser,
          )
          .isMYExternalSalesRepUser,
      false,
    );
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeExternalSalesRepUser,
          )
          .isMYExternalSalesRepUser,
      true,
    );
  });

  test('showMaterialDescInMandarin getter', () {
    final mandarinPerferedUser = fakeUser.copyWith(
      preferredLanguage: Language.mandarin(),
    );
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
            user: mandarinPerferedUser,
          )
          .showMaterialDescInMandarin,
      true,
    );
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser,
          )
          .showMaterialDescInMandarin,
      false,
    );
    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            user: mandarinPerferedUser,
          )
          .showMaterialDescInMandarin,
      false,
    );
  });

  test('isZDP5eligible getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(salesOrgConfigs: fakeVNSalesOrgConfigs)
          .isZDP5eligible,
      true,
    );
    expect(
      EligibilityState.initial()
          .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs)
          .isZDP5eligible,
      false,
    );
  });

  test('isNotificationSettingsEnable getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClient.copyWith(
              disableCreateOrder: true,
              disableReturns: true,
            ),
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          )
          .isNotificationSettingsEnable,
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClient.copyWith(
              disableCreateOrder: true,
            ),
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          )
          .isNotificationSettingsEnable,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClient,
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          )
          .isNotificationSettingsEnable,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClient.copyWith(
              disableCreateOrder: true,
              disableReturns: true,
            ),
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .isNotificationSettingsEnable,
      true,
    );
  });

  test('isReturnsOverrideEnable getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
              disableOverrideFieldCustomer: true,
            ),
          )
          .isReturnsOverrideEnable,
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeSalesRepUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
              disableOverrideFieldSR: true,
            ),
          )
          .isReturnsOverrideEnable,
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .isReturnsOverrideEnable,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeSalesRepUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .isReturnsOverrideEnable,
      true,
    );
  });

  test('isGimmickMaterialEnabled getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeSalesRepUser,
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          )
          .gimmickMaterialEnabled,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeSalesRepUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .gimmickMaterialEnabled,
      false,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeSalesRepUser,
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          )
          .gimmickMaterialEnabled,
      true,
    );
  });

  test('disableCreateOrder getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(user: fakeClientUser.copyWith(disableCreateOrder: true))
          .disableCreateOrder,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith
          .shipToInfo(customerBlock: CustomerBlock('blocked'))
          .disableCreateOrder,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith
          .customerCodeInfo(status: Status('EDI'))
          .disableCreateOrder,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeClientUser,
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerInfo,
          )
          .disableCreateOrder,
      false,
    );
  });

  test('isOrderTypeEnableAndSpecialOrderType getter', () {
    expect(
      EligibilityState.initial()
          .copyWith(
            user: fakeExternalSalesRepUser.copyWith(
              selectedOrderType: DocumentType('fake'),
            ),
          )
          .isOrderTypeEnableAndSpecialOrderType,
      true,
    );

    expect(
      EligibilityState.initial()
          .copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeSalesRepUser.copyWith(
              selectedOrderType: DocumentType('zpfb'),
            ),
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          )
          .isOrderTypeEnableAndSpecialOrderType,
      false,
    );
  });
}
