import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/new_claim_submission/new_claim_submission_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_claim_submission/new_claim_submission_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/widgets/open_setting_bottomsheet.dart';
import 'package:ezrxmobile/presentation/widgets/select_attachment_bottomsheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../../common_mock_data/mock_bloc.dart';

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;
  late NewClaimSubmissionBloc newClaimSubmissionBloc;
  late PoAttachmentBloc poAttachmentBloc;
  late ClaimManagementBloc claimManagementBloc;
  late Config config;
  late List<PrincipalData> principals;
  final file = PlatformFile(name: 'fake-name', size: 10);
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
    locator.registerLazySingleton(() => Config());

    config = locator<Config>();
    eligibilityBloc = EligibilityBlocMock();
    poAttachmentBloc = PoAttachmentBlocMock();
    claimManagementBloc = ClaimManagementBlocMock();
    locator.registerFactory(() => poAttachmentBloc);
    newClaimSubmissionBloc = NewClaimSubmissionBlocMock();
    principals =
        await ClaimManagementLocalDataSource().getPrincipalForSalesOrg();
  });

  setUp(() {
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakePHSalesOrgConfigs,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
    );
    when(() => newClaimSubmissionBloc.state).thenReturn(
      NewClaimSubmissionState.initial(),
    );
    when(() => poAttachmentBloc.state).thenReturn(
      PoAttachmentState.initial(),
    );
    when(() => claimManagementBloc.state).thenReturn(
      ClaimManagementState.initial(),
    );
  });

  Future getScopedWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<NewClaimSubmissionBloc>(
            create: (context) => newClaimSubmissionBloc,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => poAttachmentBloc,
          ),
          BlocProvider<ClaimManagementBloc>(
            create: (context) => claimManagementBloc,
          ),
        ],
        child: const NewClaimSubmissionPage(),
      ),
    );
  }

  group('New Claim Submission Page Test', () {
    testWidgets('=> Display Page Test', (tester) async {
      await getScopedWidget(tester);
      await tester.pump();
      expect(find.text('New claim submission'.tr()), findsOneWidget);
      verify(
        () => newClaimSubmissionBloc.add(
          NewClaimSubmissionEvent.initialized(
            salesOrganisation: fakePHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
      expect(
        find.text(
          'Please select the Claim type and submit your claim with related document'
              .tr(),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.newClaimPrincipalCodeTextField),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.newClaimClaimTypeDropdown),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.newClaimClaimAmountTextField),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.newClaimClaimDetailsTextField),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.claimSubmittedCreateNewClaimButton),
        findsOneWidget,
      );
    });

    testWidgets('=> Tap Close Button Test', (tester) async {
      when(() => autoRouterMock.maybePop())
          .thenAnswer((invocation) => Future.value(true));
      final closeButton = find.byKey(WidgetKeys.closeButton);
      await getScopedWidget(tester);
      await tester.pump();
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      verify(() => autoRouterMock.maybePop()).called(1);
    });

    testWidgets('=> Tap Submit Button When Form Validated Test',
        (tester) async {
      whenListen(
        newClaimSubmissionBloc,
        Stream.fromIterable([
          NewClaimSubmissionState.initial().copyWith(
            claimSubmission: ClaimSubmission.empty().copyWith(
              principal: principals.first,
              claimType: ClaimType(1),
              claimAmount: 10,
              claimDetails: 'fake-claim-detail',
              documents: List.generate(5, (_) => file),
            ),
          ),
        ]),
      );

      final submitButton =
          find.byKey(WidgetKeys.claimSubmittedCreateNewClaimButton);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);
      verify(
        () => newClaimSubmissionBloc.add(
          NewClaimSubmissionEvent.submit(
            user: fakeClientUser,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Show error when submit failure', (tester) async {
      whenListen(
        newClaimSubmissionBloc,
        Stream.fromIterable([
          NewClaimSubmissionState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });

    testWidgets('=> Replace with Thank you page when submit success',
        (tester) async {
      when(() => autoRouterMock.replace(const ClaimSubmittedPageRoute()))
          .thenAnswer((invocation) => Future.value());
      whenListen(
        newClaimSubmissionBloc,
        Stream.fromIterable([
          NewClaimSubmissionState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right('')),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.fetch(
            appliedFilter: ClaimManagementFilter.empty(),
          ),
        ),
      ).called(1);
      verify(() => autoRouterMock.replace(const ClaimSubmittedPageRoute()))
          .called(1);
    });

    testWidgets('=> Claim Detail Field Test', (tester) async {
      await getScopedWidget(tester);
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.newClaimClaimDetailsTextField),
        '1',
      );
      await tester.pump();
      verify(
        () => newClaimSubmissionBloc.add(
          const NewClaimSubmissionEvent.onClaimDetailsChange(
            claimDetails: '1',
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Claim Type Field Test', (tester) async {
      await getScopedWidget(tester);
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.newClaimClaimTypeDropdown));
      await tester.pumpAndSettle();
      await tester.tap(find.text('P1 - Principal Deals'.tr()));
      verify(
        () => newClaimSubmissionBloc.add(
          NewClaimSubmissionEvent.onSelectClaimType(
            claimType: ClaimType(1),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Claim Amount Field Test', (tester) async {
      await getScopedWidget(tester);
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.newClaimClaimAmountTextField),
        '1',
      );
      await tester.pump();
      verify(
        () => newClaimSubmissionBloc.add(
          const NewClaimSubmissionEvent.onClaimAmountChange(
            amount: 1,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Tap Upload file Test', (tester) async {
      final uploadBox = find.byKey(WidgetKeys.newClaimDocumentUpload);
      await getScopedWidget(tester);
      await tester.pump();
      await tester.dragUntilVisible(
        uploadBox,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -200),
      );
      await tester.tap(
        uploadBox,
      );
      await tester.pumpAndSettle();
      expect(find.byType(SelectAttachmentBottomsheet), findsOneWidget);
    });

    testWidgets('=> Show file upload exeed qty error test', (tester) async {
      whenListen(
        newClaimSubmissionBloc,
        Stream.fromIterable([
          NewClaimSubmissionState.initial().copyWith(
            showUploadExeedMessage: true,
          ),
        ]),
      );
      final errorMessage = find.text(
        'Exceed maximum file size of {maximumUploadSize}MB'.tr(
          namedArgs: {
            'maximumUploadSize': config.maximumUploadSize.toString(),
          },
        ),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        errorMessage,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -200),
      );
      expect(errorMessage, findsOneWidget);
    });

    testWidgets('=> Show error when pick file failure test', (tester) async {
      whenListen(
        poAttachmentBloc,
        Stream.fromIterable([
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });

    testWidgets('=> Show setting box when not have permission test',
        (tester) async {
      whenListen(
        poAttachmentBloc,
        Stream.fromIterable([
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.cameraPermissionFailed(true))),
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      expect(find.byType(OpenSettingBottomSheet), findsOneWidget);
    });

    testWidgets('=> Add files when pick files success', (tester) async {
      whenListen(
        poAttachmentBloc,
        Stream.fromIterable([
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right('')),
            localFiles: [file],
          ),
        ]),
      );
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => newClaimSubmissionBloc.add(
          NewClaimSubmissionEvent.addPoDocument(
            poDocuments: [file],
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Principal Field Test', (tester) async {
      whenListen(
        newClaimSubmissionBloc,
        Stream.fromIterable([
          NewClaimSubmissionState.initial().copyWith(
            principalList: principals,
          ),
          NewClaimSubmissionState.initial().copyWith(
            principalList: principals,
            claimSubmission: ClaimSubmission.empty().copyWith(
              principal: principals.first,
            ),
          ),
        ]),
      );
      final field = find.byKey(WidgetKeys.newClaimPrincipalCodeTextField);
      final firstItem = find.text(principals.first.searchItemText);
      await getScopedWidget(tester);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        field,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -200.0),
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        field,
        '1',
      );
      await tester.pumpAndSettle();
      await tester.tap(firstItem.last);
    });
  });
}
