import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/select_order_type_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late CartBloc cartBlocMock;
  late AppRouter appRouter;
  final orderTypes = (await SalesOrgLocalDataSource().getConfig()).orderTypes;
  final fakeOrderType = DocumentType('zpor');

  setUpAll(() {
    locator.registerSingleton<AppRouter>(AutoRouteMock());
    appRouter = locator<AppRouter>();
  });

  setUp(() {
    eligibilityBlocMock = EligibilityBlocMock();
    userBlocMock = UserBlocMock();
    cartBlocMock = CartBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    clearInteractions(appRouter);
  });

  Widget testWidget() => WidgetUtils.getScopedWidget(
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (_) => userBlocMock),
          BlocProvider<EligibilityBloc>(create: (_) => eligibilityBlocMock),
          BlocProvider<CartBloc>(create: (_) => cartBlocMock),
        ],
        autoRouterMock: appRouter,
        child: const Material(child: SelectOrderTypeBottomSheet()),
      );

  group('select order type bottom sheet -', () {
    testWidgets('Should display default componnents', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes),
      );
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();
      expect(find.text('Change order type'), findsOne);
      expect(
        find.byKey(WidgetKeys.cartNotEmptyMessageWhenSelectOrderType),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderTypeTile(fakeOrderType.getOrCrash())),
          matching: find.text('ZPOR | Regular order'),
        ),
        findsOne,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.cancelButton),
          matching: find.text('Cancel'),
        ),
        findsOne,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.confirmButton),
          matching: find.text('Confirm'),
        ),
        findsOne,
      );
    });

    testWidgets('Should display warning message when cart is not empty',
        (tester) async {
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(cartProducts: [PriceAggregate.empty()]),
      );
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.cartNotEmptyMessageWhenSelectOrderType),
          matching: find.text(
            'You have material(s) of a different order type in your cart. The material(s) in your cart will be cleared once you confirm this change. Please note that this action cannot be undone.',
          ),
        ),
        findsOne,
      );
    });

    testWidgets('Should pop when tap confirm with the same order type',
        (tester) async {
      when(() => appRouter.maybePop()).thenAnswer((_) async => true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes)
            .copyWith
            .user(selectedOrderType: fakeOrderType),
      );
      whenListen(
        userBlocMock,
        Stream.fromIterable([
          UserState.initial().copyWith(
            user: User.empty().copyWith(selectedOrderType: fakeOrderType),
          ),
        ]),
        initialState: UserState.initial().copyWith(
          isSelectingOrderType: true,
          failureOrSuccessOption: optionOf(const Right('')),
        ),
      );
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.confirmButton));
      await tester.pumpAndSettle();
      verifyNever(
        () => userBlocMock
            .add(UserEvent.selectOrderType(orderType: fakeOrderType)),
      );
      verify(() => appRouter.maybePop()).called(1);
    });

    testWidgets(
        'Should select new order type when tap confirm with the different order type',
        (tester) async {
      when(() => appRouter.maybePop()).thenAnswer((_) async => true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes),
      );
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(WidgetKeys.orderTypeTile(fakeOrderType.getOrCrash())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.confirmButton));
      await tester.pumpAndSettle();
      verify(
        () => userBlocMock
            .add(UserEvent.selectOrderType(orderType: fakeOrderType)),
      ).called(1);
      verifyNever(() => appRouter.maybePop());
    });

    testWidgets('Should pop when tap cancel', (tester) async {
      when(() => appRouter.maybePop()).thenAnswer((_) async => true);
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.cancelButton));
      await tester.pumpAndSettle();
      verify(() => appRouter.maybePop()).called(1);
    });

    testWidgets(
        'Show snackbar and back to product tab after select order type and clear cart success',
        (tester) async {
      const navigateRoute =
          HomeNavigationTabbarRoute(children: [ProductsTabRoute()]);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes)
            .copyWith
            .user(selectedOrderType: fakeOrderType),
      );
      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(isClearing: true),
          CartState.initial(),
        ]),
      );
      when(
        () => appRouter.popUntilRouteWithName(HomeNavigationTabbarRoute.name),
      ).thenAnswer((_) async => true);
      when(
        () => appRouter.navigate(navigateRoute),
      ).thenAnswer((_) async => true);
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();

      verify(
        () => appRouter.popUntilRouteWithName(HomeNavigationTabbarRoute.name),
      ).called(1);
      verify(
        () => appRouter.navigate(navigateRoute),
      ).called(1);
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'Your cart is cleared, and the Order type has changed to ZPOR | Regular order',
          ),
        ),
        findsOne,
      );
    });

    testWidgets('Start clear cart after select order type when cart has items',
        (tester) async {
      whenListen(
        userBlocMock,
        Stream.fromIterable([
          UserState.initial().copyWith(isSelectingOrderType: true),
          UserState.initial().copyWith(
            failureOrSuccessOption: optionOf(Right(fakeOrderType)),
          ),
        ]),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(cartProducts: [PriceAggregate.empty()]),
      );
      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();

      verify(
        () => cartBlocMock.add(const CartEvent.clearCart()),
      ).called(1);
    });

    testWidgets(
        'Show snackbar and back to product tab after select order type when cart is empty',
        (tester) async {
      const navigateRoute =
          HomeNavigationTabbarRoute(children: [ProductsTabRoute()]);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes)
            .copyWith
            .user(selectedOrderType: fakeOrderType),
      );
      when(
        () => appRouter.popUntilRouteWithName(HomeNavigationTabbarRoute.name),
      ).thenAnswer((_) async => true);
      when(() => appRouter.navigate(navigateRoute))
          .thenAnswer((_) async => true);
      whenListen(
        userBlocMock,
        Stream.fromIterable([
          UserState.initial().copyWith(isSelectingOrderType: true),
          UserState.initial().copyWith(
            failureOrSuccessOption: optionOf(Right(fakeOrderType)),
          ),
        ]),
      );

      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();

      verify(
        () => appRouter.popUntilRouteWithName(HomeNavigationTabbarRoute.name),
      ).called(1);
      verify(
        () => appRouter.navigate(navigateRoute),
      ).called(1);
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'Order type has changed to ZPOR | Regular order',
          ),
        ),
        findsOne,
      );
    });

    testWidgets('Show error snackbar when select order type failed',
        (tester) async {
      whenListen(
        userBlocMock,
        Stream.fromIterable([
          UserState.initial().copyWith(isSelectingOrderType: true),
          UserState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-message'))),
          ),
        ]),
      );

      await tester.pumpWidget(testWidget());
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text('fake-message'),
        ),
        findsOne,
      );
    });

    testWidgets('Can not tap confirm when loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith
            .salesOrgConfigs(orderTypes: orderTypes)
            .copyWith
            .user(selectedOrderType: fakeOrderType),
      );
      when(() => userBlocMock.state)
          .thenReturn(UserState.initial().copyWith(isSelectingOrderType: true));
      await tester.pumpWidget(testWidget());
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.confirmButton));
      await tester.pump();
      verifyNever(
        () => userBlocMock
            .add(UserEvent.selectOrderType(orderType: fakeOrderType)),
      );
      verifyNever(() => appRouter.maybePop());
    });
  });
}
