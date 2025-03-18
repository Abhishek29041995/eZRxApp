import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_attachment_bloc/announcement_attachment_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/new_announcement_icon.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  late AnnouncementInfoDetailsBloc announcementInfoDetailsBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late AnnouncementAttachmentBloc announcementAttachmentBlocMock;

  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementInfoDetails moclAnnouncementInfoDetails;
  late AnnouncementArticleInfo mockAnnouncementInfo;

  final mockAnnouncementInfoDetailsState =
      AnnouncementInfoDetailsState.initial().copyWith(
    announcementInfoDetails: AnnouncementInfoDetails(
      id: '123',
      title: 'Announcement title',
      content: HtmlContent(''),
      summary: 'Summary',
      thumbnail: '',
      publishedDate: DateTimeStringValue(''),
      releaseDate: DateTimeStringValue('20240101'),
      manufacturer: 'Manufacturer',
      source: '',
      tag: '',
      documents: [],
    ),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerFactory<AnnouncementAttachmentBloc>(
      () => announcementAttachmentBlocMock,
    );
    autoRouterMock = locator<AppRouter>();
    announcementInfoDetailsBlocMock = AnnouncementInfoDetailsBlocMock();
    announcementAttachmentBlocMock = AnnouncementAttachmentBlocMock();
    announcementInfoBlocMock = AnnouncementInfoBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    moclAnnouncementInfoDetails =
        (await AnnouncementInfoLocalDataSource().getAnnouncementInfoDetails())
            .copyWith(thumbnail: '');
    mockAnnouncementInfo =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfo();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => announcementInfoDetailsBlocMock.state)
        .thenReturn(AnnouncementInfoDetailsState.initial());
    when(() => announcementInfoBlocMock.state)
        .thenReturn(AnnouncementInfoState.initial());
    when(() => announcementAttachmentBlocMock.state)
        .thenReturn(AnnouncementAttachmentState.initial());
  });

  Widget getAnnouncementInfoDetailsPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<AnnouncementInfoDetailsBloc>(
          create: (context) => announcementInfoDetailsBlocMock,
        ),
        BlocProvider<AnnouncementAttachmentBloc>(
          create: (context) => announcementAttachmentBlocMock,
        ),
      ],
      child: const AnnouncementInfoDetailsPage(),
    );
  }

  group('Test "announcement_info_details_page" widget test => ', () {
    testWidgets(
      'when data is loading',
      (tester) async {
        when(() => announcementInfoDetailsBlocMock.state).thenReturn(
          AnnouncementInfoDetailsState.initial().copyWith(isLoading: true),
        );
        await tester.pumpWidget(getAnnouncementInfoDetailsPage());
        await tester.pump();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final loadingWidgets = find.byKey(WidgetKeys.loaderImage);
        expect(loadingWidgets, findsOneWidget);
      },
    );

    testWidgets(
      'when data is loaded',
      (tester) async {
        whenListen(
          announcementInfoBlocMock,
          Stream.fromIterable([
            AnnouncementInfoState.initial().copyWith(
              isLoading: true,
            ),
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: mockAnnouncementInfo,
            ),
          ]),
        );
        final expectedState = [
          mockAnnouncementInfoDetailsState.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
          mockAnnouncementInfoDetailsState,
        ];
        whenListen(
          announcementInfoDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final announcementDetailsItem = find.byKey(
          WidgetKeys.announcementDetailsItem('0'),
        );
        expect(announcementDetailsItem, findsOneWidget);
      },
    );

    testWidgets(
      'Tap scrollToTopArrowIcon button',
      (tester) async {
        when(() => announcementInfoDetailsBlocMock.state).thenReturn(
          AnnouncementInfoDetailsState.initial().copyWith(
            announcementInfoDetails: moclAnnouncementInfoDetails,
          ),
        );

        when(() => announcementInfoBlocMock.state).thenReturn(
          AnnouncementInfoState.initial().copyWith(
            announcementInfo: mockAnnouncementInfo,
          ),
        );
        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pump();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final scrollToTopArrowIcon =
            find.byKey(WidgetKeys.scrollToTopFloatingButton);
        final customScrollView =
            find.byKey(WidgetKeys.announcementInfoDetailList);
        await tester.drag(
          customScrollView,
          const Offset(0, -200),
          warnIfMissed: false,
        );
        await tester.pumpAndSettle();
        expect(scrollToTopArrowIcon, findsOneWidget);
        await tester.tap(scrollToTopArrowIcon);
      },
    );

    testWidgets(
      'tap back button',
      (tester) async {
        when(() => announcementInfoDetailsBlocMock.state).thenReturn(
          mockAnnouncementInfoDetailsState,
        );
        when(() => announcementInfoBlocMock.state).thenReturn(
          AnnouncementInfoState.initial().copyWith(
            announcementInfo: mockAnnouncementInfo,
          ),
        );
        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pump();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final backButton = find.byKey(WidgetKeys.announcementDetailsBackButton);
        expect(backButton, findsOneWidget);
        await tester.ensureVisible(backButton);
        await tester.tap(backButton);
      },
    );

    testWidgets(
      'tap announcement item',
      (tester) async {
        final expectedState = [
          mockAnnouncementInfoDetailsState,
          mockAnnouncementInfoDetailsState.copyWith(
            apiFailureOrSuccessOption: optionOf(const Right('')),
          ),
        ];
        whenListen(
          announcementInfoDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        when(() => announcementInfoBlocMock.state).thenReturn(
          AnnouncementInfoState.initial().copyWith(
            announcementInfo: mockAnnouncementInfo,
          ),
        );
        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final announcementDetailsItem = find.byKey(
          WidgetKeys.announcementDetailsItem('0'),
        );
        expect(announcementDetailsItem, findsOneWidget);
        await tester.ensureVisible(announcementDetailsItem);
        await tester.tap(announcementDetailsItem);
      },
    );

    testWidgets(
      'tap announcement Details Bottom Back Button',
      (tester) async {
        final content =
            moclAnnouncementInfoDetails.content.value.getOrElse(() => '');
        when(() => announcementInfoDetailsBlocMock.state).thenReturn(
          AnnouncementInfoDetailsState.initial().copyWith(
            announcementInfoDetails: moclAnnouncementInfoDetails.copyWith(
              content: HtmlContent(content * 10),
            ),
          ),
        );

        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pump();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        await tester.dragFrom(
          const Offset(100, 400),
          const Offset(100, -221),
        );
        await tester.pumpAndSettle();
        final backButton =
            find.byKey(WidgetKeys.announcementDetailsBottomBackButtonKey);
        expect(backButton, findsOneWidget);
        await tester.ensureVisible(backButton);
        await tester.tap(backButton);
      },
    );
    testWidgets(
      'test error section while facing some error in data fetching',
      (tester) async {
        final expectedState = [
          AnnouncementInfoDetailsState.initial().copyWith(
            isLoading: true,
          ),
          AnnouncementInfoDetailsState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Some Error'))),
          ),
        ];
        whenListen(
          announcementInfoDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        final announcementInfoDetailsPage =
            find.byKey(WidgetKeys.announcementDetailsPageKey);
        expect(announcementInfoDetailsPage, findsOneWidget);
        final errorSnackBar = find.byKey(WidgetKeys.customSnackBar);
        expect(errorSnackBar, findsOneWidget);
      },
    );

    testWidgets(
        'Test New AnnounceMent Icon not visible for announcements that has been released before 7 days from now',
        (tester) async {
      when(
        () => announcementInfoDetailsBlocMock.state,
      ).thenReturn(mockAnnouncementInfoDetailsState);

      await tester.pumpWidget(
        getAnnouncementInfoDetailsPage(),
      );
      await tester.pump();
      final announcementInfoDetailsPage =
          find.byKey(WidgetKeys.announcementDetailsPageKey);
      expect(announcementInfoDetailsPage, findsOneWidget);
      final newIcon = find.byType(NewAnnouncementIcon);
      expect(newIcon, findsNothing);
    });

    group('Test AnnouncementInfoAttachmentSection => ', () {
      const filename = 'test.pdf';
      testWidgets('Show documents if not empty', (tester) async {
        when(
          () => announcementInfoDetailsBlocMock.state,
        ).thenReturn(
          mockAnnouncementInfoDetailsState.copyWith(
            announcementInfoDetails: AnnouncementInfoDetails.empty().copyWith(
              documents: [
                Attachment(filename),
              ],
            ),
          ),
        );

        whenListen(
          announcementAttachmentBlocMock,
          Stream.fromIterable([
            AnnouncementAttachmentState.initial().copyWith(
              isDownloading: true,
              failureOrSuccessOption: optionOf(const Right('')),
            ),
            AnnouncementAttachmentState.initial(),
          ]),
        );

        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        final file = find.text(filename);
        expect(file, findsOneWidget);
        await tester.tap(file);
        verify(
          () => announcementAttachmentBlocMock.add(
            AnnouncementAttachmentEvent.downloadFile(
              url: Attachment(filename),
            ),
          ),
        ).called(1);
      });

      testWidgets('Show error message if download failed', (tester) async {
        when(
          () => announcementInfoDetailsBlocMock.state,
        ).thenReturn(
          mockAnnouncementInfoDetailsState.copyWith(
            announcementInfoDetails: AnnouncementInfoDetails.empty().copyWith(
              documents: [
                Attachment(filename),
              ],
            ),
          ),
        );

        whenListen(
          announcementAttachmentBlocMock,
          Stream.fromIterable([
            AnnouncementAttachmentState.initial().copyWith(
              isDownloading: true,
            ),
            AnnouncementAttachmentState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error'))),
            ),
          ]),
        );

        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text('fake-error'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show success message if download successully',
          (tester) async {
        when(
          () => announcementInfoDetailsBlocMock.state,
        ).thenReturn(
          mockAnnouncementInfoDetailsState.copyWith(
            announcementInfoDetails: AnnouncementInfoDetails.empty().copyWith(
              documents: [
                Attachment(filename),
              ],
            ),
          ),
        );

        whenListen(
          announcementAttachmentBlocMock,
          Stream.fromIterable([
            AnnouncementAttachmentState.initial().copyWith(
              isDownloading: true,
            ),
            AnnouncementAttachmentState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Right(''),
              ),
            ),
          ]),
        );

        await tester.pumpWidget(
          getAnnouncementInfoDetailsPage(),
        );
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text('File downloaded successfully'.tr()),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
