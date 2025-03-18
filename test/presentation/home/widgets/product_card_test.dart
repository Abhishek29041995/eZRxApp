import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_card.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late ProductImageBloc productImageBlocMock;
  late MixpanelService mixpanelServiceMock;
  late ClevertapService clevertapServiceMock;
  late CartBloc cartBlocMock;

  const widgetKey = Key('fake-key');

  const section = 'fake-section';
  const path = 'fake-path';
  final materialNumber = MaterialNumber('fake-number');
  final material = MaterialInfo.empty().copyWith(
    materialNumber: materialNumber,
    stockInfos: [
      StockInfo.empty(),
    ],
  );

  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator
        .registerLazySingleton<ClevertapService>(() => ClevertapServiceMock());
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    mixpanelServiceMock = locator<MixpanelService>();
    clevertapServiceMock = locator<ClevertapService>();
    cartBlocMock = CartBlocMock();
  });

  setUp(() {
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
  });

  Widget getWidget({isGreaterThanDesktop = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => materialPriceBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData(size: Size(isGreaterThanDesktop ? 480 : 900, 900)),
        child: Material(
          child: ProductCard(
            widgetKey: widgetKey,
            material: material,
            section: section,
            onFavouriteTap: () {},
          ),
        ),
      ),
    );
  }

  group('ProductCard test => ', () {
    testWidgets('Show MaterialGridItem when screen is Greater Than Desktop ',
        (tester) async {
      await tester.pumpWidget(getWidget(isGreaterThanDesktop: true));
      await tester.pump();
      expect(find.byType(MaterialGridItem), findsOneWidget);
    });

    testWidgets('On Product tap ', (tester) async {
      final clickAt = RouterUtils.buildRouteTrackingName(path);
      final tags = ['On Offer', 'Out of stock'];
      final item = find.byType(MaterialGridItem);
      when(
        () => autoRouterMock
            .push(ProductDetailsPageRoute(materialInfo: material)),
      ).thenAnswer((_) => Future.value());
      when(() => autoRouterMock.currentPath).thenReturn(path);
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialNumber: Price.empty().copyWith(
              lastPrice: MaterialPrice(100),
              finalPrice: MaterialPrice(90),
            ),
          },
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(item, findsOneWidget);
      await tester.tap(item);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.productItemClicked,
          properties: {
            TrackingProps.clickAt: clickAt,
            TrackingProps.isBundle: false,
            TrackingProps.productName: material.displayDescription,
            TrackingProps.productNumber: material.materialNumber.displayMatNo,
            TrackingProps.productManufacturer: material.getManufactured,
            TrackingProps.section: section,
            TrackingProps.tag: tags.join(', '),
          },
        ),
      ).called(1);

      verify(
        () => clevertapServiceMock.trackEvent(
          eventName: TrackingEvents.productItemClicked,
          properties: {
            TrackingProps.clickAt: clickAt,
            TrackingProps.isBundle: false,
            TrackingProps.productName: material.displayDescription,
            TrackingProps.productNumber: material.materialNumber.displayMatNo,
            TrackingProps.productManufacturer: material.getManufactured,
            TrackingProps.tag: tags.join(', '),
          },
        ),
      ).called(1);

      verify(
        () => autoRouterMock
            .push(ProductDetailsPageRoute(materialInfo: material)),
      ).called(1);
    });
  });
}
