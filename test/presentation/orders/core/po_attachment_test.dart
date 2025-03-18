import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockPaymentCustomerInformationBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class AdditionalDetailsMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class PermissionServiceMock extends Mock implements PermissionService {}

class PoAttachmentRepositoryMock extends Mock
    implements PoAttachmentRepository {}

void main() {
  late AppRouter autoRouterMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late FilePickerService filePickerService;
  late PermissionService permissionService;
  late EligibilityBloc eligibilityBlocMock;
  // late PoAttachmentRepository poAttachmentRepositoryMock;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    filePickerService = FilePickerServiceMock();
    permissionService = PermissionServiceMock();
    autoRouterMock = AppRouter();
    eligibilityBlocMock = EligibilityBlocMock();
    locator.registerLazySingleton(() => autoRouterMock);
    locator.registerLazySingleton(() => filePickerService);
    locator.registerLazySingleton(() => permissionService);
  });

  setUp(() {
    additionalDetailsBlocMock = AdditionalDetailsMock();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    // poAttachmentRepositoryMock = PoAttachmentRepositoryMock();
    when(() => additionalDetailsBlocMock.state)
        .thenReturn(AdditionalDetailsState.initial());
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  // final fakePoDocumentList = <PoDocuments>[
  //   PoDocuments(
  //     name: 'fake-name-1',
  //     url: 'fake-url-1',
  //   ),
  //   PoDocuments(
  //     name: 'fake-name-2',
  //     url: 'fake-url-2',
  //   ),
  //   PoDocuments(
  //     name: 'fake-name-3',
  //     url: 'fake-url-3',
  //   ),
  // ];

  /* group('PoAttatchment Download Widget View', () {
    Widget getTestWidget({
      List<PoDocuments> poDocuments = const [],
    }) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock),
          BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBlocMock),
          BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock),
        ],
        child: Scaffold(
          body: PoAttachment(
            poDocuments: poDocuments,
            uploadingPocDocument: const [],
            poAttachMentRenderMode: PoAttachMentRenderMode.view,
          ),
        ),
      );
    }

    testWidgets('Po Attachment Document is Empty', (tester) async {
      await tester.pumpWidget(getTestWidget());
      await tester.pump();
      final additionalComment = find.byKey(
        const ValueKey('additionalComment'),
      );
      expect(additionalComment, findsNothing);
    });

    testWidgets('Po Attachment Document is not Empty', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.download,
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.download,
          isFetching: false,
        )
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(
        getTestWidget(poDocuments: fakePoDocumentList),
      );
      await tester.pump();
      final downloadAllMessage =
          find.text('All attachments downloaded successfully.'.tr());
      expect(downloadAllMessage, findsOneWidget);
      final additionalComment = find.byKey(
        const ValueKey('additionalComment'),
      );
      expect(additionalComment, findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-1')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-2')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-3')), findsNothing);
      final viewAll = find.byKey(const ValueKey('viewAll'));
      expect(viewAll, findsOneWidget);
      final downloadAll = find.byKey(const ValueKey('downloadAll'));
      expect(downloadAll, findsOneWidget);
      await tester.tap(viewAll);
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-name-3')), findsOneWidget);
      when(() => permissionService.requestStoragePermission())
          .thenAnswer((invocation) async => PermissionStatus.granted);
      expect(find.byIcon(Icons.attachment_outlined), findsWidgets);
      await tester.tap(downloadAll);
      await tester.pump();
      final downloadsuccessfullyMessage =
          find.text('All attachments downloaded successfully.'.tr());
      expect(downloadsuccessfullyMessage, findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('Po Attachment Document Download Inprogress', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final expectedStates = [
        PoAttachmentState.initial().copyWith(fileUrl: [
          fakePoDocumentList.first,
        ], fileOperationMode: FileOperationMode.download, isFetching: true)
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(
        getTestWidget(poDocuments: fakePoDocumentList),
      );
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-name-1')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-2')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-3')), findsNothing);
      final downloadAll = find.byKey(const ValueKey('downloadAll'));
      expect(downloadAll, findsOneWidget);
      await tester.pump();
      when(() => permissionService.requestStoragePermission())
          .thenAnswer((invocation) async => PermissionStatus.granted);
      expect(find.byIcon(Icons.attachment_outlined), findsWidgets);
      await tester.tap(downloadAll);
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsWidgets);

      debugDefaultTargetPlatformOverride = null;
    });
  });

  group('PoAttatchment Download Widget edit', () {
    Widget getTestWidget({
      List<PoDocuments> poDocuments = const [],
      List<PoDocuments> uploadingPocDocument = const [],
    }) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock),
          BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBlocMock),
          BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock),
        ],
        child: Scaffold(
          body: PoAttachment(
            poDocuments: poDocuments,
            uploadingPocDocument: uploadingPocDocument,
            poAttachMentRenderMode: PoAttachMentRenderMode.edit,
          ),
        ),
      );
    }

    testWidgets('Po Attachment Document is not Empty', (tester) async {
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileUrl: [
            fakePoDocumentList.first,
          ],
          fileOperationMode: FileOperationMode.upload,
        )
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(
        getTestWidget(
          poDocuments: fakePoDocumentList,
          uploadingPocDocument: [fakePoDocumentList.last],
        ),
      );
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-name-1')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-2')), findsOneWidget);

      final poAttachementDeleteIcon =
          find.byKey(const ValueKey('poAttachementDeleteIcon'));
      expect(poAttachementDeleteIcon, findsWidgets);
      await tester.tap(poAttachementDeleteIcon.first);
      await tester.pump();
      verify(
        () => additionalDetailsBlocMock.add(
          AdditionalDetailsEvent.removePoDocument(
            poDocument: fakePoDocumentList.first,
          ),
        ),
      ).called(1);
      final deleteAll = find.byKey(const ValueKey('deleteAll'));
      expect(deleteAll, findsOneWidget);
      await tester.tap(deleteAll);
      await tester.pump();
      verify(
        () => additionalDetailsBlocMock.add(
          const AdditionalDetailsEvent.removeAllPoDocument(),
        ),
      ).called(1);
    });

    testWidgets('Po Attachment Document Download no pemission', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          fileUrl: [
            fakePoDocumentList.first,
          ],
          fileOperationMode: FileOperationMode.download,
        )
      ];
      whenListen(poAttachmentBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(
        getTestWidget(
          poDocuments: fakePoDocumentList,
          uploadingPocDocument: [fakePoDocumentList.last],
        ),
      );
      await tester.pump();
      expect(find.byKey(const ValueKey('fake-name-1')), findsOneWidget);
      expect(find.byKey(const ValueKey('fake-name-2')), findsOneWidget);
      final downloadAll = find.byKey(const ValueKey('downloadAll'));
      expect(downloadAll, findsOneWidget);
      when(() => poAttachmentRepositoryMock.downloadPermission())
          .thenAnswer((invocation) async => const Left(
                ApiFailure.storagePermissionFailed(),
              ));
      await tester.tap(downloadAll);
      await tester.pumpAndSettle(const Duration(seconds: 10));

      debugDefaultTargetPlatformOverride = null;
    });

  });*/
}
