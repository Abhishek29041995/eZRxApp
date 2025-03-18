import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  late ReturnListByItemBloc mockReturnListByItemBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ProductImageBloc mockProductImageBloc;
  late ReturnSummaryDetailsBloc mockReturnSummaryDetailsBloc;
  late AuthBloc mockAuthBloc;
  late List<ReturnItem> fakeReturnItemList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
  });
  setUp(() async {
    mockSalesOrgBloc = SalesOrgBlocMock();
    mockUserBloc = UserBlocMock();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    mockEligibilityBloc = EligibilityBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockAnnouncementBloc = AnnouncementBlocMock();
    mockReturnSummaryDetailsBloc = ReturnSummaryDetailsBlocMock();
    mockProductImageBloc = ProductImageBlocMock();
    mockReturnListByItemBloc = ReturnListByItemBlocMock();
    fakeReturnItemList = await ReturnListLocalDataSource().fetchReturnByItems();
  });

  group(
    'Return By Item Page',
    () {
      setUp(() {
        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => mockUserBloc.state).thenReturn(UserState.initial());
        when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
        when(() => mockCustomerCodeBloc.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => mockEligibilityBloc.state)
            .thenReturn(EligibilityState.initial());
        when(() => mockReturnListByItemBloc.state)
            .thenReturn(ReturnListByItemState.initial());
        when(() => mockAnnouncementBloc.state)
            .thenReturn(AnnouncementState.initial());
        when(() => mockProductImageBloc.state)
            .thenReturn(ProductImageState.initial());
        when(() => mockReturnSummaryDetailsBloc.state)
            .thenReturn(ReturnSummaryDetailsState.initial());
      });

      RouteDataScope getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
            BlocProvider<AnnouncementBloc>(
              create: (context) => mockAnnouncementBloc,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => mockEligibilityBloc,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<UserBloc>(create: (context) => mockUserBloc),
            BlocProvider<ReturnListByItemBloc>(
              create: (context) => mockReturnListByItemBloc,
            ),
            BlocProvider<ReturnSummaryDetailsBloc>(
              create: (context) => mockReturnSummaryDetailsBloc,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
          ],
          child: const Scaffold(body: ReturnByItemPage()),
        );
      }

      testWidgets('Return Item page Body Test - loading', (tester) async {
        when(() => mockEligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
          ),
        );
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            isFetching: true,
          ),
        );
        final expectedStates = [
          ReturnListByItemState.initial()
              .copyWith(isFetching: true, returnItemList: []),
        ];
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.loaderImage),
          findsOneWidget,
        );
      });

      testWidgets('Return Item page Body Test - Success', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(isFetching: true),
        );
        final expectedStates = [
          ReturnListByItemState.initial().copyWith(
            returnItemList: fakeReturnItemList
                .where((e) => !e.isMarketPlace)
                .take(1)
                .toList(),
          ),
        ];
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.returnItem('0')),
          findsOneWidget,
        );
        expect(find.byType(MarketPlaceLogo), findsNothing);
        expect(
          find.byType(StatusLabel),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            mockReturnListByItemBloc
                .state.returnItemList.first.status.displayStatus,
          ),
          findsOneWidget,
        );
      });

      testWidgets('Return Item page Body Test with marketplace - Success',
          (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            returnItemList: fakeReturnItemList
                .where((e) => e.isMarketPlace)
                .take(1)
                .toList(),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final itemTile = find.byKey(WidgetKeys.returnItem('0'));

        expect(
          find.descendant(
            of: itemTile,
            matching: find.byType(MarketPlaceLogo),
          ),
          findsOne,
        );

        expect(
          find.descendant(
            of: itemTile,
            matching: find.text('Batch: NA - Expires: NA'),
          ),
          findsOne,
        );
      });
      testWidgets(
        'Return Item page Body Test - Return Item Tap',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial(),
          );
          final expectedStates = [
            ReturnListByItemState.initial().copyWith(
              isFetching: true,
            ),
            ReturnListByItemState.initial().copyWith(
              isFetching: false,
              returnItemList: [fakeReturnItemList.first],
            ),
          ];
          whenListen(
            mockReturnListByItemBloc,
            Stream.fromIterable(expectedStates),
          );

          await tester.pumpWidget(getWUT());
          await tester.pumpAndSettle();

          expect(
            find.byKey(WidgetKeys.returnItem('0')),
            findsOneWidget,
          );
          expect(
            find.byKey(WidgetKeys.returnInvoiceId),
            findsOneWidget,
          );
          expect(
            find.text('Invoice #${fakeReturnItemList.first.invoiceID}'),
            findsOneWidget,
          );
          final findReturnItemTile = find.byKey(WidgetKeys.returnItemKey);
          expect(
            findReturnItemTile,
            findsOneWidget,
          );
          await tester.tap(findReturnItemTile);
          await tester.pump();
          expect(
            autoRouterMock.current.name ==
                'ReturnRequestSummaryByItemDetailsRoute',
            true,
          );
        },
      );

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => mockEligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
            ),
          );
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(outsidePolicy: true),
                ReturnItem.empty().copyWith(outsidePolicy: false),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byKey(WidgetKeys.returnItemKey);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
      testWidgets(
        '=> display outside return policy tag when toggle is off',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(outsidePolicy: true),
                ReturnItem.empty().copyWith(outsidePolicy: false),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byKey(WidgetKeys.returnItemKey);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );

      testWidgets('Return Item bonus', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            returnItemList: [
              fakeReturnItemList.first,
            ],
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.returnItem('0')),
          findsOneWidget,
        );
        expect(
          find.byType(BonusTag),
          findsOneWidget,
        );
      });

      testWidgets(
        '=> Find Customer name',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(customerName: 'fake-customerName'),
              ],
            ),
          );
          when(() => mockEligibilityBloc.state).thenReturn(
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
          final cardFinder = find.byKey(WidgetKeys.returnItemKey);
          final customerName = find.text('fake-customerName');
          expect(cardFinder, findsOneWidget);
          expect(customerName, findsNothing);
        },
      );

      testWidgets(
        'on load more',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
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

      testWidgets(
        '=> display WareHouse Storage Condition tag',
        (tester) async {
          when(() => mockEligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
            ),
          );
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(
                  wareHouseStorageCondition: StorageCondition('AC'),
                ),
                ReturnItem.empty().copyWith(
                  wareHouseStorageCondition: StorageCondition('FZ'),
                ),
                ReturnItem.empty().copyWith(
                  wareHouseStorageCondition: StorageCondition(''),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byKey(WidgetKeys.returnItemKey);
          final wareHouseStorageConditionTag =
              find.byKey(WidgetKeys.wareHouseStorageConditionTag);
          expect(cardFinder, findsNWidgets(3));
          expect(wareHouseStorageConditionTag, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.text('Air Conditioned'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.at(1),
              matching: find.text('Freezer'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.wareHouseStorageConditionTag),
            ),
            findsNothing,
          );
        },
      );
    },
  );
}
