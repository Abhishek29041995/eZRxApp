import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/bank_instruction_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class PaymentSummaryDetailsRepositoryMock extends Mock
    implements PaymentSummaryDetailsRepository {}

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

class BankInstructionRepositoryMock extends Mock
    implements BankInstructionRepository {}

class CreatePaymentInvoicePdfMock extends Mock
    implements CreatePaymentInvoicePdf {}

void main() {
  late PaymentSummaryDetailsRepository paymentSummaryDetailsMockRepository;
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late BankInstructionRepository bankInstructionRepository;
  late PaymentSummaryDetails details;
  late List<PaymentItem> paymentList;
  late BankInstruction bankInstruction;
  late PaymentInfo paymentInfo;
  late Uint8List fakeRawFile;
  late CreatePaymentInvoicePdf createPaymentInvoicePdf;

  final paymentSummaryDetailsState = PaymentSummaryDetailsState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryDetailsMockRepository = PaymentSummaryDetailsRepositoryMock();
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    bankInstructionRepository = BankInstructionRepositoryMock();
    createPaymentInvoicePdf = CreatePaymentInvoicePdfMock();
    details = await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    paymentList = await PaymentItemLocalDataSource().getPaymentItems();
    bankInstruction = await BankInstructionLocalDataSource()
        .getBankInstruction(details.bankIdentification);
    fakeRawFile = Uint8List.fromList([1, 2, 3, 4, 5]);
    paymentInfo = PaymentInfo.empty().copyWith(
      paymentBatchAdditionalInfo: details.paymentBatchAdditionalInfo.getValue(),
      paymentID: details.paymentID.getValue(),
      accountingDocExternalReference: details.accountingDocExternalReference,
      zzAdvice: details.zzAdvice.getValue(),
    );
  });
  group('Payment Summary Details Bloc Test', () {
    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> initialized',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.initialized(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          shipToInfo: fakeShipToInfo,
        ),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when market is Indonesia',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeIDSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInstruction),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details: details,
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isDetailFetching: true,
        ),
        paymentSummaryDetailsState.copyWith(
          details: details,
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          bankInstruction: bankInstruction,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when market is not Indonesia',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details: details,
          isMarketPlace: true,
        ),
      ),
      skip: 4,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          details: details.copyWith(
            paymentItems: paymentList,
          ),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when payment batch aditional info is valid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details.copyWith(
              paymentBatchAdditionalInfo: StringValue(''),
            ),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details: details.copyWith(
            paymentBatchAdditionalInfo: StringValue(''),
          ),
          isMarketPlace: true,
        ),
      ),
      skip: 5,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          details: details.copyWith(
            paymentItems: paymentList,
          ),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details.copyWith(
              paymentBatchAdditionalInfo: StringValue(''),
            ),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          ),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details.copyWith(
              paymentBatchAdditionalInfo: StringValue(''),
            ),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo.copyWith(
              paymentBatchAdditionalInfo: '',
            ),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeMYSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isDetailFetching: true,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isListLoading: true,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details.copyWith(
            paymentBatchAdditionalInfo: StringValue(''),
            paymentItems: paymentList,
          ),
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details.copyWith(
            paymentBatchAdditionalInfo: StringValue(''),
            paymentItems: paymentList,
          ),
          isFetchingAdvice: true,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details.copyWith(
            paymentBatchAdditionalInfo: StringValue(''),
            paymentItems: paymentList,
          ),
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event failed when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details.copyWith(
              paymentBatchAdditionalInfo: StringValue(''),
            ),
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: PaymentInfo.empty(),
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isMarketPlace: false,
        ),
      ),
      skip: 1,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryList event success',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );

        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
          isMarketPlace: true,
        ),
      ),
      skip: 3,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details.copyWith(
            paymentItems: paymentList,
          ),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryList event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
          isMarketPlace: false,
        ),
      ),
      skip: 1,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchBankInstruction event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchBankInstruction(),
      ),
      skip: 1,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: paymentInfo,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchAdvice(
          isMarketPlace: false,
        ),
      ),
      skip: 1,
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event success',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
        shipToInfo: fakeShipToInfo,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );

        when(
          () => createPaymentInvoicePdf.createInvoicePdf(
            salesOrganisation: fakeIDSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
            shipToInfo: fakeShipToInfo,
            createdDate: details.createdDate,
            adviceExpiry: details.adviceExpiry,
          ),
        ).thenAnswer(
          (_) => Future.value(fakeRawFile),
        );

        when(
          () => newPaymentRepository.saveFile(
            pdfData: fakeRawFile,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            AttachmentFileBuffer.empty(),
          ),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
          shipToInfo: fakeShipToInfo,
        ),
        paymentSummaryDetailsState.copyWith(
          savedAdvice: AttachmentFileBuffer.empty(),
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event failed when getSavePermission error',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );

        when(
          () => createPaymentInvoicePdf.createInvoicePdf(
            salesOrganisation: fakeSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
            shipToInfo: fakeShipToInfo,
            createdDate: DateTimeStringValue(''),
            adviceExpiry: AdviceExpiryValue(''),
          ),
        ).thenAnswer(
          (_) => Future.value(fakeRawFile),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event failed when saveFile error',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
        shipToInfo: fakeShipToInfo,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );

        when(
          () => createPaymentInvoicePdf.createInvoicePdf(
            salesOrganisation: fakeIDSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
            shipToInfo: fakeShipToInfo,
            createdDate: details.createdDate,
            adviceExpiry: details.adviceExpiry,
          ),
        ).thenAnswer(
          (_) => Future.value(fakeRawFile),
        );

        when(
          () => newPaymentRepository.saveFile(
            pdfData: fakeRawFile,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
          shipToInfo: fakeShipToInfo,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          failureOrSuccessOption:
              const Some(Left(ApiFailure.other('mock-error'))),
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> deleteAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.deletePaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            paymentSummaryDetails: details,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.deleteAdvice(isMarketPlace: false),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isDeletingPayment: true,
        ),
        paymentSummaryDetailsState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> deleteAdvice Event success ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.deletePaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            paymentSummaryDetails: details,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.deleteAdvice(isMarketPlace: true),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isDeletingPayment: true,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> cancelAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.cancelPaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            referenceId: details.paymentID.getValue(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.cancelAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isCancelingAdvice: true,
        ),
        paymentSummaryDetailsState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> cancelAdvice Event success ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.cancelPaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            referenceId: details.paymentID.getValue(),
          ),
        ).thenAnswer(
          (invocation) async => const Right('success'),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.cancelAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isCancelingAdvice: true,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );
    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> View downloaded advice',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      seed: () => paymentSummaryDetailsState.copyWith(
        savedAdvice: AttachmentFileBuffer.empty()
            .copyWith(buffer: fakeRawFile, name: 'fake-name'),
      ),
      setUp: () {
        when(
          () => newPaymentRepository.viewSavedAdvice(
            savedAdvice: AttachmentFileBuffer.empty()
                .copyWith(buffer: fakeRawFile, name: 'fake-name'),
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.viewSavedAdvice(),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when payment batch aditional info is invalid and salesOrganization is ID',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
        createPaymentInvoicePdf: createPaymentInvoicePdf,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details.copyWith(
              paymentBatchAdditionalInfo: StringValue(''),
            ),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          ),
        );
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInstruction),
        );
      },
      seed: () => paymentSummaryDetailsState.copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        paymentSummaryDetailsState.copyWith(
          isDetailFetching: true,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        paymentSummaryDetailsState.copyWith(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          user: fakeClientUser,
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        paymentSummaryDetailsState.copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isDetailFetching: true,
        ),
        paymentSummaryDetailsState.copyWith(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          bankInstruction: bankInstruction,
        ),
      ],
    );
  });
}
