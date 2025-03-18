import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_with_logo.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_item_section.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/return_request_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/return_status_section.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late ReturnListByRequestBloc mockReturnListByRequestBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ProductImageBloc mockProductImageBloc;
  late ReturnDetailsByRequestBloc mockReturnDetailsByRequestBloc;
  late PoAttachmentBloc mockPoAttachmentBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late RequestInformation requestInformation;

  final statusVariants = ValueVariant<StatusType>(
    {
      StatusType('PENDING'),
      StatusType('APPROVED'),
      StatusType('REJECTED'),
    },
  );

  final requestAttachment = PoDocuments(
    url: 'fake-path',
    name: 'fake-name',
    size: FileSize(256),
    isPoison: false,
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    requestInformation = await ReturnSummaryDetailsRequestInformationLocal()
        .getReturnRequestInformation();
  });
  setUp(() async {
    mockSalesOrgBloc = SalesOrgBlocMock();
    mockUserBloc = UserBlocMock();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockAnnouncementBloc = AnnouncementBlocMock();
    mockReturnDetailsByRequestBloc = ReturnDetailsByRequestBlocMock();
    mockProductImageBloc = ProductImageBlocMock();
    mockReturnListByRequestBloc = ReturnListByRequestBlocMock();
    mockPoAttachmentBloc = PoAttachmentBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
  });

  /////////////////////Finder///////////////////////////////////////////////////
  final bonusPriceComponent = find.byKey(WidgetKeys.bonusPriceComponent);
  /////////////////////////////////////////////////////////////////////////////

  group('Return By Item Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockReturnListByRequestBloc.state)
          .thenReturn(ReturnListByRequestState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockReturnDetailsByRequestBloc.state)
          .thenReturn(ReturnDetailsByRequestState.initial());
      when(() => mockPoAttachmentBloc.state)
          .thenReturn(PoAttachmentState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ReturnListByRequestBloc>(
            create: (context) => mockReturnListByRequestBloc,
          ),
          BlocProvider<ReturnDetailsByRequestBloc>(
            create: (context) => mockReturnDetailsByRequestBloc,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => mockPoAttachmentBloc,
          ),
        ],
        child: const Scaffold(
          body: ReturnRequestDetails(),
        ),
      );
    }

    testWidgets('Return Request Details Body Test - loading', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
      await tester.pump();
    });
    testWidgets('Return Request Details Body Test - Sucess', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('PENDING'),
            requestID: 'fake-id',
          ),
        ),
      );
      final expectedStates = [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: false,
          requestInformation: [
            ReturnRequestInformation.empty()
                .copyWith(returnQuantity: 1, status: StatusType('PENDING')),
          ],
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('PENDING'),
            requestID: 'fake-id',
          ),
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.returnRequestDetailSection),
        findsOneWidget,
      );
      await tester.pump();
      expect(
        find.byType(StatusTrackerSection),
        findsOneWidget,
      );
      expect(
        find.byType(StatusTrackerSection),
        findsOneWidget,
      );
      expect(
        find.textContaining(
          mockReturnDetailsByRequestBloc.state.requestInformation.first.status
              .displayStatusForViewByRequest,
        ),
        findsNWidgets(2),
      );
      await tester.pump();
    });

    testWidgets('Show comment', (tester) async {
      final fakeComment = Remarks('fake-comment');
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              remarks: fakeComment,
              returnQuantity: 1,
            ),
          ],
        ),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));

      await tester.pumpWidget(getWUT());
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
    });

    testWidgets('Return request fail => Bonus return reason', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList
              .map(
                (e) => e.copyWith(
                  bonusInformation: e.bonusInformation
                      .map((e) => e.copyWith(bapiStatus: StatusType('FAILED')))
                      .toList(),
                ),
              )
              .toList(),
        ),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));
      await tester.pumpWidget(getWUT());
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
      final bonusReturnReason = find.byKey(
        WidgetKeys.balanceTextRow(
          'Reason for return',
          requestInformation.returnRequestInformationList.first.bonusInformation
              .first.returnOrderDesc,
        ),
      );
      expect(bonusReturnReason, findsOneWidget);
      expect(bonusPriceComponent, findsNothing);
    });

    testWidgets('Return request not fail => Bonus Price', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList,
        ),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));

      await tester.pumpWidget(getWUT());
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
      expect(bonusPriceComponent, findsOneWidget);
    });

    testWidgets('Bonus return request fail => Bonus return reason',
        (tester) async {
      const bonusRejectReason = 'Bonus reject reason';
      const bonusRejectComment = 'Bonus reject comment';
      const approvalNumber = 'fake-approval-number';

      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            requestInformation.returnRequestInformationList.first.copyWith(
              bonusInformation: [
                requestInformation.returnRequestInformationList.first.copyWith(
                  remarks: Remarks(bonusRejectComment),
                  returnOrderDesc: bonusRejectReason,
                  status: StatusType('APPROVED'),
                  bapiSalesDocNumber: approvalNumber,
                ),
              ],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byKey(
          WidgetKeys.scrollList,
        ),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final showBonusDetail = find.text('Show details');
      expect(showBonusDetail, findsOneWidget);
      await tester.tap(showBonusDetail);
      await tester.pumpAndSettle();

      final hideBonusDetail = find.text('Hide details');
      expect(hideBonusDetail, findsOneWidget);
      await tester.fling(
        find.byKey(
          WidgetKeys.scrollList,
        ),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(find.text('Bonus approval details'), findsOneWidget);
      WidgetKeys.balanceTextRow(
        'Approval number',
        approvalNumber,
      );
      expect(find.text('Bonus return details'), findsOneWidget);
      final bonusReturnReason = find.byKey(
        WidgetKeys.balanceTextRow(
          'Reason',
          bonusRejectReason,
        ),
      );
      expect(bonusReturnReason, findsOneWidget);
      final bonusComment = find.byKey(
        WidgetKeys.balanceTextRow(
          'Comments',
          bonusRejectComment,
        ),
      );
      expect(bonusComment, findsOneWidget);
    });

    testWidgets(
      'Return Request Details Subtotal text',
      (tester) async {
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            isLoading: false,
            requestInformation: [
              ReturnRequestInformation.empty().copyWith(returnQuantity: 1),
            ],
            requestInformationHeader:
                ReturnRequestInformationHeader.empty().copyWith(
              requestID: 'fake-id',
            ),
          ),
        );
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSalesOrg;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: currentSalesOrgVariant,
            ),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.returnRequestDetailSection),
          findsOneWidget,
        );
        expect(
          find.text('Subtotal (excl.tax) :'),
          findsOneWidget,
        );
      },
      variant: salesOrgVariant,
    );

    testWidgets(
      'Return Request Details Bonus Item Only',
      (tester) async {
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                bonusInformation: <ReturnRequestInformation>[],
              ),
            ],
          ),
        );
        await tester.binding.setSurfaceSize(const Size(480, 900));

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.text('Bonus details'.tr()), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(CustomCard),
            matching: find.byType(StatusLabel),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(CustomCard),
            matching: find.text('Bonus'.tr()),
          ),
          findsOneWidget,
        );

        final showHideButton = find.descendant(
          of: find.byType(CustomCard),
          matching: find.byKey(WidgetKeys.returnDetailShowDetailButton),
        );
        expect(
          showHideButton,
          findsOneWidget,
        );
        await tester.dragUntilVisible(
          showHideButton,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(CustomCard),
            matching: find.byKey(
              WidgetKeys.returnBonusApprovalDetail,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(CustomCard),
            matching: find.byKey(
              WidgetKeys.returnBonusReturnDetail,
            ),
          ),
          findsOneWidget,
        );
      },
    );
    testWidgets(
        'return summary details item display Overridden price & pro-rated price with strike through for Counter offer',
        (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));
      await tester.pumpWidget(getWUT());
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
    });

    testWidgets(
        'return summary details item bonus display Overridden price & pro-rated price with strike through for Counter offer',
        (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));

      await tester.pumpWidget(getWUT());
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
    });

    testWidgets(
        'return summary details item test display return price info icon',
        (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList
              .map(
                (e) => e.copyWith(
                  status: StatusType('APPROVED'),
                  initialQuantity: 1,
                ),
              )
              .toList(),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
      await tester.dragUntilVisible(
        itemSummaryPriceFinder,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -500.0),
      );
      expect(itemSummaryPriceFinder, findsOneWidget);
      final itemPriceFinder = find.text('MYR 11.00', findRichText: true);
      final itemPriceInfoIconFinder =
          find.byKey(WidgetKeys.returnSummaryInfoIcon('Return value changed'));
      expect(itemPriceFinder, findsOneWidget);
      expect(itemPriceInfoIconFinder, findsOneWidget);
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pump();

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
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList
              .map(
                (e) => e.copyWith(
                  status: StatusType('APPROVED'),
                  overrideValue: 1,
                  priceOverrideTrail: <PriceOverrideTrail>[],
                ),
              )
              .toList(),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final itemSummaryPriceFinder = find.byType(ReturnSummaryItemPrice);
      expect(itemSummaryPriceFinder, findsOneWidget);
      final itemQuantityFinder = find.text('Qty: 2');
      final itemQuantityInfoIconFinder = find
          .byKey(WidgetKeys.returnSummaryInfoIcon('Return quantity changed'));
      expect(itemQuantityFinder, findsOneWidget);
      expect(itemQuantityInfoIconFinder, findsOneWidget);
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pump();

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

    testWidgets('return summary details test display return items count',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              returnQuantity: 2,
            ),
          ],
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            totalItemCount: '2',
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => mockReturnListByRequestBloc.state).thenReturn(
        ReturnListByRequestState.initial().copyWith(
          returnItemList: [
            ReturnItem.empty().copyWith(itemQty: ReturnQuantity('2')),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      final returnItemCountFinder = find.text('Return items (2)');
      expect(returnItemCountFinder, findsOneWidget);
    });

    testWidgets('=> show `-` when attachment is empty', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 1100));
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            requestInformation.returnRequestInformationList.first.copyWith(
              status: StatusType('APPROVED'),
              bonusInformation: <ReturnRequestInformation>[],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
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
      '=> return items details test approval section when bapi status is success',
      (tester) async {
        final currentStatusVariant =
            statusVariants.currentValue ?? StatusType('');
        await tester.binding.setSurfaceSize(const Size(480, 1100));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                status: currentStatusVariant,
                bapiStatus: StatusType('SUCCESS'),
                bapiSalesDocNumber: '1234',
                bonusInformation: <ReturnRequestInformation>[],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
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
          expect(find.text('Approval details'.tr()), findsOneWidget);
          final reason = find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason'.tr(),
              requestInformation
                  .returnRequestInformationList.first.statusReason.getOrDefault,
            ),
          );
          expect(reason, findsOneWidget);
          final approvalNumber = find.byKey(
            WidgetKeys.balanceTextRow(
              'Approval number'.tr(),
              '1234',
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
        await tester.binding.setSurfaceSize(const Size(480, 1100));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                status: currentStatusVariant,
                bonusInformation: <ReturnRequestInformation>[],
                bapiStatus: StatusType('FAILED'),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
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
          expect(find.text('Approval details'.tr()), findsOneWidget);
          final reason = find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason'.tr(),
              requestInformation
                  .returnRequestInformationList.first.statusReason.getOrDefault,
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
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                status: currentStatusVariant,
                bapiStatus: StatusType('SUCCESS'),
                bapiSalesDocNumber: '123456',
                bonusInformation: [
                  requestInformation.returnRequestInformationList.first
                      .copyWith(
                    prsfd: Prsfd('B'),
                    status: currentStatusVariant,
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
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
              requestInformation
                  .returnRequestInformationList.first.statusReason.getOrDefault,
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
      '=> return bonus item details test approval section whenn bapi status is failed',
      (tester) async {
        final currentStatusVariant =
            statusVariants.currentValue ?? StatusType('');
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                status: currentStatusVariant,
                bapiStatus: StatusType('FAILED'),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
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
              requestInformation
                  .returnRequestInformationList.first.statusReason.getOrDefault,
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
      '=> show approver updated icon for bonus when overrideValue is greater than 0 and status is Approved ',
      (tester) async {
        final status = StatusType('APPROVED');
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                status: status,
                initialQuantity: 0,
                bonusInformation: [
                  requestInformation.returnRequestInformationList.first
                      .copyWith(
                    prsfd: Prsfd('B'),
                    status: status,
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        await tester.pumpAndSettle();

        expect(find.text('Approver updated'), findsOneWidget);
      },
    );

    testWidgets(
      '=> Do not show approver updated icon for bonus when overrideValue is 0 and status is Approved ',
      (tester) async {
        final status = StatusType('APPROVED');
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                status: status,
                overrideValue: 0,
                initialQuantity: 0,
                bonusInformation: [
                  requestInformation.returnRequestInformationList.first
                      .copyWith(
                    prsfd: Prsfd('B'),
                    status: status,
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        await tester.pumpAndSettle();

        expect(find.text('Approver updated'), findsNothing);
      },
    );

    testWidgets(
      '=> Do not show approver updated icon for bonus when overrideValue is greater than 0 and status is not Approved ',
      (tester) async {
        final status = StatusType('rejected');
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            requestInformation: [
              requestInformation.returnRequestInformationList.first.copyWith(
                prsfd: Prsfd('B'),
                status: status,
                bonusInformation: [
                  requestInformation.returnRequestInformationList.first
                      .copyWith(
                    prsfd: Prsfd('B'),
                    status: status,
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        await tester.pumpAndSettle();

        expect(find.text('Approver updated'), findsNothing);
      },
    );
    testWidgets('Return Item section widget', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('reviewed'),
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final statusWidget = find.byType(StatusTrackerSection);
      expect(statusWidget, findsOneWidget);
      final listTitle =
          find.descendant(of: statusWidget, matching: find.byType(ListTile));
      await tester.tap(listTitle);
      await tester.pumpAndSettle();
      final returnStatusWidget = find.byType(ReturnStatusSection);
      expect(returnStatusWidget, findsOneWidget);
      final closeBtn = find.descendant(
        of: returnStatusWidget,
        matching: find.byType(ElevatedButton),
      );
      await tester.tap(closeBtn);
      await tester.pumpAndSettle();
      expect(find.byType(ReturnStatusSection), findsNothing);
    });
    testWidgets('Show MP logo when item is from market place', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(find.byType(MarketPlaceSellerWithLogo), findsOneWidget);
    });

    testWidgets('Display failed message when Bapi failed', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('failed'),
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.text(
          'RO creation for at least one material has failed. Please recreate your return request to proceed.',
        ),
        findsOne,
      );
    });

    testWidgets('Return item section test download success', (tester) async {
      final expectedReturnDetailsState = [
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: PoDocuments.empty(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: requestAttachment,
          downloadFailureOrSuccessOption: none(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: PoDocuments.empty(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: requestAttachment,
          downloadFailureOrSuccessOption: optionOf(Right(File('path'))),
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
        Stream.fromIterable(expectedReturnDetailsState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.text('The attachments downloaded successfully'), findsOne);
    });

    testWidgets('Return item section test download fail', (tester) async {
      final expectedReturnDetailsState = [
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: PoDocuments.empty(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadedAttachment: requestAttachment,
          downloadFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-api-fail-message'))),
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
        Stream.fromIterable(expectedReturnDetailsState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(
        find.text('fake-api-fail-message'),
        findsOne,
      );
    });
    testWidgets('Download attachment function', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              attachmentUrl: [requestAttachment],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.scrollList);
      expect(
        scrollList,
        findsOneWidget,
      );
      await tester.dragUntilVisible(
        find.byType(RequestItemSection),
        scrollList,
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();
      final expandBtn = find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandBtn, findsOneWidget);
      await tester.tap(expandBtn);
      await tester.pumpAndSettle();
      await tester.drag(scrollList, const Offset(0, -1500));
      await tester.pumpAndSettle();
      final downloadAttachmentBtn = find.byKey(
        WidgetKeys.returnAttachmentDownloadButton,
        skipOffstage: false,
      );
      expect(downloadAttachmentBtn, findsOneWidget);
      await tester.tap(downloadAttachmentBtn);
      await tester.pumpAndSettle();
      verify(
        () => mockReturnDetailsByRequestBloc.add(
          ReturnDetailsByRequestEvent.downloadFile(
            file: requestAttachment,
          ),
        ),
      ).called(1);
    });
    testWidgets('Display Quantity override tag for bonus item', (tester) async {
      final bonusItem = ReturnRequestInformation.empty().copyWith(
        initialQuantity: 10,
        returnQuantity: 5,
        status: StatusType('APPROVED'),
      );
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              bonusInformation: [bonusItem],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.scrollList);
      expect(
        scrollList,
        findsOneWidget,
      );
      await tester.dragUntilVisible(
        find.byType(RequestItemSection),
        scrollList,
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();
      final expandBtn = find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandBtn, findsOneWidget);
      await tester.tap(expandBtn);
      await tester.pumpAndSettle();
      await tester.drag(scrollList, const Offset(0, -1500));
      await tester.pumpAndSettle();
      final quantityOverrideApprovedTag = find.descendant(
        of: find.byKey(
          WidgetKeys.returnItemDetailBonusItem,
        ),
        matching: find.byType(ReturnOverrideInfoIcon),
      );
      expect(quantityOverrideApprovedTag, findsOneWidget);
      await tester.tap(quantityOverrideApprovedTag);
      await tester.pumpAndSettle();
      expect(
        find.text('Request Return quantity : <${bonusItem.initialQuantity}>'),
        findsOne,
      );
    });
    testWidgets('No Quantity override tag is shown when intialQuantity is zero',
        (tester) async {
      final bonusItem = ReturnRequestInformation.empty().copyWith(
        initialQuantity: 0,
        status: StatusType('failed'),
      );
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              bonusInformation: [bonusItem],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.scrollList);
      expect(
        scrollList,
        findsOneWidget,
      );
      await tester.dragUntilVisible(
        find.byType(RequestItemSection),
        scrollList,
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();
      final expandBtn = find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandBtn, findsOneWidget);
      await tester.tap(expandBtn);
      await tester.pumpAndSettle();
      await tester.drag(scrollList, const Offset(0, -1500));
      await tester.pumpAndSettle();
      final quantityOverrideApprovedTag = find.descendant(
        of: find.byKey(
          WidgetKeys.returnItemDetailBonusItem,
        ),
        matching: find.byType(ReturnOverrideInfoIcon),
      );
      expect(quantityOverrideApprovedTag, findsNothing);
    });
  });
}
