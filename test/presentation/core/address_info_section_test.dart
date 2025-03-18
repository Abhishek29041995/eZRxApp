import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CustomerInformation customerInformationMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerLazySingleton(() => AppRouter());
    customerInformationMock =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });

  group('Address Info Section Test', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = locator<AppRouter>();
    });

    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Center(
          child: AddressInfoSection.noAction(),
        ),
      );
    }

    testWidgets('Test customer code address in proper format', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: customerInformationMock.soldToInformation.last,
          shipToInfo:
              customerInformationMock.soldToInformation.last.shipToInfos.first,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final customerCodeTextFinder =
          find.textContaining('Customer code: 0030082707');
      final fullCustomerAddressFinder = find.textContaining(
        'RSD HOSPITALS SDN BHD (SJMC)   t/a SUBANG JAYA MEDICAL CENTRE, NO 1 JALAN SS 12/1A, 47500 SUBANG JAYA SELANGOR, PETALINGx, PETALING JAYAx 47500',
      );

      expect(customerCodeTextFinder, findsOneWidget);
      expect(fullCustomerAddressFinder, findsOneWidget);
    });

    testWidgets('Test ship to code address in proper format', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: customerInformationMock.soldToInformation.last,
          shipToInfo:
              customerInformationMock.soldToInformation.last.shipToInfos.first,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final customerCodeTextFinder =
          find.textContaining('Delivery to: 0070149863');
      final fullCustomerAddressFinder = find.textContaining(
        'RSD HOSPITALS SDN BHD (SJMC) t/a SUBANG JAYA MEDICAL CENTRE, NO 1 JALAN SS 12/1A, 47500 SUBANG, JAYA, PETALING, PETALING JAYA 47500',
      );

      expect(customerCodeTextFinder, findsOneWidget);
      expect(fullCustomerAddressFinder, findsOneWidget);
    });
  });
}
