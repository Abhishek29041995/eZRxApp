import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/articles_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../common_mock_data/mock_other.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late EligibilityBloc eligibilityBlocMock;
  late ArticlesInfoBloc articlesInfoBlocMock;
  late AppRouter autoRouterMock;
  late List<AnnouncementArticleItem> announcementListMock;
  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton(() => articlesInfoBlocMock);
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    articlesInfoBlocMock = ArticlesInfoBlocMock();
    announcementListMock = [
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID',
        title: 'fakeTitle1',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
        tag: 'fake-tag',
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID2',
        title: 'fakeTitle2',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID3',
        title: 'fakeTitle3',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID4',
        title: 'fakeTitle4',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID5',
        title: 'fakeTitle5',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID6',
        title: 'fakeTitle6',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID7',
        title: 'fakeTitle7',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID8',
        title: 'fakeTitle8',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
    ];
  });
  group('test article tab', () {
    setUp(() {
      when(() => articlesInfoBlocMock.state)
          .thenReturn(ArticlesInfoState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });
    Widget getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ArticlesInfoBloc>(
            create: (context) => articlesInfoBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const ArticlesTab(),
      );
    }

    testWidgets('should show loading for the first time', (tester) async {
      when(() => articlesInfoBlocMock.state).thenReturn(
        ArticlesInfoState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
    });
    testWidgets('should show articles list after successfully get Data',
        (tester) async {
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
    });
    testWidgets('should add fetch data again when refresh', (tester) async {
      final articlesInfoBloc = locator<ArticlesInfoBloc>();
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(
        () => articlesInfoBloc.add(
          const ArticlesInfoEvent.getArticles(),
        ),
      ).called(1);
    });
    testWidgets('should add loadMoreArticles again when pull down to load more',
        (tester) async {
      final articlesInfoBloc = locator<ArticlesInfoBloc>();
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
      await tester.drag(
        find.text('fakeTitle1'),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      verify(
        () => articlesInfoBloc.add(
          const ArticlesInfoEvent.loadMoreArticles(),
        ),
      ).called(1);
    });
    testWidgets('The first item should be visible when press scrollToTop',
        (tester) async {
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsNothing);
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
    });

    testWidgets('Find category tag', (tester) async {
      when(() => articlesInfoBlocMock.state).thenReturn(
        ArticlesInfoState.initial().copyWith(
          articleInfo: AnnouncementArticleInfo.empty().copyWith(
            announcementList: announcementListMock,
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(find.byKey(WidgetKeys.articlesListTag), findsOneWidget);
    });

    testWidgets('tap on article item', (tester) async {
      when(
        () => autoRouterMock.push(
          ArticleDetailsRoute(
            article: announcementListMock.first,
          ),
        ),
      ).thenAnswer((_) => Future.value());
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable([
          ArticlesInfoState.initial().copyWith(
            categoryKeyList: [''],
            articleInfo: AnnouncementArticleInfo.empty().copyWith(
              announcementList: [announcementListMock.first],
            ),
          ),
        ]),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.genericKey(key: 'articleItem0')));
      verify(
        () => autoRouterMock.push(
          ArticleDetailsRoute(
            article: announcementListMock.first,
          ),
        ),
      ).called(1);
    });
  });
}
