import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class NewRequestMockBloc extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class ReturnDetailsByRequestBlocMock
    extends MockBloc<ReturnDetailsByRequestEvent, ReturnDetailsByRequestState>
    implements ReturnDetailsByRequestBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late AnnouncementBloc announcementBlocMock;
  late ReturnDetailsByRequestBloc returnDetailsByRequestBlocMock;

  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late NewRequestBloc newRequestBlocMock;
  late ProductImageBloc productImageBlocMock;
  late UsageCodeBloc usageCodeBlocMock;

  late ReturnMaterial fakeReturnMaterial;
  late ReturnItemDetails fakeReturnItemDetails;
  late ReturnItemDetails fakeReturnBonusItemDetails;
  late double fakeUnitPrice;
  late String fakeUnitPriceString;
  late double fakeOverridePrice;
  late String fakeOverridePriceString;
  late int fakeBalanceQuantity;
  late int fakeReturnQuantity;
  late ReturnMaterialList fakeListMaterial;

  final fakeSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-SalesOrg'),
  );

  setUpAll(() async {
    fakeUnitPrice = 8.77;
    fakeUnitPriceString = '8.77';
    fakeOverridePrice = 12;
    fakeOverridePriceString = '12.00';
    fakeBalanceQuantity = 5;
    fakeReturnQuantity = 2;
    fakeListMaterial =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    fakeReturnMaterial = fakeListMaterial.items.first.copyWith(
      unitPrice: RangeValue(fakeUnitPrice.toString()),
      balanceQuantity: IntegerValue(fakeBalanceQuantity.toString()),
      bonusItems: [fakeListMaterial.items[1]],
    );
    fakeReturnItemDetails = fakeReturnMaterial.validatedItemDetails.copyWith(
      returnQuantity: ReturnQuantity(fakeReturnQuantity.toString()),
    );
    fakeReturnBonusItemDetails =
        fakeListMaterial.items[1].validatedItemDetails.copyWith(
      returnQuantity: ReturnQuantity(fakeReturnQuantity.toString()),
    );
    locator.registerLazySingleton(() => AppRouter());
  });

  group('New Request Successful page', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
      newRequestBlocMock = NewRequestMockBloc();
      announcementBlocMock = AnnouncementBlocMock();
      returnDetailsByRequestBlocMock = ReturnDetailsByRequestBlocMock();
      salesOrgBlocMock = SalesOrgMockBloc();
      productImageBlocMock = ProductImageBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      usageCodeBlocMock = UsageCodeBlocMock();

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => newRequestBlocMock.state)
          .thenReturn(NewRequestState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => returnDetailsByRequestBlocMock.state)
          .thenReturn(ReturnDetailsByRequestState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<NewRequestBloc>(
            create: (context) => newRequestBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ReturnDetailsByRequestBloc>(
            create: (context) => returnDetailsByRequestBlocMock,
          ),
          BlocProvider<ProductImageBloc>(
            create: ((context) => productImageBlocMock),
          ),
          BlocProvider<UsageCodeBloc>(
            create: ((context) => usageCodeBlocMock),
          ),
        ],
        child: const NewRequestSuccessfulPage(),
      );
    }

    testWidgets(' => Test hyperlink navigation to return request details page',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          returnRequestId: 'fake-Id',
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final returnRequestID = find.text('Return #fake-Id', findRichText: true);
      _tapTextSpan(
        tester.widget<RichText>(returnRequestID),
        '#fake-Id',
      );
      verify(
        () => returnDetailsByRequestBlocMock.add(
          const ReturnDetailsByRequestEvent.fetch(
            returnId: 'fake-Id',
          ),
        ),
      ).called(1);
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
      expect(unitPrice, findsOneWidget);
    });

    testWidgets(' => check Batch and EXP', (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              isMarketPlace: false,
            ),
          ],
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
      final batch = find.textContaining(
        'Batch'.tr(),
      );
      expect(batch, findsWidgets);
      final expires = find.textContaining(
        'Expires:'.tr(),
      );
      expect(expires, findsWidgets);
    });

    testWidgets(' => display Override Price for return material item',
        (WidgetTester tester) async {
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
      expect(overridePrice, findsOneWidget);
      final overridePriceNote =
          find.text('Requested return value counter offer'.tr());
      expect(overridePriceNote, findsOneWidget);
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
      expect(totalPrice, findsWidgets);
    });

    testWidgets(
        ' => display Total Price for 1 return material item with override price',
        (WidgetTester tester) async {
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
      expect(totalPrice, findsWidgets);
    });

    testWidgets(
        ' => display bonus item if return both bonus and commercial item ',
        (WidgetTester tester) async {
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
                fakeReturnBonusItemDetails.copyWith(
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
      await tester.pump();
      final expandableSectionFinder =
          find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandableSectionFinder, findsOneWidget);
      await tester.scrollUntilVisible(expandableSectionFinder, -500);
      await tester.pump();
      await tester.tap(expandableSectionFinder);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.returnBonusItemSection), findsOneWidget);
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
            selectedItems: fakeListMaterial.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byKey(WidgetKeys.returnItemKey);
        expect(cardFinder, findsNWidgets(fakeListMaterial.items.length));
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
      '=> Do not display outside return policy tag when toggle is off but value is true in the item',
      (tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: fakeListMaterial.items,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byKey(WidgetKeys.returnItemKey);
        expect(cardFinder, findsNWidgets(fakeListMaterial.items.length));
        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );

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
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                ReturnItemDetails.empty()
                    .copyWith(returnQuantity: ReturnQuantity('1')),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byType(MarketPlaceSellerTitle), findsOneWidget);
    });

    testWidgets(
        ' => display only commercial item if bonus item do not have balance quantity',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              bonusItems: fakeReturnMaterial.bonusItems
                  .map((e) => e.copyWith(balanceQuantity: IntegerValue('0')))
                  .toList(),
            ),
          ],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
                fakeReturnBonusItemDetails,
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expandableSectionFinder =
          find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandableSectionFinder, findsOneWidget);
      await tester.scrollUntilVisible(expandableSectionFinder, -500);
      await tester.pump();
      await tester.tap(expandableSectionFinder);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.returnBonusItemSection), findsNothing);
    });

    testWidgets(' => check subtotal with tax and grand total',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial,
          ],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
                fakeReturnBonusItemDetails,
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final subtotal = find.text(
        'SGD ${(fakeReturnItemDetails.returnValue + fakeReturnBonusItemDetails.returnValue).toStringAsFixed(2)}',
        findRichText: true,
      );
      expect(subtotal, findsWidgets);
      final grandTotal = find.text(
        'SGD ${(fakeReturnItemDetails.returnValue + fakeReturnBonusItemDetails.returnValue).toStringAsFixed(2)}',
        findRichText: true,
      );
      expect(grandTotal, findsWidgets);
    });

    testWidgets(
      ' => check subtotal text',
      (WidgetTester tester) async {
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSalesOrg;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: currentSalesOrgVariant,
            ),
          ),
        );
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [
              fakeReturnMaterial,
            ],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                  fakeReturnBonusItemDetails,
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.text('Subtotal (excl.tax) :'),
          findsOneWidget,
        );
      },
      variant: salesOrgVariant,
    );

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
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
                fakeReturnBonusItemDetails,
              ],
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final expandableSectionFinder =
          find.byKey(WidgetKeys.returnExpandableSection);
      expect(expandableSectionFinder, findsOneWidget);
      await tester.scrollUntilVisible(expandableSectionFinder, -500);
      await tester.pump();
      await tester.tap(expandableSectionFinder);
      await tester.pumpAndSettle();
      expect(find.byType(WareHouseStorageConditionTag), findsAtLeast(2));
      expect(find.text('Air Conditioned'), findsAtLeast(2));
    });
  });
}

bool _findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    if (visitor.recognizer is TapGestureRecognizer) {
      (visitor.recognizer as TapGestureRecognizer).onTap?.call();
    }

    return false;
  }

  return true;
}

bool _tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => _findTextAndTap(visitor, text),
  );

  return isTapped;
}
