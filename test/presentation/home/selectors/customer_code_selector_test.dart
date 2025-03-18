import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
  });
  final fakeCustomerInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: '00001234',
    shipToInfos: [
      ShipToInfo.empty().copyWith(
        shipToCustomerCode: '00001234',
      ),
    ],
  );

  final fakeCustomerInfo2 = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: '00001235',
    shipToInfos: [
      ShipToInfo.empty().copyWith(
        shipToCustomerCode: '00001235',
      ),
    ],
  );

  final fakeCustomerInfo3 = CustomerCodeInfo.empty().copyWith(
    shipToInfos: [
      ShipToInfo.empty().copyWith(
        shipToName: ShipToName.empty().copyWith(
          name1: 'test-name-1',
          name2: 'test-name-2',
          name3: 'test-name-3',
          name4: 'test-name-4',
        ),
        shipToAddress: ShipToAddress.empty().copyWith(
          city1: 'test-city-1',
          city2: 'test-city-2',
          street2: 'test-street-2',
          street3: 'test-street-3',
          street4: 'test-street-4',
          street5: 'test-street-5',
          street: 'test-street',
        ),
        postalCode: 'test-postal-code',
      ),
    ],
  );

  group('Customer Code Selector Test ', () {
    setUp(() {
      mockCustomerCodeBloc = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();

      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial()
            .copyWith(customerCodeList: [fakeCustomerInfo]),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
    });

    Widget getWidget({usingLocalization = false}) =>
        WidgetUtils.getScopedWidget(
          autoRouterMock: locator<AppRouter>(),
          usingLocalization: usingLocalization,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<CustomerCodeBloc>(
                create: (context) => mockCustomerCodeBloc,
              ),
              BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock,
              ),
            ],
            child: const Material(
              child: Scaffold(
                body: CustomerCodeSelector(),
              ),
            ),
          ),
        );

    testWidgets('When customerCodeInfo is empty', (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [CustomerCodeInfo.empty()],
        ),
      );

      await tester.pumpWidget(getWidget(usingLocalization: true));
      await tester.pump();
      final selectedCustomerCodeText = find.text('NA');
      expect(selectedCustomerCodeText, findsNWidgets(2));
    });

    testWidgets('When customerCodeInfo is not empty', (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [fakeCustomerInfo],
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeCustomerInfo.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getWidget());
      final selectedCustomerCodeText =
          find.text(fakeCustomerInfo.shipToInfos.first.shipToCustomerCode);
      expect(selectedCustomerCodeText, findsOneWidget);
    });

    testWidgets('When customerCodeInfo is getting fetched', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          isLoadingCustomerCode: true,
        ),
      );
      await tester.pumpWidget(getWidget());
      final shimmer = find.byType(Shimmer);
      expect(shimmer, findsNWidgets(2));
    });

    testWidgets('When there is an error', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [
            CustomerCodeInfo.empty(),
          ],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedCustomerCodeListStates),
      );

      await tester.pumpWidget(getWidget());
      final selectedCustomerCodeText = find.text('00001234');
      expect(selectedCustomerCodeText, findsNothing);
    });

    testWidgets('When customerCodeInfo got changed', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [
            fakeCustomerInfo2,
          ],
          apiFailureOrSuccessOption: optionOf(const Right(null)),
        ),
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedCustomerCodeListStates),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerInfo2,
          shipToInfo: fakeCustomerInfo2.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedCustomerCodeText1 = find.text('00001235');
      expect(selectedCustomerCodeText1, findsOneWidget);
    });

    testWidgets('When customerCodeInfo got changed from Previous error State',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [
            CustomerCodeInfo.empty(),
          ],
          apiFailureOrSuccessOption: none(),
        ),
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedCustomerCodeListStates),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeCustomerInfo2.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedCustomerCodeText1 = find.text('00001235');
      expect(selectedCustomerCodeText1, findsOneWidget);
      await tester.pump();
      final customerCodeSelect =
          find.byKey(const ValueKey('customerCodeSelect'));
      await tester.ensureVisible(customerCodeSelect.first);
      await tester.pumpAndSettle();
      await tester.tap(customerCodeSelect.first);
      expect(
        locator<AppRouter>().current.route.name,
        CustomerSearchPageRoute.name,
      );
    });

    testWidgets('Validate if delivery address is displayed in correct format',
        (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [
            fakeCustomerInfo3.copyWith(
              customerCodeSoldTo: 'fake-sold-to',
            ),
          ],
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerInfo3.copyWith(
            customerCodeSoldTo: 'fake-sold-to',
          ),
          shipToInfo: fakeCustomerInfo3.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getWidget(usingLocalization: true));
      await tester.pump();

      final deliveryAddress = find.text(
        'test-name-1 test-name-2 test-name-3 test-name-4 test-street, test-street-2, test-street-3, test-street-4, test-street-5, test-city-1, test-city-2 test-postal-code',
      );

      expect(deliveryAddress, findsOneWidget);
    });
  });
}
