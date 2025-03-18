import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
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
  final tileInfoFinder = find.byKey(WidgetKeys.materialDetailsInfoTile);

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
        child: MaterialInformation(
          materialInfo: MaterialInfo.empty(),
        ),
      ),
    );
  }

  group('Material Information Test', () {
    testWidgets('Show expiry date and batch number when configs enable',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            enableBatchNumber: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(tileInfoFinder, findsOneWidget);
      await tester.tap(tileInfoFinder);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Batch'.tr(), 'NA')),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Expiry date'.tr(), 'NA')),
        findsOneWidget,
      );
    });

    testWidgets('Hide expiry date and batch number when configs are disable',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(tileInfoFinder, findsOneWidget);
      await tester.tap(tileInfoFinder);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Batch'.tr(), 'NA')),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Expiry date'.tr(), 'NA')),
        findsNothing,
      );
    });
  });
}
