import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../utils/material_frame_wrapper.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AnnouncementBloc announcementBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late Announcement announcementMock;
  late Announcement announcementCustomMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    announcementMock = await AnnouncementLocalDataSource().getAnnouncements();
    final rawData = json.decode(
      await rootBundle
          .loadString('assets/json/get_announcements/getAnnouncementsCustomResponse.json'),
    );

    announcementCustomMock =
        AnnouncementDto.fromJson(rawData['data']['getAnnouncements'][0])
            .toDomain;

    announcementMock = announcementMock.copyWith(
      endTime: DateTimeStringValue(
        DateFormat.yMd().add_jm().format(
              DateTime.now().add(const Duration(days: 10)),
            ),
      ),
    );

    announcementCustomMock = announcementCustomMock.copyWith(
      endTime: DateTimeStringValue(
        DateFormat.yMd().add_jm().format(
              DateTime.now().add(const Duration(days: 10)),
            ),
      ),
    );
  });

  Widget announcement(String path) => MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<AuthBloc>(
              create: (context) => authBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
          ],
          child: Material(
            child: AnnouncementWidget(
              currentPath: path,
            ),
          ),
        ),
      );

  Widget announcementWithLocalization(String path) => MaterialFrameWrapper(
        usingLocalization: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<AuthBloc>(
              create: (context) => authBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
          ],
          child: Material(
            child: AnnouncementWidget(
              currentPath: path,
            ),
          ),
        ),
      );

  setUp(() {
    announcementBlocMock = AnnouncementBlocMock();
    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
  });

  group('Normal announcement with Post login type', () {
    testWidgets('doen\'t show when AuthState is unauthenticated',
        (tester) async {
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      await tester.pumpWidget(announcement('core'));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('doen\'t show when AuthState is biometricDenied',
        (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.biometricDenied());
      await tester.pumpWidget(announcement('core'));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('doen\'t show when AuthState is visitedAppSettings',
        (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.visitedAppSettings());
      await tester.pumpWidget(announcement('core'));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('show when AuthState is unauthenticated and displayTime.isPre',
        (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.unauthenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock.copyWith(
            type: AnnouncementType('Pre'),
          ),
        ),
      );
      await tester.pumpWidget(announcement('core'));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets(
        'show when AuthState is unauthenticated and displayTime.isPreAndPost',
        (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.unauthenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock.copyWith(
            type: AnnouncementType('Pre and Post'),
          ),
        ),
      );
      await tester.pumpWidget(announcement('core'));

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('doen\'t show when endtime is passed', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock.copyWith(
            endTime: DateTimeStringValue(
              DateFormat.yMd()
                  .add_jm()
                  .format(DateTime.now().subtract(const Duration(days: 10))),
            ),
          ),
        ),
      );
      await tester.pumpWidget(announcement('core'));

      expect(
        find.byKey(const Key('announcementDescription')),
        findsNothing,
      );
    });

    testWidgets('doen\'t show when active is false', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock.copyWith(active: false),
        ),
      );
      await tester.pumpWidget(announcement('core'));

      expect(
        find.byKey(const Key('announcementDescription')),
        findsNothing,
      );
    });

    testWidgets('show when AuthState is authenticated', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock,
        ),
      );
      await tester.pumpWidget(announcement('core'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));
      expect(reloadIcon, findsOneWidget);
      expect(closeIcon, findsOneWidget);
      expect(
        find.byKey(const Key('announcementDescription')),
        findsOneWidget,
      );

      expect(
        find.textContaining('eZRx will be unavailable from'),
        findsOneWidget,
      );
      await tester.tap(closeIcon);
      await tester.tap(reloadIcon);

      verify(
        () =>
            announcementBlocMock.add(const AnnouncementEvent.getAnnouncement()),
      ).called(1);
      verify(
        () => announcementBlocMock.add(const AnnouncementEvent.close()),
      ).called(1);
    });

    testWidgets('with no close icon', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock.copyWith(isCrossButton: false),
        ),
      );
      await tester.pumpWidget(announcement('core'));

      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(closeIcon, findsNothing);
    });

    testWidgets('with loading icon', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          isLoading: true,
          announcement: announcementMock,
        ),
      );
      await tester.pumpWidget(announcement('core'));

      final loadingIcon = find.byKey(const Key('announcementLoadingIndicator'));

      expect(loadingIcon, findsOneWidget);
    });

    testWidgets('test call event when change salesOrg', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          isLoading: true,
          announcement: announcementMock,
        ),
      );
      whenListen(
        salesOrgBlocMock,
        Stream.fromIterable([
          SalesOrgState.initial(),
        ]),
      );
      when(
        () => salesOrgBlocMock.state,
      ).thenReturn(
        SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeHKSalesOrganisation),
      );
      await tester.pumpWidget(announcement('core'));

      verify(
        () => announcementBlocMock.add(
          const AnnouncementEvent.changePreferLanguage(
            preferSalesOrgLanguage: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('test update UI event when change salesOrg', (tester) async {
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          isClosed: false,
          announcement: announcementMock,
          preferSalesOrgLanguage: false,
        ),
      );
      whenListen(
        salesOrgBlocMock,
        Stream.fromIterable([
          SalesOrgState.initial(),
        ]),
      );
      when(
        () => salesOrgBlocMock.state,
      ).thenReturn(
        SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeHKSalesOrganisation),
      );
      await tester.pumpWidget(announcementWithLocalization('core'));
      await tester.pump();
      expect(
        find.byKey(const Key('announcementDescription')),
        findsOneWidget,
      );
    });

    // testWidgets('call show event when AuthState shift to authenticated',
    //     (tester) async {
    //   whenListen(
    //       authBlocMock,
    //       Stream.fromIterable(
    //         [
    //           const AuthState.loading(),
    //           const AuthState.authenticated(),
    //         ],
    //       ));
    //   when(() => announcementBlocMock.state)
    //       .thenReturn(AnnouncementState.initial());
    //   await tester.pumpWidget(announcement());

    //   verify(() => announcementBlocMock
    //       .add(const AnnouncementEvent.getAnnouncement())).called(1);
    // });

    //   testWidgets('call show event when AuthState shift to unanthenticated',
    //       (tester) async {
    //     whenListen(
    //         authBlocMock,
    //         Stream.fromIterable(
    //           [
    //             const AuthState.loading(),
    //             const AuthState.unauthenticated(),
    //           ],
    //         ));
    //     when(() => announcementBlocMock.state)
    //         .thenReturn(AnnouncementState.initial());
    //     await tester.pumpWidget(announcement());

    //     verify(() => announcementBlocMock
    //         .add(const AnnouncementEvent.getAnnouncement())).called(1);
    //   });
    // });
    group('Custom announcement', () {
      testWidgets(
          'show with default EN language when AuthState is authenticated',
          (tester) async {
        when(() => authBlocMock.state)
            .thenReturn(const AuthState.authenticated());
        when(() => announcementBlocMock.state).thenReturn(
          AnnouncementState.initial().copyWith(
            isClosed: false,
            announcement: announcementCustomMock,
          ),
        );
        await tester.pumpWidget(announcement('orders'));
        final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
        final closeIcon = find.byKey(const Key('announcementCloseIcon'));
        expect(reloadIcon, findsOneWidget);
        expect(closeIcon, findsOneWidget);
        expect(
          find.byKey(const Key('announcementDescription')),
          findsOneWidget,
        );

        expect(
          find.text(
            'Please note that eZRx will be unavailable \${startTime} from 30 January 2023 18:30 to 30 January 2023 19:00 (GMT +8), due to scheduled maintenance. We apologise for any inconvenience caused and thank you for your patience.',
          ),
          findsOneWidget,
        );
      });

      testWidgets('show with Myanmar language when AuthState is authenticated',
          (tester) async {
        when(() => authBlocMock.state)
            .thenReturn(const AuthState.authenticated());
        when(() => announcementBlocMock.state).thenReturn(
          AnnouncementState.initial().copyWith(
            isClosed: false,
            announcement: announcementCustomMock,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2200')),
          ),
        );
        await tester.pumpWidget(announcement('orders'));
        final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
        final closeIcon = find.byKey(const Key('announcementCloseIcon'));
        expect(reloadIcon, findsOneWidget);
        expect(closeIcon, findsOneWidget);
        expect(
          find.byKey(const Key('announcementDescription')),
          findsOneWidget,
        );

        expect(
          find.text(
            'Test',
          ),
          findsOneWidget,
        );
      });
    });
  });
}
