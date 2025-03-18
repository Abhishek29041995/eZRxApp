import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/combo_offers_product.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late ProductDetailBloc productDetailBloc;
  final mockCartBloc = CartBlocMock();
  late CustomerLicenseBloc customerLicenseBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  final mockProductImageBloc = ProductImageBlocMock();
  late Map<MaterialNumber, Price> mockPriceList;
  final comboDealListMockBloc = ComboDealListBlocMock();
  late TenderContractDetailBloc tenderContractDetailBloc;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<ProductDetailBloc>(() => productDetailBloc);
    locator.registerFactory<TenderContractDetailBloc>(
      () => tenderContractDetailBloc,
    );
  });
  group('ProductDetail page', () {
    setUp(() {
      tenderContractDetailBloc = TenderContractDetailBlocMock();
      autoRouterMock = locator<AppRouter>();
      productDetailBloc = ProductDetailBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => productDetailBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => tenderContractDetailBloc.state)
          .thenReturn(TenderContractDetailState.initial());
      when(() => mockCartBloc.state).thenReturn(CartState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => comboDealListMockBloc.state)
          .thenReturn(ComboDealListState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());

      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => mockCartBloc),
          BlocProvider<MaterialPriceBloc>(
            create: ((context) => materialPriceBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ComboDealListBloc>(
            create: (context) => comboDealListMockBloc,
          ),
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
        ],
        child: Scaffold(
          body: ProductDetailsPage(materialInfo: MaterialInfo.empty()),
        ),
      );
    }

    testWidgets(
      ' Add To cart button disable test when order toggle is disable ',
      (tester) async {
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: mockPriceList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final addToCartButton =
            find.widgetWithText(ElevatedButton, 'Add to cart');

        expect(
          addToCartButton,
          findsOneWidget,
        );
        await tester.pump();
        expect(
          (tester.widget(addToCartButton) as ElevatedButton).enabled,
          false,
        );
      },
    );

    testWidgets(
      ' Product details page offer tag hide when loading material detail',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(isDetailFetching: true),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.byType(OfferLabel), findsNothing);
      },
    );

    testWidgets(
      ' Product details page offer tag',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(OfferLabel);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      ' Product details page combo offer tag',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(ComboOfferLabel);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      ' Product details page get combo deal section',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        when(() => comboDealListMockBloc.state).thenReturn(
          ComboDealListState.initial().copyWith(
            comboDeals: {
              'fake-combo-deal-id': [
                ComboDeal.empty(),
              ],
            },
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(ComboOffersProduct);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Show IRN when enableIRN is true',
      (tester) async {
        const iRNNumber = '12C 234/11';

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTHSalesOrganisation,
            salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
              enableIRN: true,
            ),
          ),
        );

        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.textContaining(iRNNumber), findsOneWidget);
      },
    );

    testWidgets(
      'Do not show IRN when enableIRN is false',
      (tester) async {
        const iRNNumber = '12C 234/11';

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTHSalesOrganisation,
            salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
              enableIRN: false,
            ),
          ),
        );

        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.textContaining(iRNNumber), findsNothing);
      },
    );
  });
}
