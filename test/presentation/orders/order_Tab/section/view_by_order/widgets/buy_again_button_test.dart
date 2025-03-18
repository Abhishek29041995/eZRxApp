import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../../common_mock_data/mock_other.dart';
import '../../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBlocMock cartBlocMock;
  late MixpanelService mixpanelService;
  late ClevertapService clevertapService;
  final fakePhoneNumber = PhoneNumber('0987378484');
  final buyAgainButton = find.byType(OutlinedButton);

  const path = '/orders/view_by_order_details';

  setUpAll(() async {
    mixpanelService = MixpanelServiceMock();
    clevertapService = ClevertapServiceMock();
    locator.registerLazySingleton(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => mixpanelService);
    locator.registerSingleton<ClevertapService>(clevertapService);
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    locator.registerFactory(() => reOrderPermissionBlocMock);
    cartBlocMock = CartBlocMock();
    autoRouterMock = locator<AutoRouteMock>();

    eligibilityBlocMock = EligibilityBlocMock();
  });
  group('Order History Details Page', () {
    setUp(() async {
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial(),
      );
    });

    Widget getScopedWidget(OrderHistoryDetails viewByOrderHistoryItem) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        path: path,
        usingLocalization: true,
        useMediaQuery: false,
        routeName: ViewByOrderDetailsPageRoute.name,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: ((context) => eligibilityBlocMock),
          ),
          BlocProvider<CartBloc>(
            create: ((context) => cartBlocMock),
          ),
          BlocProvider<ReOrderPermissionBloc>(
            create: ((context) => reOrderPermissionBlocMock),
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
        ],
        child: Material(
          child: BuyAgainButton(
            viewByOrderHistoryItem: viewByOrderHistoryItem,
          ),
        ),
      );
    }

    testWidgets('Buy Again Button disable check', (tester) async {
      final deliveryInfo = DeliveryInfoData.empty();
      when(
        () => autoRouterMock.isRouteActive(ViewByOrderDetailsPageRoute.name),
      ).thenReturn(true);

      when(
        () => autoRouterMock
            .push(CartPageRoute(isReOrder: true, deliveryInfo: deliveryInfo)),
      ).thenAnswer((invocation) => Future.value());

      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial(),
        ]),
      );

      await tester.pumpWidget(getScopedWidget(OrderHistoryDetails.empty()));
      await tester.pumpAndSettle();

      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);

      verify(
        () => autoRouterMock.push(
          CartPageRoute(
            deliveryInfo: deliveryInfo,
            isReOrder: true,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'Buy Again Button disable check if current route is not active one',
        (tester) async {
      when(
        () => autoRouterMock.isRouteActive(ViewByOrderDetailsPageRoute.name),
      ).thenReturn(false);

      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial(),
        ]),
      );

      await tester.pumpWidget(getScopedWidget(OrderHistoryDetails.empty()));
      await tester.pumpAndSettle();

      verifyNever(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      );
    });

    testWidgets('Pass phone number to the Checkout page when reorder is valid',
        (tester) async {
      final deliveryInfo =
          DeliveryInfoData.empty().copyWith(mobileNumber: fakePhoneNumber);
      when(
        () => autoRouterMock.isRouteActive(ViewByOrderDetailsPageRoute.name),
      ).thenReturn(true);

      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial().copyWith(),
        ]),
      );

      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/cart');

      when(
        () => autoRouterMock.push(
          CartPageRoute(
            isReOrder: true,
            deliveryInfo: deliveryInfo,
          ),
        ),
      ).thenAnswer((invocation) => Future.value());

      await tester.pumpWidget(
        getScopedWidget(
          OrderHistoryDetails.empty()
              .copyWith(telephoneNumber: fakePhoneNumber),
        ),
      );
      await tester.pumpAndSettle();
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);

      verify(
        () => autoRouterMock
            .push(CartPageRoute(deliveryInfo: deliveryInfo, isReOrder: true)),
      ).called(1);
    });

    testWidgets('tap re-order button', (tester) async {
      final orderNumber = OrderNumber('fake-order-number');

      await tester.pumpWidget(
        getScopedWidget(
          OrderHistoryDetails.empty().copyWith(
            orderNumber: orderNumber,
            orderHistoryDetailsOrderItem: [
              OrderHistoryDetailsOrderItem.empty(),
            ],
          ),
        ),
      );
      await tester.pump();
      expect(buyAgainButton, findsOneWidget);
      await tester.tap(buyAgainButton);
      await tester.pump();
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.fetchOrder(
            orderHistoryDetailsOrderItems: [
              OrderHistoryDetailsOrderItem.empty(),
            ],
            orderNumberWillUpsert: orderNumber,
          ),
        ),
      ).called(1);
      verify(
        () => clevertapService.trackEvent(
          eventName: TrackingEvents.reorderClicked,
          properties: {
            TrackingProps.productName: '',
            TrackingProps.productNumber: 'NA',
            TrackingProps.productManufacturer: 'NA',
            TrackingProps.clickAt:
                'View By Order Details Page', //use direct value to verify,
          },
        ),
      ).called(1);
      verify(
        () => mixpanelService.trackEvent(
          eventName: TrackingEvents.buyAgainClicked,
          properties: {
            TrackingProps.productName: '',
            TrackingProps.productNumber: 'NA',
            TrackingProps.productManufacturer: 'NA',
            TrackingProps.clickAt:
                'View By Order Details Page', //use direct value to verify,
          },
        ),
      ).called(1);
    });

    testWidgets('add items to cart when fetch order success', (tester) async {
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable([
          ReOrderPermissionState.initial().copyWith(
            isFetching: true,
          ),
          ReOrderPermissionState.initial(),
        ]),
      );

      await tester.pumpWidget(
        getScopedWidget(
          OrderHistoryDetails.empty()
              .copyWith(telephoneNumber: fakePhoneNumber),
        ),
      );
      await tester.pumpAndSettle();

      verify(
        () => cartBlocMock.add(
          CartEvent.addHistoryItemsToCart(
            items: [],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            tenderContractList: {},
          ),
        ),
      ).called(1);
    });

    testWidgets('show error message when fetch order error', (tester) async {
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable([
          ReOrderPermissionState.initial().copyWith(
            isFetching: true,
          ),
          ReOrderPermissionState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-error')),
            ),
          ),
        ]),
      );

      await tester.pumpWidget(
        getScopedWidget(
          OrderHistoryDetails.empty(),
        ),
      );
      await tester.pumpAndSettle();
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });

    testWidgets(
        'show bottomsheet when re-order animal health item with normal product in cart',
        (tester) async {
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/cart');
      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.addAnimalHealthWithNormalProductToCart()),
            ),
          ),
        ]),
      );

      await tester.pumpWidget(
        getScopedWidget(
          OrderHistoryDetails.empty(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AddToCartErrorSection), findsOneWidget);
      expect(
        find.text(
          'Animal health materials cannot be ordered with regular materials. By proceeding, your existing cart will be cleared.'
              .tr(),
        ),
        findsOneWidget,
      );
    });
  });
}
