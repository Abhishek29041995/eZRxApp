import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_request_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late ReturnListByRequestBloc mockReturnListByRequestBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late List<ReturnItem> fakeReturnItemList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockReturnListByRequestBloc = ReturnListByRequestBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    fakeReturnItemList =
        await ReturnListLocalDataSource().fetchReturnByRequests();
  });

  group('Return By Request Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockReturnListByRequestBloc.state)
          .thenReturn(ReturnListByRequestState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => mockSalesOrgBloc,
          ),
          BlocProvider<UserBloc>(
            create: (context) => mockUserBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ReturnListByRequestBloc>(
            create: (context) => mockReturnListByRequestBloc,
          ),
        ],
        child: const Scaffold(body: ReturnByRequestPage()),
      );
    }

    testWidgets('Return By Request Page Body Test - loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );
      when(() => mockReturnListByRequestBloc.state).thenReturn(
        ReturnListByRequestState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        ReturnListByRequestState.initial()
            .copyWith(isFetching: true, returnItemList: []),
      ];
      whenListen(
        mockReturnListByRequestBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
      await tester.pump();
    });

    testWidgets('Return By Request Page Body Test - Success', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );
      when(() => mockReturnListByRequestBloc.state).thenReturn(
        ReturnListByRequestState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        ReturnListByRequestState.initial()
            .copyWith(isFetching: false, returnItemList: fakeReturnItemList),
      ];
      whenListen(
        mockReturnListByRequestBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.returnRequest('0')),
        findsOneWidget,
      );
      expect(
        find.byType(StatusLabel),
        findsAtLeastNWidgets(2),
      );
      expect(
        find.textContaining(
          mockReturnListByRequestBloc
              .state.returnItemList.first.status.displayStatusForViewByRequest,
        ),
        findsAtLeastNWidgets(2),
      );
      await tester.pump();
    });

    testWidgets('Return By Request Page quantity text validation find 1 item',
        (tester) async {
      when(() => mockReturnListByRequestBloc.state).thenReturn(
        ReturnListByRequestState.initial().copyWith(
          returnItemList: [fakeReturnItemList.first],
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.text('1 item'), findsOneWidget);
    });

    testWidgets(
      '=> Find Customer name',
      (tester) async {
        when(() => mockReturnListByRequestBloc.state).thenReturn(
          ReturnListByRequestState.initial().copyWith(
            returnItemList: [
              ReturnItem.empty().copyWith(customerName: 'fake-customerName'),
            ],
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasBonusOverride: true,
            ),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final customerName = find.text('fake-customerName');

        expect(customerName, findsOneWidget);
      },
    );

    testWidgets(
      'on load more',
      (tester) async {
        when(() => mockReturnListByRequestBloc.state).thenReturn(
          ReturnListByRequestState.initial().copyWith(
            returnItemList: [
              ...fakeReturnItemList,
              ...fakeReturnItemList,
              ...fakeReturnItemList,
            ],
            isFetching: true,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.scrollUntilVisible(
          find.byKey(WidgetKeys.loadMoreLoader),
          200,
        );
      },
    );
  });
}
