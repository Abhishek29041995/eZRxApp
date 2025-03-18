import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_category_group.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/faq/faq.dart';
import 'package:ezrxmobile/presentation/faq/faq_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class FaqBlocMock extends MockBloc<FaqEvent, FaqState> implements FaqBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ContactUsMockBloc extends MockBloc<ContactUsEvent, ContactUsState>
    implements ContactUsBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ContactUsBloc contactUsBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  final mockSalesOrgBloc = SalesOrgMockBloc();
  late FaqBloc faqBlocMock;
  late FAQInfo faqList;
  final salesOrg = SalesOrg('2001');
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<FaqBloc>(() => faqBlocMock);
    faqList = await FAQInfoLocalDataSource().getFAQInfo(salesOrg.country);
  });
  group('FAQ Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      faqBlocMock = FaqBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlockMock();
      contactUsBlocMock = ContactUsMockBloc();
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => faqBlocMock.state).thenReturn(FaqState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => contactUsBlocMock.state).thenReturn(ContactUsState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<FaqBloc>(create: (context) => faqBlocMock),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ContactUsBloc>(
            create: (context) => contactUsBlocMock,
          ),
        ],
        child: const Scaffold(
          body: FAQPage(),
        ),
      );
    }

    testWidgets(
      'Test FaqInfoPage ',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            isFetching: false,
            searchKey: SearchKey.empty(),
            selectedCategory: FAQCategory(''),
          ),
        );
        final expectedStates = [
          FaqState.initial().copyWith(
            faqInfo: faqList,
            searchKey: SearchKey.search('Order created'),
            selectedCategory: FAQCategory('All'),
          ),
        ];
        whenListen(faqBlocMock, Stream.fromIterable(expectedStates));

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final widgetFinder = find.byType(FaqInfoPage);
        expect(widgetFinder, findsOneWidget);
      },
    );
    testWidgets(
      'Test "Search results for: " text',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            searchKey: SearchKey.search('Order created'),
            isFetching: false,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final titleFinder = find.text('FAQ');
        expect(titleFinder, findsOneWidget);
        final iconFinder = find.byIcon(
          Icons.chevron_left,
        );
        expect(iconFinder, findsOneWidget);
        await tester.tap(
          iconFinder,
          warnIfMissed: true,
        );

        await tester.pump();
        final result = find.text(
          'Search results for: ${SearchKey.search('Order created').getOrDefaultValue('')}',
        );
        expect(result, findsOneWidget);
      },
    );
    testWidgets('loaderImage  test ', (tester) async {
      when(() => faqBlocMock.state).thenReturn(
        FaqState.initial().copyWith(
          isFetching: true,
          faqInfo: FAQInfo.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });
    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => faqBlocMock.state).thenReturn(
        FaqState.initial().copyWith(
          isFetching: false,
          faqInfo: FAQInfo.empty(),
          selectedCategory: FAQCategory('All'),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: salesOrg,
          ),
          user: User.empty().copyWith(
            username: Username('fake-name'),
            role: Role(
              description: 'fake-desc',
              id: 'id',
              name: 'fake-name',
              type: RoleType('fake-type'),
            ),
            preferredLanguage: Language.english(),
          ),
        ),
      );
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            username: Username('fake-name'),
            role: Role(
              description: 'fake-desc',
              id: 'id',
              name: 'fake-name',
              type: RoleType('fake-type'),
            ),
            preferredLanguage: Language.english(),
          ),
        ),
      );
      when(
        () => mockSalesOrgBloc.state,
      ).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: salesOrg,
          ),
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(getScopedWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final faqNotFoundRecordKey = find.byKey(WidgetKeys.faqNotFoundRecordKey);
      await tester.drag(
        faqNotFoundRecordKey,
        const Offset(0.0, 1000.0),
        warnIfMissed: false,
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      verify(
        () => faqBlocMock.add(
          FaqEvent.getFaq(
            salesOrg: salesOrg,
          ),
        ),
      ).called(2);
      handle.dispose();
    });
    testWidgets(
      'Load faq page with  data ',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList.copyWith(
              faqList: [
                ...faqList.faqList,
                ...faqList.faqList,
                ...faqList.faqList,
              ],
            ),
            canLoadMore: true,
            isFetching: false,
            selectedCategory: FAQCategory('All'),
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-name'),
              role: Role(
                description: 'fake-desc',
                id: 'id',
                name: 'fake-name',
                type: RoleType('fake-type'),
              ),
              preferredLanguage: Language.english(),
            ),
          ),
        );
        when(
          () => mockSalesOrgBloc.state,
        ).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: salesOrg,
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: salesOrg,
            ),
            user: User.empty().copyWith(
              username: Username('fake-name'),
              role: Role(
                description: 'fake-desc',
                id: 'id',
                name: 'fake-name',
                type: RoleType('fake-type'),
              ),
              preferredLanguage: Language.english(),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump(const Duration(seconds: 3));

        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key: faqList.faqList.first.category.getOrDefaultValue(''),
          ),
        );

        expect(itemKey, findsOneWidget);
        final itemKey2 =
            find.byKey(Key(faqList.faqList[2].category.getOrDefaultValue('')));
        expect(itemKey2, findsOneWidget);

        await tester.dragUntilVisible(
          find.text('Contact us'),
          find.byType(ScrollList<FAQCategoryGroup>),
          const Offset(0, -500),
        );

        await tester.pumpAndSettle();

        verify(
          () => faqBlocMock.add(
            FaqEvent.loadMoreAFaq(
              salesOrg: salesOrg,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test CustomChip with  data ',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            canLoadMore: true,
            isFetching: false,
            selectedCategory: FAQCategory('All'),
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-name'),
              role: Role(
                description: 'fake-desc',
                id: 'id',
                name: 'fake-name',
                type: RoleType('fake-type'),
              ),
              preferredLanguage: Language.english(),
            ),
          ),
        );
        when(
          () => mockSalesOrgBloc.state,
        ).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: salesOrg,
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump(const Duration(seconds: 3));

        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key:
                'customChip${faqList.faqList.first.category.getOrDefaultValue('')}',
          ),
        );

        expect(itemKey, findsOneWidget);
        await tester.tap(
          itemKey,
          warnIfMissed: true,
        );
        await tester.pump(const Duration(seconds: 1));
        verify(
          () => faqBlocMock.add(
            FaqEvent.filterByFaqCategory(
              selectedCategory: FAQCategory(
                faqList.faqList.first.category.getOrDefaultValue(''),
              ),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'Test navigate to contact us page',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            canLoadMore: true,
            isFetching: false,
            selectedCategory: FAQCategory('All'),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump(const Duration(seconds: 3));

        final contactUs = find.text('Contact us');

        await tester.dragUntilVisible(
          contactUs,
          find.byType(ScrollList<FAQCategoryGroup>),
          const Offset(0, -500),
        );

        await tester.pumpAndSettle();

        expect(contactUs, findsOneWidget);
        await tester.tap(
          contactUs,
          warnIfMissed: true,
        );
        await tester.pump();
        expect(
          autoRouterMock.current.name == 'ContactUsPageRoute',
          true,
        );
      },
    );
    testWidgets(
      'Test FAQ searchBar',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            canLoadMore: true,
            isFetching: false,
            selectedCategory: FAQCategory('All'),
            searchKey: SearchKey.search('like'),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump(const Duration(seconds: 3));

        final searchBar = find.byType(CustomSearchBar);

        expect(searchBar, findsOneWidget);
        await tester.enterText(searchBar, 'like');
        await tester.pumpAndSettle(const Duration(microseconds: 200));
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.tap(
          searchBar,
          warnIfMissed: true,
        );
        final clearIconKey = find.byKey(
          WidgetKeys.clearIconKey,
        );

        expect(clearIconKey, findsOneWidget);
        await tester.tap(
          clearIconKey,
          warnIfMissed: true,
        );
        verify(
          () => faqBlocMock.add(
            FaqEvent.updateSearchKey(
              searchKey: SearchKey.empty(),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'Test CategoryChip page',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            canLoadMore: true,
            isFetching: false,
            selectedCategory: FAQCategory(''),
          ),
        );
        final expectedStates = [
          FaqState.initial().copyWith(
            faqInfo: faqList,
            searchKey: SearchKey.search('Order created'),
            selectedCategory: FAQCategory('All'),
          ),
        ];
        whenListen(faqBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final itemKey = find.text('All');

        expect(itemKey, findsOneWidget);
        expect(itemKey, findsOneWidget);
        await tester.tap(
          itemKey,
          warnIfMissed: true,
        );
        await tester.pump(const Duration(seconds: 1));
        verify(
          () => faqBlocMock.add(
            FaqEvent.filterByFaqCategory(
              selectedCategory: FAQCategory(
                'All',
              ),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        faqBlocMock,
        Stream.fromIterable([
          FaqState.initial().copyWith(
            searchKey: SearchKey.search(searchKey),
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}
