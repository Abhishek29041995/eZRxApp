import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late MaterialInfo materialMock;
  late List<StockInfo> stockMock;

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    materialMock =
        (await MaterialListLocalDataSource().getProductList()).products.first;
    stockMock = (await StockInfoLocalDataSource().getMaterialStockInfoList())
        .firstWhere(
          (e) => e.materialNumber == materialMock.materialNumber,
        )
        .stockInfos;
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getScopedWidget(MaterialInfo materialInfo) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: Material(
        child: StockLabel(materialInfo: materialInfo),
      ),
    );
  }

  group('StockLabel widget', () {
    final stockWidget = find.byKey(WidgetKeys.materialListStockLabel);

    testWidgets('Hide when salesOrg disable show stock info', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      final noStockMaterialMock = materialMock.copyWith(
        stockInfos: [stockMock.first.copyWith(inStock: MaterialInStock('NO'))],
      );

      await tester.pumpWidget(getScopedWidget(noStockMaterialMock));
      await tester.pumpAndSettle();

      expect(stockWidget, findsNothing);
    });

    testWidgets(
        'Hide when salesOrg enable show stock info & material is in stock',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      final inStockMaterialMock = materialMock.copyWith(stockInfos: stockMock);

      await tester.pumpWidget(getScopedWidget(inStockMaterialMock));
      await tester.pumpAndSettle();

      expect(stockWidget, findsNothing);
    });

    testWidgets(
        'Hide when salesOrg enable show stock info & material is loading stock',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget(materialMock));
      await tester.pumpAndSettle();

      expect(stockWidget, findsNothing);
    });

    testWidgets(
        'Show when salesOrg enable show stock info & material is not in stock',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      final noStockMaterialMock = materialMock.copyWith(
        stockInfos: [stockMock.first.copyWith(inStock: MaterialInStock('NO'))],
      );

      await tester.pumpWidget(getScopedWidget(noStockMaterialMock));
      await tester.pumpAndSettle();

      expect(stockWidget, findsOneWidget);
    });
  });
}
