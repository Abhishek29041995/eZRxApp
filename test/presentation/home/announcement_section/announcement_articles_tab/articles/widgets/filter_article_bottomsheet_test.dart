import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/widgets/filter_article_bottomsheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../../common_mock_data/mock_other.dart';
import '../../../../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late ArticlesInfoBloc articlesInfoBloc;
  late ArticlesInfoFilterBloc articlesInfoFilterBloc;
  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton(() => Config());
    autoRouterMock = locator<AppRouter>();
    articlesInfoBloc = ArticlesInfoBlocMock();
    articlesInfoFilterBloc = ArticlesInfoFilterBlocMock();
  });

  setUp(() {
    when(() => articlesInfoBloc.state).thenReturn(ArticlesInfoState.initial());
    when(() => articlesInfoFilterBloc.state)
        .thenReturn(ArticlesInfoFilterState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ArticlesInfoBloc>(
          create: (context) => articlesInfoBloc,
        ),
        BlocProvider<ArticlesInfoFilterBloc>(
          create: (context) => articlesInfoFilterBloc,
        ),
      ],
      child: const Material(
        child: ArticleFilterBottomSheet(),
      ),
    );
  }

  group('Filter Article Bottomsheet test => ', () {
    testWidgets('Tap on category selector', (tester) async {
      const categoryKey = 'fake-category-key';
      whenListen(
        articlesInfoFilterBloc,
        Stream.fromIterable([
          ArticlesInfoFilterState.initial().copyWith(
            filterCategoryKeyList: [categoryKey],
            categoryKeyList: [categoryKey],
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CheckboxListTile).first);
      verify(
        () => articlesInfoFilterBloc.add(
          const ArticlesInfoFilterEvent.categoryChanged(
            categoryKey,
            false,
          ),
        ),
      ).called(1);
    });

    testWidgets('Tap reset button', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      await tester.tap(filterResetButton);
      verify(
        () => articlesInfoFilterBloc.add(
          const ArticlesInfoFilterEvent.resetCategory(),
        ),
      ).called(1);

      verify(
        () => articlesInfoBloc.add(
          const ArticlesInfoEvent.setCategoryKey(
            categoryKeyList: [],
          ),
        ),
      ).called(1);

      verify(
        () => autoRouterMock.popForced(),
      ).called(1);
    });

    testWidgets('Tap apply button when filterCategoryKeyList is empty',
        (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      await tester.tap(filterApplyButton);

      verifyNever(
        () => autoRouterMock.popForced(),
      );
    });

    testWidgets('Tap apply button when filterCategoryKeyList is not empty',
        (tester) async {
      when(() => articlesInfoFilterBloc.state).thenAnswer(
        (_) => ArticlesInfoFilterState.initial()
            .copyWith(filterCategoryKeyList: ['']),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      await tester.tap(filterApplyButton);
      verify(
        () => articlesInfoBloc.add(
          const ArticlesInfoEvent.setCategoryKey(
            categoryKeyList: [''],
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.popForced(),
      ).called(1);
    });
  });
}
