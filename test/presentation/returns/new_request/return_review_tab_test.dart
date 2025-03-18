import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';

import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/upload_file_list.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_return_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_quantity_and_price.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/widgets/bonus_material_return_widget.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

const link = 'https://www.google.com/';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  final salesOrgBlocMock = SalesOrgMockBloc();
  late EligibilityBloc eligibilityBlocMock;
  late NewRequestBloc newRequestBlocMock;
  final usageCodeBlocMock = UsageCodeBlocMock();
  late ReturnRequestAttachmentBloc returnRequestAttachmentBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ReturnMaterial fakeReturnMaterial;
  late ReturnItemDetails fakeReturnItemDetails;
  late double fakeUnitPrice;
  late String fakeUnitPriceString;
  late double fakeOverridePrice;
  late String fakeOverridePriceString;
  late int fakeBalanceQuantity;
  late int fakeReturnQuantity;
  late List<Usage> fakeUsageList;
  late ReturnMaterialList fakeReturnMaterialList;
  final remarks = Remarks('test-remarks');

  ///////////////////////////Finder/////////////////////////////////////////
  final specialInstructionsField =
      find.byKey(WidgetKeys.specialInstructionsField);
  final returnReferenceField = find.byKey(WidgetKeys.returnReferenceField);
  final returnReviewItemKey = find.byKey(WidgetKeys.returnReviewItemKey);
  /////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    fakeUnitPrice = 8.77;
    fakeUnitPriceString = '8.77';
    fakeOverridePrice = 12;
    fakeOverridePriceString = '12.00';
    fakeBalanceQuantity = 5;
    fakeReturnQuantity = 2;
    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    fakeReturnMaterial = fakeReturnMaterialList.items.first.copyWith(
      unitPrice: RangeValue(fakeUnitPrice.toString()),
      balanceQuantity: IntegerValue(fakeBalanceQuantity.toString()),
      bonusItems: [fakeReturnMaterialList.items.first],
    );
    fakeReturnItemDetails = fakeReturnMaterial.validatedItemDetails.copyWith(
      returnQuantity: ReturnQuantity(fakeReturnQuantity.toString()),
      assignmentNumber: fakeReturnMaterial.assignmentNumber,
      itemNumber: fakeReturnMaterial.itemNumber,
      uploadedFiles: [
        PoDocuments.empty().copyWith(
          name: 'fake_name',
          url: 'fake_path',
          size: FileSize(1),
        ),
      ],
    );

    fakeUsageList = await UsageCodeLocalDataSource().getUsages();
    locator.registerLazySingleton(() => AppRouter());
  });

  setUp(() {
    autoRouterMock = locator<AppRouter>();
    newRequestBlocMock = NewRequestMockBloc();
    returnRequestAttachmentBlocMock = ReturnRequestAttachmentBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => newRequestBlocMock.state).thenReturn(NewRequestState.initial());
    when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
    when(() => returnRequestAttachmentBlocMock.state)
        .thenReturn(ReturnRequestAttachmentState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
  });
  Widget getScopedWidget({useMediaQuery = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: useMediaQuery,
      providers: [
        BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
        BlocProvider<NewRequestBloc>(
          create: (context) => newRequestBlocMock,
        ),
        BlocProvider<UsageCodeBloc>(create: (context) => usageCodeBlocMock),
        BlocProvider<ReturnRequestAttachmentBloc>(
          create: ((context) => returnRequestAttachmentBlocMock),
        ),
        BlocProvider<ProductImageBloc>(
          create: ((context) => productImageBlocMock),
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: ReturnReviewTab(),
      ),
    );
  }

  group('Return Review Tab test', () {
    testWidgets(' => Body Test', (tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable(
          [
            NewRequestState.initial(),
            NewRequestState.initial().copyWith(
              selectedItems: [fakeReturnMaterial],
              invoiceDetails: [
                InvoiceDetails.empty().copyWith(
                  returnItemDetailsList: [
                    fakeReturnItemDetails,
                  ],
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.scrollList),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.returnReferenceField),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
        findsOneWidget,
      );
      expect(
        returnReviewItemKey,
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byType(MaterialInfoWidget),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byType(MaterialQuantityAndPrice),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byType(MaterialDetailsSection),
        ),
        findsOneWidget,
      );
    });

    testWidgets(' =>  Body Test - Return details section', (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial.copyWith(bonusItems: [])],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  returnReason: fakeUsageList.first.usageCode,
                  remarks: remarks,
                  returnType: ReturnType.returnItem(),
                ),
              ],
            ),
          ],
        ),
      );

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.widgetWithText(ExpandableInfo, 'Return details'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Return Type',
              ReturnType.returnItem().returnTypeValue,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason',
              fakeUsageList.first.usageDescription,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments',
              remarks.getValue(),
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byType(UploadedFileList),
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        ' =>  Body Test - Return details section when return type is Exchange',
        (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial.copyWith(bonusItems: [])],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  returnReason: fakeUsageList.first.usageCode,
                  remarks: remarks,
                  returnType: ReturnType.exchangeItem(),
                ),
              ],
            ),
          ],
        ),
      );

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.widgetWithText(ExpandableInfo, 'Return details'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Return Type',
              ReturnType.exchangeItem().returnTypeValue,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason',
              fakeUsageList.first.usageDescription,
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments',
              remarks.getValue(),
            ),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byType(UploadedFileList),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        ' =>  Body Test - Return remarks empty space trimmed from both leading and trailing',
        (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial.copyWith(bonusItems: [])],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  returnReason: fakeUsageList.first.usageCode,
                  remarks: Remarks('   test-remarks  '),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments',
              'test-remarks',
            ),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(' =>  Body Test - Uploaded File List section', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
      expect(
        find.text('fake_name - 0.00 Kb'),
        findsWidgets,
      );
      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsWidgets,
      );
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pump();
      await tester.tap(find.byIcon(Icons.cloud_download_outlined).first);
      await tester.pumpAndSettle();
      verify(
        () => returnRequestAttachmentBlocMock.add(
          ReturnRequestAttachmentEvent.downloadFile(
            file: PoDocuments.empty().copyWith(
              name: 'fake_name',
              url: 'fake_path',
              size: FileSize(1),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets(' =>  Body Test - Uploaded File List section error test',
        (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );
      whenListen(
        returnRequestAttachmentBlocMock,
        Stream.fromIterable([
          ReturnRequestAttachmentState.initial(),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake_error'))),
          ),
        ]),
      );

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
      expect(
        find.text('fake_name - 0.00 Kb'),
        findsWidgets,
      );
      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsWidgets,
      );
      expect(
        find.text('Attachments downloaded successfully.'),
        findsNothing,
      );
    });
    testWidgets(' =>  Body Test - Uploaded File List section success test',
        (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );
      whenListen(
        returnRequestAttachmentBlocMock,
        Stream.fromIterable([
          ReturnRequestAttachmentState.initial(),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
          ),
        ]),
      );

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
      expect(
        find.text('fake_name - 0.00 Kb'),
        findsWidgets,
      );
      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsWidgets,
      );
      expect(
        find.text('Attachments downloaded successfully.'),
        findsWidgets,
      );
    });

    testWidgets(' => display Unit Price for return material item',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final unitPrice = find.textContaining(
        fakeUnitPriceString,
        findRichText: true,
      );
      expect(unitPrice, findsWidgets);
    });

    testWidgets(' => display Override Price for return material item',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  priceOverride: CounterOfferValue(
                    fakeOverridePrice.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final overridePrice = find.textContaining(
        fakeOverridePriceString,
        findRichText: true,
      );
      expect(overridePrice, findsWidgets);
      final overridePriceNote =
          find.text('Requested return value counter offer'.tr());
      expect(overridePriceNote, findsWidgets);
    });

    testWidgets(
        ' => display Total Price for 1 return material item with no override price',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final totalPrice = find.textContaining(
        (fakeUnitPrice * fakeReturnQuantity).toString(),
        findRichText: true,
      );
      expect(totalPrice, findsOneWidget);
    });

    testWidgets(
        ' => display Total Price for 1 return material item with override price',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  priceOverride: CounterOfferValue(
                    fakeOverridePrice.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final totalPrice = find.textContaining(
        (fakeOverridePrice * fakeReturnQuantity).toString(),
        findRichText: true,
      );
      expect(totalPrice, findsOneWidget);
    });

    group('Return  Special Instruction', () {
      testWidgets('check Special Instruction character limit',
          (WidgetTester tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                ],
              ),
            ],
          ),
        );

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(specialInstructionsField, findsOneWidget);
        await tester.enterText(specialInstructionsField, 'a' * 200);
        await tester.pump();
        expect(find.text('a' * 128), findsOneWidget);
      });

      testWidgets('check Special Instruction link',
          (WidgetTester tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                ],
              ),
            ],
          ),
        );

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(specialInstructionsField, findsOneWidget);
        await tester.enterText(specialInstructionsField, link);
        await tester.pump();
        expect(find.text(link), findsNothing);
      });
    });

    group('Return reference Instruction', () {
      testWidgets('check Return reference character limit',
          (WidgetTester tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                ],
              ),
            ],
          ),
        );

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(returnReferenceField, findsOneWidget);
        await tester.enterText(returnReferenceField, 'a' * 200);
        await tester.pump();
        expect(find.text('a' * 35), findsOneWidget);
      });

      testWidgets('check Return reference link', (WidgetTester tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                ],
              ),
            ],
          ),
        );

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(returnReferenceField, findsOneWidget);
        await tester.enterText(returnReferenceField, link);
        await tester.pump();
        expect(find.text(link), findsNothing);
      });

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
            ),
          );
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: fakeReturnMaterialList.items,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cardFinder = find.byKey(WidgetKeys.returnReviewItemKey);
          expect(
            cardFinder,
            findsNWidgets(fakeReturnMaterialList.items.length),
          );
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
      testWidgets(
        '=> display outside return policy tag when toggle is off in sales org config',
        (tester) async {
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: fakeReturnMaterialList.items,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cardFinder = find.byKey(WidgetKeys.returnReviewItemKey);
          expect(
            cardFinder,
            findsNWidgets(fakeReturnMaterialList.items.length),
          );
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
    });

    group('Return item bonus check', () {
      testWidgets('=> check bonus widget for return item',
          (WidgetTester tester) async {
        whenListen(
          newRequestBlocMock,
          Stream.fromIterable([
            NewRequestState.initial(),
            NewRequestState.initial().copyWith(
              selectedItems: [fakeReturnMaterial],
              invoiceDetails: [
                InvoiceDetails.empty().copyWith(
                  returnItemDetailsList: [
                    fakeReturnItemDetails.copyWith(
                      returnReason: fakeUsageList.first.usageCode,
                      remarks: remarks,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        );
        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget(useMediaQuery: true));
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
            matching: find.text('Bonus details'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
            matching: find.byType(BonusMaterialReturnInfo),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
            matching: find.byType(BonusMaterialInfo),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
            matching: find.text('Bonus return details'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(BonusMaterialReturnInfo),
            matching: find.byKey(
              WidgetKeys.balanceTextRow(
                'Reason',
                fakeUsageList.first.usageDescription,
              ),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(BonusMaterialReturnInfo),
            matching: find.byKey(
              WidgetKeys.balanceTextRow(
                'Comments',
                remarks.getValue(),
              ),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(BonusMaterialReturnInfo),
            matching: find.byType(UploadedFileList),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(BonusMaterialInfo),
            matching: find.text(
              'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('=> Should show bonus after inclued from step 2',
          (tester) async {
        final bonusItem = fakeReturnMaterialList.items[1];
        final materialItem = fakeReturnMaterialList.items[0].copyWith(
          bonusItems: [bonusItem],
        );
        final selectedItems = [materialItem];
        final initialState = NewRequestState.initial().copyWith(
          selectedItems: selectedItems,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                materialItem.validatedItemDetails,
              ],
            ),
          ],
        );
        final expectedState = initialState.copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                materialItem.validatedItemDetails,
                bonusItem.validatedItemDetails,
              ],
            ),
          ],
        );
        when(() => newRequestBlocMock.state).thenReturn(initialState);
        whenListen(
          newRequestBlocMock,
          Stream.fromIterable([initialState, expectedState]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(find.byType(BonusMaterialReturnInfo), findsOne);
      });
    });
    group('Return Review Tab test for only bonus returns', () {
      testWidgets(
        '=> return only bonus',
        (tester) async {
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: <ReturnMaterial>[
                fakeReturnMaterial.copyWith(
                  balanceQuantity: IntegerValue('0'),
                ),
              ],
              invoiceDetails: <InvoiceDetails>[
                InvoiceDetails.empty().copyWith(
                  returnItemDetailsList: [
                    fakeReturnItemDetails,
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getScopedWidget(useMediaQuery: true));
          await tester.pump();
          expect(find.byType(BonusMaterialReturnWidget), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(CustomCard),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Bonus Details'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(BonusMaterialInfo),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialInfo),
              matching: find.text(
                'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).'
                    .tr(),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Hide details'),
            ),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        '=> return only bonus expansion',
        (tester) async {
          final hideDetailsButtonFinder = find.descendant(
            of: find.byType(BonusMaterialReturnWidget),
            matching: find.text('Hide details'),
          );
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: <ReturnMaterial>[
                fakeReturnMaterial.copyWith(
                  balanceQuantity: IntegerValue('0'),
                ),
              ],
              invoiceDetails: <InvoiceDetails>[
                InvoiceDetails.empty().copyWith(
                  returnItemDetailsList: [
                    fakeReturnItemDetails.copyWith(
                      returnReason: fakeUsageList.first.usageCode,
                      remarks: remarks,
                    ),
                  ],
                ),
              ],
            ),
          );
          when(() => usageCodeBlocMock.state).thenReturn(
            UsageCodeState.initial().copyWith(
              usages: fakeUsageList,
            ),
          );
          await tester.pumpWidget(getScopedWidget(useMediaQuery: true));
          await tester.pump();
          expect(find.byType(BonusMaterialReturnWidget), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(CustomCard),
            ),
            findsOneWidget,
          );
          expect(
            hideDetailsButtonFinder,
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byIcon(Icons.keyboard_arrow_up),
            ),
            findsOneWidget,
          );
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(Divider),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Bonus return details'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Bonus return details'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byKey(
                WidgetKeys.balanceTextRow(
                  'Reason',
                  fakeUsageList.first.usageDescription,
                ),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byKey(
                WidgetKeys.balanceTextRow(
                  'Comments',
                  remarks.getValue(),
                ),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(UploadedFileList),
            ),
            findsOneWidget,
          );
          await tester.tap(hideDetailsButtonFinder);
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Show details'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byIcon(Icons.keyboard_arrow_down),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(Divider),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.text('Bonus return details'),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: find.byType(BonusMaterialReturnWidget),
              matching: find.byType(UploadedFileList),
            ),
            findsNothing,
          );
        },
      );
    });
  });
  testWidgets(
      ' => display Market place icon and seller name if contains MP items',
      (WidgetTester tester) async {
    when(() => newRequestBlocMock.state).thenReturn(
      NewRequestState.initial().copyWith(
        selectedItems: [
          fakeReturnMaterial.copyWith(
            isMarketPlace: true,
          ),
        ],
      ),
    );

    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();
    expect(find.byType(MarketPlaceSellerTitle), findsOneWidget);
  });

  testWidgets('=> varify storage condition for the item ', (tester) async {
    when(() => newRequestBlocMock.state).thenReturn(
      NewRequestState.initial().copyWith(
        selectedItems: [
          fakeReturnMaterial.copyWith(
            materialDescription: '',
            wareHouseStorageCondition: StorageCondition('AC'),
            bonusItems: [],
          ),
        ],
      ),
    );
    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();
    expect(find.byType(WareHouseStorageConditionTag), findsOneWidget);
    expect(find.text('Air Conditioned'), findsOneWidget);
  });

  testWidgets('=> varify storage condition for the bonus item ',
      (tester) async {
    when(() => newRequestBlocMock.state).thenReturn(
      NewRequestState.initial().copyWith(
        selectedItems: [
          fakeReturnMaterial.copyWith(
            materialDescription: '',
            wareHouseStorageCondition: StorageCondition('AC'),
            bonusItems: [
              fakeReturnMaterial.copyWith(
                materialDescription: '',
                wareHouseStorageCondition: StorageCondition('AC'),
              ),
            ],
          ),
        ],
        invoiceDetails: <InvoiceDetails>[
          InvoiceDetails.empty().copyWith(
            returnItemDetailsList: [
              fakeReturnItemDetails,
            ],
          ),
        ],
      ),
    );
    await tester.pumpWidget(getScopedWidget(useMediaQuery: true));
    await tester.pumpAndSettle();
    expect(
      find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
      findsOneWidget,
    );
    await tester.fling(
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -2000.0),
      1000.0,
    );
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
        matching: find.text('Bonus details'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
        matching: find.byType(BonusMaterialReturnInfo),
      ),
      findsOneWidget,
    );
    expect(find.byType(WareHouseStorageConditionTag), findsAtLeast(2));
    expect(find.text('Air Conditioned'), findsAtLeast(2));
  });
}
