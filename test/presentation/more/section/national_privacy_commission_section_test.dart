import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/national_privacy_commission_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;

  final nationalPrivacyCommissionTile =
      find.byKey(WidgetKeys.nationalPrivacyCommissionTile);

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    eligibilityBlocMock = EligibilityBlocMock();
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
  });
  setUp(() {
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
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
      child: const Material(
        child: NationalPrivacyCommissionSection(),
      ),
    );
  }

  group('National Privacy Commission Section', () {
    testWidgets(
      'Test UI on non PH market',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrganisation: fakeMYSalesOrganisation),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          nationalPrivacyCommissionTile,
          findsNothing,
        );
        expect(find.text('National Privacy Commission'.tr()), findsNothing);
      },
    );

    testWidgets(
      'Test UI on PH market',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrganisation: fakePHSalesOrganisation),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          nationalPrivacyCommissionTile,
          findsOneWidget,
        );
        expect(find.text('National Privacy Commission'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      'Test tap on View seal',
      (tester) async {
        when(
          () => autoRouterMock.navigate(
            const NationalPrivacyCommissionPageRoute(),
          ),
        ).thenAnswer((_) => Future.value());
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrganisation: fakePHSalesOrganisation),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.tap(nationalPrivacyCommissionTile);
        await tester.pumpAndSettle();
        verify(
          () => autoRouterMock.navigate(
            const NationalPrivacyCommissionPageRoute(),
          ),
        ).called(1);
      },
    );
  });
}
