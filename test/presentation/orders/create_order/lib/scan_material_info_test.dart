import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/scan_material_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../utils/widget_utils.dart';

class MaterialInfoScannerMock extends Mock implements MaterialInfoScanner {}

// ignore: must_be_immutable
class MockDataCaptureView extends StatefulWidget implements DataCaptureView {
  MockDataCaptureView({
    super.key,
  });

  @override
  DataCaptureContext? dataCaptureContext;

  @override
  FocusGesture? focusGesture;

  @override
  late Anchor logoAnchor;

  @override
  late PointWithUnit logoOffset;

  @override
  late LogoStyle logoStyle;

  @override
  late PointWithUnit pointOfInterest;

  @override
  late MarginsWithUnit scanAreaMargins;

  @override
  late ZoomGesture? zoomGesture;

  @override
  void addControl(Control control) {}

  @override
  void addListener(DataCaptureViewListener listener) {}

  @override
  void addOverlay(DataCaptureOverlay overlay) {}

  @override
  State<StatefulWidget> createState() => _MockDataCaptureViewState();

  @override
  void removeAllOverlays() {}

  @override
  void removeControl(Control control) {}

  @override
  void removeListener(DataCaptureViewListener listener) {}

  @override
  void removeOverlay(DataCaptureOverlay overlay) {}

  @override
  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  Future<Point> viewPointForFramePoint(Point point) async {
    return Point(1, 2);
  }

  @override
  Future<Quadrilateral> viewQuadrilateralForFrameQuadrilateral(
    Quadrilateral quadrilateral,
  ) async {
    return Quadrilateral(Point(1, 2), Point(1, 2), Point(1, 2), Point(1, 2));
  }
}

// Custom State class for MockDataCaptureView
class _MockDataCaptureViewState extends State<MockDataCaptureView> {
  @override
  Widget build(BuildContext context) {
    return Container(); // Your mock implementation
  }

// Implement other methods that might be required for the mock
}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late ScanMaterialInfoBlocMock scanMaterialInfoBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementBloc mockAnnouncementBloc;
  late AuthBloc authBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late MaterialInfoScanner materialInfoScannerMock;
  late DataCaptureView dataCaptureViewMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = AutoRouteMock();
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerLazySingleton(
      () => materialInfoScannerMock,
    );
  });

  group('Test scan material info', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      locator = GetIt.instance;
      scanMaterialInfoBlocMock = ScanMaterialInfoBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      materialFilterBlocMock = MaterialFilterBlocMock();
      materialInfoScannerMock = MaterialInfoScannerMock();
      dataCaptureViewMock = MockDataCaptureView();
      mockAnnouncementBloc = MockAnnouncementBloc();
      authBlocMock = AuthBlocMock();
      when(() => scanMaterialInfoBlocMock.state)
          .thenReturn(ScanMaterialInfoState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => materialFilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => materialInfoScannerMock.dataCaptureView)
          .thenReturn(dataCaptureViewMock);
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<ScanMaterialInfoBloc>(
            create: (context) => scanMaterialInfoBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<MaterialFilterBloc>(
            create: (context) => materialFilterBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
        ],
        child: const ScanMaterialInfo(),
      );
    }

    testWidgets(
      '=> Test widget display',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.text('Please scan one code at a time.'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Test listen when condition',
      (tester) async {
        whenListen(
          scanMaterialInfoBlocMock,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(isScanInProgress: true),
            ScanMaterialInfoState.initial(),
          ]),
        );
        when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.text('Please scan one code at a time.'.tr()),
          findsOneWidget,
        );
        verify(() => autoRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      '=> Test torch button',
      (tester) async {
        whenListen(
          scanMaterialInfoBlocMock,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(isScanInProgress: true),
            ScanMaterialInfoState.initial(),
          ]),
        );
        when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final button = find.byIcon(Icons.flash_off);
        expect(
          button,
          findsOneWidget,
        );
        await tester.tap(button);
        await tester.pumpAndSettle();
        verify(
          () => scanMaterialInfoBlocMock.add(
            const ScanMaterialInfoEvent.updateTorchState(torchState: true),
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> Test back button',
      (tester) async {
        whenListen(
          scanMaterialInfoBlocMock,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(isScanInProgress: true),
            ScanMaterialInfoState.initial(),
          ]),
        );
        when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final button = find.byIcon(Icons.chevron_left);
        expect(
          button,
          findsOneWidget,
        );
        await tester.tap(button);
        await tester.pumpAndSettle();
        verify(
          () => scanMaterialInfoBlocMock.add(
            const ScanMaterialInfoEvent.disableScan(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> Test photo gallery button',
      (tester) async {
        whenListen(
          scanMaterialInfoBlocMock,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(isScanInProgress: true),
            ScanMaterialInfoState.initial(),
          ]),
        );
        when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final button = find.byIcon(Icons.photo_library_outlined);
        expect(
          button,
          findsOneWidget,
        );
        await tester.tap(button);
        await tester.pumpAndSettle();
        verify(
          () => scanMaterialInfoBlocMock.add(
            const ScanMaterialInfoEvent.scanImageFromDeviceStorage(),
          ),
        ).called(1);
      },
    );
  });
}
