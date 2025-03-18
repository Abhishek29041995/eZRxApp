import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_hk_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityState initializedState;
  late PriceAggregate fakeCartItem;
  late PriceAggregate fakeMPCartItem;
  late List<PriceAggregate> mockMaterialsCartItems;
  late List<PriceAggregate> fakeCart;
  group('Test OrderEligibilityState', () {
    setUpAll(() {
      final config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton(config);
    });

    setUp(
      () async {
        fakeCart = (await CartLocalDataSource().getAddedToCartProductList())
            .cartProducts;
        fakeCartItem =
            fakeCart.firstWhere((e) => e.materialInfo.type.typeMaterial);
        fakeMPCartItem =
            fakeCartItem.copyWith.materialInfo(isMarketPlace: true);
        initializedState = OrderEligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrg: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
          shipInfo: fakeShipToInfo.copyWith(city1: 'Kol'),
        );

        mockMaterialsCartItems = await CartLocalDataSource().upsertCart();
      },
    );

    test(' => containsRegularMaterials should return correct value', () {
      // containsRegularMaterials is false
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              isSampleMaterial: true,
            ),
          ),
        ],
      );
      expect(modifiedState.containsRegularMaterials, false);

      // containsRegularMaterials is true
      final changeState = initializedState.copyWith(
        cartItems: [
          fakeCartItem,
        ],
      );
      expect(changeState.containsRegularMaterials, true);
    });

    test(' => validateRegularOrderType should return correct value', () {
      // validateRegularOrderType is true
      expect(initializedState.validateRegularOrderType, true);

      // validateRegularOrderType equals containsRegularMaterials
      final changeState = initializedState.copyWith(
        user: fakeSalesRepUser.copyWith(
          selectedOrderType: DocumentType('ZPOR'),
        ),
      );
      expect(
        changeState.validateRegularOrderType,
        changeState.containsRegularMaterials,
      );
    });

    test(' => displayMovWarning should return correct value', () {
      // displayMovWarning is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            tenderContract: TenderContract.empty(),
          ),
        ],
      );
      expect(modifiedState.displayMovWarning, true);

      // displayMovWarning is false
      expect(initializedState.displayMovWarning, false);
    });

    test(' => isOOSAllowedIfPresentInCart should return correct value', () {
      // isOOSAllowedIfPresentInCart is true
      expect(initializedState.isOOSAllowedIfPresentInCart, true);
      // isOOSAllowedIfPresentInCart is false
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
          ),
        ],
        configs: fakeKHSalesOrgConfigs.copyWith(
          addOosMaterials: OosMaterial(false),
        ),
      );
      expect(modifiedState.isOOSAllowedIfPresentInCart, false);
    });

    test(' => isBundleQuantitySatisfies should return correct value', () {
      // isBundleQuantitySatisfies is true
      expect(initializedState.isBundleQuantitySatisfies, true);

      // isBundleQuantitySatisfies is false
      final bundle = fakeCart.firstWhere((e) => e.materialInfo.type.typeBundle);
      final bundleMaterials = bundle.bundle.materials
          .map((e) => e.copyWith(quantity: MaterialQty(0)))
          .toList();
      final modifiedState = initializedState.copyWith(
        cartItems: [bundle.copyWith.bundle(materials: bundleMaterials)],
        showErrorMessage: true,
      );
      expect(modifiedState.isBundleQuantitySatisfies, false);
    });

    test(' => isOOSOrderAllowedToSubmit should return correct value', () {
      // isOOSOrderAllowedToSubmit is false
      expect(
        initializedState
            .copyWith(
              configs: fakeKHSalesOrgConfigs,
            )
            .isOOSOrderAllowedToSubmit,
        false,
      );

      // isOOSOrderAllowedToSubmit is true
      final modifiedState = initializedState.copyWith(
        configs: fakeMYSalesOrgConfigs.copyWith(
          oosValue: OosValue(0),
        ),
      );
      expect(modifiedState.isOOSOrderAllowedToSubmit, true);
    });

    test(' => displayMWPNotAllowedWarning should return correct value', () {
      // displayMWPNotAllowedWarning is false
      final state = initializedState.copyWith(
        configs: fakeTHSalesOrgConfigs,
      );
      expect(state.displayMWPNotAllowedWarning, false);

      // displayMWPNotAllowedWarning is true
      final modifiedState = initializedState.copyWith(
        configs: fakePHSalesOrgConfigs,
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
          ),
        ],
      );
      expect(modifiedState.displayMWPNotAllowedWarning, true);
    });

    test(' => cartContainsSuspendedMaterials should return correct value', () {
      // cartContainsSuspendedMaterials is false
      expect(initializedState.cartContainsSuspendedMaterials, false);

      // cartContainsSuspendedMaterials is true
      final stateWithZPMaterial = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.material(),
              isSuspended: true,
            ),
          ),
        ],
      );
      expect(stateWithZPMaterial.cartContainsSuspendedMaterials, true);

      // cartContainsSuspendedMaterials is true
      final stateWithMPMaterial = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            salesOrgConfig: fakeSGSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.material(),
              isSuspended: false,
              isMarketPlace: true,
            ),
          ),
        ],
      );
      expect(stateWithMPMaterial.cartContainsSuspendedMaterials, true);
    });

    test(' => invalidMaterialCartItems should return correct value', () {
      // invalidMaterialCartItems is empty
      expect(initializedState.invalidMaterialCartItems, []);

      // invalidMaterialCartItems is not empty
      final cartProducts = mockMaterialsCartItems
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(
                type: MaterialInfoType('material'),
              ),
            ),
          )
          .toList();
      final eligibilityState = OrderEligibilityState.initial().copyWith(
        cartItems: cartProducts,
      );
      final invalidMaterials = cartProducts
          .map(
            (e) => e.materialInfo.copyWith(
              quantity: MaterialQty(0),
            ),
          )
          .toList();
      final materials = eligibilityState.invalidMaterialCartItems;
      expect(materials, invalidMaterials);

      expect(
        OrderEligibilityState.initial().copyWith(
          cartItems: [
            fakeCartItem.copyWith(
              price: Price.empty().copyWith(finalPrice: MaterialPrice(100)),
            ),
          ],
        ).invalidMaterialCartItems,
        [fakeCartItem.materialInfo.copyWith(quantity: MaterialQty(0))],
      );
    });

    test(' => displayCartPagePriceMessage should return correct value', () {
      // displayCartPagePriceMessage is false
      expect(initializedState.displayPriceNotAvailableMessage, false);

      // displayCartPagePriceMessage is true
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              isSuspended: true,
            ),
          ),
        ],
      );
      expect(modifiedState.displayPriceNotAvailableMessage, true);
    });

    test(' => invalidBundleCartItems should return correct value', () {
      // invalidBundleCartItems is empty
      expect(initializedState.invalidBundleCartItems, []);

      // invalidBundleCartItems is not empty
      final modifiedState = initializedState.copyWith(
        configs: fakeKHSalesOrgConfigs.copyWith(
          addOosMaterials: OosMaterial(false),
        ),
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('bundle'),
            ),
            bundle: Bundle.empty().copyWith(
              bundleCode: 'test-code',
              materials: [
                MaterialInfo.empty().copyWith(
                  quantity: MaterialQty(1),
                ),
              ],
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
      );
      expect(modifiedState.invalidBundleCartItems, [
        MaterialInfo.empty().copyWith(
          parentID: 'test-code',
        ),
      ]);

      final changedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('bundle'),
            ),
            bundle: Bundle.empty().copyWith(
              bundleCode: 'test-code',
              materials: [
                MaterialInfo.empty().copyWith(
                  quantity: MaterialQty(1),
                  stockInfos: [
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('Yes'),
                    ),
                  ],
                  isSuspended: true,
                ),
              ],
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
      );
      expect(changedState.invalidBundleCartItems, [
        MaterialInfo.empty().copyWith(
          parentID: 'test-code',
          stockInfos: [
            StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
            ),
          ],
          isSuspended: true,
        ),
      ]);
    });

    test(' => isCheckoutDisabled should return correct value', () {
      expect(initializedState.isCheckoutDisabled, false);

      final modifiedState = initializedState.copyWith(
        user: fakeSalesRepUser.copyWith(
          selectedOrderType: DocumentType('ZPFC'),
        ),
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              principalData: PrincipalData.empty().copyWith(
                principalCode: PrincipalCode('100225'),
              ),
              type: MaterialInfoType('material'),
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
        grandTotal: 100,
      );
      expect(modifiedState.isCheckoutDisabled, false);
    });

    test(' => displayInvalidItemsBanner should return correct value', () {
      // displayInvalidItemsBanner is false
      expect(initializedState.displayInvalidItemsBanner, false);

      // displayInvalidItemsBanner is true
      final eligibilityState = OrderEligibilityState.initial().copyWith(
        cartItems: mockMaterialsCartItems,
      );
      expect(eligibilityState.displayInvalidItemsBanner, true);
    });

    test(' => cartContainsSuspendedPrincipal should return correct value', () {
      // cartContainsSuspendedMaterials is false
      expect(initializedState.cartContainsSuspendedPrincipal, false);

      // cartContainsSuspendedMaterials is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [mockMaterialsCartItems.last],
      );
      expect(modifiedState.cartContainsSuspendedPrincipal, true);
    });

    group('MOV validation -', () {
      test('zpMOVEligible getter', () {
        //return true when there is no zp material
        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
          ).zpMOVEligible,
          true,
        );

        //return true when zp material subtotal >= mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeCartItem],
                grandTotal: fakeMYSalesOrgConfigs.minOrderAmount,
              )
              .zpMOVEligible,
          true,
        );

        //return false when zp material subtotal < mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeCartItem],
                grandTotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
              )
              .zpMOVEligible,
          false,
        );

        //return false when zp small order fee enable for client role & user is internal sales rep material & subtotal < mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
                user: fakeInternalSalesRepUser,
                cartItems: [
                  fakeCartItem.copyWith(
                    stockInfoList: [
                      StockInfo.empty().copyWith(
                        inStock: MaterialInStock('Yes'),
                      ),
                    ],
                  ),
                ],
                subTotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
              )
              .zpMOVEligible,
          false,
        );
      });

      test('mpMOVEligible getter', () {
        //return true when there is no mp material
        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
          ).mpMOVEligible,
          true,
        );

        //return true when mp material subtotal >= mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeMPCartItem],
                mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
              )
              .mpMOVEligible,
          true,
        );

        //return false when mp material subtotal < mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeMPCartItem],
                mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
              )
              .mpMOVEligible,
          false,
        );
      });

      group('isTotalGreaterThanMinOrderAmount getter -', () {
        test('when contains marketplace material', () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem, fakeCartItem],
            configs: fakeMYSalesOrgConfigs,
          );
          // return false when not satisfied zp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          //return false when not satisfied mp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          //return true when satisfied both mp MOV and zp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
                )
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });

        test(
            'when contains only zp material && market required check mov on subtotal',
            () {
          final state = OrderEligibilityState.initial().copyWith(
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs,
            cartItems: [fakeCartItem],
          );

          // return false when subtotal < mov
          expect(
            state
                .copyWith(subTotal: fakeSGSalesOrgConfigs.minOrderAmount - 1)
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          // return true when subtotal >= mov
          expect(
            state
                .copyWith(subTotal: fakeSGSalesOrgConfigs.minOrderAmount)
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });

        test(
            'when contains only zp material && market not required check mov on subtotal',
            () {
          final state = OrderEligibilityState.initial().copyWith(
            salesOrg: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            cartItems: [fakeCartItem],
          );

          // return false when grandTotal < mov
          expect(
            state
                .copyWith(
                  grandTotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          // return true when grandTotal >= mov
          expect(
            state
                .copyWith(grandTotal: fakeMYSalesOrgConfigs.minOrderAmount)
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });
      });

      group('movNotEligibleMessage getter -', () {
        test('when contains ZP material only and ZP MoV is not eligible', () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeMYSalesOrgConfigs,
          );

          expect(
            stateWithMPMaterial.movNotEligibleMessage,
            const TRObject(
              'Please ensure that minimum order value is at least {mov}',
              arguments: {'mov': 'MYR 300.00'},
            ),
          );
        });

        test(
            'when contains ZP material only and ZP MoV is not eligible for SG External Sales Rep',
            () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeSGSalesOrgConfigsWithSmallOrderFee,
          );

          expect(
            stateWithMPMaterial.movNotEligibleMessage,
            const TRObject(
              'Please ensure that minimum order value is at least {mov}',
              arguments: {'mov': 'SGD 300.00'},
            ),
          );
        });

        test(
            'when contains both ZP and MP materials and both ZP MoV and MP MoV are not eligible',
            () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem, fakeMPCartItem],
            configs: fakeMYSalesOrgConfigs,
            mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
            zpSubtotal: fakeMYSalesOrgConfigs.zpMinOrderAmount - 1,
          );

          expect(
            stateWithMPMaterial.movNotEligibleMessage,
            const TRObject(
              'Please ensure that minimum order value is at least {zpMOV} for ZP subtotal & {mpMOV} for MP subtotal.',
              arguments: {
                'zpMOV': 'MYR 300.00',
                'mpMOV': 'MYR 0.00',
              },
            ),
          );
        });

        test(
            'when contains both ZP and MP materials and only ZP MoV is not eligible',
            () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem, fakeMPCartItem],
            configs: fakeMYSalesOrgConfigs,
            mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
            zpSubtotal: fakeMYSalesOrgConfigs.zpMinOrderAmount - 1,
          );

          expect(
            stateWithMPMaterial.movNotEligibleMessage,
            const TRObject(
              'Please ensure that minimum order value is at least {mov} for ZP subtotal.',
              arguments: {
                'mov': 'MYR 300.00',
              },
            ),
          );
        });

        test(
            'when contains both ZP and MP materials and only MP MoV is not eligible',
            () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem, fakeMPCartItem],
            configs: fakeMYSalesOrgConfigs,
            mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
            zpSubtotal: fakeMYSalesOrgConfigs.zpMinOrderAmount,
          );

          expect(
            stateWithMPMaterial.movNotEligibleMessage,
            const TRObject(
              'Please ensure that minimum order value is at least {mov} for MP subtotal.',
              arguments: {
                'mov': 'MYR 0.00',
              },
            ),
          );
        });
      });

      test('zpSubtotalInStockGreaterThanSAPMOV getter', () {
        // return false when there cart only has OOS item
        final ossStateMaterial = OrderEligibilityState.initial().copyWith(
          cartItems: [
            fakeCartItem.copyWith(
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(10),
              ),
            ),
          ],
          configs: fakeMYSalesOrgConfigs.copyWith(sapMinOrderAmount: 100),
        );
        expect(ossStateMaterial.zpSubtotalInStockGreaterThanSAPMOV, false);

        // return true when there cart only has instock item and subtotal is not smaller than sapMinOrderValue
        final inStockState = initializedState.copyWith(
          cartItems: [
            fakeCartItem.copyWith(
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(10),
              ),
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeMYSalesOrgConfigs.copyWith(sapMinOrderAmount: 100),
        );

        expect(inStockState.zpSubtotalInStockGreaterThanSAPMOV, true);

        // return true when there cart only has instock item and subtotal is smaller than sapMinOrderValue
        final invalidInStockState = initializedState.copyWith(
          cartItems: [
            fakeCartItem.copyWith(
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(1),
              ),
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeMYSalesOrgConfigs.copyWith(sapMinOrderAmount: 100),
        );

        expect(invalidInStockState.zpSubtotalInStockGreaterThanSAPMOV, false);
      });

      test('isIntSalesRepWithSmallOrderFeeForCustomer getter', () {
        // return false when user is not internal sales rep role
        final stateMaterial = OrderEligibilityState.initial().copyWith(
          user: fakeClientUser,
        );
        expect(
          stateMaterial.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );

        // return false when enableSmallOrderFee config is OFF
        var modifyStateMaterial = stateMaterial.copyWith(
          user: fakeInternalSalesRepUser,
        );
        expect(
          modifyStateMaterial.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );

        // return false when smallOrderFeeUserRoles config doesn't contain client user or client admin
        modifyStateMaterial = modifyStateMaterial.copyWith(
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee.copyWith(
            smallOrderFeeUserRoles: [],
          ),
        );

        expect(
          modifyStateMaterial.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );

        modifyStateMaterial = modifyStateMaterial.copyWith(
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
        );
      });

      test('Enabled/Disabled based on HK order type', () {
        final fakeState = OrderEligibilityState.initial().copyWith(
          user: fakeSalesRepUser,
          salesOrg: fakeHKSalesOrganisation,
          configs: fakeHKSalesOrgConfigs,
          cartItems: [
            fakeCartItem.copyWith(tenderContract: TenderContract.empty()),
          ],
          grandTotal: fakeHKSalesOrgConfigs.minOrderAmount - 1,
        );
        expect(
          fakeState.copyWith
              .user(selectedOrderType: DocumentType.zpor())
              .isMinOrderValuePassed,
          false,
        );

        expect(
          fakeState.copyWith
              .user(selectedOrderType: DocumentType('zpfb'))
              .isMinOrderValuePassed,
          false,
        );

        expect(
          fakeState.copyWith
              .user(selectedOrderType: DocumentType('zpfc'))
              .isMinOrderValuePassed,
          false,
        );
      });
    });

    group('Small order fee validation -', () {
      final inStock = [
        StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
      ];
      late final zpSmallOrderFeeEnableState =
          OrderEligibilityState.initial().copyWith(
        user: fakeClientUser,
        cartItems: [fakeCartItem],
        configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
      );

      late final mpSmallOrderFeeEnableState =
          OrderEligibilityState.initial().copyWith(
        user: fakeClientUser,
        cartItems: [fakeMPCartItem],
        configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
      );
      test('zpSmallOrderFeeEnable getter', () {
        expect(OrderEligibilityState.initial().zpSmallOrderFeeEnable, false);

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(enableSmallOrderFee: true),
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(
              enableSmallOrderFee: true,
              smallOrderFeeUserRoles: ['Client User'],
            ),
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(zpSmallOrderFeeEnableState.zpSmallOrderFeeEnable, true);
      });

      test('mpSmallOrderFeeEnable getter', () {
        expect(OrderEligibilityState.initial().mpSmallOrderFeeEnable, false);

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
            configs:
                fakeMYSalesOrgConfigs.copyWith(enableMPSmallOrderFee: true),
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(
              enableMPSmallOrderFee: true,
              mpSmallOrderFeeUserRoles: ['Client User'],
            ),
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(mpSmallOrderFeeEnableState.mpSmallOrderFeeEnable, true);
      });

      test('atLeastOneZPItemInStockRequired getter', () {
        expect(
          zpSmallOrderFeeEnableState.atLeastOneZPItemInStockRequired,
          true,
        );

        expect(
          OrderEligibilityState.initial().atLeastOneZPItemInStockRequired,
          false,
        );

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [fakeCartItem.copyWith(stockInfoList: inStock)],
          ).atLeastOneZPItemInStockRequired,
          false,
        );
        // return true when isIntSalesRepWithSmallOrderFeeForCustomer is true
        expect(
          zpSmallOrderFeeEnableState
              .copyWith(
                user: fakeInternalSalesRepUser,
                configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
              )
              .atLeastOneZPItemInStockRequired,
          true,
        );
      });

      test('isIntSalesRepWithSmallOrderFeeForCustomer getter', () {
        var modifiedState = zpSmallOrderFeeEnableState.copyWith(
          configs: fakePHSalesOrgConfigs,
        );
        // return false when user is not internal sales rep
        expect(
          modifiedState.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );
        modifiedState = modifiedState.copyWith(user: fakeInternalSalesRepUser);
        // return false when enableSmallOrderFee is OFF
        expect(
          modifiedState.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );
        // return false when smallOrderFeeUserRoles doesn't contain client role
        modifiedState = modifiedState.copyWith(
          configs: fakeMYSalesOrgConfigs,
        );
        expect(
          modifiedState.isIntSalesRepWithSmallOrderFeeForCustomer,
          false,
        );
        modifiedState = modifiedState.copyWith(
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
        );
        expect(
          modifiedState.isIntSalesRepWithSmallOrderFeeForCustomer,
          true,
        );
      });

      test('displayAtLeastOneMPItemInStockWarning getter', () {
        expect(
          mpSmallOrderFeeEnableState.atLeastOneMPItemInStockRequired,
          true,
        );

        expect(
          OrderEligibilityState.initial().atLeastOneMPItemInStockRequired,
          false,
        );

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [fakeMPCartItem.copyWith(stockInfoList: inStock)],
          ).atLeastOneMPItemInStockRequired,
          false,
        );
      });

      test('zpSmallOrderFeeApplied getter', () {
        expect(OrderEligibilityState.initial().zpSmallOrderFeeApplied, false);

        expect(zpSmallOrderFeeEnableState.zpSmallOrderFeeApplied, false);

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(
                stockInfoList: inStock,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(
                    fakeMYSalesOrgConfigsWithSmallOrderFee.sapMinOrderAmount,
                  ),
                ),
              ),
            ],
          ).zpSmallOrderFeeApplied,
          false,
        );

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(stockInfoList: inStock, quantity: 0),
            ],
          ).zpSmallOrderFeeApplied,
          true,
        );

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(
                stockInfoList: inStock,
                quantity: 0,
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty()
                      .copyWith(principalCode: PrincipalCode('100777')),
                ),
              ),
            ],
            configs: fakeSGSalesOrgConfigs.copyWith(
              enableSmallOrderFee: true,
              smallOrderFeeUserRoles: ['Client User'],
            ),
          ).zpSmallOrderFeeApplied,
          false,
        );
      });

      test('smallOrderFeeApplied getter', () {
        final state = OrderEligibilityState.initial()
            .copyWith(salesOrg: fakeIDSalesOrganisation);
        expect(state.smallOrderFeeApplied, true);
      });

      test('smallOrderFee getter', () {
        final state = zpSmallOrderFeeEnableState.copyWith(
          cartItems: [
            fakeCartItem.copyWith(stockInfoList: inStock, quantity: 0),
          ],
        );
        expect(state.smallOrderFee, 23.0);
      });

      test('mpSmallOrderFeeApplied getter', () {
        expect(OrderEligibilityState.initial().mpSmallOrderFeeApplied, false);

        expect(mpSmallOrderFeeEnableState.mpSmallOrderFeeApplied, false);

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeMPCartItem.copyWith(
                stockInfoList: inStock,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(
                    fakeMYSalesOrgConfigsWithSmallOrderFee.mpSAPMinOrderAmount,
                  ),
                ),
              ),
            ],
          ).mpSmallOrderFeeApplied,
          false,
        );

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeMPCartItem.copyWith(stockInfoList: inStock, quantity: 0),
            ],
          ).mpSmallOrderFeeApplied,
          true,
        );
      });
    });

    group('orderEligibleTrackingErrorMessage test', () {
      test(
        ' => Check orderEligibleTrackingErrorMessage for zp only',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [PriceAggregate.empty()],
            configs: fakeTHSalesOrgConfigs,
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Please ensure that minimum order value is at least THB 100.00',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage with market has ZP and MP and has both ZP and MP small order fee',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isMarketPlace: true,
                ),
              ),
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty(),
              ),
            ],
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee.copyWith(
              mpMinOrderAmount: 200.0,
            ),
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Please ensure that minimum order value is at least MYR 300.00 for ZP subtotal & MYR 200.00 for MP subtotal.',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage with market has ZP and MP and has ZP small order fee',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isMarketPlace: true,
                ),
              ),
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty(),
              ),
            ],
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Please ensure that minimum order value is at least MYR 300.00 for ZP subtotal.',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage with market has ZP and MP and has MP small order fee',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isMarketPlace: true,
                ),
              ),
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty(),
              ),
            ],
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee.copyWith(
              mpMinOrderAmount: 200.0,
            ),
            zpSubtotal: 400.0,
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Please ensure that minimum order value is at least MYR 200.00 for MP subtotal.',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage for invalid contract',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isMarketPlace: true,
                ),
                tenderContract: TenderContract.empty().copyWith(
                  contractNumber: TenderContractNumber('fake-number'),
                  isTenderExpired: true,
                ),
                salesOrgConfig: fakeVNSalesOrgConfigs,
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Tender Contract is no longer available for one or few item(s). Please remove to continue.',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when is Max Qty Exceeds For Any Tender',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isMarketPlace: true,
                ),
                tenderContract: TenderContract.empty().copyWith(
                  contractNumber: TenderContractNumber('fake-number'),
                  remainingTenderQuantity: 9,
                ),
                quantity: 10,
                salesOrgConfig: fakeVNSalesOrgConfigs,
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'One or few item(s) order qty exceed the maximum available tender quantity.',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when ask User To Add Commercial Material',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                is26SeriesMaterial: true,
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Your cart must contain other commercial material to proceed checkout',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when Gimmick Material Not Allowed',
        () {
          final materialNumber = MaterialNumber('fake-number');
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                salesOrgConfig: fakeMYSalesOrgConfigs,
                materialInfo: MaterialInfo.empty()
                    .copyWith(materialNumber: materialNumber, isGimmick: true),
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Gimmick material ${materialNumber.displayMatNo} is not allowed',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when MWP Not Allowed And Present In Cart',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                salesOrgConfig: fakePHSalesOrgConfigs,
                materialInfo: MaterialInfo.empty()
                    .copyWith(type: MaterialInfoType.material()),
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'The following items have been identified in your cart: Material without price',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when OOS not Allowed If Present In Cart',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty(),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'The following items have been identified in your cart: Out of stock material',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when cart Contains Suspended Principal',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isPrincipalSuspended: true,
                ),
                stockInfoList: [
                  StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
                ],
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'The following items have been identified in your cart: Principle suspended material',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when cart Contains Suspended Materials',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  isSuspended: true,
                ),
                stockInfoList: [
                  StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
                ],
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'The following items have been identified in your cart: Suspended material',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when Bundle Quantity not Satisfies',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType.bundle(),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [
                    MaterialInfo.empty().copyWith(
                      stockInfos: [
                        StockInfo.empty()
                            .copyWith(inStock: MaterialInStock('Yes')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'The following items have been identified in your cart: Unsatisfied qty bundle',
          );
        },
      );

      test(
        ' => Check orderEligibleTrackingErrorMessage when has Mandatory Tender Material But Unavailable',
        () {
          final state = OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                salesOrgConfig: fakeVNSalesOrgConfigs,
                materialInfo: MaterialInfo.empty().copyWith(
                  hasMandatoryTenderContract: true,
                  defaultMaterialDescription: 'fake-name',
                ),
              ),
            ],
          );

          expect(
            state.orderEligibleTrackingErrorMessage,
            'Product fake-name need to use tender contract.',
          );
        },
      );
    });

    group('displayInvalidItemsWarning test', () {
      test('Check displayInvalidItemsWarning', () {
        final state = OrderEligibilityState.initial().copyWith(
          cartItems: [
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                isSuspended: true,
              ),
            ),
          ],
          showErrorMessage: true,
        );
        expect(
          state.displayInvalidItemsWarning,
          true,
        );
      });

      test('Check displayInvalidItemsWarning', () {
        final state = OrderEligibilityState.initial();
        expect(
          state.hasMultipleErrors,
          false,
        );
      });
    });

    group('comboDealEligible Test', () {
      test('Check comboDealEligible with salesDeals Empty', () {
        final state = OrderEligibilityState.initial().copyWith(
          configs: fakeKHSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
        );
        expect(
          state.comboDealEligible,
          false,
        );
      });

      test('Check comboDealEligible with comboDealsUserRole all user ', () {
        final state = OrderEligibilityState.initial().copyWith(
          configs: fakeKHSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo
              .copyWith(salesDeals: [SalesDealNumber('fake-number')]),
        );
        expect(
          state.comboDealEligible,
          true,
        );
      });

      test('Check comboDealEligible with comboDealsUserRole customer only ',
          () {
        final state = OrderEligibilityState.initial().copyWith(
          configs: fakeKHSalesOrgConfigs.copyWith(
            comboDealsUserRole: ComboDealUserRole(2),
          ),
          customerCodeInfo: fakeCustomerCodeInfo
              .copyWith(salesDeals: [SalesDealNumber('fake-number')]),
          user: fakeClientUser,
        );
        expect(
          state.comboDealEligible,
          true,
        );
      });

      test('Check comboDealEligible with comboDealsUserRole salesrep only ',
          () {
        final state = OrderEligibilityState.initial().copyWith(
          configs: fakeKHSalesOrgConfigs.copyWith(
            comboDealsUserRole: ComboDealUserRole(3),
          ),
          customerCodeInfo: fakeCustomerCodeInfo
              .copyWith(salesDeals: [SalesDealNumber('fake-number')]),
          user: fakeSalesRepUser,
        );
        expect(
          state.comboDealEligible,
          true,
        );
      });

      test('Check comboDealEligible with comboDealsUserRole not eligible ', () {
        final state = OrderEligibilityState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo
              .copyWith(salesDeals: [SalesDealNumber('fake-number')]),
          user: fakeSalesRepUser,
        );
        expect(
          state.comboDealEligible,
          false,
        );
      });
    });

    group('smallOrderFeeAppliedMessage Test', () {
      test('Check showSmallOrderFeeForID', () {
        final state = OrderEligibilityState.initial().copyWith(
          salesOrg: fakeIDSalesOrganisation,
          configs: fakeIDSalesOrgConfigs,
        );
        expect(
          state.smallOrderFeeAppliedMessage,
          TRObject(
            'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
            arguments: {
              'smallOrderFee': StringUtils.priceComponentDisplayPrice(
                fakeIDSalesOrgConfigs,
                fakeIDSalesOrganisation.salesOrg.smallOrderThreshold,
                false,
              ),
            },
          ),
        );
      });

      test('Check has both zp and mp small order fee', () {
        final state = OrderEligibilityState.initial().copyWith(
          cartItems: [
            PriceAggregate.empty().copyWith(
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                isMarketPlace: true,
              ),
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee.copyWith(
            mpMinOrderAmount: 200.0,
          ),
          user: fakeClientUser,
        );
        expect(
          state.smallOrderFeeAppliedMessage,
          const TRObject(
            'A small order fee applies to orders with ZP and MP in-stock items separately that are under the minimum order value of {zpSmallOrderFee} ZP subtotal & {mpSmallOrderFee} for MP subtotal.',
            arguments: {
              'zpSmallOrderFee': 'MYR 300.00',
              'mpSmallOrderFee': 'MYR 300.00',
            },
          ),
        );
      });

      test('Check has zp small order fee', () {
        final state = OrderEligibilityState.initial().copyWith(
          cartItems: [
            PriceAggregate.empty().copyWith(
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
          user: fakeClientUser,
        );
        expect(
          state.smallOrderFeeAppliedMessage,
          const TRObject(
            'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
            arguments: {'smallOrderFee': 'MYR 300.00'},
          ),
        );
      });

      test('Check has mp small order fee', () {
        final state = OrderEligibilityState.initial().copyWith(
          cartItems: [
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                isMarketPlace: true,
              ),
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee.copyWith(
            mpMinOrderAmount: 200.0,
          ),
          user: fakeClientUser,
        );
        expect(
          state.smallOrderFeeAppliedMessage,
          const TRObject(
            'A small order fee applies to orders with MP in-stock items that are under the minimum order value of {smallOrderFee} for MP subtotal.',
            arguments: {'smallOrderFee': 'MYR 300.00'},
          ),
        );
      });

      test('Check if external sales rep has small order fee', () {
        final state = OrderEligibilityState.initial().copyWith(
          cartItems: [
            PriceAggregate.empty().copyWith(
              stockInfoList: [
                StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
              ],
            ),
          ],
          configs: fakeSGSalesOrgConfigsWithSmallOrderFee.copyWith(
            mpMinOrderAmount: 200.0,
          ),
          user: fakeExternalSalesRepUser,
        );
        expect(
          state.smallOrderFeeAppliedMessage,
          const TRObject(
            'Small order fee is applied to orders with in-stock items that are under the minimum order value of {smallOrderFee}. This will be charged to client.',
            arguments: {'smallOrderFee': 'SGD 300.00'},
          ),
        );
      });
    });

    test('displayInvalidOOSOnCartItem Test', () {
      final state = OrderEligibilityState.initial().copyWith(
        configs:
            fakeTWSalesOrgConfigs.copyWith(addOosMaterials: OosMaterial(false)),
      );
      expect(state.displayInvalidOOSOnCartItem, true);
    });

    test('invalidCartItems test', () {
      final state = OrderEligibilityState.initial();
      expect(state.invalidCartItems, <MaterialInfo>[]);
    });

    test('invalidComboItems test', () {
      final state = OrderEligibilityState.initial().copyWith(
        cartItems: [
          PriceAggregate.empty().copyWith(
            materialInfo:
                MaterialInfo.empty().copyWith(type: MaterialInfoType('combo')),
            comboMaterials: [ComboMaterialItem.empty()],
          ),
        ],
      );
      expect(state.invalidComboItems, [
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            isValid: false,
          ),
          quantity: 0,
          materialInfo:
              MaterialInfo.empty().copyWith(type: MaterialInfoType('combo')),
        ),
      ]);
    });
  });
}
