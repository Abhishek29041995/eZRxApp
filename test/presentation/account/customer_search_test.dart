import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../utils/widget_utils.dart';
import '../../common_mock_data/mock_other.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements AutoRoutePage {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late CustomerInformation customerInformationMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late MixpanelService mixpanelService;

  //final fakeMaterialNumber = MaterialNumber('000000000023168451');
  // final fakeMaterialInfo = MaterialInfo(
  //   quantity: 0,
  //   ean: '2234567890',
  //   materialNumber: fakeMaterialNumber,
  //   materialDescription: "Reag Cup 15ml 1'S",
  //   governmentMaterialCode: '',
  //   therapeuticClass: 'All other non-therapeutic products',
  //   itemBrand: 'Item not listed in I',
  //   principalData: PrincipalData(
  //     principalName: PrincipalName('台灣羅氏醫療診斷設備(股)公司'),
  //     principalCode: PrincipalCode('0000102004'),
  //   ),
  //   taxClassification: MaterialTaxClassification('Product : Full Tax'),
  //   itemRegistrationNumber: 'NA',
  //   unitOfMeasurement: 'EA',
  //   materialGroup2: MaterialGroup.two(''),
  //   materialGroup4: MaterialGroup.four('OTH'),
  //   isSampleMaterial: false,
  //   hidePrice: false,
  //   hasValidTenderContract: false,
  //   hasMandatoryTenderContract: false,
  //   taxes: ['5'],
  //   bundles: [],
  //   defaultMaterialDescription: '',
  //   isFOCMaterial: false,
  //   remarks: '',
  //   genericMaterialName: '',
  // );
  final fakeUserWithMultiSalesOrgs = User.empty().copyWith(
    userSalesOrganisations: [
      fakeHKSalesOrganisation,
      fakeIDSalesOrganisation,
    ],
  );
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    mixpanelService = MixpanelServiceMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => mixpanelService);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Customer Search Screen', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = AutoRouteMock();
      eligibilityBlocMock = EligibilityBlocMock();
      customerInformationMock =
          await CustomerCodeLocalDataSource().getCustomerCodeList();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(isFetching: false));
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
    });
    tearDownAll(() {
      locator.unregister<AppRouter>();
    });

    RouteDataScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const CustomerSearchPage(),
      );
    }

    testWidgets('Load customer Search Widget', (tester) async {
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(
          [
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ],
        ),
      );
      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(
          [
            CustomerCodeState.initial().copyWith(
              searchKey: SearchKey.empty(),
              isFetching: false,
              apiFailureOrSuccessOption: none(),
              customerCodeList: [
                CustomerCodeInfo.empty(),
              ],
            ),
            CustomerCodeState.initial().copyWith(
              searchKey: SearchKey.search('GSK'),
              isFetching: true,
              apiFailureOrSuccessOption: optionOf(
                const Right(unit),
              ),
              customerCodeList: [
                CustomerCodeInfo.empty(),
              ],
            ),
          ],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);
      expect(customerSearchPage, findsOneWidget);
    });

    testWidgets('verify back button on customer search', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );

      when(() => autoRouterMock.maybePop()).thenAnswer((_) async {
        Navigator.of(tester.element(find.byType(Navigator))).pop();
        return true;
      });

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final backButton = find.byKey(WidgetKeys.backButton);
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      verify(() => autoRouterMock.maybePop()).called(1);
    });

    testWidgets('verify error api customer search', (tester) async {
      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(
          [
            CustomerCodeState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.other('Fake-Error')),
              ),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final customBar = find.byKey(WidgetKeys.customSnackBar);
      expect(customBar, findsOneWidget);
    });

    testWidgets('verify none api customer search', (tester) async {
      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(
          [
            CustomerCodeState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(
                const Right(unit),
              ),
            ),
            CustomerCodeState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: none(),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final customBar = find.byKey(WidgetKeys.customSnackBar);
      expect(customBar, findsNothing);
    });

    testWidgets(
      'Find Full Ship To Name',
      (tester) async {
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            isFetching: false,
            customerCodeList: [fakeCustomerCodeInfo],
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());

        await tester.pumpAndSettle();

        final shipToName =
            find.text('fake-name1 fake-name2 fake-name3 fake-name4');
        expect(shipToName, findsOneWidget);

        final shipToAddress = find.byKey(
          WidgetKeys.shipToAddressOption(
            fakeCustomerCodeInfo.shipToInfos[0].shipToCustomerCode,
          ),
        );
        expect(shipToAddress, findsOneWidget);
        await tester.tap(shipToAddress);
        await tester.pumpAndSettle();

        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.shipToAddressSave,
            properties: {
              TrackingProps.shipToAddress:
                  fakeCustomerCodeInfo.shipToInfos[0].shipToCustomerCode,
            },
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Verify Change delivery address',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(shipToInfo: fakeShipToInfo2),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            isFetching: false,
            customerCodeList: [fakeCustomerCodeInfo],
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        when(() => cartBlocMock.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [PriceAggregate.empty()],
          ),
        );

        when(() => autoRouterMock.maybePop())
            .thenAnswer((invocation) async => true);

        await tester.pumpWidget(getScopedWidget());

        await tester.pumpAndSettle();

        final shipToAddress = find.byKey(
          WidgetKeys.shipToAddressOption(
            fakeCustomerCodeInfo.shipToInfos[0].shipToCustomerCode,
          ),
        );
        expect(shipToAddress, findsOneWidget);
        await tester.tap(shipToAddress);
        await tester.pumpAndSettle();
        // expect to find bottom sheet contain deliveryAddress
        final changeDeliveryAddress = find.text('Change delivery address?');
        expect(changeDeliveryAddress, findsOneWidget);
        // tap cancel button
        final closeButton = find.byKey(WidgetKeys.cancelButton);
        expect(closeButton, findsOneWidget);
        await tester.tap(closeButton);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.maybePop()).called(1);
        // tap confirm button
        final confirmButton = find.byKey(WidgetKeys.confirmButton);
        expect(confirmButton, findsOneWidget);
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();
        verify(
          () =>
              autoRouterMock.popUntilRouteWithName('HomeNavigationTabbarRoute'),
        ).called(1);
      },
    );

    testWidgets('Test have customer code list and emit load more state include',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: true,
        ),
      ];

      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(expectedCustomerCodeListStates),
        initialState: customerCodeBlocMock.state.copyWith(
          isFetching: false,
          canLoadMore: true,
          customerCodeList: customerInformationMock.soldToInformation,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();

      final noCustomerFound = find.text('No Customer Code Found');
      final loadIndicator = find.byKey(WidgetKeys.loaderImage);

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsOneWidget);
      expect(noCustomerFound, findsNothing);
    });

    testWidgets(
        'Test have customer code list and emit load more state include and found no data',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [],
        ),
      ];

      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(expectedCustomerCodeListStates),
        initialState: customerCodeBlocMock.state.copyWith(
          isFetching: true,
          canLoadMore: true,
          customerCodeList: customerInformationMock.soldToInformation,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pumpAndSettle();

      final noCustomerFound = find.text("That didn't match anything");
      final loadIndicator = find.byKey(const Key('loadIndicator'));

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsNothing);
      expect(noCustomerFound, findsOneWidget);
    });

    testWidgets('Test Customer Code Address should in proper format',
        (tester) async {
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [customerInformationMock.soldToInformation.last],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);
      const fullShipToAddress =
          't/a SUBANG JAYA MEDICAL CENTRE, NO 1 JALAN SS 12/1A, 47500 SUBANG, JAYA, PETALING, PETALING JAYA 47500';
      final shipToAddressFinder = find.textContaining(fullShipToAddress);

      expect(customerSearchPage, findsOneWidget);
      expect(shipToAddressFinder, findsOneWidget);
    });

    testWidgets(
        'Test have customer code list and change sale org should reset selected shipTo and customer code',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(user: fakeUserWithMultiSalesOrgs),
      );
      final expectedSalesOrgStates = [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2501'),
          ),
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2500')),
          isLoading: false,
        ),
      ];

      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: customerInformationMock.soldToInformation,
        ),
      );

      whenListen(
        salesOrgBlocMock,
        Stream.fromIterable(expectedSalesOrgStates),
        initialState: SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2501'),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);
      expect(customerSearchPage, findsOneWidget);
      verify(
        () => eligibilityBlocMock.add(
          EligibilityEvent.selectedCustomerCode(
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'Test have customer code list and change sale org when not have sale org previously should not reset selected shipTo and customer code',
        (tester) async {
      final expectedSalesOrgStates = [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2500')),
          isLoading: false,
        ),
      ];

      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: customerInformationMock.soldToInformation,
        ),
      );

      whenListen(
        salesOrgBlocMock,
        Stream.fromIterable(expectedSalesOrgStates),
        initialState: SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2501'),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);
      expect(customerSearchPage, findsOneWidget);
      verifyNever(
        () => eligibilityBlocMock.add(
          EligibilityEvent.selectedCustomerCode(
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
      );
    });

    testWidgets(
        'The app bar should not display the flag if there is only one sales org',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
        ),
      );
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [fakeCustomerCodeInfo],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeHKSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final customerFlag = find.byKey(WidgetKeys.countryFlag);
      expect(customerFlag, findsNothing);
    });

    testWidgets('The app bar should display the HK flag.', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(user: fakeUserWithMultiSalesOrgs),
      );
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [customerInformationMock.soldToInformation.last],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeHKSalesOrganisation,
        ),
      );
      when(
        () => autoRouterMock.push(
          SalesOrgSearchRoute(
            avialableSalesOrgList:
                UserState.initial().user.userSalesOrganisations,
          ),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final countryFlag = find.byKey(WidgetKeys.countryFlag);
      expect(countryFlag, findsOneWidget);
      await tester.tap(countryFlag);
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.fetchAvailableSalesOrg(
            avialableSalesOrgList:
                UserState.initial().user.userSalesOrganisations,
          ),
        ),
      ).called(1);
    });

    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        customerCodeBlocMock,
        Stream.fromIterable(
          [
            CustomerCodeState.initial().copyWith(
              searchKey: SearchKey.search(searchKey),
              isFetching: false,
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });

    testWidgets('Verify Search bar behavior', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final searchField = find.byKey(WidgetKeys.searchBar);

      // test onChanged function
      await tester.enterText(searchField, 'new value');
      // this pump 2 second to bypass the debounce rule
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('new value'),
          ),
        ),
      ).called(1);

      // test on submit action
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.search('new value'),
          ),
        ),
      ).called(1);

      // test on clear button
      final clearButton = find.byKey(WidgetKeys.clearIconKey);
      await tester.tap(clearButton);
      await tester.pumpAndSettle();
      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test onRefresh', (tester) async {
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [fakeCustomerCodeInfo],
        ),
      );

      await tester.pumpWidget(getScopedWidget());

      await tester.pumpAndSettle();

      // Simulate the refresh action
      await tester.drag(
        find.byKey(WidgetKeys.customerCodeList),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle();

      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetch(
            searchValue: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });
  });
}
