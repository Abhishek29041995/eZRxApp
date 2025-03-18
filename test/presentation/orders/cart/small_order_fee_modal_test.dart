import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/small_order_fee_modal/small_order_fee_modal.dart';
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
  late AppRouter autoRouterMock;
  late CartBloc cartBloc;
  late EligibilityBloc eligibilityBloc;
  late OrderEligibilityBloc orderEligibilityBloc;

  late RouteData routeData;

  setUpAll(() async {
    autoRouterMock = AutoRouteMock();
    cartBloc = CartBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    orderEligibilityBloc = OrderEligibilityBlocMock();
    routeData = RouteData(
      stackKey: const Key(''),
      type: const RouteType.adaptive(),
      route: RouteMatch(
        segments: const [],
        config: AutoRoute(
          page: const PageInfo(HomeTabRoute.name),
        ),
        stringMatch: 'home',
        key: const ValueKey('HomeTabRoute'),
      ),
      router: autoRouterMock,
      pendingChildren: [],
    );
  });

  group('Small Order Fee Modal Test', () {
    setUp(() {
      when(() => cartBloc.state).thenReturn(CartState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => orderEligibilityBloc.state)
          .thenReturn(OrderEligibilityState.initial());
      when(() => autoRouterMock.currentPath).thenReturn('home');
      when(() => autoRouterMock.current).thenReturn(routeData);
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<OrderEligibilityBloc>(
            create: (context) => orderEligibilityBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
        ],
        child: const Material(
          child: SmallOrderFeePage(),
        ),
      );
    }

    testWidgets(
      '=> test modal content',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.text('Agree to small order fee?'.tr()), findsOneWidget);
        expect(
          find.text('Please agree to small order fee to proceed.'.tr()),
          findsOneWidget,
        );
        expect(
          find.text(
            'Alternatively, you may choose to add more in-stock items to your order.'
                .tr(),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.cancelButton),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.confirmButton),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test cancel button tap',
      (tester) async {
        when(() => autoRouterMock.maybePop())
            .thenAnswer((invocation) => Future.value(false));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.tap(find.byKey(WidgetKeys.cancelButton));
        verify(() => autoRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      '=> test agree button tap',
      (tester) async {
        when(() => autoRouterMock.maybePop(true))
            .thenAnswer((invocation) => Future.value(false));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.tap(find.byKey(WidgetKeys.confirmButton));
        verify(() => autoRouterMock.maybePop(true)).called(1);
      },
    );
  });
}
