import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_details.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../utils/widget_utils.dart';

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMixPanelService extends Mock implements MixpanelService {}

void main() {
  late AppRouter autoRouterMock;
  late ProductDetailBloc productDetailMockBloc;
  late EligibilityBloc eligibilityBlocMock;

  final productItemWithProductItemXp = ProductItem.empty().copyWith(
    productItemXp: ProductItemXp.empty()
        .copyWith(howToUse: StringValue('fake-description')),
  );

  final fakeProductDetailAggregate = ProductDetailAggregate.empty().copyWith(
    productItem: productItemWithProductItemXp,
  );

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => ProductDetailsMockBloc());
    locator.registerLazySingleton(() => EligibilityBlocMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MockMixPanelService());
    autoRouterMock = locator<AppRouter>();
    productDetailMockBloc = locator<ProductDetailsMockBloc>();
    eligibilityBlocMock = locator<EligibilityBlocMock>();
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => productDetailMockBloc.state)
        .thenReturn(ProductDetailState.initial());
  });

  RouteDataScope getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ProductDetailBloc>(
          create: ((context) => productDetailMockBloc),
        ),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
      ],
      child: Material(
        child: ListView(
          children: const [
            MaterialDetailsToggle(),
          ],
        ),
      ),
    );
  }

  group('Test Material Detail', () {
    testWidgets('Test see more/see less material description', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            enableBatchNumber: true,
          ),
        ),
      );

      when(() => productDetailMockBloc.state).thenReturn(
        ProductDetailState.initial().copyWith(
          productDetailAggregate: fakeProductDetailAggregate,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materialDetailsDescription = find.byKey(WidgetKeys.materialDetailsDescription);
      final expandButton = find.byKey(WidgetKeys.expandIcon);

      expect(materialDetailsDescription, findsOneWidget);
      expect(expandButton, findsOneWidget);

      await tester.tap(expandButton);
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(expandButton, 200);

      await tester.tap(expandButton);
      await tester.pumpAndSettle();
      
      expect(materialDetailsDescription, findsOneWidget);
    });
  });
}
