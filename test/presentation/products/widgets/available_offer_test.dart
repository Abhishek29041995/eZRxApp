import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

void main() {
  late MaterialPriceBlocMock materialPriceBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late UserBloc userBlocMock;
  late MaterialInfo materialInfoMock;
  late Price materialPrice;
  final productDetailMockBloc = ProductDetailsMockBloc();
  userBlocMock = UserBlocMock();
  final availableOfferFinder = find.byKey(WidgetKeys.availableOfferColumnKey);
  final bonus = PriceBonus.empty().copyWith(
    items: [
      PriceBonusItem.empty().copyWith(
        bonusMaterials: [
          BonusMaterial.empty().copyWith(
            materialNumber: MaterialNumber('123456789'),
          ),
        ],
      ),
    ],
  );

  final unsortedBonus = PriceBonus.empty().copyWith(
    items: [
      PriceBonusItem.empty().copyWith(
        bonusMaterials: [
          BonusMaterial.empty().copyWith(
            id: 2,
            materialNumber: MaterialNumber('"000000000023156808'),
            materialDescription: '0.3cc 31G Syr. 10Bag  8mm 100/Bx',
            bonusRatio: 1,
            bonusQuantity: 3,
            qualifyingQuantity: 20,
          ),
        ],
      ),
      PriceBonusItem.empty().copyWith(
        bonusMaterials: [
          BonusMaterial.empty().copyWith(
            id: 1,
            materialNumber: MaterialNumber('"000000000023156808'),
            materialDescription: '0.3cc 31G Syr. 10Bag  8mm 100/Bx',
            calculation: BonusMaterialCalculation('915'),
            bonusRatio: 1,
            bonusQuantity: 1,
            qualifyingQuantity: 10,
          ),
        ],
      ),
    ],
  );

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    materialInfoMock = await ProductDetailLocalDataSource().getProductDetails();
    materialPrice =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) => element.materialNumber == materialInfoMock.materialNumber,
    );
  });

  group('Available Offer -', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => productDetailMockBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: ((context) => productDetailMockBloc),
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
        ],
        child: Material(
          child: AvailableOffer(
            materialNumber: materialInfoMock.materialNumber,
          ),
        ),
      );
    }

    testWidgets(
      '=> Test AvailableOffer visible when hide price is false',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-user'),
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            ),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );

        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfoMock.materialNumber: materialPrice.copyWith(
                tiers: [],
                bonuses: [],
              ),
            },
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfoMock.copyWith(
                principalData: PrincipalData(
                  principalName: materialInfoMock.principalData.principalName,
                  principalCode: PrincipalCode('105307'),
                ),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(availableOfferFinder, findsNothing);

        await tester.pumpAndSettle();
      },
    );
    testWidgets(
      '=> Test AvailableOffer visible when hide price is true',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-user'),
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );

        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfoMock.materialNumber: materialPrice.copyWith(
                tiers: [PriceTierItem.empty()],
                bonuses: [bonus],
              ),
            },
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfoMock.copyWith(
                hidePrice: true,
                principalData: PrincipalData(
                  principalName: materialInfoMock.principalData.principalName,
                  principalCode: PrincipalCode('105307'),
                ),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(availableOfferFinder, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    testWidgets('Not visible when bonus and tier price are empty',
        (tester) async {
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              tiers: [],
              bonuses: [],
            ),
          },
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(availableOfferFinder, findsNothing);
    });

    testWidgets('Visible when bonus is not empty', (tester) async {
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              bonuses: [bonus],
            ),
          },
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(availableOfferFinder, findsOneWidget);
    });

    testWidgets('Visible when tier price is not empty', (tester) async {
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              tiers: [PriceTierItem.empty()],
            ),
          },
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(availableOfferFinder, findsOneWidget);
    });

    testWidgets('Visible when bonus is not empty and the market is ID',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrganisation: fakeIDSalesOrganisation,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              bonuses: [bonus],
            ),
          },
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.text(
          "The offers you get will based on eligibility. You'll know which promo you received after you do check out.",
        ),
        findsOneWidget,
      );
      expect(
        find.byType(
          AvailableOfferItem,
        ),
        findsWidgets,
      );
    });
    testWidgets('Available offers button test', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      tester.view.devicePixelRatio = 1;
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrganisation: fakeIDSalesOrganisation,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              bonuses: [bonus],
            ),
          },
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final availableOffers = find.text('Available offers');
      final availableOffersKey = find.byKey(WidgetKeys.availableOffersTile);

      expect(
        availableOffersKey,
        findsOneWidget,
      );
      expect(
        availableOffers,
        findsOneWidget,
      );
      await tester.tap(availableOffers);
      await tester.pumpAndSettle();
      expect(
        find.byType(ShowOfferDialogWidget),
        findsOneWidget,
      );
      expect(
        find.byType(
          AvailableOfferItem,
        ),
        findsWidgets,
      );
      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(
        closeButton,
        findsWidgets,
      );
      await tester.tap(closeButton);
      await tester.pumpAndSettle();
      expect(
        find.byType(ShowOfferDialogWidget),
        findsNothing,
      );
    });
    testWidgets('Available Offer Item test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrganisation: fakeIDSalesOrganisation,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              bonuses: [bonus],
            ),
          },
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final availableOffers = find.text('Available offers');
      final availableOffersKey = find.byKey(WidgetKeys.availableOffersTile);

      expect(
        availableOffersKey,
        findsOneWidget,
      );
      expect(
        availableOffers,
        findsOneWidget,
      );
      await tester.tap(availableOffers);
      await tester.pumpAndSettle();
      expect(
        find.byType(ShowOfferDialogWidget),
        findsOneWidget,
      );
      expect(
        find.byType(
          AvailableOfferItem,
        ),
        findsWidgets,
      );
      expect(
        find.textContaining(
          'Minimum Amount',
        ),
        findsNWidgets(2),
      );
      expect(
        find.textContaining(
          'Purchase quantity: 100',
        ),
        findsNWidgets(2),
      );
    });

    testWidgets('Available Offer Item test when the bonus is empty',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrganisation: fakeIDSalesOrganisation,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber:
                materialPrice.copyWith(bonuses: []),
          },
        ),
      );
      when(() => productDetailMockBloc.state).thenReturn(
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: materialInfoMock.copyWith(hidePrice: false),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final availableOffers = find.text('Available offers');
      final availableOffersKey = find.byKey(WidgetKeys.availableOffersTile);

      expect(
        availableOffersKey,
        findsOneWidget,
      );
      expect(
        availableOffers,
        findsOneWidget,
      );
      await tester.tap(availableOffers);
      await tester.pumpAndSettle();
      expect(
        find.byType(ShowOfferDialogWidget),
        findsOneWidget,
      );
      expect(
        find.byType(
          AvailableOfferItem,
        ),
        findsWidgets,
      );
    });

    testWidgets('Available Offer Item test sorted Bonus offer listing ',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 1200));
      tester.view.devicePixelRatio = 1;
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTWSalesOrganisation,
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: materialPrice.copyWith(
              bonuses: [unsortedBonus],
              tiers: <PriceTierItem>[],
            ),
          },
        ),
      );
      when(() => productDetailMockBloc.state).thenReturn(
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: materialInfoMock,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final availableOfferItemFinder = find.byType(AvailableOfferItem);
      expect(availableOfferItemFinder, findsWidgets);
      final quantityTextFinder = find.text('For every 10 quantity, receive');
      expect(quantityTextFinder, findsOneWidget);
      expect(
        find.descendant(
          of: availableOfferItemFinder.first,
          matching: quantityTextFinder,
        ),
        findsOneWidget,
      );
    });
  });
}
