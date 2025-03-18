import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class OrderStatusTrackerRepositoryMock extends Mock
    implements OrderStatusTrackerRepository {}

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late OrderHistory orderHistory;
  late OrderHistory orderHistoryForFetchStatus;
  late OrderHistory orderHistoryForEmptyInvoiceNumber;
  late OrderStatusTrackerRepository orderStatusTrackerRepositoryMock;
  late ViewByItemRepository viewByItemRepositoryMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late OrderHistoryItem fakeOrderHistoryItem;
  final fakeOutForDeliveryStatus = OrderStepValue('Out for delivery');

  late ViewByItemDetailsState seedState;
  const fakeError = ApiFailure.other('fake-error');
  final fakeInvoiceNumber = StringValue('fake-invoice-number');

  final viewByItemDetailsState = ViewByItemDetailsState.initial();
  late final InvoiceDetailResponse invoiceDetail;
  const offSet = 0;
  final config = Config()..appFlavor = Flavor.mock;

  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
        orderHistory = await ViewByItemLocalDataSource().getViewByItems();
        invoiceDetail =
            await ViewByItemLocalDataSource().getInvoiceDetailsForOrder();
        orderHistoryForFetchStatus = orderHistory.copyWith(
          orderHistoryItems: orderHistory.orderHistoryItems
              .map(
                (e) => e.copyWith(
                  status: OrderStepValue(
                    'Delivered - partial rejection',
                  ),
                  invoiceNumber: fakeInvoiceNumber,
                ),
              )
              .toList(),
        );
        orderHistoryForEmptyInvoiceNumber = orderHistory.copyWith(
          orderHistoryItems: orderHistory.orderHistoryItems
              .map(
                (e) => e.copyWith(
                  status: OrderStepValue(
                    'Delivered - partial rejection',
                  ),
                  invoiceNumber: StringValue(''),
                ),
              )
              .toList(),
        );
        fakeOrderHistoryItem = orderHistory.orderHistoryItems.first.copyWith(
          status: fakeOutForDeliveryStatus,
        );
        seedState = viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
          orderHistory: orderHistory,
          orderHistorySelectedItems: orderHistory.orderHistoryItems
              .where(
                (item) =>
                    item.lineNumber.parentIntValue ==
                    fakeOrderHistoryItem.lineNumber.parentIntValue,
              )
              .toList(),
          shipToInfo: fakeShipToInfo,
        );
      });

      setUp(() {
        orderStatusTrackerRepositoryMock = OrderStatusTrackerRepositoryMock();
        viewByItemRepositoryMock = ViewByItemRepositoryMock();
      });

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "initialized" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            shipToInfo: fakeShipToInfo,
          ),
        ),
        expect: () => [
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            shipToInfo: fakeShipToInfo,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchZyllemStatus(
            invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
          ),
        ),
        expect: () => [
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            isStatusLoading: true,
          ),
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            orderHistoryStatuses: fakeOrderStatusTracker,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchZyllemStatus(
            invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
          ),
        ),
        expect: () => [
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            isStatusLoading: true,
          ),
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "updateIsExpanded" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.updateIsExpanded(isExpanded: true),
        ),
        expect: () => [
          viewByItemDetailsState.copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            isExpanded: true,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistory),
          );

          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () {
          final orderHistorySelectedItems = orderHistory.orderHistoryItems
              .where(
                (item) =>
                    item.lineNumber.parentIntValue ==
                    fakeOrderHistoryItem.lineNumber.parentIntValue,
              )
              .toList();

          return [
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isInvoiceLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
          ];
        },
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event with zyllem status',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistoryForFetchStatus),
          );

          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );

          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeInvoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () {
          final orderHistorySelectedItems =
              orderHistoryForFetchStatus.orderHistoryItems
                  .where(
                    (item) =>
                        item.lineNumber.parentIntValue ==
                        fakeOrderHistoryItem.lineNumber.parentIntValue,
                  )
                  .toList();

          return [
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption:
                  optionOf(Right(orderHistoryForFetchStatus)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isInvoiceLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isStatusLoading: true,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
          ];
        },
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: seedState.customerCodeInfo,
              salesOrgConfig: seedState.salesOrgConfig,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isDetailsLoading: true,
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
          seedState.copyWith(
            isInvoiceLoading: true,
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );

      test(
        'Get "poDocumentsList" when isExpanded = true',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
            config: config,
          );
          orderHistoryBloc.emit(
            viewByItemDetailsState.copyWith(
              orderHistorySelectedItems: [
                OrderHistoryItem.empty().copyWith(
                  orderHistoryItemPoAttachments: <PoDocuments>[
                    PoDocuments.empty(),
                  ],
                ),
              ],
              isExpanded: true,
            ),
          );
          expect(
            orderHistoryBloc.state.poDocumentsList,
            orderHistoryBloc
                .state.orderHistorySelectedItem.orderHistoryItemPoAttachments,
          );
        },
      );

      test(
        'Get "poDocumentsList" when isExpanded = false',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
            config: config,
          );
          orderHistoryBloc.emit(
            viewByItemDetailsState.copyWith(
              orderHistorySelectedItems: [
                OrderHistoryItem.empty().copyWith(
                  orderHistoryItemPoAttachments: <PoDocuments>[
                    PoDocuments.empty(),
                  ],
                ),
              ],
              isExpanded: false,
            ),
          );
          expect(
            orderHistoryBloc.state.poDocumentsList,
            [
              orderHistoryBloc.state.orderHistorySelectedItem
                  .orderHistoryItemPoAttachments.first,
            ],
          );
        },
      );

      test(
        'Get "displayShowMoreOrLess"',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
            config: config,
          );
          orderHistoryBloc.emit(
            viewByItemDetailsState.copyWith(
              orderHistorySelectedItems: [
                OrderHistoryItem.empty().copyWith(
                  orderHistoryItemPoAttachments: <PoDocuments>[],
                ),
              ],
            ),
          );
          expect(
            orderHistoryBloc.state.displayShowMoreOrLess,
            false,
          );
        },
      );

      test('Get other items will filter out current item based on lineNumber',
          () {
        expect(
          seedState.otherItems,
          orderHistory.orderHistoryItems
              .where((e) => e.lineNumber != fakeOrderHistoryItem.lineNumber)
              .toList(),
        );
      });

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event with zyllem status and disableDeliveryDate is enable',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeVNSalesOrgConfigs,
          salesOrganisation: fakeVNSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistoryForFetchStatus),
          );

          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );

          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: orderHistoryForFetchStatus
                  .orderHistoryItems.first.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () {
          final orderHistorySelectedItems =
              orderHistoryForFetchStatus.orderHistoryItems
                  .where(
                    (item) =>
                        item.lineNumber.parentIntValue ==
                        fakeOrderHistoryItem.lineNumber.parentIntValue,
                  )
                  .toList();

          return [
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption:
                  optionOf(Right(orderHistoryForFetchStatus)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isInvoiceLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isStatusLoading: true,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForFetchStatus,
              orderHistoryStatuses: fakeOrderStatusTracker,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: none(),
            ),
          ];
        },
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event without zyllem status when invoiceNumber is empty',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeVNSalesOrgConfigs,
          salesOrganisation: fakeVNSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(
              orderHistoryForEmptyInvoiceNumber,
            ),
          );

          when(
            () => (viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () {
          final orderHistorySelectedItems =
              orderHistoryForEmptyInvoiceNumber.orderHistoryItems
                  .where(
                    (item) =>
                        item.lineNumber.parentIntValue ==
                        fakeOrderHistoryItem.lineNumber.parentIntValue,
                  )
                  .toList();

          return [
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForEmptyInvoiceNumber,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption:
                  optionOf(Right(orderHistoryForEmptyInvoiceNumber)),
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForEmptyInvoiceNumber,
              orderHistorySelectedItems: orderHistorySelectedItems,
              isInvoiceLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistoryForEmptyInvoiceNumber,
              orderHistorySelectedItems: orderHistorySelectedItems,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
          ];
        },
      );

      blocTest(
        'For "fetchOrdersInvoiceData" Event success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => seedState.copyWith(orderHistory: orderHistory),
        setUp: () {
          when(
            () => viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: orderHistory.orderHistoryItems.first.orderNumber,
              customerCodeInfo: seedState.customerCodeInfo,
              language: seedState.user.preferredLanguage,
              offset: offSet,
            ),
          ).thenAnswer((invocation) async => Right(invoiceDetail));
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrdersInvoiceData(
            orderNumber: orderHistory.orderHistoryItems.first.orderNumber,
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isInvoiceLoading: true,
          ),
          seedState.copyWith(
            invoiceDetail: invoiceDetail,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event but cant find lineNumber from fetchOrderHistoryDetails event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => viewByItemDetailsState.copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: fakeOrderHistoryItem.orderNumber,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeRootAdminUser.preferredLanguage,
              offset: offSet,
            ),
          ).thenAnswer((invocation) async => Right(invoiceDetail));

          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey.search(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistory),
          );

          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: LineNumber('000020'),
          ),
        ),
        expect: () {
          final orderHistorySelectedItems = orderHistory.orderHistoryItems
              .where(
                (item) =>
                    item.lineNumber.parentIntValue ==
                    fakeOrderHistoryItem.lineNumber.parentIntValue,
              )
              .toList();

          return [
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
              orderHistorySelectedItems: orderHistorySelectedItems,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              isInvoiceLoading: true,
              orderHistory: orderHistory,
              orderHistorySelectedItems: orderHistorySelectedItems,
            ),
            viewByItemDetailsState.copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistorySelectedItems: orderHistorySelectedItems,
              invoiceDetail: invoiceDetail,
            ),
          ];
        },
      );

      blocTest(
        'For "loadMoreInvoices" Event success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => seedState.copyWith(
          orderHistory: orderHistory,
          invoiceDetail: invoiceDetail,
        ),
        setUp: () {
          when(
            () => viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: orderHistory.orderHistoryItems.first.orderNumber,
              customerCodeInfo: seedState.customerCodeInfo,
              language: seedState.user.preferredLanguage,
              offset: invoiceDetail.invoiceDetails.length,
            ),
          ).thenAnswer((invocation) async => Right(invoiceDetail));
        },
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.loadMoreInvoices(),
        ),
        expect: () => [
          seedState.copyWith(
            isInvoiceLoading: true,
            orderHistory: orderHistory,
            invoiceDetail: invoiceDetail,
          ),
          seedState.copyWith(
            orderHistory: orderHistory,
            invoiceDetail: invoiceDetail.copyWith(
              invoiceDetails:
                  List<InvoiceDetail>.from(invoiceDetail.invoiceDetails)
                    ..addAll(invoiceDetail.invoiceDetails),
            ),
          ),
        ],
      );

      blocTest(
        'For "loadMoreInvoices" Event fail',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
          config: config,
        ),
        seed: () => seedState.copyWith(
          orderHistory: orderHistory,
          invoiceDetail: invoiceDetail,
        ),
        setUp: () {
          when(
            () => viewByItemRepositoryMock.getInvoiceDetailsForOrder(
              orderNumber: orderHistory.orderHistoryItems.first.orderNumber,
              customerCodeInfo: seedState.customerCodeInfo,
              language: seedState.user.preferredLanguage,
              offset: invoiceDetail.invoiceDetails.length,
            ),
          ).thenAnswer((invocation) async => const Left(fakeError));
        },
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.loadMoreInvoices(),
        ),
        expect: () => [
          seedState.copyWith(
            isInvoiceLoading: true,
            orderHistory: orderHistory,
            invoiceDetail: invoiceDetail,
          ),
          seedState.copyWith(
            orderHistory: orderHistory,
            invoiceDetail: invoiceDetail,
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );
      group('test displayBuyAgainButton getter =>', () {
        test('return false when isDetailsLoading is true', () {
          final state = seedState.copyWith(
            isDetailsLoading: true,
          );
          expect(state.displayBuyAgainButton, isFalse);
        });
      });
    },
  );
}
