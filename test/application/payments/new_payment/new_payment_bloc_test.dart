import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

void main() {
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late CustomerOpenItem customerOpenItem;
  late PaymentInfo fakePaymentInfo;
  late List<CustomerOpenItem> fakeCustomerOpenItemSelected;
  late List<CustomerOpenItem> fakeCreditSelected;
  late List<NewPaymentMethod> fakePaymentMethodValues;
  late PaymentMethodOption fakePaymentMethodOption;
  final newPaymentState = NewPaymentState.initial();
  final fakeCreateVirtualAccount = CreateVirtualAccount.empty();
  final fakePaymentStatus = PaymentStatus(
    paymentId: 'fake-id',
    transactionReference: 'fake-ref',
    transactionStatus: TransactionStatus('fake-status'),
  );

  setUpAll(() {
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    customerOpenItem = CustomerOpenItem.empty().copyWith(
      openAmountInTransCrcy: 100,
    );
  });
  setUp(() {
    fakePaymentInfo = PaymentInfo.empty();
    fakeCustomerOpenItemSelected = <CustomerOpenItem>[
      CustomerOpenItem.empty().copyWith(
        status: StatusType('Overdue'),
        accountingDocument: '1100001163',
        netDueDate: DateTimeStringValue('2023-07-31'),
        documentDate: DateTimeStringValue('2021-01-02'),
        amountInTransactionCurrency: 999,
        documentReferenceID: StringValue('0800072883'),
        postingKeyName: 'Invoice',
        transactionCurrency: Currency('MYR'),
        accountingDocExternalReference: '200120231100001163001SD 1100001163',
        bpCustomerNumber: '30082707',
        debitCreditCode: 'S',
        cashDiscountAmountInDspCrcy: 0,
        cashDiscountDueDate: DateTimeStringValue('2023-06-30'),
        totalAmountInDisplayCrcy: 999,
        displayCurrency: Currency('MYR'),
        openAmountInDisplayCrcy: 999,
        fiscalYear: '2023',
        isDisputed: '',
        accountingDocumentItem: '001',
        accountingDocumentItemRef: '001530',
        partialPaymentHistoryDesc: '200120231100001163001:',
        paymentAmountInDisplayCrcy: 999,
        companyCode: '2001',
        openAmountInTransCrcy: 999,
      ),
    ];
    fakeCreditSelected = [
      fakeCustomerOpenItemSelected.first
          .copyWith(postingKeyName: 'Credit memo'),
    ];

    fakePaymentMethodValues = <NewPaymentMethod>[
      NewPaymentMethod(
        paymentMethod: PaymentMethodValue('Payment Gateway'),
        options: [],
      ),
      NewPaymentMethod(
        paymentMethod: PaymentMethodValue('Qr Code'),
        options: [],
      ),
    ];

    fakePaymentMethodOption = PaymentMethodOption.empty()
        .copyWith(displayName: StringValue('fake-data'));
  });

  group(
    'New Payment Bloc Invoices ',
    () {
      blocTest(
        'Initialize',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            isMarketPlace: true,
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(isMarketPlace: true),
        ],
      );

      blocTest(
        'Fetch payment method success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(isMarketPlace: true),
        setUp: () {
          when(
            () => newPaymentRepository.fetchPaymentMethods(
              salesOrganisation: SalesOrganisation.empty(),
              isMarketPlace: true,
            ),
          ).thenAnswer((_) async => Right([NewPaymentMethod.empty()]));
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.fetchAvailablePaymentMethods(),
        ),
        expect: () => [
          newPaymentState.copyWith(
            isFetchingPaymentMethod: true,
            isMarketPlace: true,
          ),
          newPaymentState.copyWith(
            isFetchingPaymentMethod: false,
            paymentMethods: [NewPaymentMethod.empty()],
            selectedPaymentMethod: NewPaymentMethod.empty(),
            isMarketPlace: true,
          ),
        ],
      );

      blocTest(
        'Fetch payment Method fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.fetchPaymentMethods(
              salesOrganisation: SalesOrganisation.empty(),
              isMarketPlace: false,
            ),
          ).thenAnswer((_) async => const Left(ApiFailure.other('fake-error')));
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.fetchAvailablePaymentMethods(),
        ),
        expect: () => [
          newPaymentState.copyWith(
            isFetchingPaymentMethod: true,
          ),
          newPaymentState.copyWith(
            isFetchingPaymentMethod: false,
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-error')),
            ),
            paymentMethods: [],
            selectedPaymentMethod: NewPaymentMethod.empty(),
          ),
        ],
      );

      blocTest(
        'UpdateAllInvoices',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllInvoices(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          ),
        ],
      );

      blocTest(
        'ToggleInvoice selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          selectedInvoices: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [newPaymentState],
      );

      blocTest(
        'ToggleInvoice deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: true,
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          ),
        ],
      );
    },
  );

  group(
    'New Payment Bloc Credits',
    () {
      blocTest(
        'UpdateAllCredits',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllCredits(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedCredits: [CustomerOpenItem.empty()],
          ),
        ],
      );

      blocTest(
        'ToggleCredit selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          selectedCredits: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [newPaymentState],
      );

      blocTest(
        'ToggleCredit deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          selectedInvoices: [
            customerOpenItem,
          ],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: customerOpenItem,
            selected: true,
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedInvoices: [
              customerOpenItem,
            ],
            selectedCredits: [
              customerOpenItem,
            ],
          ),
        ],
        verify: (NewPaymentBloc bloc) {
          expect(
            bloc.state.amountTotal,
            customerOpenItem.openAmountInTransCrcy * 2,
          );
        },
      );
    },
  );

  group(
    'New Payment Bloc Pay now',
    () {
      blocTest(
        'Pay fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.pay(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              user: User.empty(),
              paymentMethod: 'Payment Gateway',
              customerOpenItems: fakeCustomerOpenItemSelected,
              shipToInfo: ShipToInfo.empty(),
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(const NewPaymentEvent.pay()),
        expect: () => [
          newPaymentState.copyWith(
            isLoading: true,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
          newPaymentState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
        ],
      );

      blocTest(
        'Pay success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          isMarketPlace: true,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.pay(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              user: User.empty(),
              paymentMethod: 'Payment Gateway',
              customerOpenItems: fakeCustomerOpenItemSelected,
              shipToInfo: ShipToInfo.empty(),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              PaymentInfo.empty(),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(const NewPaymentEvent.pay()),
        expect: () => [
          newPaymentState.copyWith(
            isLoading: true,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
            isMarketPlace: true,
          ),
          newPaymentState.copyWith(
            paymentInfo: fakePaymentInfo,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
            isMarketPlace: true,
          ),
        ],
      );

      blocTest(
        'Pay success with credit',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          selectedCredits: fakeCreditSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.pay(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              user: User.empty(),
              paymentMethod: 'Payment Gateway',
              shipToInfo: ShipToInfo.empty(),
              customerOpenItems: [
                ...fakeCustomerOpenItemSelected,
                ...fakeCreditSelected,
              ],
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              PaymentInfo.empty(),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(const NewPaymentEvent.pay()),
        expect: () => [
          newPaymentState.copyWith(
            isLoading: true,
            selectedInvoices: fakeCustomerOpenItemSelected,
            selectedCredits: fakeCreditSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
          newPaymentState.copyWith(
            paymentInfo: fakePaymentInfo,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedCredits: fakeCreditSelected,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
        ],
      );
    },
  );

  group(
    'New Payment Bloc Update Payment Gateway',
    () {
      blocTest(
        'Update Payment Gateway called on MY market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              paymentStatus: fakePaymentStatus,
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          isMarketPlace: true,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentStatus: fakePaymentStatus,
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verify(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              paymentStatus: fakePaymentStatus,
              isMarketPlace: true,
            ),
          ).called(1);
        },
      );

      blocTest(
        'Update Payment Gateway not called on PH market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentStatus: fakePaymentStatus,
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakePHSalesOrganisation,
              paymentStatus: fakePaymentStatus,
              isMarketPlace: false,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          );
        },
      );

      blocTest(
        'Update Payment Gateway called on VN market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeVNSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              isMarketPlace: false,
              paymentStatus: fakePaymentStatus,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation: fakeVNSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentStatus: fakePaymentStatus,
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verify(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeVNSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              isMarketPlace: false,
              paymentStatus: fakePaymentStatus,
            ),
          ).called(1);
        },
      );

      blocTest(
        'Update Payment Gateway not called on TH market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation: fakeTHSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentStatus: fakePaymentStatus,
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeTHSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              isMarketPlace: false,
              paymentStatus: fakePaymentStatus,
            ),
          );
        },
      );

      blocTest(
        'Update Payment Gateway not called on SG market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentStatus: fakePaymentStatus,
          ),
        ),
        seed: () => newPaymentState.copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: fakeSGSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              isMarketPlace: false,
              paymentStatus: fakePaymentStatus,
            ),
          );
        },
      );
    },
  );

  group(
    'New Payment Bloc Fetch Invoice Pdf',
    () {
      blocTest(
        'Fetch Invoice Pdf fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          paymentInfo: fakePaymentInfo,
          isMarketPlace: true,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.getPaymentInvoiceInfoPdf(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              paymentInfo: fakePaymentInfo,
              user: User.empty(),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) =>
            bloc.add(const NewPaymentEvent.fetchInvoiceInfoPdf()),
        expect: () => [
          newPaymentState.copyWith(
            isFetchingInvoiceInfoPdf: true,
            isMarketPlace: true,
          ),
          newPaymentState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isMarketPlace: true,
          ),
        ],
      );

      blocTest(
        'Fetch Invoice Pdf success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          isLoading: false,
          paymentInfo: fakePaymentInfo,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.getPaymentInvoiceInfoPdf(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              paymentInfo: fakePaymentInfo,
              user: User.empty(),
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              PaymentInvoiceInfoPdf.empty(),
            ),
          );
        },
        act: (NewPaymentBloc bloc) =>
            bloc.add(const NewPaymentEvent.fetchInvoiceInfoPdf()),
        expect: () => [
          newPaymentState.copyWith(
            isFetchingInvoiceInfoPdf: true,
          ),
          newPaymentState.copyWith(
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
          ),
        ],
      );
    },
  );

  group(
    'New Payment Bloc Save Invoice Pdf',
    () {
      blocTest(
        'save Invoice Pdf fail because permission',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            isSavingInvoicePdf: true,
          ),
          newPaymentState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Save Invoice Pdf fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => newPaymentRepository.saveFile(
              pdfData: Uint8List.fromList([0, 1]),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            isSavingInvoicePdf: true,
          ),
          newPaymentState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Save Invoice Pdf success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => newPaymentRepository.saveFile(
              pdfData: Uint8List.fromList([0, 1]),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              AttachmentFileBuffer.empty(),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            isSavingInvoicePdf: true,
          ),
          newPaymentState,
        ],
      );
    },
  );

  group(
    'Update Payment Method Selected',
    () {
      blocTest(
        'Update Payment Method Selected',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentMethodSelected(
            paymentMethodSelected: fakePaymentMethodValues.last,
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedPaymentMethod: fakePaymentMethodValues.last,
          ),
        ],
      );
    },
  );

  group(
    'Update Payment Method Option Selected',
    () {
      blocTest(
        'Update Payment Method Option Selected',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState,
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentMethodOptionSelected(
            paymentMethodOptionSelected: fakePaymentMethodOption,
          ),
        ),
        expect: () => [
          newPaymentState.copyWith(
            selectedPaymentMethod: newPaymentState.selectedPaymentMethod
                .copyWith(options: [fakePaymentMethodOption]),
          ),
        ],
      );
    },
  );

  group(
    'Create Virtual Account',
    () {
      blocTest(
        'Create Virtual Account success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState,
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.createVirtualAccount(),
        ),
        setUp: () {
          when(
            () => newPaymentRepository.createVirtualAccount(
              salesOrganisation: newPaymentState.salesOrganisation,
              customerCodeInfo: newPaymentState.customerCodeInfo,
              invoices: newPaymentState.selectedInvoices,
              paymentMethodOption:
                  newPaymentState.selectedPaymentMethod.firstSelectedOption,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeCreateVirtualAccount),
          );
        },
        expect: () => [
          newPaymentState.copyWith(isCreatingVirtualAccount: true),
          newPaymentState.copyWith(
            createVirtualAccount: fakeCreateVirtualAccount,
          ),
        ],
      );

      blocTest(
        'Create Virtual Account failure',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState,
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.createVirtualAccount(),
        ),
        setUp: () {
          when(
            () => newPaymentRepository.createVirtualAccount(
              salesOrganisation: newPaymentState.salesOrganisation,
              customerCodeInfo: newPaymentState.customerCodeInfo,
              invoices: newPaymentState.selectedInvoices,
              paymentMethodOption:
                  newPaymentState.selectedPaymentMethod.firstSelectedOption,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
        },
        expect: () => [
          newPaymentState.copyWith(isCreatingVirtualAccount: true),
          newPaymentState.copyWith(
            createVirtualAccountFailed: true,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );
    },
  );

  group(
    'description',
    () {
      blocTest(
        'getPrincipalCutoffs if is not ID',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState,
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.getPrincipalCutoffs(),
        ),
        expect: () => [
          newPaymentState.copyWith(isFetchingPrincipalCutoffs: true),
          newPaymentState,
        ],
      );

      blocTest(
        'getPrincipalCutoffs failure if is ID',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.getPrincipalCutoffs(),
        ),
        setUp: () {
          when(
            () => newPaymentRepository.getPrincipalCutoffs(
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
        },
        expect: () => [
          newPaymentState.copyWith(
            isFetchingPrincipalCutoffs: true,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
          newPaymentState.copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        ],
      );

      blocTest(
        'getPrincipalCutoffs success if is ID',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => newPaymentState.copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.getPrincipalCutoffs(),
        ),
        setUp: () {
          when(
                () => newPaymentRepository.getPrincipalCutoffs(
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
                (invocation) async => Right(PrincipalCutoffs.empty()),
          );
        },
        expect: () => [
          newPaymentState.copyWith(
            isFetchingPrincipalCutoffs: true,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
          newPaymentState.copyWith(
            principalCutoffs: PrincipalCutoffs.empty(),
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        ],
      );
    },
  );
}
