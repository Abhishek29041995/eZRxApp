import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_failed/payment_failed_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late NewPaymentBloc newPaymentBloc;
  final isMarketPlaceVariant = ValueVariant<bool>({true, false});

  setUpAll(() async {
    locator.registerSingleton<AppRouter>(AutoRouteMock());
  });

  setUp(() {
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    newPaymentBloc = NewPaymentBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => newPaymentBloc.state).thenReturn(NewPaymentState.initial());
  });

  Widget getWidget({bool isMarketPlace = false}) => WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        useMediaQuery: true,
        usingLocalization: true,
        routeName: PaymentFailedPageRoute.name,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<NewPaymentBloc>(
            create: (context) => newPaymentBloc,
          ),
        ],
        child: PaymentFailedPage(isMarketPlace: isMarketPlace),
      );

  group('Payment failed page test =>', () {
    testWidgets('Should display appbar and pop when tap close', (tester) async {
      when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final closeButton = find.byKey(WidgetKeys.closeButton);
      final appbar = find.byType(AppBar);
      expect(
        find.descendant(
          of: appbar,
          matching: find.text('Payment request failed'),
        ),
        findsOne,
      );
      expect(
        find.descendant(of: appbar, matching: closeButton),
        findsOne,
      );
      await tester.tap(closeButton);
      await tester.pumpAndSettle();
      verify(() => autoRouterMock.maybePop()).called(1);
    });

    testWidgets('Should display body with messages', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Unfortunately there was an error from payment gateway while processing your payment.',
        ),
        findsOne,
      );
      expect(
        find.text(
          'Please delete the payment advice and generate a new payment advice.',
        ),
        findsOne,
      );
      expect(
        find.text(
          'Alternatively, you may visit the payment summary page to try again.',
        ),
        findsOne,
      );
    });

    testWidgets(
      'Should display footer button',
      (tester) async {
        final isMarketPlace = isMarketPlaceVariant.currentValue!;
        when(
          () => autoRouterMock
              .push(PaymentSummaryPageRoute(isMarketPlace: isMarketPlace)),
        ).thenAnswer((_) async => true);

        await tester.pumpWidget(getWidget(isMarketPlace: isMarketPlace));
        await tester.pumpAndSettle();

        final paymentSummaryButton =
            find.byKey(WidgetKeys.paymentSummaryRouteButton);

        expect(paymentSummaryButton, findsOne);
        expect(
          find.descendant(
            of: paymentSummaryButton,
            matching: find.text(
              isMarketPlace ? 'MP Payment summary' : 'Payment summary',
            ),
          ),
          findsOne,
        );
        await tester.tap(paymentSummaryButton);
        await tester.pumpAndSettle();

        verify(
          () => autoRouterMock.push(
            PaymentSummaryPageRoute(isMarketPlace: isMarketPlace),
          ),
        ).called(1);
      },
      variant: isMarketPlaceVariant,
    );
  });
}
