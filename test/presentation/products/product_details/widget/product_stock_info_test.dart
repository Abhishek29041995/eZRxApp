import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/product_stock_info.dart';
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

class TenderContractDetailBlocMock
    extends MockBloc<TenderContractDetailEvent, TenderContractDetailState>
    implements TenderContractDetailBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ProductDetailBloc productDetailMockBloc;
  late EligibilityBloc eligibilityBlocMock;
  late TenderContractDetailBloc tenderContractDetailBloc;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    autoRouterMock = locator<AppRouter>();
    productDetailMockBloc = ProductDetailsMockBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    tenderContractDetailBloc = TenderContractDetailBlocMock();
    when(() => productDetailMockBloc.state)
        .thenReturn(ProductDetailState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => tenderContractDetailBloc.state).thenReturn(
      TenderContractDetailState.initial(),
    );
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
        BlocProvider<TenderContractDetailBloc>(
          create: ((context) => tenderContractDetailBloc),
        ),
      ],
      child: Material(
        child: ProductStockInfo(
          materialNumber: MaterialNumber('fake-material-Number'),
        ),
      ),
    );
  }

  group('Product Stock Info Test', () {
    testWidgets('Show Stock Info When Config Disabled', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoadingShimmer), findsNothing);
    });
    testWidgets('Show Shimmer when loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => productDetailMockBloc.state).thenReturn(
        ProductDetailState.initial().copyWith(
          isStockFetching: true,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('Show Stock Info When Loading Is Done', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      final expectedStates = Stream.fromIterable(
        [
          ProductDetailState.initial().copyWith(
            isStockFetching: true,
          ),
          ProductDetailState.initial(),
        ],
      );
      whenListen(productDetailMockBloc, expectedStates);
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byType(LoadingShimmer), findsNothing);
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
    });
  });
}
