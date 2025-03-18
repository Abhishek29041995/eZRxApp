import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/credit_and_invoice_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class CreditAndInvoiceDetailsRepositoryMock extends Mock
    implements CreditAndInvoiceDetailsRepository {}

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

void main() {
  late CreditAndInvoiceDetailsRepository creditAndInvoiceDetailsRepository;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  late CreditAndInvoiceItem fakeInvoice;
  late List<CustomerDocumentDetail> customerDocumentDetailList;
  late List<CreditAndInvoiceItem> creditAndInvoiceItemList;
  final fakeInitialState = CreditAndInvoiceDetailsState.initial().copyWith(
    customerCodeInfo: fakeCustomerCodeInfo,
    salesOrganisation: fakeMYSalesOrganisation,
  );
  const fakeError = ApiFailure.other('fake-error');
  final creditListContainInvalidItem = [
    CustomerDocumentDetail.empty().copyWith(
      principalData: PrincipalData.empty().copyWith(
        principalCode: PrincipalCode(
          '',
        ),
      ),
    ),
    CustomerDocumentDetail.empty().copyWith(
      principalData: PrincipalData.empty().copyWith(
        principalCode: PrincipalCode(
          '1',
        ),
      ),
    ),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsRepository = CreditAndInvoiceDetailsRepositoryMock();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepositoryMock();
    creditAndInvoiceItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    customerDocumentDetailList = await CreditAndInvoiceDetailsLocalDataSource()
        .getCreditAndInvoiceDetails();
  });

  setUp(() async {
    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      searchKey: StringValue('1100001301'),
      accountingDocumentItem: '001',
      postingKeyName: 'Invoice',
    );
  });

  group(
    'Invoice Details Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => CreditAndInvoiceDetailsBloc(
          creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
          allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        ),
        act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
          CreditAndInvoiceDetailsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
        expect: () => [fakeInitialState],
      );
    },
  );

  group('Invoice Details Bloc Fetch', () {
    blocTest(
      'fetch -> Invoice Details fetch fail',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: fakeInvoice,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetch(
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true, basicInfo: fakeInvoice),
        fakeInitialState.copyWith(
          basicInfo: fakeInvoice,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetch -> Invoice Details fetch By Id success',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => allCreditsAndInvoicesRepository.filterInvoices(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            filter: AllInvoicesFilter.defaultFilter().copyWith(
              searchKey: SearchKey.search(
                creditAndInvoiceItemList.first.searchKey.getValue(),
              ),
            ),
            pageSize: 1,
            offset: 0,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(creditAndInvoiceItemList),
        );
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: creditAndInvoiceItemList.first,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(customerDocumentDetailList),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetchInvoiceById(
          invoiceId: creditAndInvoiceItemList.first.searchKey.getValue(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true),
        fakeInitialState.copyWith(
          basicInfo: creditAndInvoiceItemList.first,
          itemsInfo: customerDocumentDetailList,
          failureOrSuccessOption: optionOf(Right(customerDocumentDetailList)),
        ),
      ],
    );

    blocTest(
      'fetch -> Invoice Details fetch By Id fail',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => allCreditsAndInvoicesRepository.filterInvoices(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            filter: AllInvoicesFilter.defaultFilter().copyWith(
              searchKey: SearchKey.search(
                creditAndInvoiceItemList.first.searchKey.getValue(),
              ),
            ),
            pageSize: 1,
            offset: 0,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetchInvoiceById(
          invoiceId: creditAndInvoiceItemList.first.searchKey.getValue(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true),
        fakeInitialState.copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'fetch -> Invoice Details fetch By Id Invoice details fetch fail',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => allCreditsAndInvoicesRepository.filterInvoices(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            filter: AllInvoicesFilter.defaultFilter().copyWith(
              searchKey: SearchKey.search(
                creditAndInvoiceItemList.first.searchKey.getValue(),
              ),
            ),
            pageSize: 1,
            offset: 0,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(creditAndInvoiceItemList),
        );
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: creditAndInvoiceItemList.first,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetchInvoiceById(
          invoiceId: creditAndInvoiceItemList.first.searchKey.getValue(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true),
        fakeInitialState.copyWith(
          basicInfo: creditAndInvoiceItemList.first,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'fetch -> Invoice Details fetch success and return valid items',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: fakeInvoice,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(creditListContainInvalidItem),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetch(
          creditAndInvoiceItem: fakeInvoice,
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true, basicInfo: fakeInvoice),
        fakeInitialState.copyWith(
          basicInfo: fakeInvoice,
          itemsInfo: creditListContainInvalidItem.validItems,
          failureOrSuccessOption: optionOf(
            Right(creditListContainInvalidItem),
          ),
        ),
      ],
    );

    test('validItems getter return only items have valid principalCode', () {
      expect(
        creditListContainInvalidItem.validItems
            .every((e) => e.principalData.principalCode.isValid()),
        true,
      );
    });
  });
}
