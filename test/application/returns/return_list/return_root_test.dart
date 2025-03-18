import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnListByItemBlocMock
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockProductImageBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockReturnSummaryDetailsBloc
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class MockReturnListByRequestBloc
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class MockViewByItemReturnFilterBloc
    extends MockBloc<ViewByItemReturnFilterEvent, ViewByItemReturnFilterState>
    implements ViewByItemReturnFilterBloc {}

class MockViewByRequestReturnFilterBloc extends MockBloc<
    ViewByRequestReturnFilterEvent,
    ViewByRequestReturnFilterState> implements ViewByRequestReturnFilterBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

final locator = GetIt.instance;

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
  late ViewByItemReturnFilterBloc mockViewByItemReturnFilterBloc;
  late ViewByRequestReturnFilterBloc mockViewByRequestReturnFilterBloc;
  late AuthBloc mockAuthBloc;
  late ReturnListByRequestBloc mockReturnListByRequestBloc;
  late ProductImageBlocMock productImageBlocMock;
  final viewByItemTab = find.byKey(
    Key(
      StringUtils.changeToCamelCase(sentence: 'View by items'),
    ),
  );

  final viewByRequest = find.byKey(
    Key(
      StringUtils.changeToCamelCase(sentence: 'View by return requests'),
    ),
  );
  final customSearchBar = find.byKey(WidgetKeys.searchBar);

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  group(
    'Return Root Page Test',
    () {
      setUp(() {
        mockSalesOrgBloc = MockSalesOrgBloc();
        mockUserBloc = MockUserBloc();
        mockCustomerCodeBloc = MockCustomerCodeBloc();
        mockEligibilityBloc = MockEligibilityBloc();
        mockAuthBloc = MockAuthBloc();
        mockAnnouncementBloc = MockAnnouncementBloc();
        mockReturnSummaryDetailsBloc = MockReturnSummaryDetailsBloc();
        mockProductImageBloc = MockProductImageBloc();
        mockReturnListByItemBloc = ReturnListByItemBlocMock();
        mockReturnListByRequestBloc = ReturnListByRequestBlocMock();
        mockViewByItemReturnFilterBloc = MockViewByItemReturnFilterBloc();
        mockViewByRequestReturnFilterBloc = MockViewByRequestReturnFilterBloc();
        productImageBlocMock = ProductImageBlocMock();
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
        when(() => mockReturnListByRequestBloc.state)
            .thenReturn(ReturnListByRequestState.initial());
        when(() => mockViewByItemReturnFilterBloc.state)
            .thenReturn(ViewByItemReturnFilterState.initial());
        when(() => mockViewByRequestReturnFilterBloc.state)
            .thenReturn(ViewByRequestReturnFilterState.initial());
        when(() => productImageBlocMock.state)
            .thenReturn(ProductImageState.initial());
      });

      Widget getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          routeName: ReturnRootRoute.name,
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
            BlocProvider<EligibilityBloc>(
              create: (context) => mockEligibilityBloc,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => mockSalesOrgBloc,
            ),
            BlocProvider<UserBloc>(
              create: (context) => mockUserBloc,
            ),
            BlocProvider<ReturnListByRequestBloc>(
              create: (context) => mockReturnListByRequestBloc,
            ),
            BlocProvider<ReturnListByItemBloc>(
              create: (context) => mockReturnListByItemBloc,
            ),
            BlocProvider<ViewByItemReturnFilterBloc>(
              create: (context) => mockViewByItemReturnFilterBloc,
            ),
            BlocProvider<ViewByRequestReturnFilterBloc>(
              create: (context) => mockViewByRequestReturnFilterBloc,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBlocMock,
            ),
          ],
          child: const ReturnRoot(),
        );
      }

      testWidgets('Return Root Page ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        expect(viewByRequest, findsOneWidget);
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        final returnByRequestRootPage =
            find.byKey(WidgetKeys.returnByRequestRootPage);
        expect(returnByRequestRootPage, findsOneWidget);
      });

      testWidgets('Return Root Page return by item section ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        expect(viewByRequest, findsOneWidget);
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        expect(find.byKey(WidgetKeys.returnByItemsSearchBar), findsOneWidget);
        expect(find.byKey(WidgetKeys.exportReturnByItem), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.returnByItemsFilterButton),
          findsOneWidget,
        );
      });

      testWidgets('Return Root Page return by return section ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        expect(viewByRequest, findsOneWidget);
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.returnByRequestSearchBar), findsOneWidget);
        expect(find.byKey(WidgetKeys.exportReturnByRequest), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.returnByRequestFilterButton),
          findsOneWidget,
        );
      });

      testWidgets('Return Root Page List By Item Search Bar ', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        await tester.tap(viewByItemTab);
        await tester.pumpAndSettle();
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        await tester.pumpAndSettle();
        expect(
          customSearchBar,
          findsOneWidget,
        );
        await tester.enterText(customSearchBar, 'du');
        await tester.pumpAndSettle(
          Duration(milliseconds: locator<Config>().autoSearchTimeout),
        );
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestSearched,
            props: {
              TrackingProps.keyword: 'du',
              TrackingProps.subTabFrom: const ReturnByItemPageRoute().routeName,
            },
          ),
        ).called(1);
        verify(
          () => mockReturnListByItemBloc.add(
            ReturnListByItemEvent.fetch(
              appliedFilter: ReturnFilter.empty(),
              searchKey: SearchKey.search('du'),
            ),
          ),
        ).called(1);
        await tester.enterText(customSearchBar, 'dummy');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestSearched,
            props: {
              TrackingProps.keyword: 'dummy',
              TrackingProps.subTabFrom: const ReturnByItemPageRoute().routeName,
            },
          ),
        ).called(1);
        verify(
          () => mockReturnListByItemBloc.add(
            ReturnListByItemEvent.fetch(
              appliedFilter: ReturnFilter.empty(),
              searchKey: SearchKey.search('dummy'),
            ),
          ),
        ).called(1);
        final clearIconKey = find.byKey(WidgetKeys.clearIconKey);
        expect(clearIconKey, findsOneWidget);
        await tester.tap(clearIconKey);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestSearched,
            props: {
              TrackingProps.keyword: '',
              TrackingProps.subTabFrom: const ReturnByItemPageRoute().routeName,
            },
          ),
        ).called(1);
      });

      testWidgets('Return Root Page List By request Search Bar ',
          (tester) async {
        when(() => mockReturnListByRequestBloc.state).thenReturn(
          ReturnListByRequestState.initial().copyWith(
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByRequest, findsOneWidget);
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        expect(
          customSearchBar,
          findsOneWidget,
        );
        await tester.enterText(customSearchBar, 'du');
        await tester.pumpAndSettle(
          Duration(milliseconds: locator<Config>().autoSearchTimeout),
        );
        await tester.enterText(customSearchBar, 'dummy');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestSearched,
            props: {
              TrackingProps.keyword: 'dummy',
              TrackingProps.subTabFrom:
                  const ReturnByRequestPageRoute().routeName,
            },
          ),
        ).called(1);
        verify(
          () => mockReturnListByRequestBloc.add(
            ReturnListByRequestEvent.fetch(
              appliedFilter: ReturnFilter.empty(),
              searchKey: SearchKey.search('dummy'),
            ),
          ),
        ).called(1);
        final clearIconKey = find.byKey(WidgetKeys.clearIconKey);
        expect(clearIconKey, findsOneWidget);
        await tester.tap(clearIconKey);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestSearched,
            props: {
              TrackingProps.keyword: '',
              TrackingProps.subTabFrom:
                  const ReturnByRequestPageRoute().routeName,
            },
          ),
        ).called(1);
      });

      testWidgets('Return Root Page List By Item Filter ', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            appliedFilter: ReturnFilter.empty()
                .copyWith(returnStatusList: [StatusType('Pending')]),
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        await tester.tap(viewByItemTab);
        await tester.pumpAndSettle();
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        await tester.pumpAndSettle();
        final customBadge = find.byType(
          CustomBadge,
        );
        expect(
          customBadge,
          findsOneWidget,
        );
        await tester.tap(customBadge);
        await tester.pumpAndSettle();
        expect(find.byType(ReturnByItemFilterPage), findsOneWidget);
        verify(
          () => mockViewByItemReturnFilterBloc.add(
            ViewByItemReturnFilterEvent.updateFilterToLastApplied(
              lastAppliedFilter: ReturnFilter.empty()
                  .copyWith(returnStatusList: [StatusType('Pending')]),
            ),
          ),
        ).called(1);
        final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
        expect(filterApplyButton, findsOneWidget);
        final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
        expect(filterResetButton, findsOneWidget);
        await tester.tap(filterResetButton);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestFiltered,
            props: {
              TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
                const ReturnByItemPageRoute().routeName,
              ),
              TrackingProps.filterUsed: [],
            },
          ),
        ).called(1);
        verify(
          () => mockReturnListByItemBloc.add(
            ReturnListByItemEvent.fetch(
              appliedFilter: ReturnFilter.empty(),
              searchKey: SearchKey.search('fake_search_key'),
            ),
          ),
        ).called(1);
      });

      testWidgets('Return Root Page List By request Filter ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByRequest, findsOneWidget);
        when(() => mockReturnListByRequestBloc.state).thenReturn(
          ReturnListByRequestState.initial().copyWith(
            appliedFilter: ReturnFilter.empty()
                .copyWith(returnStatusList: [StatusType('Pending')]),
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        final customBadge = find.byType(
          CustomBadge,
        );
        expect(
          customBadge,
          findsOneWidget,
        );
        await tester.tap(customBadge);
        await tester.pumpAndSettle();
        expect(find.byType(ReturnByRequestFilterPage), findsOneWidget);
        verify(
          () => mockViewByRequestReturnFilterBloc.add(
            ViewByRequestReturnFilterEvent.updateFilterToLastApplied(
              lastAppliedFilter: ReturnFilter.empty()
                  .copyWith(returnStatusList: [StatusType('Pending')]),
            ),
          ),
        ).called(1);
        final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
        expect(filterApplyButton, findsOneWidget);
        final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
        expect(filterResetButton, findsOneWidget);
        await tester.tap(filterResetButton);
        await tester.pumpAndSettle();
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.returnRequestFiltered,
            props: {
              TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
                const ReturnByRequestPageRoute().routeName,
              ),
              TrackingProps.filterUsed: [],
            },
          ),
        ).called(1);
        verify(
          () => mockReturnListByRequestBloc.add(
            ReturnListByRequestEvent.fetch(
              appliedFilter: ReturnFilter.empty(),
              searchKey: SearchKey.search('fake_search_key'),
            ),
          ),
        ).called(1);
      });

      testWidgets('Return Root Page List By Item Export ', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            appliedFilter: ReturnFilter.empty()
                .copyWith(returnStatusList: [StatusType('Pending')]),
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByItemTab, findsOneWidget);
        await tester.tap(viewByItemTab);
        await tester.pumpAndSettle();
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByItem);
        expect(exportReturnByItem, findsOneWidget);
        await tester.pumpAndSettle();
        final exportReturnByItemIcon = find.byIcon(
          Icons.cloud_download_outlined,
        );
        expect(
          exportReturnByItemIcon,
          findsOneWidget,
        );
        await tester.tap(exportReturnByItemIcon);
        await tester.pumpAndSettle();
        verify(
          () => mockReturnListByItemBloc.add(
            const ReturnListByItemEvent.downloadFile(),
          ),
        ).called(1);
      });
      testWidgets('Return Root Page List By Item Export error snack bar',
          (tester) async {
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable([
            ReturnListByItemState.initial().copyWith(
              isDownloadInProgress: true,
            ),
            ReturnListByItemState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake_error'))),
            ),
          ]),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByItem);
        expect(exportReturnByItem, findsOneWidget);
        await tester.pumpAndSettle();
        final customSnackBar = find.byType(
          CustomSnackBar,
        );
        expect(
          customSnackBar,
          findsOneWidget,
        );
        expect(
          find.text('File downloaded successfully'),
          findsNothing,
        );
      });
      testWidgets('Return Root Page List By Item Export snack bar',
          (tester) async {
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable([
            ReturnListByItemState.initial().copyWith(
              isDownloadInProgress: true,
            ),
            ReturnListByItemState.initial().copyWith(
              failureOrSuccessOption: optionOf(const Right(<ReturnItem>[])),
            ),
          ]),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByItem);
        expect(exportReturnByItem, findsOneWidget);
        await tester.pumpAndSettle();
        final customSnackBar = find.byType(
          CustomSnackBar,
        );
        expect(
          customSnackBar,
          findsOneWidget,
        );
        expect(
          find.text('File downloaded successfully'),
          findsOneWidget,
        );
      });
      testWidgets('Return Root Page List By Request Export ', (tester) async {
        when(() => mockReturnListByRequestBloc.state).thenReturn(
          ReturnListByRequestState.initial().copyWith(
            appliedFilter: ReturnFilter.empty()
                .copyWith(returnStatusList: [StatusType('Pending')]),
            searchKey: SearchKey.search('fake_search_key'),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(viewByRequest, findsOneWidget);
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByRequest);
        expect(exportReturnByItem, findsOneWidget);
        await tester.pumpAndSettle();
        final exportReturnByItemIcon = find.byIcon(
          Icons.cloud_download_outlined,
        );
        expect(
          exportReturnByItemIcon,
          findsOneWidget,
        );
        await tester.tap(exportReturnByItemIcon);
        await tester.pumpAndSettle();
        verify(
          () => mockReturnListByRequestBloc.add(
            const ReturnListByRequestEvent.downloadFile(),
          ),
        ).called(1);
      });

      testWidgets('Checks if events are added in initState', (tester) async {
        when(() => mockEligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        verify(
          () => mockReturnListByItemBloc.add(
            ReturnListByItemEvent.initialized(
              salesOrg: fakeSalesOrganisation.salesOrg,
              user: fakeClientUser,
              shipInfo: fakeShipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ),
        ).called(1);
        verify(
          () => mockReturnListByRequestBloc.add(
            ReturnListByRequestEvent.initialized(
              salesOrg: fakeSalesOrganisation.salesOrg,
              user: fakeClientUser,
              shipInfo: fakeShipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ),
        ).called(1);
      });

      testWidgets('Search bar should display keyword same as searchKey state',
          (tester) async {
        const searchKey = 'fake-search-key';
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable([
            ReturnListByItemState.initial().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ]),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        final searchField = tester.widget<TextFormField>(customSearchBar);
        expect(searchField.controller?.text, searchKey);
      });
      // testWidgets('Return Root Page List By Request Export error snack bar',
      //     (tester) async {
      //   await tester.pumpWidget(getWUT());
      //   await tester.pump();
      //   expect(viewByRequest, findsOneWidget);
      //   whenListen(
      //     mockReturnListByRequestBloc,
      //     Stream.fromIterable([
      //       ReturnListByRequestState.initial().copyWith(
      //         isDownloadInProgress: true,
      //       ),
      //       ReturnListByRequestState.initial().copyWith(
      //         failureOrSuccessOption:
      //             optionOf(const Left(ApiFailure.other('fake_error'))),
      //       ),
      //     ]),
      //   );
      //   await tester.tap(viewByRequest);
      //   await tester.pumpAndSettle();
      //   final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByRequest);
      //   expect(exportReturnByItem, findsOneWidget);
      //   await tester.pumpAndSettle();
      //   final customSnackBar = find.byType(
      //     CustomSnackBar,
      //   );
      //   expect(
      //     customSnackBar,
      //     findsOneWidget,
      //   );
      //   expect(
      //     find.text('File downloaded successfully'),
      //     findsNothing,
      //   );
      // });
      // testWidgets('Return Root Page List By Request Export snack bar',
      //     (tester) async {
      //   await tester.pumpWidget(getWUT());
      //   await tester.pump();
      //   expect(viewByRequest, findsOneWidget);
      //   whenListen(
      //     mockReturnListByRequestBloc,
      //     Stream.fromIterable([
      //       ReturnListByRequestState.initial().copyWith(
      //         isDownloadInProgress: true,
      //       ),
      //       ReturnListByRequestState.initial().copyWith(
      //         failureOrSuccessOption: optionOf(const Right(<ReturnItem>[])),
      //       ),
      //     ]),
      //   );
      //   await tester.tap(viewByRequest);
      //   await tester.pumpAndSettle();
      //   await tester.pumpAndSettle();
      //   final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByRequest);
      //   expect(exportReturnByItem, findsOneWidget);
      //   final customSnackBar = find.byType(
      //     CustomSnackBar,
      //   );
      //   expect(
      //     customSnackBar,
      //     findsOneWidget,
      //   );
      //   expect(
      //     find.text('File downloaded successfully'),
      //     findsOneWidget,
      //   );
      // });
    },
  );
}
