import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityState initializedState;
  late OrderEligibilityState changedState;
  late PriceAggregate fakeCartItem;
  group(
    'Test Order Eligibility Bloc',
    () {
      setUpAll(() {
        final config = Config()..appFlavor = Flavor.uat;
        locator.registerSingleton(config);
      });
      setUp(
        () async {
          fakeCartItem = (await CartLocalDataSource()
              .upsertCart(type: UpsertCartLocalType.upsertCartItems))[0];
          initializedState = OrderEligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser,
            salesOrg: fakeKHSalesOrganisation,
            configs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
            shipInfo: fakeShipToInfo.copyWith(city1: 'Kol'),
          );
          changedState = initializedState.copyWith(
            cartItems: [fakeCartItem],
            grandTotal: 350.0,
            subTotal: 300.0,
          );
        },
      );

      blocTest(
        ' => Initialized event test',
        build: () => OrderEligibilityBloc(),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            OrderEligibilityEvent.initialized(
              user: initializedState.user,
              salesOrg: initializedState.salesOrg,
              customerCodeInfo: initializedState.customerCodeInfo,
              configs: initializedState.configs,
              shipInfo: initializedState.shipInfo,
            ),
          );
        },
        expect: () => [initializedState],
      );

      blocTest(
        ' => showErrorMessage when state.isMinOrderValuePassed is false',
        build: () => OrderEligibilityBloc(),
        seed: () => initializedState,
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          initializedState.copyWith(
            showErrorMessage: true,
          ),
        ],
      );

      blocTest(
        ' => showErrorMessage when state.isMWPNotAllowedAndPresentInCart is true',
        build: () => OrderEligibilityBloc(),
        seed: () => changedState.copyWith(
          configs: fakePHSalesOrgConfigs,
          cartItems: [
            fakeCartItem.copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('100225'),
                ),
                type: MaterialInfoType('material'),
              ),
            ),
          ],
        ),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          changedState.copyWith(
            configs: fakePHSalesOrgConfigs,
            cartItems: [
              fakeCartItem.copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('100225'),
                  ),
                  type: MaterialInfoType('material'),
                ),
              ),
            ],
            showErrorMessage: true,
          ),
        ],
      );

      blocTest(
        ' => showErrorMessage when state.isOOSOrderAllowedToSubmit is false',
        build: () => OrderEligibilityBloc(),
        seed: () => changedState.copyWith(
          configs: fakeKHSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(false),
          ),
          cartItems: [
            fakeCartItem.copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('100225'),
                ),
              ),
            ),
          ],
        ),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          changedState.copyWith(
            configs: fakeKHSalesOrgConfigs.copyWith(
              addOosMaterials: OosMaterial(false),
            ),
            cartItems: [
              fakeCartItem.copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('100225'),
                  ),
                ),
              ),
            ],
            showErrorMessage: true,
          ),
        ],
      );

      blocTest(
        ' => showErrorMessage when state.displayInvalidItemsBanner is true',
        build: () => OrderEligibilityBloc(),
        seed: () => changedState.copyWith(
          configs: fakeKHSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(true),
          ),
          cartItems: [
            fakeCartItem.copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                isSuspended: true,
              ),
            ),
          ],
        ),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          changedState.copyWith(
            configs: fakeKHSalesOrgConfigs.copyWith(
              addOosMaterials: OosMaterial(true),
            ),
            cartItems: [
              fakeCartItem.copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isSuspended: true,
                ),
              ),
            ],
            showErrorMessage: true,
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Update event test',
        build: () => OrderEligibilityBloc(),
        seed: () => initializedState,
        act: (bloc) => bloc.add(
          OrderEligibilityEvent.update(
            cartItems: [fakeCartItem],
            grandTotal: 200.0,
            subTotal: 180.0,
            mpSubtotal: 222.2,
            zpSubtotal: 333.3,
          ),
        ),
        expect: () => [
          initializedState.copyWith(
            cartItems: <PriceAggregate>[fakeCartItem],
            grandTotal: 200.0,
            subTotal: 180.0,
            mpSubtotal: 222.2,
            zpSubtotal: 333.3,
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> selectDeliveryOption event test',
        build: () => OrderEligibilityBloc(),
        seed: () => initializedState,
        act: (bloc) => bloc.add(
          OrderEligibilityEvent.selectDeliveryOption(
            DeliveryOption.requestDeliveryDate(),
          ),
        ),
        expect: () => [
          initializedState.copyWith(
            deliveryOption: DeliveryOption.requestDeliveryDate(),
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = changedState.isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when orderType ZPFC',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedState
              .copyWith(
                user: fakeSalesRepUser.copyWith(
                  selectedOrderType: DocumentType('ZPFC'),
                ),
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is less than minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedState.copyWith(
            salesOrg: fakeTHSalesOrganisation,
            configs: fakeTHSalesOrgConfigs,
            subTotal: 40.0,
            cartItems: [
              fakeCartItem.copyWith(
                tenderContract: TenderContract.empty(),
              ),
            ],
          ).isMinOrderValuePassed;
          expect(isMinOrderValuePassed, false);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is equal to minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedState
              .copyWith(
                salesOrg: fakeTHSalesOrganisation,
                configs: fakeTHSalesOrgConfigs,
                subTotal: 100.0,
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is greater than minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedState
              .copyWith(
                salesOrg: fakeTHSalesOrganisation,
                configs: fakeTHSalesOrgConfigs,
                subTotal: 110.0,
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed And Customer Code Account Suspended',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final orderEligibilityState = initializedState.copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('z1'),
            ),
          );

          expect(orderEligibilityState.isAccountSuspended, true);
          expect(orderEligibilityState.isMinOrderValuePassed, false);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed And Ship to Account Suspended',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final orderEligibilityState = initializedState.copyWith(
            shipInfo: ShipToInfo.empty().copyWith(
              status: Status('z1'),
            ),
          );

          expect(orderEligibilityState.isAccountSuspended, true);
          expect(orderEligibilityState.isMinOrderValuePassed, false);
        },
      );

      test(
        ' => Mini order value bypass for Sales rep for material with principalCode == 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('101252'),
                  ),
                ),
              ),
            ],
            subTotal: 99,
          );

          expect(eligibilityState.isMinOrderValuePassed, true);
        },
      );
      test(
        ' => Mini order value not bypass for Sales rep for material with principalCode != 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
            cartItems: [PriceAggregate.empty()],
            grandTotal: 99,
            configs: fakeTHSalesOrgConfigs,
          );

          expect(eligibilityState.isMinOrderValuePassed, false);
        },
      );

      test(
        'Mini order value bypass for Client User for material with principalCode == 100822',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('101252'),
                  ),
                ),
              ),
            ],
            grandTotal: 99,
            configs: fakeTHSalesOrgConfigs,
          );

          expect(eligibilityState.isMinOrderValuePassed, true);
        },
      );
      test(
        ' => Mini order value not bypass for Client User for material with principalCode != 100822',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
            cartItems: [PriceAggregate.empty()],
            grandTotal: 99,
            configs: fakeTHSalesOrgConfigs,
          );

          expect(eligibilityState.isMinOrderValuePassed, false);
        },
      );
    },
  );
}
