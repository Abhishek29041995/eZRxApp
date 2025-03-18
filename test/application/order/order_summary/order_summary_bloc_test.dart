import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  late OrderRepository orderRepositoryMock;
  late StockInfoRepository stockInfoRepositoryMock;
  final submitOrderResponse = SubmitOrderResponse.empty().copyWith(
    salesDocument: 'fake-sales-document',
    messages: [
      SubmitOrderResponseMessage.empty().copyWith(
        message: 'NO MSG',
        type: 'D',
      ),
    ],
  );
  final orderHistoryDetails = OrderHistoryDetails.empty().copyWith(
    orderValue: 100.0,
    totalTax: 100.0,
  );
  final seedState = OrderSummaryState.initial().copyWith(
    user: fakeRootAdminUser.copyWith(email: EmailAddress('awsib@gmail.com')),
    customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
    shipToInfo: fakeShipToInfo,
    salesOrgConfig: fakePHSalesOrgConfigs,
    salesOrganisation: fakePHSalesOrganisation,
  );
  final stockInfoList = <MaterialStockInfo>[MaterialStockInfo.empty()];

  group('Test Order Summary Bloc', () {
    setUp(
      () {
        orderRepositoryMock = OrderRepositoryMock();
        stockInfoRepositoryMock = StockInfoRepositoryMock();
      },
    );

    blocTest(
      ' => Initialized event test',
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.initialized(
            user: seedState.user,
            shipToInfo: seedState.shipToInfo,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrgConfig: seedState.salesOrgConfig,
            salesOrganisation: seedState.salesOrganisation,
          ),
        );
      },
      expect: () => [seedState],
    );

    blocTest(
      ' => Submit order success',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: seedState.shipToInfo,
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: fakePHSalesOrganisation,
            data: DeliveryInfoData.empty(),
            configs: seedState.salesOrgConfig,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            grandTotal: 100.0,
            orderValue: 100.0,
            totalTax: 100.0,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        ).thenAnswer((value) async => Right(submitOrderResponse));
      },
      seed: () => seedState,
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            grandTotal: 100.0,
            data: DeliveryInfoData.empty(),
            orderValue: 100.0,
            totalTax: 100.0,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          isSubmitting: true,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
        ),
      ],
    );

    blocTest(
      ' => Submit order failure',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: seedState.shipToInfo,
            user: seedState.user,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            grandTotal: 100.0,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: seedState.salesOrganisation,
            data: DeliveryInfoData.empty(),
            configs: seedState.salesOrgConfig,
            orderValue: 100.0,
            totalTax: 100,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState,
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            grandTotal: 100.0,
            data: DeliveryInfoData.empty(),
            orderValue: 100.0,
            totalTax: 100,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          isSubmitting: true,
        ),
        seedState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
        ),
      ],
    );

    blocTest(
      ' => Submit order success with combo type',
      setUp: () {
        when(
          () => orderRepositoryMock.submitOrder(
            shipToInfo: seedState.shipToInfo,
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: seedState.salesOrganisation,
            data: DeliveryInfoData.empty(),
            configs: seedState.salesOrgConfig,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
                comboMaterials: [
                  ComboMaterialItem.empty().copyWith(
                    comboDealType: 'K1',
                    quantity: 2,
                    listPrice: 15,
                    mandatory: true,
                    minQty: 2,
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
            ],
            grandTotal: 18.0,
            orderValue: 30.0,
            totalTax: 0.0,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        ).thenAnswer((value) async => Right(submitOrderResponse));
      },
      seed: () => seedState,
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.submitOrder(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
                comboMaterials: [
                  ComboMaterialItem.empty().copyWith(
                    comboDealType: 'K1',
                    quantity: 2,
                    listPrice: 15,
                    mandatory: true,
                    minQty: 2,
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
                      remarks: 'fake-remark',
                      type: MaterialInfoType.combo(),
                      promoType: 'fake-promo-type',
                    ),
                  ),
                ],
              ),
            ],
            data: DeliveryInfoData.empty(),
            grandTotal: 18.0,
            orderValue: 30.0,
            totalTax: 0.0,
            aplSmallOrderFee: 12500.0,
            mpSmallOrderFee: 13,
            zpSmallOrderFee: 14.5,
            salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
            deliveryOption: 'fake-option',
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          isSubmitting: true,
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
        ),
      ],
    );

    blocTest(
      ' => Get order confirmation detail success',
      setUp: () {
        when(
          () => orderRepositoryMock.getOrderConfirmationDetail(
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: seedState.salesOrganisation,
            orderResponse: submitOrderResponse,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            shipToInfo: fakeShipToInfo,
            configs: seedState.salesOrgConfig,
          ),
        ).thenAnswer(
          (value) async => Right([orderHistoryDetails]),
        );
        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            salesOrganisation: seedState.salesOrganisation,
            customerCodeInfo: seedState.customerCodeInfo,
            materials: [orderHistoryDetails]
                .allItems
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (value) async => Right(stockInfoList),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.orderConfirmationDetail(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
          cartItems: <PriceAggregate>[
            PriceAggregate.empty().copyWith(quantity: 2),
          ],
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
          orderHistoryDetailsList: [orderHistoryDetails],
          cartItems: <PriceAggregate>[
            PriceAggregate.empty().copyWith(quantity: 2),
          ],
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          orderHistoryDetailsList: [orderHistoryDetails],
          cartItems: <PriceAggregate>[
            PriceAggregate.empty().copyWith(quantity: 2),
          ],
        ),
      ],
    );

    blocTest(
      ' => Get order confirmation detail failure',
      setUp: () {
        when(
          () => orderRepositoryMock.getOrderConfirmationDetail(
            user: seedState.user,
            customerCodeInfo: seedState.customerCodeInfo,
            salesOrganisation: seedState.salesOrganisation,
            orderResponse: submitOrderResponse,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            shipToInfo: fakeShipToInfo,
            configs: seedState.salesOrgConfig,
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.orderConfirmationDetail(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          isConfirming: true,
          cartItems: <PriceAggregate>[
            PriceAggregate.empty().copyWith(quantity: 2),
          ],
        ),
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
          cartItems: <PriceAggregate>[
            PriceAggregate.empty().copyWith(quantity: 2),
          ],
        ),
      ],
    );

    blocTest(
      ' => Get confirmed order stock info success',
      setUp: () {
        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            salesOrganisation: seedState.salesOrganisation,
            customerCodeInfo: seedState.customerCodeInfo,
            materials: [orderHistoryDetails]
                .allItems
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (value) async => Right(stockInfoList),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.confirmedOrderStockInfo(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            orderHistoryDetailList: [orderHistoryDetails],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          orderHistoryDetailsList: [orderHistoryDetails],
        ),
      ],
    );

    blocTest(
      ' => Get confirmed order stock info failure',
      setUp: () {
        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: seedState.customerCodeInfo,
            materials: [orderHistoryDetails]
                .allItems
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: seedState.salesOrganisation,
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (value) async => const Left(ApiFailure.other('Some Error')),
        );
      },
      seed: () => seedState.copyWith(
        submitOrderResponse: submitOrderResponse,
      ),
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          OrderSummaryEvent.confirmedOrderStockInfo(
            priceAggregate: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              ),
            ],
            orderHistoryDetailList: [orderHistoryDetails],
          ),
        );
      },
      expect: () => [
        seedState.copyWith(
          submitOrderResponse: submitOrderResponse,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Some Error'))),
        ),
      ],
    );

    blocTest(
      ' => UpdateIsExpanded event when isExpanded is true',
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => seedState,
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          const OrderSummaryEvent.updateIsExpanded(
            isExpanded: true,
          ),
        );
      },
      expect: () => [seedState.copyWith(isExpanded: true)],
    );

    blocTest(
      ' => UpdateIsExpanded event when isExpanded is false',
      build: () => OrderSummaryBloc(
        repository: orderRepositoryMock,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => seedState.copyWith(
        isExpanded: true,
      ),
      act: (OrderSummaryBloc bloc) {
        bloc.add(
          const OrderSummaryEvent.updateIsExpanded(
            isExpanded: false,
          ),
        );
      },
      expect: () => [seedState],
    );
  });
}
