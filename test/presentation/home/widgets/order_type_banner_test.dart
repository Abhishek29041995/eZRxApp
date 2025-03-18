import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/order_type.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/widgets/order_type_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
  });

  setUp(() {
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Material(
        child: OrderTypeBanner(),
      ),
    );
  }

  group('OrderTypeBanner test => ', () {
    testWidgets('Display nothing when isShowOrderType is false',
        (tester) async {
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable([
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Show ListTile when isShowOrderType is true', (tester) async {
      when(
        () => eligibilityBlocMock.state,
      ).thenAnswer(
        (_) => EligibilityState.initial().copyWith(
          user: fakeSalesRepUser.copyWith(enableOrderType: true),
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            orderTypes: [
              OrderType.empty().copyWith(categoryId: DocumentType('zpvf')),
            ],
          ),
        ),
      );

      when(() => autoRouterMock.push(const SelectOrderTypeBottomSheetRoute()))
          .thenAnswer((_) => Future.value());

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(find.byType(ListTile), findsOneWidget);
      final icon = find.byIcon(Icons.edit_outlined);
      expect(icon, findsOneWidget);
      await tester.tap(icon);
      verify(() => autoRouterMock.push(const SelectOrderTypeBottomSheetRoute()))
          .called(1);
    });
  });
}
