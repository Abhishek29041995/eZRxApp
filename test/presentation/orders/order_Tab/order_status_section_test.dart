import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_status_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  final fakeOrderStep = OrderStepValue('out for redelivery');
  final fakeOrderStatus =
      await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();

  setUpAll(() {
    locator.registerFactory<AppRouter>(() => AutoRouteMock());
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() => WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(create: (_) => eligibilityBlocMock),
        ],
        child: Material(
          child: OrderStatusSection(
            steps: fakeOrderStep.viewByItemHistorySteps
                .updatedOutOfDeliverySubSteps(fakeOrderStatus),
            deliveryDateTitle: '',
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
      );

  group('OrderStatusSection Test', () {
    testWidgets(
        'Should display exact datetime from data (now allow DateTime parse to local)',
        (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      expect(find.text('08 Jun 2024'), findsOne);
      expect(find.text('12:26AM'), findsOne);
      expect(find.text('Delivered'), findsOne);
    });
  });
}
