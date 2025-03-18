import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late AnnouncementInfoBloc announcementInfoBloc;
  late AnnouncementBloc announcementBloc;
  late ArticlesInfoBloc articlesInfoBloc;
  late AuthBloc authBloc;
  late Config configMock;
  late EligibilityBloc eligibilityBlocMock;
  late AnnouncementFilterBloc announcementFilterBlocMock;
  late ArticlesInfoFilterBloc articlesInfoFilterBlocMock;
  const fakeKeyWord = 'fake-keyword';

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => Config());
    autoRouterMock = locator<AppRouter>();
    configMock = locator<Config>();
    announcementInfoBloc = AnnouncementInfoBlocMock();
    announcementBloc = AnnouncementBlocMock();
    articlesInfoBloc = ArticlesInfoBlocMock();
    articlesInfoFilterBlocMock = ArticlesInfoFilterBlocMock();
    announcementFilterBlocMock = AnnouncementFilterBlocMock();
    authBloc = AuthBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => announcementInfoBloc.state)
        .thenReturn(AnnouncementInfoState.initial());
    when(() => announcementBloc.state).thenReturn(AnnouncementState.initial());
    when(() => authBloc.state).thenReturn(const AuthState.initial());
    when(() => articlesInfoBloc.state).thenReturn(ArticlesInfoState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => announcementFilterBlocMock.state)
        .thenReturn(AnnouncementFilterState.initial());
    when(() => articlesInfoFilterBlocMock.state)
        .thenReturn(ArticlesInfoFilterState.initial());
  });

  Future setUpWidgetArticleTab(WidgetTester tester) async {
    await tester.tap(find.byKey(WidgetKeys.genericKey(key: 'Articles')));
    await tester.pumpAndSettle();
  }

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      routeName: AnnouncementsPageRoute.name,
      usingLocalization: true,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBloc,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBloc,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBloc,
        ),
        BlocProvider<ArticlesInfoBloc>(
          create: (context) => articlesInfoBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AnnouncementFilterBloc>(
          create: (context) => announcementFilterBlocMock,
        ),
        BlocProvider<ArticlesInfoFilterBloc>(
          create: (context) => articlesInfoFilterBlocMock,
        ),
      ],
      child: const AnnouncementsPage(),
    );
  }

  group('Announcements Page Test', () {
    testWidgets('Default Display', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.announcementsTab), findsOneWidget);
      expect(find.text('Announcements & articles'.tr()), findsOneWidget);
      expect(find.byType(AnnouncementsTab), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.genericKey(key: 'Announcements')),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.genericKey(key: 'Articles')),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.searchSectionTab('Announcements')),
        findsOneWidget,
      );
    });

    group('Announcements Search Bar', () {
      testWidgets('Announcements Search Bar On Change', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final searchFieldFinder = find.byKey(
          WidgetKeys.searchSectionTab('Announcements'),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.pump(Duration(milliseconds: configMock.autoSearchTimeout));
        verify(
          () => announcementInfoBloc.add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.search(fakeKeyWord),
            ),
          ),
        ).called(1);
      });

      testWidgets('Announcements Search Bar On Submit', (tester) async {
        final expectStates = [
          AnnouncementInfoState.initial().copyWith(
            isLoading: true,
          ),
          AnnouncementInfoState.initial(),
        ];
        whenListen(announcementInfoBloc, Stream.fromIterable(expectStates));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final searchFieldFinder = find.byKey(
          WidgetKeys.searchSectionTab('Announcements'),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(
          () => announcementInfoBloc.add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.search(fakeKeyWord),
            ),
          ),
        ).called(1);
      });

      testWidgets('Announcements Search Bar On Tap Clear Button',
          (tester) async {
        when(() => announcementInfoBloc.state).thenReturn(
          AnnouncementInfoState.initial().copyWith(
            searchKey: SearchKey.search(fakeKeyWord),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        await tester.tap(find.byKey(WidgetKeys.clearIconKey));
        verify(
          () => announcementInfoBloc.add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.empty(),
            ),
          ),
        ).called(1);
      });
      testWidgets('Search bar should display keyword same as searchKey state',
          (tester) async {
        const searchKey = 'fake-search-key';
        whenListen(
          announcementInfoBloc,
          Stream.fromIterable([
            AnnouncementInfoState.initial().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final searchField =
            tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
        expect(searchField.controller?.text, searchKey);
      });

      testWidgets('Open Announcement filter bottom sheet and tap close',
          (tester) async {
        final filterIcon = find.byKey(WidgetKeys.announcementFilterIcon);
        when(
          () => announcementInfoBloc.state,
        ).thenAnswer(
          (_) => AnnouncementInfoState.initial().copyWith(
            categoryKeyList: [''],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(filterIcon, findsOneWidget);
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        verify(
          () => announcementFilterBlocMock.add(
            const AnnouncementFilterEvent.setCategoryWhileOpenBottomSheet(
              [''],
            ),
          ),
        ).called(1);
        expect(find.byKey(WidgetKeys.announcementFilterKey), findsOneWidget);
      });
    });

    group('Articles Search Bar', () {
      testWidgets('Articles Search Bar On Change', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await setUpWidgetArticleTab(tester);

        final searchFieldFinder = find.byKey(
          WidgetKeys.searchSectionTab('Articles'),
        );
        expect(
          searchFieldFinder,
          findsOneWidget,
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.pump(Duration(milliseconds: configMock.autoSearchTimeout));
        verify(
          () => articlesInfoBloc.add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.search(fakeKeyWord),
            ),
          ),
        ).called(1);
      });

      testWidgets('Articles Search Bar On Submit', (tester) async {
        final expectStates = [
          ArticlesInfoState.initial().copyWith(
            isFetching: true,
          ),
          ArticlesInfoState.initial(),
        ];
        whenListen(articlesInfoBloc, Stream.fromIterable(expectStates));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        await setUpWidgetArticleTab(tester);
        final searchFieldFinder = find.byKey(
          WidgetKeys.searchSectionTab('Articles'),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(
          () => articlesInfoBloc.add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.search(fakeKeyWord),
            ),
          ),
        ).called(1);
      });

      testWidgets('Articles Search Bar On Tap Clear Button', (tester) async {
        when(() => articlesInfoBloc.state).thenReturn(
          ArticlesInfoState.initial().copyWith(
            searchKey: SearchKey.search(fakeKeyWord),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await setUpWidgetArticleTab(tester);
        await tester.tap(find.byKey(WidgetKeys.clearIconKey));
        verify(
          () => articlesInfoBloc.add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.empty(),
            ),
          ),
        ).called(1);
      });

      testWidgets('Search bar should display keyword same as searchKey state',
          (tester) async {
        const searchKey = 'fake-search-key';
        whenListen(
          articlesInfoBloc,
          Stream.fromIterable([
            ArticlesInfoState.initial().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        await setUpWidgetArticleTab(tester);

        final searchField =
            tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
        expect(searchField.controller?.text, searchKey);
      });

      testWidgets('Open Article filter bottom sheet and tap close',
          (tester) async {
        final filterIcon = find.byKey(WidgetKeys.articleFilterIcon);
        when(
          () => articlesInfoBloc.state,
        ).thenAnswer(
          (_) => ArticlesInfoState.initial().copyWith(
            categoryKeyList: [''],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await setUpWidgetArticleTab(tester);

        expect(filterIcon, findsOneWidget);
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        verify(
          () => articlesInfoFilterBlocMock.add(
            const ArticlesInfoFilterEvent.setCategoryWhileOpenBottomSheet(
              [''],
            ),
          ),
        ).called(1);
        expect(find.byKey(WidgetKeys.articleFilterKey), findsOneWidget);
      });
    });
  });
}
