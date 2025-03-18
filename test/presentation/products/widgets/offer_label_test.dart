import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late MaterialPriceBlocMock materialPriceBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfoMock;
  
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    materialInfoMock =
        (await MaterialListLocalDataSource().getProductList()).products.first;
  });

  setUp(() async {
    materialPriceBlocMock = MaterialPriceBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
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
      ],
      child: Material(child: OfferLabel(materialInfo: materialInfoMock)),
    );
  }

  group('Offer label -', () {
    testWidgets(
        'Should visible when last price and final price is not the same',
        (tester) async {
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            materialInfoMock.materialNumber: Price.empty().copyWith(
              lastPrice: MaterialPrice(10.0),
              finalPrice: MaterialPrice(11.0),
            ),
          },
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(find.byType(ProductTag), findsOneWidget);
    });
  });
}
