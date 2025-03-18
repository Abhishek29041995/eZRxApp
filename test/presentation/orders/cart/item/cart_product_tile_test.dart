import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    cartBlocMock = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    orderEligibilityBlocMock = OrderEligibilityBlocMock();
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => orderEligibilityBlocMock.state)
        .thenReturn(OrderEligibilityState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => materialPriceBlocMock,
        ),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => orderEligibilityBlocMock,
        ),
      ],
      child: Material(
        child: CartProductTile(
          cartItem: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material-number'),
            ),
            is26SeriesMaterial: true,
          ),
        ),
      ),
    );
  }

  group('Cart Product Tile Test', () {
    testWidgets('Dislay GovtListPriceComponent Test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(GovtListPriceComponent), findsOneWidget);
    });

    testWidgets('Dislay Stock Info Test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(
            WidgetKeys.cartItemProductTile(
              MaterialNumber('fake-material-number').displayMatNo,
            ),
          ),
          matching: find.byKey(WidgetKeys.materialDetailsStock),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Hide bonus and price counter section for 26 series material on SG market',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.bonusPriceOverrideSection),
        findsNothing,
      );
    });
  });
}
