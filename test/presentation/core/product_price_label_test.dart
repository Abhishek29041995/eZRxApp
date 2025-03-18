import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    cartBlocMock = CartBlocMock();
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => materialPriceBlocMock.state).thenReturn(
      MaterialPriceState.initial(),
    );
    when(() => cartBlocMock.state).thenReturn(
      CartState.initial(),
    );
  });

  Widget getScopedWidget() {
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
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
      ],
      child: Scaffold(
        body: ProductPriceLabel(materialInfo: MaterialInfo.empty()),
      ),
    );
  }

  testWidgets('Show GovtListPriceComponent Test', (tester) async {
    await tester.pumpWidget(getScopedWidget());
    await tester.pump();
    expect(find.byType(GovtListPriceComponent), findsOneWidget);
  });
}
