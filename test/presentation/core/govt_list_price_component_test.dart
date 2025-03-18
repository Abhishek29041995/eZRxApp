import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      ),
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
      ],
      child: const Scaffold(
        body: GovtListPriceComponent(
          price: '100',
        ),
      ),
    );
  }

  testWidgets('Show gov price if showGovtListPrice is true', (tester) async {
    await tester.pumpWidget(getScopedWidget());
    await tester.pump();
    expect(find.byType(PriceComponent), findsOneWidget);
  });

  testWidgets('Hide gov price if showGovtListPrice is false', (tester) async {
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeMYSalesOrgConfigs,
      ),
    );
    await tester.pumpWidget(getScopedWidget());
    await tester.pump();
    expect(find.byType(PriceComponent), findsNothing);
  });
}
