import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_object;
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';

class PaymentTermsRepoMock extends Mock implements PaymentTermsRepository {}

class PaymentCustomerInfoMockBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentTermsRepository paymentTermsRepositoryMock;
  late List<PaymentTerm> paymentTermMockData;

  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );

  const fakesalesRepInfo = SalesRepresentativeInfo(
    count: 0,
    uniquePrincipalGroup: [],
    uniquePrincipalNumber: [],
    uniqueSalesOrganisation: [],
  );

  const fakepaymentCustomerInformation = PaymentCustomerInformation(
    billToInfo: <BillToInfo>[],
    paymentTerm: 'fake-term',
    shipToInfoList: <ShipToInfo>[],
  );

  group('Payment Terms Bloc', () {
    setUp(() async {
      paymentTermsRepositoryMock = PaymentTermsRepoMock();
      paymentTermMockData =
          await PaymentTermLocalDataSource().getPaymentTerms();
      WidgetsFlutterBinding.ensureInitialized();
    });
    blocTest<PaymentTermBloc, PaymentTermState>(
      'For Customer Information Initialized Event',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      act: (bloc) => bloc.add(const PaymentTermEvent.initialized()),
      expect: () => [
        PaymentTermState.initial(),
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Fetch fail',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentTermsRepositoryMock.getPaymentTerms(
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfig: fakeMMSalesOrgConfigs,
            paymentCustomerInfo: fakepaymentCustomerInformation,
            salesRepInfo: fakesalesRepInfo,
            preferredLanguage: fakeClientUser.preferredLanguage,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          salesOrganisation: fakeMYSalesOrganisation,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisationConfigs: fakeMMSalesOrgConfigs,
          salesRepresentativeInfo: fakesalesRepInfo,
          user: fakeClientUser,
        ),
      ),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTermsFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Fetch Success',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentTermsRepositoryMock.getPaymentTerms(
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfig: fakeMMSalesOrgConfigs,
            paymentCustomerInfo: fakepaymentCustomerInformation,
            salesRepInfo: fakesalesRepInfo,
            preferredLanguage: fakeClientUser.preferredLanguage,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            paymentTermMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(
        PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfigs: fakeMMSalesOrgConfigs,
          salesRepresentativeInfo: fakesalesRepInfo,
          user: fakeClientUser,
        ),
      ),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTerms: paymentTermMockData,
          paymentTermsFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Extension Test',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      seed: () => PaymentTermState.initial().copyWith(
        paymentTerms: paymentTermMockData,
      ),
      verify: (bloc) {
        expect(
          bloc.state.paymentTerms.displaySelected(value_object.PaymentTerm('')),
          null,
        );
        expect(
          bloc.state.paymentTerms
              .displaySelected(value_object.PaymentTerm('0001')),
          '0001',
        );
        expect(
          bloc.state.paymentTerms.displaySelected(
            value_object.PaymentTerm('0001 - Pay immediately (Standard SAP)'),
          ),
          '0001 - Pay immediately (Standard SAP)',
        );
        expect(
          bloc.state.paymentTerms
              .displaySelected(value_object.PaymentTerm('0002')),
          null,
        );
      },
    );
  });
}
