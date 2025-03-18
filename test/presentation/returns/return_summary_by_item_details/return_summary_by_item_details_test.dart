import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/widgets/return_summary_details_section.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late ReturnSummaryDetailsBlocMock returnSummaryDetailsBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AnnouncementBlocMock announcementBlocMock;
  late CustomerCodeBlocMock customerCodeBlocMock;
  late AuthBlocMock authBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late AppRouter autoRouterMock;
  late ReturnRequestInformation requestInformationMock;
  late ReturnRequestInformationHeader returnRequestInformationHeader;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    final mockData = await ReturnSummaryDetailsRequestInformationLocal()
        .getReturnRequestInformation();
    requestInformationMock = mockData.returnRequestInformationList.first;
    returnRequestInformationHeader = mockData.requestInformationHeader;
  });

  setUp(() {
    returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    authBlocMock = AuthBlocMock();
    when(() => returnSummaryDetailsBlocMock.state)
        .thenReturn(ReturnSummaryDetailsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
  });

  ////////////////////Finder/////////////////////////////////////////////
  final returnItemDetailCopyButton =
      find.byKey(WidgetKeys.returnItemDetailCopyButton);
  final returnItemDetailRequestDate =
      find.byKey(WidgetKeys.returnItemDetailRequestDate);
  final returnDetailSummary = find.byKey(WidgetKeys.returnDetailSummary);
  ///////////////////////////////////////////////////////////////////

  final statusVariants = ValueVariant<StatusType>(
    {
      StatusType('PENDING'),
      StatusType('APPROVED'),
      StatusType('REJECTED'),
    },
  );

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: false,
      providers: [
        BlocProvider<ReturnSummaryDetailsBloc>(
          create: (context) => returnSummaryDetailsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
      ],
      child: const ReturnRequestSummaryByItemDetails(),
    );
  }

  group(
    'Test "Return Summary By Item Details"',
    () {
      testWidgets(
        '=> Test page app bar and body',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
              requestInformationHeader: returnRequestInformationHeader,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Return item details'.tr()), findsOneWidget);
          expect(find.byType(AnnouncementBanner), findsOneWidget);
        },
      );

      testWidgets(
        '=> return details section',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
              requestInformationHeader: returnRequestInformationHeader,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.text(
              '${'Return'.tr()} #${returnRequestInformationHeader.requestID}',
            ),
            findsOneWidget,
          );
          expect(
            returnItemDetailCopyButton,
            findsOneWidget,
          );
          expect(
            returnItemDetailRequestDate,
            findsOneWidget,
          );
          final returnReference = find.byKey(
            WidgetKeys.balanceTextRow(
              'Return reference',
              returnRequestInformationHeader.returnReference.displayNAIfEmpty,
            ),
          );
          expect(returnReference, findsOneWidget);
          final specialInstructions = find.byKey(
            WidgetKeys.balanceTextRow(
              'Special instructions',
              returnRequestInformationHeader
                  .specialInstructions.displayNAIfEmpty,
            ),
          );
          expect(specialInstructions, findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusTrackerSection),
              matching: find.text('Return status'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets('=> show `-` when attachment is empty', (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 1000));
        when(() => returnSummaryDetailsBlocMock.state).thenReturn(
          ReturnSummaryDetailsState.initial().copyWith(
            requestInformation: requestInformationMock.copyWith(
              status: StatusType('APPROVED'),
              bonusInformation: <ReturnRequestInformation>[],
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final showDetailButtonFinder =
            find.byKey(WidgetKeys.returnDetailShowDetailButton);
        expect(showDetailButtonFinder, findsOneWidget);
        await tester.tap(showDetailButtonFinder);
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(ReturnItemCard),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        final attachmentSection = find.byKey(
          WidgetKeys.returnAttachmentSection,
        );
        expect(attachmentSection, findsOneWidget);
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Attachments'.tr(),
              '-',
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        '=> return items details test approval section whenn bapi status is success',
        (tester) async {
          final currentStatusVariant =
              statusVariants.currentValue ?? StatusType('');
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                status: currentStatusVariant,
                bonusInformation: <ReturnRequestInformation>[],
                bapiStatus: StatusType('SUCCESS'),
                bapiSalesDocNumber: '123456',
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(ReturnItemCard), findsOneWidget);
          expect(find.byKey(WidgetKeys.returnItemKey), findsOneWidget);
          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.tap(showDetailButtonFinder);
          await tester.pumpAndSettle();
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          if (currentStatusVariant == StatusType('PENDING')) {
            expect(find.byKey(WidgetKeys.returnApprovalDetail), findsNothing);
          } else {
            expect(find.byKey(WidgetKeys.returnApprovalDetail), findsOneWidget);
            expect(returnDetailSummary, findsOneWidget);
            expect(find.text('Approval details'.tr()), findsOneWidget);
            final reason = find.byKey(
              WidgetKeys.balanceTextRow(
                'Reason'.tr(),
                requestInformationMock.statusReason.getOrDefault,
              ),
            );
            expect(reason, findsOneWidget);
            final approvalNumber = find.byKey(
              WidgetKeys.balanceTextRow(
                'Approval number'.tr(),
                '123456',
              ),
            );
            expect(approvalNumber, findsOneWidget);
            final attachmentSection = find.byKey(
              WidgetKeys.returnAttachmentSection,
            );
            expect(attachmentSection, findsOneWidget);
          }
        },
        variant: statusVariants,
      );
      testWidgets(
        '=> return items details test approval section when bapi status is failed',
        (tester) async {
          final currentStatusVariant =
              statusVariants.currentValue ?? StatusType('');
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                status: currentStatusVariant,
                bonusInformation: <ReturnRequestInformation>[],
                bapiStatus: StatusType('FAILED'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(ReturnItemCard), findsOneWidget);
          expect(find.byKey(WidgetKeys.returnItemKey), findsOneWidget);
          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.tap(showDetailButtonFinder);
          await tester.pumpAndSettle();
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          if (currentStatusVariant == StatusType('PENDING')) {
            expect(find.byKey(WidgetKeys.returnApprovalDetail), findsNothing);
          } else {
            expect(find.byKey(WidgetKeys.returnApprovalDetail), findsOneWidget);
            expect(returnDetailSummary, findsOneWidget);
            expect(find.text('Approval details'.tr()), findsOneWidget);
            final reason = find.byKey(
              WidgetKeys.balanceTextRow(
                'Reason'.tr(),
                requestInformationMock.statusReason.getOrDefault,
              ),
            );
            expect(reason, findsOneWidget);
            final approvalNumber = find.byKey(
              WidgetKeys.balanceTextRow(
                'Approval number'.tr(),
                'NA',
              ),
            );
            expect(approvalNumber, findsOneWidget);
            final attachmentSection = find.byKey(
              WidgetKeys.returnAttachmentSection,
            );
            expect(attachmentSection, findsOneWidget);
          }
        },
        variant: statusVariants,
      );

      testWidgets(
        '=> return bonus item details test approval section when bapi status is success',
        (tester) async {
          final currentStatusVariant =
              statusVariants.currentValue ?? StatusType('');
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
                status: currentStatusVariant,
                bapiStatus: StatusType('SUCCESS'),
                bapiSalesDocNumber: '123456',
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.fling(
            find.byType(ReturnItemCard),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          await tester.pumpAndSettle();
          if (currentStatusVariant == StatusType('PENDING')) {
            expect(
              find.byKey(WidgetKeys.returnApprovalDetail),
              findsNothing,
            );
          } else {
            expect(
              find.byKey(WidgetKeys.returnApprovalDetail),
              findsOneWidget,
            );
            expect(find.text('Bonus approval details'.tr()), findsOneWidget);
            final reason = find.byKey(
              WidgetKeys.balanceTextRow(
                'Reason'.tr(),
                requestInformationMock.statusReason.getOrDefault,
              ),
            );
            expect(reason, findsOneWidget);
            final approvalNumber = find.byKey(
              WidgetKeys.balanceTextRow(
                'Approval number'.tr(),
                '123456',
              ),
            );
            expect(approvalNumber, findsOneWidget);
            final attachmentSection = find.byKey(
              WidgetKeys.returnAttachmentSection,
            );
            expect(attachmentSection, findsOneWidget);
          }
        },
        variant: statusVariants,
      );
      testWidgets(
        '=> return bonus item details test approval section when bapi status is failed',
        (tester) async {
          final currentStatusVariant =
              statusVariants.currentValue ?? StatusType('');
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
                status: currentStatusVariant,
                bapiStatus: StatusType('FAILED'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.fling(
            find.byType(ReturnItemCard),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          await tester.pumpAndSettle();
          if (currentStatusVariant == StatusType('PENDING')) {
            expect(
              find.byKey(WidgetKeys.returnApprovalDetail),
              findsNothing,
            );
          } else {
            expect(
              find.byKey(WidgetKeys.returnApprovalDetail),
              findsOneWidget,
            );
            expect(find.text('Bonus approval details'.tr()), findsOneWidget);
            final reason = find.byKey(
              WidgetKeys.balanceTextRow(
                'Reason'.tr(),
                requestInformationMock.statusReason.getOrDefault,
              ),
            );
            expect(reason, findsOneWidget);
            final approvalNumber = find.byKey(
              WidgetKeys.balanceTextRow(
                'Approval number'.tr(),
                'NA',
              ),
            );
            expect(approvalNumber, findsOneWidget);
            final attachmentSection = find.byKey(
              WidgetKeys.returnAttachmentSection,
            );
            expect(attachmentSection, findsOneWidget);
          }
        },
        variant: statusVariants,
      );

      testWidgets(
        '=> return bonus item test',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus details'.tr()), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text('Bonus'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text(
                'Batch ${requestInformationMock.batch} (Expires ${requestInformationMock.expiryDate.dateString})',
              ),
            ),
            findsOneWidget,
          );
          expect(find.byType(PriceComponent), findsWidgets);

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text(
                'Qty: ${requestInformationMock.returnQuantity} ',
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text(
                'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).'
                    .tr(),
              ),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> return bonus item test for ID',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus details'.tr()), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text('Bonus'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> return bonus item details test',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 1000));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus details'.tr()), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text('Bonus'),
            ),
            findsOneWidget,
          );
          final showDetailsButton = find.text('Show details');
          final hideDetailsButton = find.text('Hide details');

          expect(hideDetailsButton, findsOneWidget);
          await tester.tap(hideDetailsButton);
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text('Bonus return details'),
            ),
            findsNothing,
          );
          expect(showDetailsButton, findsOneWidget);
          await tester.tap(showDetailsButton);
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.returnBonusItemCard),
              matching: find.text('Bonus return details'),
            ),
            findsOneWidget,
          );
          final returnType = find.byKey(
            WidgetKeys.balanceTextRow(
              'Return type',
              requestInformationMock.returnTypeDesc,
            ),
          );
          expect(returnType, findsWidgets);
          final reason = find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason',
              requestInformationMock.returnOrderDesc,
            ),
          );
          expect(reason, findsWidgets);
          final comment = find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments',
              requestInformationMock.remarks.displayText,
            ),
          );
          expect(comment, findsWidgets);
        },
      );

      testWidgets(
        '=> Test loading display',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
        },
      );
      testWidgets(
        '=> Fetch data failed',
        (tester) async {
          const errorMessage = 'Mock Error';
          final expectedState = [
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
            ReturnSummaryDetailsState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(errorMessage))),
            ),
          ];
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable(expectedState),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          expect(find.text(errorMessage), findsOneWidget);
        },
      );

      testWidgets(
        '=> Fetch data success',
        (tester) async {
          final expectedState = [
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
            ),
          ];
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable(expectedState),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final scrollListFinder = find.byKey(WidgetKeys.scrollList);
          expect(
            scrollListFinder,
            findsOneWidget,
          );
          expect(find.byType(ReturnSummaryDetailsSection), findsOneWidget);
          expect(find.byType(ReturnItemCard), findsOneWidget);

          final copyIdButtonFinder =
              find.byKey(WidgetKeys.returnItemDetailCopyButton);
          expect(copyIdButtonFinder, findsOneWidget);
          await tester.tap(copyIdButtonFinder);

          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.scrollUntilVisible(showDetailButtonFinder, -500);
          await tester.pump();
          await tester.tap(showDetailButtonFinder);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
        },
      );

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: true,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> hide outside return policy tag',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: false,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsNothing,
          );
        },
      );

      testWidgets(
        '=> hide outside return policy tag when toggle is off',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: true,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsNothing,
          );
        },
      );

      testWidgets(
        '=> display comment',
        (tester) async {
          final fakeComment = Remarks('fake-comment');
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                remarks: fakeComment,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final showButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            showButtonFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, 1000),
          );
          await tester.pumpAndSettle();
          await tester.tap(showButtonFinder);
          await tester.pumpAndSettle();
          final commentTextFinder = find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments'.tr(),
              fakeComment.displayText,
            ),
          );
          expect(
            find.descendant(
              of: commentTextFinder,
              matching: find.text(
                fakeComment.displayText,
              ),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> Find Bonus Price in Bonus details Section',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                currency: Currency('MYR'),
              ),
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                bonusInformation: [
                  ReturnRequestInformation.empty().copyWith(
                    totalPrice: 200,
                    returnQuantity: 1,
                  ),
                ],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final scrollListFinder = find.byKey(WidgetKeys.scrollList);
          expect(
            scrollListFinder,
            findsOneWidget,
          );
          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.scrollUntilVisible(showDetailButtonFinder, -500);
          await tester.pump();
          await tester.tap(showDetailButtonFinder);
          await tester.pumpAndSettle();
          final bonusPrice = find.text('MYR 200.00', findRichText: true);
          expect(bonusPrice, findsOneWidget);
        },
      );

      testWidgets(
        '=> return items details Display Overridden price & pro-rated price with strike through for Counter offer',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
          expect(itemSummaryPriceFinder, findsOneWidget);
          final unitPriceFinder = find.text('MYR 15.00', findRichText: true);
          final counterOfferPriceFinder =
              find.text('MYR 11.00', findRichText: true);
          final counterOfferMsgFinder =
              find.text('Requested return value counter offer');
          expect(unitPriceFinder, findsOneWidget);
          expect(counterOfferPriceFinder, findsOneWidget);
          expect(counterOfferMsgFinder, findsOneWidget);
        },
      );

      testWidgets(
        '=> return items bonus details display overridden price & pro-rated price with strike through for Counter offer',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final showButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            showButtonFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, 1000),
          );
          await tester.pumpAndSettle();
          await tester.tap(showButtonFinder);
          await tester.pumpAndSettle();
          final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
          expect(itemSummaryPriceFinder, findsNWidgets(2));
          final unitPriceFinder = find.text('MYR 15.00', findRichText: true);
          final counterOfferPriceFinder =
              find.text('MYR 11.00', findRichText: true);
          final counterOfferMsgFinder =
              find.text('Requested return value counter offer');
          final bonusPriceMsgFinder = find.text(
            'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
          );
          expect(unitPriceFinder, findsNWidgets(2));
          expect(counterOfferPriceFinder, findsNWidgets(2));
          expect(counterOfferMsgFinder, findsNWidgets(2));
          expect(bonusPriceMsgFinder, findsOneWidget);
        },
      );

      testWidgets(
          'return summary details item test display return price info icon',
          (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 1000));

        when(() => returnSummaryDetailsBlocMock.state).thenReturn(
          ReturnSummaryDetailsState.initial().copyWith(
            requestInformation: requestInformationMock.copyWith(
              status: StatusType('APPROVED'),
              initialQuantity: 0,
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
        expect(itemSummaryPriceFinder, findsOneWidget);
        final itemPriceFinder = find.text('MYR 11.00', findRichText: true);
        final itemPriceInfoIconFinder = find
            .byKey(WidgetKeys.returnSummaryInfoIcon('Return value changed'));
        expect(itemPriceFinder, findsOneWidget);
        expect(itemPriceInfoIconFinder, findsOneWidget);

        await tester.tap(itemPriceInfoIconFinder);
        await tester.pump();

        final returnSummaryInfoBottomSheetFinder =
            find.byKey(WidgetKeys.returnSummaryInfoBottomSheet);
        final itemPriceInfoIconContentFinder =
            find.text('Request counter offer : <110.0>');
        final itemPriceInfoIconSubContentFinder =
            find.text('Approver updated the value');
        expect(returnSummaryInfoBottomSheetFinder, findsOneWidget);
        expect(itemPriceInfoIconContentFinder, findsOneWidget);
        expect(itemPriceInfoIconSubContentFinder, findsOneWidget);
      });

      testWidgets(
          'return summary details item test display return quantity info icon',
          (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 1000));
        when(() => returnSummaryDetailsBlocMock.state).thenReturn(
          ReturnSummaryDetailsState.initial().copyWith(
            requestInformation: requestInformationMock.copyWith(
              status: StatusType('APPROVED'),
              overrideValue: 0,
              priceOverrideTrail: <PriceOverrideTrail>[],
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
        expect(itemSummaryPriceFinder, findsOneWidget);
        final itemQuantityFinder = find.text('Qty: 2');
        final itemQuantityInfoIconFinder = find
            .byKey(WidgetKeys.returnSummaryInfoIcon('Return quantity changed'));
        expect(itemQuantityFinder, findsOneWidget);
        expect(itemQuantityInfoIconFinder, findsOneWidget);

        await tester.tap(itemQuantityInfoIconFinder);
        await tester.pump();

        final returnSummaryInfoBottomSheetFinder =
            find.byKey(WidgetKeys.returnSummaryInfoBottomSheet);
        final itemQuantityInfoIconContentFinder =
            find.text('Request Return quantity : <3>');
        final itemQuantityInfoIconSubContentFinder =
            find.text('Approver updated the QTY');
        expect(returnSummaryInfoBottomSheetFinder, findsOneWidget);
        expect(itemQuantityInfoIconContentFinder, findsOneWidget);
        expect(itemQuantityInfoIconSubContentFinder, findsOneWidget);
      });

      testWidgets(
        '=> display WareHouse Storage Condition tag',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                wareHouseStorageCondition: StorageCondition('AC'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final wareHouseStorageConditionTag =
              find.byKey(WidgetKeys.wareHouseStorageConditionTag);
          expect(wareHouseStorageConditionTag, findsOneWidget);
          expect(
            find.text('Air Conditioned'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> display WareHouse Storage Condition tag for bonus',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                wareHouseStorageCondition: StorageCondition('AC'),
                bonusInformation: [
                  requestInformationMock.copyWith(
                    wareHouseStorageCondition: StorageCondition('AC'),
                  ),
                ],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final showButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            showButtonFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, 1000),
          );
          await tester.pumpAndSettle();
          await tester.tap(showButtonFinder);
          await tester.pumpAndSettle();
          final wareHouseStorageConditionTag =
              find.byKey(WidgetKeys.wareHouseStorageConditionTag);
          expect(
            wareHouseStorageConditionTag,
            findsAtLeast(2),
          );
          expect(
            find.text('Air Conditioned'),
            findsAtLeast(2),
          );
        },
      );

      group('=> Attachment section', () {
        final scrollList = find.byKey(WidgetKeys.scrollList);
        const scrollOffset = Offset(0, -300);
        const attachmentTestIndex = 0;

        testWidgets('=> Tap Download attachment', (tester) async {
          final attachmentCount = requestInformationMock.attachmentUrl.length;
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                status: StatusType(''),
                bonusInformation: [],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final expandButton =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            expandButton,
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          await tester.tap(expandButton);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.returnAttachmentSection),
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          final attachmentTile = find.byKey(WidgetKeys.returnAttachmentTile);
          final downloadButton =
              find.byKey(WidgetKeys.returnAttachmentDownloadButton);
          expect(
            attachmentTile,
            findsNWidgets(attachmentCount),
          );
          expect(
            find.descendant(of: attachmentTile, matching: downloadButton),
            findsNWidgets(attachmentCount),
          );
          await tester.tap(downloadButton.at(attachmentTestIndex));
          await tester.pump();
          verify(
            () => returnSummaryDetailsBlocMock.add(
              ReturnSummaryDetailsEvent.downloadFile(
                file: requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ),
          ).called(1);
        });

        testWidgets('=> Attachment is downloading', (tester) async {
          final attachmentCount = requestInformationMock.attachmentUrl.length;
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              downloadingAttachments: [
                requestInformationMock.attachmentUrl[attachmentTestIndex],
              ],
              requestInformation: requestInformationMock.copyWith(
                status: StatusType(''),
                bonusInformation: [],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final expandButton =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            expandButton,
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          await tester.tap(expandButton);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.returnAttachmentSection),
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          final attachmentTile = find.byKey(WidgetKeys.returnAttachmentTile);
          final downloadButton =
              find.byKey(WidgetKeys.returnAttachmentDownloadButton);
          expect(
            attachmentTile,
            findsNWidgets(attachmentCount),
          );
          expect(
            find.descendant(of: attachmentTile, matching: downloadButton),
            findsNWidgets(attachmentCount - 1),
          );
          expect(
            find.descendant(
              of: attachmentTile,
              matching: find.byKey(WidgetKeys.loadMoreLoader),
            ),
            findsOneWidget,
          );
          await tester.tap(downloadButton.at(attachmentTestIndex));
          await tester.pump();
          verifyNever(
            () => returnSummaryDetailsBlocMock.add(
              ReturnSummaryDetailsEvent.downloadFile(
                file: requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ),
          );
        });

        testWidgets('=> Download attachment successfully', (tester) async {
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable([
              ReturnSummaryDetailsState.initial().copyWith(
                downloadFailureOrSuccessOption:
                    optionOf(const Right('success')),
                downloadedAttachment:
                    requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ]),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          final snackBarMessage = tester
              .widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage))
              .data;
          expect(
            snackBarMessage,
            equals('The attachments downloaded successfully'),
          );
        });

        testWidgets('=> Download attachment failure', (tester) async {
          const errorMessage = 'fake-error';

          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable([
              ReturnSummaryDetailsState.initial().copyWith(
                downloadFailureOrSuccessOption:
                    optionOf(const Left(ApiFailure.other(errorMessage))),
                downloadedAttachment:
                    requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ]),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          final snackBarMessage = tester
              .widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage))
              .data;
          expect(
            snackBarMessage,
            equals(errorMessage.tr()),
          );
        });
      });

      testWidgets('Return item details with marketplace return',
          (tester) async {
        final marketplaceReturn =
            requestInformationMock.copyWith(isMarketPlace: true);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => returnSummaryDetailsBlocMock.state).thenReturn(
          ReturnSummaryDetailsState.initial().copyWith(
            requestInformation: marketplaceReturn
                .copyWith(bonusInformation: [marketplaceReturn]),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byType(MarketPlaceRectangleLogo), findsOne);
        expect(
          find.descendant(
            of: find.byType(MarketPlaceSellerTitle),
            matching: find.text(marketplaceReturn.principalName.name),
          ),
          findsOne,
        );
        final returnTile = find.byKey(WidgetKeys.returnItemKey);
        await tester.scrollUntilVisible(returnTile, 200);
        await tester.pump();
        final batchAndExpString =
            find.text('${'Batch'.tr()}: NA - ${'Expires'.tr()}: NA');
        expect(batchAndExpString, findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.returnDetailShowDetailButton));
        await tester.pump();
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Seller code',
              marketplaceReturn.principal,
            ),
          ),
          findsOne,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Seller name',
              marketplaceReturn.principalName.name,
            ),
          ),
          findsOne,
        );
        final bonusTile = find.byKey(WidgetKeys.returnBonusItemCard);
        await tester.scrollUntilVisible(bonusTile, 200);
        await tester.pump();
        expect(
          find.descendant(
            of: bonusTile,
            matching: find.text('Batch NA (Expires NA)'),
          ),
          findsOne,
        );
      });
    },
  );
}
