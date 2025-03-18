import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/filter_announcement_bottomsheet.dart';
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
  late AnnouncementInfoBloc announcementInfoBloc;
  late AnnouncementFilterBloc announcementFilterBlocMock;
  setUpAll(() {
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton(() => Config());
    autoRouterMock = locator<AppRouter>();
    announcementInfoBloc = AnnouncementInfoBlocMock();
    announcementFilterBlocMock = AnnouncementFilterBlocMock();
  });

  setUp(() {
    when(() => announcementInfoBloc.state)
        .thenReturn(AnnouncementInfoState.initial());
    when(() => announcementFilterBlocMock.state)
        .thenReturn(AnnouncementFilterState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBloc,
        ),
        BlocProvider<AnnouncementFilterBloc>(
          create: (context) => announcementFilterBlocMock,
        ),
      ],
      child: const Material(
        child: AnnouncementFilterBottomSheet(),
      ),
    );
  }

  group('Filter Announcement Bottomsheet test => ', () {
    testWidgets('Tap on category selector', (tester) async {
      const categoryKey = 'fake-category-key';
      whenListen(
        announcementFilterBlocMock,
        Stream.fromIterable([
          AnnouncementFilterState.initial().copyWith(
            filterCategoryKeyList: [categoryKey],
            categoryKeyList: [categoryKey],
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final selector =
          find.byKey(WidgetKeys.announcementStatusFilter(categoryKey, true));
      await tester.tap(selector);
      verify(
        () => announcementFilterBlocMock.add(
          const AnnouncementFilterEvent.categoryChanged(
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
        () => announcementFilterBlocMock.add(
          const AnnouncementFilterEvent.resetCategory(),
        ),
      ).called(1);

      verify(
        () => announcementInfoBloc.add(
          const AnnouncementInfoEvent.setCategoryKey(
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
      when(() => announcementFilterBlocMock.state).thenAnswer(
        (_) => AnnouncementFilterState.initial()
            .copyWith(filterCategoryKeyList: ['']),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      await tester.tap(filterApplyButton);
      verify(
        () => announcementInfoBloc.add(
          const AnnouncementInfoEvent.setCategoryKey(
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
