import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/core/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_material.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_history_stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../integration_test/robots/common/extension.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_variant_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final viewByOrderBlocMock = ViewByOrderBlocMock();
  final mockViewByItemDetailsBloc = ViewByItemDetailsBlocMock();
  final mockViewByItemsBloc = ViewByItemsBlocMock();
  final viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
  late SalesOrgMockBloc mockSalesOrgBloc;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AuthBloc mockAuthBloc;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;

  late EligibilityBlocMock eligibilityBlocMock;
  late CartBlocMock cartBlocMock;
  late ProductImageBloc mockProductImageBloc;
  late PoAttachmentBloc mockPoAttachmentBloc;
  late CustomerInformation customerCodeInfoList;
  late ViewByOrder viewByOrder;
  late OrderHistoryDetailsOrderItem fakeOrderHistoryItem;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late List<CustomerLicense> customerLicense;
  final fakeBatch = StringValue('fake-batch');
  final fakeExpiryDate = DateTimeStringValue('2023-10-04');

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
    locator.registerFactory(() => reOrderPermissionBlocMock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());
    cartBlocMock = CartBlocMock();
    customerCodeInfoList =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    viewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    fakeOrderHistoryItem = viewByOrder
        .orderHeaders.first.orderHistoryDetailsOrderItem.first
        .copyWith(
      batches: [
        Batches(
          batchNumber: fakeBatch,
          expiryDate: fakeExpiryDate,
        ),
      ],
    );
    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
  });
  group('Order History Details Page', () {
    setUp(() async {
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      mockProductImageBloc = ProductImageBlocMock();
      mockAuthBloc = AuthBlocMock();
      mockPoAttachmentBloc = PoAttachmentBlocMock();
      mockSalesOrgBloc = SalesOrgMockBloc();
      autoRouterMock = AutoRouteMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => viewByOrderBlocMock.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => viewByOrderDetailsBlocMock.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role(
              description: '',
              name: '',
              id: '',
              type: RoleType('client'),
            ),
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('SG'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerAttr7: CustomerAttr7('ZEV'),
            customerGrp4: CustomerGrp4('VR'),
          ),
        ),
      );
      when(() => mockPoAttachmentBloc.state)
          .thenReturn(PoAttachmentState.initial());

      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);

      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial(),
      );

      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: <OrderHistoryItem>[
              OrderHistoryItem.empty().copyWith(
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: 17.2,
                totalPrice: 516,
              ),
            ],
          ),
        ),
      );
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        useMediaQuery: false,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => mockViewByItemDetailsBloc,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => viewByOrderDetailsBlocMock,
          ),
          BlocProvider<ViewByItemsBloc>(
            create: (context) => mockViewByItemsBloc,
          ),
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: ((context) => eligibilityBlocMock),
          ),
          BlocProvider<CartBloc>(
            create: ((context) => cartBlocMock),
          ),
          BlocProvider<ReOrderPermissionBloc>(
            create: ((context) => reOrderPermissionBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => mockPoAttachmentBloc,
          ),
          BlocProvider<PaymentCustomerInformationBloc>(
            create: ((context) => paymentCustomerInformationBlocMock),
          ),
        ],
        child: const Material(
          child: ViewByOrderDetailsPage(),
        ),
      );
    }

    testWidgets('Payment Term if empty', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermWidget =
          find.byKey(WidgetKeys.balanceTextRow('Payment term', 'NA'));
      expect(paymentTermWidget, findsOneWidget);
    });

    testWidgets('Hide Payment Term when disablePaymentTermsDisplay is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          user: fakeClientUser,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermWidget = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermWidget, findsNothing);
    });

    testWidgets('Show Payment Term when disablePaymentTermsDisplay is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermWidget = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermWidget, findsOneWidget);
    });

    testWidgets('loaderImage  test ', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets(
        'Show material combination code with GMC part when Government material code is enabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderHeaderSection = find.byType(OrderHeaderSection);
      expect(orderHeaderSection, findsOneWidget);
      await tester.drag(orderHeaderSection, const Offset(0, -500));
      await tester.pumpAndSettle();

      final combinationCode = find.text(
        '${fakeOrderHistoryItem.materialNumber.displayMatNo} | ${fakeOrderHistoryItem.governmentMaterialCode}',
      );
      expect(combinationCode, findsOneWidget);
    });

    testWidgets(
        'Show material combination code without GMC part when Government material code is disabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderHeaderSection = find.byType(OrderHeaderSection);
      expect(orderHeaderSection, findsOneWidget);
      await tester.drag(orderHeaderSection, const Offset(0, -500));
      await tester.pumpAndSettle();
      final materialNumber =
          find.text(fakeOrderHistoryItem.materialNumber.displayMatNo);
      expect(materialNumber, findsWidgets);
      final combinationCode = find.text(
        '${fakeOrderHistoryItem.materialNumber.displayMatNo} | ${fakeOrderHistoryItem.governmentMaterialCode}',
      );
      expect(combinationCode, findsNothing);
    });

    testWidgets('test when disablePaymentTermsDisplay enabled', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          user: fakeClientUser,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsOneWidget);

      final paymentTermsSection = find.byKey(
        WidgetKeys.paymentTermKey,
      );
      expect(paymentTermsSection, findsNothing);
    });

    testWidgets('test when disablePaymentTermsDisplay disabled',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsOneWidget);

      final paymentTermsSection = find.byKey(
        WidgetKeys.paymentTermKey,
      );
      expect(paymentTermsSection, findsOneWidget);
    });

    testWidgets('test when enableSpecialInstructions is false', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeIDSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsNothing);
    });

    group('Attachments -', () {
      final attachmentList = [
        PoDocuments.empty().copyWith(name: 'fake-name-1'),
        PoDocuments.empty().copyWith(name: 'fake-name-2'),
      ];

      setUp(() {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
      });

      testWidgets('Empty state', (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.balanceTextRow('Attachments'.tr(), 'NA')),
          findsOneWidget,
        );
      });

      testWidgets('Collapsed state', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.text('Attachments:'), findsOneWidget);
        expect(find.byKey(WidgetKeys.poAttachmentTile), findsOneWidget);
        final showMoreButton = find.text('Show more'.tr());
        expect(showMoreButton, findsOneWidget);
        await tester.tap(showMoreButton);
        await tester.pump();
        verify(
          () => viewByOrderDetailsBlocMock
              .add(const ViewByOrderDetailsEvent.expandAttachments()),
        ).called(1);
      });

      testWidgets('Expanded state', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty()
                .copyWith(orderHistoryDetailsPoDocuments: attachmentList),
            isExpanded: true,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.text('Attachments:'), findsOneWidget);
        final poAttachmentTile = find.byKey(WidgetKeys.poAttachmentTile);
        const index = 1;
        expect(
          poAttachmentTile,
          findsNWidgets(attachmentList.length),
        );
        expect(find.text('Show less'.tr()), findsOneWidget);
        await tester.tap(poAttachmentTile.at(index));
        await tester.pump();
        verify(
          () => mockPoAttachmentBloc.add(
            PoAttachmentEvent.downloadFile(files: [attachmentList[index]]),
          ),
        ).called(1);
      });

      testWidgets('Download success', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );

        whenListen(
          mockPoAttachmentBloc,
          Stream.fromIterable([
            PoAttachmentState.initial().copyWith(
              failureOrSuccessOption: optionOf(const Right(unit)),
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(snackBarMessage).data,
          equals('Attachments downloaded successfully.'.tr()),
        );
      });

      testWidgets('Download failure', (tester) async {
        const fakeMessage = 'Fake-error-message';
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );

        whenListen(
          mockPoAttachmentBloc,
          Stream.fromIterable([
            PoAttachmentState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(fakeMessage))),
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(snackBarMessage).data,
          equals(fakeMessage.tr()),
        );
      });
    });

    testWidgets('test when enableSpecialInstructions is true', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets('test when enableMobileNumber is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching:
              find.byKey(WidgetKeys.balanceTextRow('Contact person', 'NA')),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Contact number'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('test when enableFutureDeliveryDay is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Request delivery date'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('test when enableReferenceNote is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Reference note'),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'test display order details sub total & grand total as 0 for PnG materials',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('external_sales_rep'),
            ),
          ),
        ),
      );

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('0200274167'),
            orderValue: 516.00,
            totalTax: 0.0,
            invoiceNumber: StringValue(''),
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                hidePrice: true,
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                qty: 30,
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: 17.2,
                totalPrice: 516,
                type: OrderItemType('Comm'),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.text('Subtotal (incl.tax):'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'test view by order detail item has price not available for PnG',
        (tester) async {
      final materialNumber = MaterialNumber('000000000021247719');
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            invoiceNumber: StringValue(''),
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                materialNumber: materialNumber,
                unitPrice: 17.2,
                totalPrice: 516,
                type: OrderItemType('Comm'),
                productType: MaterialInfoType('material'),
                hidePrice: true,
              ),
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('external_sales_rep'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final viewByOrderDetailsItemFinder = find.byKey(
        WidgetKeys.viewByOrderDetailItem(materialNumber.displayMatNo, false),
      );
      final priceNotAvailableFinder = find.text(
        'Price Not Available',
        findRichText: true,
      );
      expect(viewByOrderDetailsItemFinder, findsOneWidget);
      expect(priceNotAvailableFinder, findsNWidgets(2));
    });

    testWidgets(
        ' => Hide Batch and EXP info when salesOrgConfig BatchNumDisplay is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      ];
      whenListen(
        viewByOrderDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batches.first.batchNumber.displayDashIfEmpty}\n(${'Expires'.tr()}: ${fakeOrderHistoryItem.batches.first.expiryDate.dateOrDashString})',
      );
      expect(expectedDelivery, findsNothing);
    });

    testWidgets(
        ' => Display Batch and EXP info when salesOrgConfig BatchNumDisplay is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
              ),
            ],
          ),
        ),
      ];
      whenListen(
        viewByOrderDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batches.first.batchNumber.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeOrderHistoryItem.batches.first.expiryDate.dateOrDashString}',
        findRichText: true,
      );
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets(
        ' => Display Batch and EXP info when salesOrgConfig BatchNumDisplay is true for multiple batch and expiry',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final fakeBatch1 = StringValue('Batch1');
      final fakeBatch2 = StringValue('Batch2');
      final fakeExpiry1 = DateTimeStringValue('20240824');
      final fakeExpiry2 = DateTimeStringValue('20250824');

      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                batches: [
                  Batches(
                    batchNumber: fakeBatch1,
                    expiryDate: fakeExpiry1,
                  ),
                  Batches(
                    batchNumber: fakeBatch2,
                    expiryDate: fakeExpiry2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ];
      whenListen(
        viewByOrderDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();

      final expectedDelivery1 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch1.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry1.dateOrDashString}',
        findRichText: true,
      );
      final expectedDelivery2 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch2.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry2.dateOrDashString}',
        findRichText: true,
      );
      expect(expectedDelivery1, findsOneWidget);
      expect(expectedDelivery2, findsOneWidget);
    });

    testWidgets(
        'Buy Again Button not shown for MP order detail when marketPlace is not enabled',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          configs: fakeSGSalesOrgConfigs,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsNothing);
    });

    testWidgets(
        'Buy Again Button shown for MP order detail when marketPlace is enabled',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag is true',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          user: User.empty().copyWith(
            disableCreateOrder: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());

      await tester.pump();

      final buyAgainButton = find.byKey(
        WidgetKeys.viewByOrderBuyAgainButtonKey,
      );

      expect(buyAgainButton, findsNothing);
    });
    testWidgets(
        'Buy again button visible when disable create order flag is false',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            disableCreateOrder: false,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());

      await tester.pump();

      final buyAgainButton = find.byKey(
        WidgetKeys.viewByOrderBuyAgainButtonKey,
      );

      expect(buyAgainButton, findsOneWidget);
    });

    testWidgets('Find Order created Status Label', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                sAPStatus: OrderStepValue('Order created'),
                productType: MaterialInfoType('material'),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByOrderDetailsList = find.byKey(WidgetKeys.scrollList);
      final orderItemsList = find.byKey(
        WidgetKeys.viewByOrderDetailItemsSection,
      );

      await tester.dragUntilVisible(
        orderItemsList,
        viewByOrderDetailsList,
        const Offset(0.0, -200.0),
      );

      await tester.pumpAndSettle();
      final orderCreatedText = find.text('Order created');
      expect(orderCreatedText, findsOneWidget);
    });

    testWidgets('Find ordered items list when product type is empty',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType('material'),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByOrderDetailsList = find.byKey(WidgetKeys.scrollList);
      final orderItemsList = find.byKey(
        WidgetKeys.viewByOrderDetailItemsSection,
      );

      await tester.dragUntilVisible(
        orderItemsList,
        viewByOrderDetailsList,
        const Offset(0.0, -200.0),
      );
    });

    group('Offer tag -', () {
      testWidgets('Visible when material have offer', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                promoStatus: true,
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -200.0),
        );
        expect(find.byKey(WidgetKeys.offerTag), findsOneWidget);
      });

      testWidgets('Invisible when material is bonus', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                type: OrderItemType('Bonus'),
                promoStatus: true,
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -200.0),
        );
        expect(find.byKey(WidgetKeys.offerTag), findsNothing);
      });
    });

    testWidgets('Test display full customer address', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: customerCodeInfoList.soldToInformation.last,
          shipToInfo:
              customerCodeInfoList.soldToInformation.last.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      const fullCustomerAddress =
          'RSD HOSPITALS SDN BHD (SJMC)   t/a SUBANG JAYA MEDICAL CENTRE, NO 1 JALAN SS 12/1A, 47500 SUBANG JAYA SELANGOR, PETALINGx, PETALING JAYAx 47500';
      final customerAddressFinder = find.textContaining(fullCustomerAddress);

      expect(customerAddressFinder, findsOneWidget);
    });
    testWidgets('Find item level tax percentage', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem.first
                  .copyWith(
                unitPrice: 100,
                qty: 10,
                totalUnitPrice: 1000,
                totalTax: 50,
                taxRate: 5,
                totalPrice: 1050,
              ),
            ],
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final viewByOrderDetailItemsSection =
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection);

      await tester.dragUntilVisible(
        viewByOrderDetailItemsSection,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -500),
      );

      await tester.pumpAndSettle();

      expect(viewByOrderDetailItemsSection, findsOneWidget);
      final totalPriceWithTax = find.textContaining(
        '1,050',
        findRichText: true,
      );
      final tax = find.textContaining(
        ' (5.0% tax)',
        findRichText: true,
      );
      final taxAmount = find.textContaining(
        'THB 50',
        findRichText: true,
      );
      expect(tax, findsOneWidget);
      expect(taxAmount, findsOneWidget);
      expect(totalPriceWithTax, findsOneWidget);
    });

    testWidgets('Test display full ship-to address', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: customerCodeInfoList.soldToInformation.last,
          shipToInfo:
              customerCodeInfoList.soldToInformation.last.shipToInfos.first,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      const fullShipToAddress =
          'RSD HOSPITALS SDN BHD (SJMC) t/a SUBANG JAYA MEDICAL CENTRE, NO 1 JALAN SS 12/1A, 47500 SUBANG, JAYA, PETALING, PETALING JAYA 47500';
      final shipToAddressFinder = find.textContaining(fullShipToAddress);
      expect(shipToAddressFinder, findsOneWidget);
    });

    testWidgets('Status tracker is  displayed with ID market', (tester) async {
      const fakeStatus = 'Order created';
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              processingStatus: OrderStepValue(fakeStatus),
            ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.statusTracker(fakeStatus)),
        findsOneWidget,
      );
    });

    testWidgets('Order Bundle item is visible when order contains bundle',
        (tester) async {
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty()
            .copyWith(productType: MaterialInfoType.bundle()),
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              orderHistoryDetailsOrderItem: bundleList,
            ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );

      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(OrderBundleItem), findsNWidgets(bundleList.length));
    });

    testWidgets('Order Bundle item is invisible when bundle detail is loading',
        (tester) async {
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty()
            .copyWith(productType: MaterialInfoType.bundle()),
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoadingBundleDetail: true,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(LoadingShimmer), findsWidgets);
    });

    testWidgets('Bundle information is visible', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          productType: MaterialInfoType.bundle(),
          material: MaterialInfo.empty().copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
          ),
        ),
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.orderHistoryBundleInformation),
        findsOneWidget,
      );
    });

    testWidgets('Order summary section - Hide Tax Rate for VN', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.text('Subtotal (excl.tax):'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderTaxKey),
          matching: find.text('Tax:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Order summary section - Enable Tax Rate for other market except VN',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeKHSalesOrganisation,
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.text('Subtotal (excl.tax):'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderTaxKey),
          matching: find.textContaining('Tax at'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
    });

    // testWidgets(
    //     'Order summary section - Display Tax Rate for other market except VN',
    //     (tester) async {
    //   const finalPrice = 100.0;
    //   const vatValue = 10.0;
    //   const quantity = 2;
    //   const subTotalValueWithoutTax = finalPrice * quantity;
    //   const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
    //   const grandTotalValue = subTotalValueWithoutTax + totalTax;
    //   when(() => eligibilityBlocMock.state).thenReturn(
    //     EligibilityState.initial().copyWith(
    //       salesOrganisation: fakeMYSalesOrganisation,
    //       salesOrgConfigs: fakeMYSalesOrgConfigTaxBreakdownEnabled,
    //     ),
    //   );

    //   when(() => viewByOrderDetailsBlocMock.state).thenReturn(
    //     ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
    //       orderHistoryDetailsOrderItem: [
    //         fakeOrderHistoryItem.copyWith(
    //           totalPrice: grandTotalValue,
    //           tax: vatValue,
    //           unitPrice: finalPrice,
    //         )
    //       ],
    //       totalTax: totalTax,
    //       orderValue: subTotalValueWithoutTax,
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget());
    //   await tester.pumpAndSettle();
    //   expect(
    //     find.descendant(
    //       of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
    //       matching: find.text('Subtotal (excl.tax):'),
    //     ),
    //     findsOneWidget,
    //   );
    //   expect(
    //     find.descendant(
    //       of: find.byKey(WidgetKeys.viewByOrderTaxKey),
    //       matching: find.text('Tax at ${vatValue.toInt()}%:'),
    //     ),
    //     findsOneWidget,
    //   );
    //   expect(
    //     find.descendant(
    //       of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
    //       matching: find.textContaining('Grand total:'),
    //     ),
    //     findsOneWidget,
    //   );
    // });

    testWidgets('BundleItemMaterial is visible', (tester) async {
      when(
        () => autoRouterMock.push(const ViewByItemDetailsPageRoute()),
      ).thenAnswer((invocation) => Future(() => null));
      final fakeOrderHistory = OrderHistory.empty().copyWith(
        orderHistoryItems: <OrderHistoryItem>[
          OrderHistoryItem.empty().copyWith(
            materialNumber: MaterialNumber('1234567890'),
            unitPrice: 17.2,
            totalPrice: 516,
          ),
        ],
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          materialNumber: MaterialNumber('1234567890'),
          productType: MaterialInfoType.bundle(),
        ),
      ];
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              orderHistoryDetailsOrderItem: bundleList,
            ),
      );

      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: fakeOrderHistory,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(BundleItemMaterial), findsWidgets);

      final orderHistoryBundleItemMaterial =
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial('1234567890'));

      expect(orderHistoryBundleItemMaterial, findsOneWidget);

      await tester.dragUntilVisible(
        orderHistoryBundleItemMaterial,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -200),
      );
      expect(orderHistoryBundleItemMaterial, findsOneWidget);
      await tester.pump();

      await tester.tap(orderHistoryBundleItemMaterial);
      await tester.pumpAndSettle();
      verify(
        () => mockViewByItemDetailsBloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistory.orderHistoryItems.first.orderNumber,
            lineNumber: fakeOrderHistory.orderHistoryItems.first.lineNumber,
          ),
        ),
      ).called(1);
    });

    group('in ID market', () {
      testWidgets('Order item', (tester) async {
        const fakeQty = 2;
        const fakePickedQty = 1;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                qty: fakeQty,
                pickedQuantity: fakePickedQty,
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.drag(find.byType(ListView), const Offset(0, -10000));
        await tester.pumpAndSettle();
        final item = find.byKey(
          WidgetKeys.viewByOrderDetailItem(
            fakeOrderHistoryItem.materialNumber.displayMatNo,
            false,
          ),
        );
        expect(item, findsOneWidget);
        expect(
          find.descendant(of: item, matching: find.byType(StatusLabel)),
          findsNothing,
        );
        expect(
          find.descendant(
            of: item,
            matching: find.text('$fakePickedQty of $fakeQty stocks fulfilled'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Order summary section for ID', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 11,
            ),
          ),
        );

        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            orderHistoryDetails:
                OrderHistoryDetails.empty().copyWith(taxRate: 11),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
            matching: find.text('Subtotal (excl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderIdSmallOrderFeeKey),
            matching: find.text('Small order fee:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderIdTaxKey),
            matching: find.text('Tax at 11.0%:'),
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Applies to orders less than ${StringUtils.formatPrice(fakeIDSalesOrgConfigs, 300000)}',
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderIdManualFeeKey),
            matching: find.textContaining('Manual fee:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderIdGrandTotalKey),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderIdTotalSavingsKey),
            matching: find.textContaining('Total savings:'),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        '=> NOT display counter offer when order history item is NOT conter offer one',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          viewByOrderList: viewByOrder,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final orderItemPrice = find.byType(OrderItemPrice);
      expect(orderItemPrice, findsOneWidget);
      final offerAppliedTxt = find.text('Offer applied'.tr());
      expect(offerAppliedTxt, findsNothing);
    });

    testWidgets(
      '=> Display material price with tax when order history item is applied tax',
      (tester) async {
        final currentSalesOrgConfigVariant =
            salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;
        final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;

        final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
          salesOrg: currentSalesOrg,
        );

        final currency = currentSalesOrgConfigVariant.currency.code;
        final hideSubTotalTax =
            currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown;
        final hideItemTax =
            !currentSalesOrgConfigVariant.displayItemTaxBreakdown;

        const unitPrice = 100.0;
        const quantity = 2;
        const taxRate = 5.0;
        const totalTax = 10.0;
        const totalUnitPrice = unitPrice * quantity;

        const totalPrice = totalUnitPrice + totalTax;

        final subTotalValue = hideSubTotalTax ? totalUnitPrice : totalPrice;

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: currentSalesOrganisation,
            salesOrgConfigs: currentSalesOrgConfigVariant,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            salesOrganisation: currentSalesOrganisation,
            configs: currentSalesOrgConfigVariant,
            orderHistoryDetails: viewByOrder.orderHeaders.first.copyWith(
              orderValue: subTotalValue,
              orderHistoryDetailsOrderItem: [
                viewByOrder
                    .orderHeaders.first.orderHistoryDetailsOrderItem.first
                    .copyWith(
                  totalUnitPrice: totalUnitPrice,
                  taxRate: taxRate,
                  totalTax: totalTax,
                  totalPrice: totalPrice,
                  qty: quantity,
                ),
              ],
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final quantityAndPriceWithTax = find.byType(QuantityAndPriceWithTax);
        await tester.dragUntilVisible(
          quantityAndPriceWithTax,
          find.byType(ListView),
          const Offset(0.0, -200.0),
        );
        //checking quantityAndPriceWithTax widget
        expect(quantityAndPriceWithTax, findsOneWidget);
        final itemTaxFinder = find.byKey(WidgetKeys.itemTax);
        await tester.scrollUntilVisible(quantityAndPriceWithTax, -200);

        //check quantity
        expect(
          find.descendant(
            of: quantityAndPriceWithTax,
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is Text &&
                  widget.key == WidgetKeys.cartItemProductQty &&
                  widget.data!.contains(quantity.toString()),
            ),
          ),
          findsOneWidget,
        );
        //check total price
        expect(
          tester
              .widget<PriceComponent>(
                find.byKey(WidgetKeys.cartItemProductTotalPrice),
              )
              .price,
          totalUnitPrice.toString(),
        );

        //if item tax disable no need to check tax, just return
        if (hideItemTax) {
          expect(itemTaxFinder, findsNothing);
          return;
        }

        //checking item tax
        final materialTaxWidget = find.byType(ItemTax);
        expect(materialTaxWidget, findsOneWidget);
        expect(itemTaxFinder, findsOneWidget);

        //checking item total tax
        expect(
          find.descendant(
            of: itemTaxFinder,
            matching: priceComponent(
              currentSalesOrg.isID
                  ? totalTax.priceDisplayForID(currency)
                  : totalTax.priceDisplay(currency),
            ),
          ),
          findsOneWidget,
        );

        //checking item tax percentage
        final itemTaxPercentage = find.byKey(WidgetKeys.itemTaxPercentage);
        expect(
          find.descendant(
            of: itemTaxFinder,
            matching: itemTaxPercentage,
          ),
          findsOneWidget,
        );
        expect(
          tester.widget<Text>(itemTaxPercentage).data,
          ' ($taxRate% ${'tax'.tr()})',
        );

        //checking item total price at item tax level
        find.descendant(
          of: itemTaxFinder,
          matching: find.descendant(
            of: find.byKey(WidgetKeys.finalTotalPriceWithTax),
            matching: priceComponent(
              currentSalesOrg.isID
                  ? totalPrice.priceDisplayForID(currency)
                  : totalPrice.priceDisplay(currency),
            ),
          ),
        );
      },
      variant: salesOrgConfigVariant,
    );

    testWidgets(
      '=> Order Summary Subtotal excl/incl. with & without tax',
      (tester) async {
        final currentSalesOrgConfigVariant =
            salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;
        final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;
        final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
          salesOrg: currentSalesOrg,
        );
        final currency = currentSalesOrgConfigVariant.currency.code;
        final hideSubTotalTax =
            currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown;
        const unitPrice = 100.0;
        const quantity = 2;
        final taxRate = currentSalesOrgConfigVariant.vatValue.toDouble();
        const totalUnitPrice = unitPrice * quantity;
        final totalTax =
            totalUnitPrice * currentSalesOrgConfigVariant.vatValue * 0.01;
        final totalPrice = totalUnitPrice + totalTax;
        final subTotalValue = hideSubTotalTax ? totalUnitPrice : totalPrice;

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: currentSalesOrganisation,
            salesOrgConfigs: currentSalesOrgConfigVariant,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            salesOrganisation: currentSalesOrganisation,
            configs: currentSalesOrgConfigVariant,
            orderHistoryDetails: viewByOrder.orderHeaders.first.copyWith(
              orderValue: subTotalValue,
              totalValue: totalPrice,
              taxRate: taxRate,
              totalTax: totalTax,
              orderHistoryDetailsOrderItem: [
                viewByOrder
                    .orderHeaders.first.orderHistoryDetailsOrderItem.first
                    .copyWith(
                  totalUnitPrice: totalUnitPrice,
                  taxRate: taxRate,
                  totalTax: totalTax,
                  totalPrice: totalPrice,
                  qty: quantity,
                ),
              ],
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final orderSummarySection = find.byType(OrderSummarySection);
        expect(orderSummarySection, findsOneWidget);

        final subTotalFinder = find.byKey(WidgetKeys.viewByOrderSubtotalKey);

        //subtotal price
        expect(
          find.descendant(
            of: subTotalFinder,
            matching: find.text(
              'Subtotal (${currentSalesOrgConfigVariant.displayPrefixTax}.tax):',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: subTotalFinder,
            matching: priceComponent(
              currentSalesOrg.isID
                  ? subTotalValue.priceDisplayForID(currency)
                  : subTotalValue.priceDisplay(currency),
            ),
          ),
          findsOneWidget,
        );

        //Tax % with value
        final taxRateVisible = find.text(
          'Tax at ${currentSalesOrgConfigVariant.vatValue.toDouble()}%:',
        );
        final hideTaxRate = find.text(
          'Tax:',
        );
        final taxSection = find.byKey(
          currentSalesOrg.isID
              ? WidgetKeys.viewByOrderIdTaxKey
              : WidgetKeys.viewByOrderTaxKey,
        );
        expect(
          find.descendant(
            of: taxSection,
            matching:
                currentSalesOrg.isMaterialTax ? hideTaxRate : taxRateVisible,
          ),
          currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown ||
                  currentSalesOrg.isID
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          find.descendant(
            of: taxSection,
            matching: priceComponent(
              currentSalesOrg.isID
                  ? totalTax.priceDisplayForID(currency)
                  : totalTax.priceDisplay(currency),
            ),
          ),
          currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
              ? findsOneWidget
              : findsNothing,
        );

        //grand total price
        final grandTotalFinder = find.byKey(
          currentSalesOrg.isID
              ? WidgetKeys.viewByOrderIdGrandTotalKey
              : WidgetKeys.viewByOrderGrandTotalKey,
        );

        expect(
          find.descendant(
            of: grandTotalFinder,
            matching: find.text('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: grandTotalFinder,
            matching: priceComponent(
              currentSalesOrg.isID
                  ? totalPrice.priceDisplayForID(currency)
                  : totalPrice.priceDisplay(currency),
            ),
          ),
          findsWidgets,
        );
      },
      variant: salesOrgConfigVariant,
    );

    testWidgets(
        '=> List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
      const originPrice = 100.0;
      const unitPrice = 80.0;
      const tax = 5.0;
      const listPrice = originPrice - tax;
      //For SG : enableListPrice = true
      when(
        () => eligibilityBlocMock.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first.copyWith(
            orderHistoryDetailsOrderItem: [
              viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem.first
                  .copyWith(
                originPrice: originPrice,
                unitPrice: unitPrice,
                tax: tax,
                priceAggregate: PriceAggregate.empty(),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('$listPrice'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        '=> List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
      const originPrice = 100.0;
      const unitPrice = 80.0;
      //For PH : enableListPrice = false
      when(
        () => eligibilityBlocMock.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first.copyWith(
            orderHistoryDetailsOrderItem: [
              viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem.first
                  .copyWith(
                originPrice: originPrice,
                unitPrice: unitPrice,
                priceAggregate: PriceAggregate.empty(),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('$originPrice'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets(
        '=> List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
        (tester) async {
      const originPrice = 100.0;
      const unitPrice = 200.0;
      //For SG : enableListPrice = true
      when(
        () => eligibilityBlocMock.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first.copyWith(
            orderHistoryDetailsOrderItem: [
              viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem.first
                  .copyWith(
                originPrice: originPrice,
                unitPrice: unitPrice,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('$originPrice'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets('Find Pending Release - On BackOrder Status Label',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                sAPStatus: OrderStepValue('Pending release - on backorder'),
                productType: MaterialInfoType('material'),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByOrderDetailsList = find.byKey(WidgetKeys.scrollList);
      final orderItemsList = find.byKey(
        WidgetKeys.viewByOrderDetailItemsSection,
      );

      await tester.dragUntilVisible(
        orderItemsList,
        viewByOrderDetailsList,
        const Offset(0.0, -200.0),
      );

      await tester.pumpAndSettle();
      final orderCreatedText = find.text('Pending release - on backorder');
      expect(orderCreatedText, findsOneWidget);
    });

    testWidgets('Display Price Not Available Message for hide price materials',
        (tester) async {
      final materialNumber = MaterialNumber('000000000021247719');
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderValue: 516.0,
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                materialNumber: materialNumber,
                unitPrice: 17.2,
                totalPrice: 516,
                type: OrderItemType('Comm'),
                productType: MaterialInfoType('material'),
                hidePrice: true,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final priceMessageWidgetFinder =
          find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
      final priceMessageFinder = find.text(
        'Price is not available for at least one item. Grand total reflected may not be accurate.'
            .tr(),
      );
      expect(priceMessageWidgetFinder, findsOneWidget);
      expect(priceMessageFinder, findsOneWidget);
    });

    testWidgets(
        'Test Bundle Order, Grand total and Sub total only with displaySubtotalTaxBreakdown is enabled ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          productType: MaterialInfoType.bundle(),
          material: MaterialInfo.empty().copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
          ),
        ),
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('Fake-Order-Number'),
            orderValue: 990.0,
            totalTax: 99.0,
            totalValue: 1089.00,
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.textContaining(
            'Subtotal (${fakeSGSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.text(
            'SGD 990.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderTaxKey),
          matching: find.text(
            'SGD 99.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.text(
            'SGD 1,089.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.orderHistoryBundleInformation),
        findsOneWidget,
      );
    });

    testWidgets(
        'Test Bundle Order, Test Grand total and Sub total value only with displaySubtotalTaxBreakdown is disabled ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          productType: MaterialInfoType.bundle(),
          material: MaterialInfo.empty().copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
          ),
        ),
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('Fake-Order-Number'),
            orderValue: 1089.0,
            totalTax: 99.0,
            totalValue: 1089.00,
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.textContaining(
            'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderSubtotalKey),
          matching: find.text(
            'MYR 1,089.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderTaxKey),
          matching: find.textContaining('Tax at 10%'),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderTaxKey),
          matching: find.text(
            'MYR 99.00',
            findRichText: true,
          ),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
          matching: find.text(
            'MYR 1,089.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.orderHistoryBundleInformation),
        findsOneWidget,
      );
    });

    testWidgets('BillToInfo when enable bill to true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
        ),
      );
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              await PaymentCustomerInformationLocalDataSource()
                  .getPaymentCustomerInformation(),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.payerInformation), findsOneWidget);
    });

    testWidgets('BillToInfo when enable bill to true and billToInfo is empty',
        (tester) async {
      when(() => paymentCustomerInformationBlocMock.state).thenAnswer(
        (invocation) => PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: PaymentCustomerInformation.empty(),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
    });

    testWidgets('BillToInfo when enable bill to false', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
    });

    testWidgets(
        'Show seller and MP logo at header + Display batch & expiry date NA with MP orders',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            batchNumDisplay: true,
          ),
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                isMarketPlace: true,
              ),
            ],
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final header = find.byType(OrderHeaderSection);
      final detail = find.byType(OrderItemDetailsSection);
      final sellerName = fakeOrderHistoryItem.principalData.principalName.name;
      expect(
        find.descendant(
          of: header,
          matching: find.byType(MarketPlaceRectangleLogo),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: header,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is MarketPlaceSellerTitle &&
                widget.sellerName == sellerName,
          ),
        ),
        findsOneWidget,
      );

      await tester.dragUntilVisible(
        detail,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      expect(
        find.descendant(of: detail, matching: find.text(sellerName)),
        findsNothing,
      );
      await tester.pumpAndSettle();
      final batchExpiryDate = find.textContaining(
        'Batch: NA - Expires: NA',
        findRichText: true,
      );
      expect(batchExpiryDate, findsOneWidget);
    });

    testWidgets('Marketplace bundle displayed with batch & exp as NA',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            batchNumDisplay: true,
          ),
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
          orderHistoryDetailsOrderItem: [
            OrderHistoryDetailsOrderItem.empty().copyWith(
              materialNumber: MaterialNumber('fake-bundle'),
              productType: MaterialInfoType.bundle(),
              isMarketPlace: true,
              batches: fakeOrderHistoryItem.batches,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderHistoryBundleItemMaterial =
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial('fake-bundle'));
      await tester.dragUntilVisible(
        orderHistoryBundleItemMaterial,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -200),
      );
      expect(orderHistoryBundleItemMaterial, findsOneWidget);
      expect(
        find.descendant(
          of: find.descendant(
            of: orderHistoryBundleItemMaterial,
            matching: find.byType(OrderHistoryStockInfo),
          ),
          matching: find.text('Batch: NA - Expires: NA'),
        ),
        findsOne,
      );
    });

    testWidgets(
      ' -> Find edi if customer info status is edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeEDICustomerCodeInfo,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            customerCodeInfo: fakeEDICustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(ediBanner, findsOneWidget);
        expect(ediBannerTitle, findsOneWidget);
        expect(ediBannerSubTitle, findsOneWidget);

        final buyAgainButton = find.byKey(
          WidgetKeys.viewByOrderBuyAgainButtonKey,
        );

        expect(buyAgainButton, findsNothing);
      },
    );

    testWidgets(
      ' -> Not Find edi if customer info status is not edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(ediBanner, findsNothing);
        expect(ediBannerTitle, findsNothing);
        expect(ediBannerSubTitle, findsNothing);

        final buyAgainButton = find.byKey(
          WidgetKeys.viewByOrderBuyAgainButtonKey,
        );

        expect(buyAgainButton, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find License expired banner in products tab',
      (WidgetTester tester) async {
        when(
          () => autoRouterMock.push(const ProfilePageRoute()),
        ).thenAnswer((invocation) => Future(() => null));
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(
            customerLicenses: customerLicense,
            salesOrganization: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final viewLicenseButton = find.byKey(WidgetKeys.viewLicenseButton);
        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsOneWidget);
        expect(licenseExpiredBannerTitle, findsOneWidget);
        expect(licenseExpiredBannerSubTitle, findsOneWidget);

        await tester.tap(viewLicenseButton);

        verify(
          () => autoRouterMock.push(const ProfilePageRoute()),
        ).called(1);

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      ' -> License expired banner not visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(customerLicenses: []),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsNothing);
        expect(licenseExpiredBannerTitle, findsNothing);
        expect(licenseExpiredBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
        'Find Add To Cart Error Section when buy again button pressed for covid material when cart have commercial material',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('1234567890'),
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(isCovid: true),
            ],
          ),
          user: fakeClientUser,
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          isUpserting: false,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              isCovid: false,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);
      expect(buyAgainButton, findsOneWidget);
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      await tester.tap(buyAgainButton);
      await tester.pump(const Duration(seconds: 2));
      expect(addToCartErrorSection, findsOneWidget);
    });

    testWidgets(
        'Find Add To Cart Error Section when buy again button pressed for commercial material when cart have covid material',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('1234567890'),
            orderHistoryDetailsOrderItem: [fakeOrderHistoryItem],
          ),
          user: fakeClientUser,
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          isUpserting: false,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              isCovid: true,
              materialInfo: MaterialInfo.empty().copyWith(
                isFOCMaterial: true,
              ),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);
      expect(buyAgainButton, findsOneWidget);
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      await tester.tap(buyAgainButton);
      await tester.pump(const Duration(seconds: 2));
      expect(addToCartErrorSection, findsOneWidget);
    });

    testWidgets('Display tender information when collapsed', (tester) async {
      final fakeTenderOrderReason = TenderContractReason('730');
      final fakeTenderContractNumber = TenderContractNumber('0040026522');
      final fakeTenderContractReference = TenderContractNumber('HCM-01234');
      const fakeTenderPrice = 11832000.0;

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                tenderContractDetails:
                    OrderHistoryDetailsTenderContract.empty().copyWith(
                  contractNumber: fakeTenderContractNumber,
                  contractReference: fakeTenderContractReference.getValue(),
                  price: fakeTenderPrice,
                  orderReason: fakeTenderOrderReason,
                ),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final detail = find.byType(OrderItemDetailsSection);
      await tester.dragUntilVisible(
        find.byType(OrderItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -550),
      );

      expect(detail, findsOneWidget);
      expect(
        find.descendant(
          of: detail,
          matching: find.byKey(WidgetKeys.tenderExpandableSection),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: detail,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderOrderReason &&
                widget is Text &&
                widget.data!.contains(
                  '${fakeTenderOrderReason.getOrCrash()} - Contract Tender',
                ),
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: detail,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderContractNumber &&
                widget is Text &&
                widget.data == fakeTenderContractNumber.getOrCrash(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Do not display tender information when Tender Order Reason is empty',
        (tester) async {
      final fakeTenderOrderReason = TenderContractReason('');
      final fakeTenderContractNumber = TenderContractNumber('');
      final fakeTenderContractReference = TenderContractNumber('');

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      );
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              OrderHistoryItem.empty().copyWith(
                qty: 10,
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: 17.2,
                totalPrice: 516,
                tenderContractNumber: fakeTenderContractNumber,
                tenderOrderReason: fakeTenderOrderReason,
                tenderPrice: 10.0,
                tenderContractReference: fakeTenderContractReference,
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final detail = find.byType(OrderItemDetailsSection);
      await tester.dragUntilVisible(
        find.byType(OrderItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -550),
      );

      expect(detail, findsOneWidget);
      expect(
        find.descendant(
          of: detail,
          matching: find.byKey(WidgetKeys.tenderExpandableSection),
        ),
        findsNothing,
      );
    });

    testWidgets('Show IRN when enableIRN is true', (tester) async {
      const iRNNumber = '12C 234/11';

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: true,
          ),
        ),
      );

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderHeaderSection = find.byType(OrderHeaderSection);
      expect(orderHeaderSection, findsOneWidget);
      await tester.drag(orderHeaderSection, const Offset(0, -500));
      await tester.pumpAndSettle();

      expect(find.textContaining(iRNNumber), findsOneWidget);
    });

    testWidgets('Do not show IRN when enableIRN is false', (tester) async {
      const iRNNumber = '12C 234/11';

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: false,
          ),
        ),
      );

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderHeaderSection = find.byType(OrderHeaderSection);
      expect(orderHeaderSection, findsOneWidget);
      await tester.drag(orderHeaderSection, const Offset(0, -500));
      await tester.pumpAndSettle();

      expect(find.textContaining(iRNNumber), findsNothing);
    });

    testWidgets(
        'Display Tender tag and offer tag for tender material when offer is applied',
        (tester) async {
      final fakeTenderOrderReason = TenderContractReason('730');
      final fakeTenderContractNumber = TenderContractNumber('0040026522');
      final fakeTenderContractReference = TenderContractNumber('HCM-01234');
      const fakeTenderPrice = 11832000.0;
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                tenderContractDetails:
                    OrderHistoryDetailsTenderContract.empty().copyWith(
                  contractNumber: fakeTenderContractNumber,
                  contractReference: fakeTenderContractReference.getValue(),
                  price: fakeTenderPrice,
                  orderReason: fakeTenderOrderReason,
                ),
                promoStatus: true,
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final detail = find.byType(OrderItemDetailsSection);
      await tester.dragUntilVisible(
        find.byType(OrderItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -550),
      );
      expect(detail, findsOneWidget);
      final offerTag = find.byKey(WidgetKeys.offerTag);
      expect(offerTag, findsOneWidget);
      final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
      expect(tenderTag, findsOneWidget);
    });

    testWidgets('Display Tender tag if material is ordered with tender',
        (tester) async {
      final fakeTenderContractNumber = TenderContractNumber('0040026522');
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                tenderContractDetails:
                    OrderHistoryDetailsTenderContract.empty().copyWith(
                  contractNumber: fakeTenderContractNumber,
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final detail = find.byType(OrderItemDetailsSection);
      await tester.dragUntilVisible(
        find.byType(OrderItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -550),
      );
      expect(detail, findsOneWidget);
      final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
      expect(tenderTag, findsOneWidget);
    });
  });
}
