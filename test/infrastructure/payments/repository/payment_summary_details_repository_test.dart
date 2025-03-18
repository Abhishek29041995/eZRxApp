import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class ConfigMock extends Mock implements Config {}

class PaymentItemLocalDataSourceMock extends Mock
    implements PaymentItemLocalDataSource {}

class PaymentItemRemoteDataSourceMock extends Mock
    implements PaymentItemRemoteDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentSummaryDetailsRepository repository;
  late Config configMock;
  late PaymentItemLocalDataSource localDataSourceMock;
  late PaymentItemRemoteDataSource remoteDataSourceMock;
  late PaymentSummaryDetails details;

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = PaymentItemLocalDataSourceMock();
      remoteDataSourceMock = PaymentItemRemoteDataSourceMock();
      locator.registerLazySingleton(() => configMock);
      repository = PaymentSummaryDetailsRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
      );
      details = await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    },
  );

  group(
    'Payment summary details repository',
    () {
      test(
        'fetchPaymentSummaryDetailsInfo success Locally with SalesOrg is ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getTransaction()).thenAnswer(
            (_) async => PaymentItemLocalDataSource().getTransaction(),
          );
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeIDSalesOrganisation,
            isMarketPlace: true,
          );
          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentSummaryDetailsInfo failed Locally with SalesOrg is ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getTransaction())
              .thenThrow(MockException());
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeIDSalesOrganisation,
            isMarketPlace: false,
          );
          expect(result.isLeft(), true);
        },
      );
      test(
        'fetchPaymentSummaryDetailsInfo failed remotely with SalesOrg is ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getTransaction(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              paymentId: '',
              salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
            ),
          ).thenThrow(MockException());
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeIDSalesOrganisation,
            isMarketPlace: false,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'fetchPaymentSummaryDetailsInfo success remotely with SalesOrg is ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getTransaction(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              paymentId: details.paymentID.getOrCrash(),
              salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => PaymentItemLocalDataSource().getTransaction(),
          );
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeIDSalesOrganisation,
            isMarketPlace: true,
          );
          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentSummaryDetailsInfo success Locally with SalesOrg is not ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getPaymentSummaryDetails()).thenAnswer(
            (_) async =>
                PaymentItemLocalDataSource().getPaymentSummaryDetails(),
          );
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeEmptySalesOrganisation,
            isMarketPlace: true,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentSummaryDetailsInfo failed Locally with SalesOrg is not ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.getPaymentSummaryDetails())
              .thenThrow(MockException());
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeEmptySalesOrganisation,
            isMarketPlace: false,
          );

          expect(result.isLeft(), true);
        },
      );

      test(
        'fetchPaymentSummaryDetailsInfo success remotely with SalesOrg is not ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getPaymentSummaryDetails(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              filterBy: PaymentSummaryDetailsDto.fromDomain(details).filterBy,
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (_) async =>
                PaymentItemLocalDataSource().getPaymentSummaryDetails(),
          );
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeVNSalesOrganisation,
            isMarketPlace: true,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentSummaryDetailsInfo failed remotely with SalesOrg is not ID',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getPaymentSummaryDetails(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              filterBy: PaymentSummaryDetailsDto.fromDomain(details).filterBy,
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              isMarketPlace: false,
            ),
          ).thenThrow(MockException());
          final result = await repository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            details: details,
            salesOrganization: fakeVNSalesOrganisation,
            isMarketPlace: false,
          );

          expect(result.isLeft(), true);
        },
      );

      test(
        'fetchPaymentList success locally ',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.getPaymentItems(),
          ).thenAnswer(
            (_) async => PaymentItemLocalDataSource().getPaymentItems(),
          );
          final result = await repository.fetchPaymentList(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            details: PaymentSummaryDetails.empty(),
            isMarketPlace: false,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentList failed locally ',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.getPaymentItems(),
          ).thenThrow(MockException());
          final result = await repository.fetchPaymentList(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            details: PaymentSummaryDetails.empty(),
            isMarketPlace: true,
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'fetchPaymentList success remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getPaymentItemList(
              accountingDocExternalReference:
                  paymentSummaryDetails.accountingDocExternalReference,
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              paymentBatchAdditionalInfo:
                  paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
              paymentID: paymentSummaryDetails.paymentID.getOrCrash(),
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (_) async => PaymentItemLocalDataSource().getPaymentItems(),
          );
          final result = await repository.fetchPaymentList(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            details: paymentSummaryDetails,
            isMarketPlace: true,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'fetchPaymentList failed remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.getPaymentItemList(
              accountingDocExternalReference:
                  paymentSummaryDetails.accountingDocExternalReference,
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              paymentBatchAdditionalInfo:
                  paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
              paymentID: paymentSummaryDetails.paymentID.getOrCrash(),
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              isMarketPlace: false,
            ),
          ).thenThrow(MockException());
          final result = await repository.fetchPaymentList(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            details: paymentSummaryDetails,
            isMarketPlace: false,
          );

          expect(result.isLeft(), true);
        },
      );

      test(
        'delete payment advice success locally ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.deleteCustomerPayment(),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.deletePaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: paymentSummaryDetails,
            salesOrganization: fakeVNSalesOrganisation,
            shipToInfo: ShipToInfo.empty(),
            isMarketPlace: false,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'delete payment failed success locally ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.deleteCustomerPayment(),
          ).thenThrow(MockException());
          final result = await repository.deletePaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: paymentSummaryDetails,
            salesOrganization: fakeVNSalesOrganisation,
            shipToInfo: ShipToInfo.empty(),
            isMarketPlace: true,
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'delete payment failed remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.deleteCustomerPayment(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              paymentAmount: paymentSummaryDetails.paymentAmount.toString(),
              paymentBatchAdditionalInfo:
                  paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
              paymentId: paymentSummaryDetails.paymentID.getOrCrash(),
              transactionCurrency: paymentSummaryDetails.transactionCurrency
                  .getOrDefaultValue(''),
              paymentDate:
                  paymentSummaryDetails.paymentDate.apiDateWithDashString,
              zzAdvice: paymentSummaryDetails.zzAdvice.getOrCrash(),
              shipToCode: ShipToInfo.empty().shipToCustomerCode,
              isMarketPlace: false,
            ),
          ).thenThrow(MockException());
          final result = await repository.deletePaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: paymentSummaryDetails,
            salesOrganization: fakeVNSalesOrganisation,
            shipToInfo: ShipToInfo.empty(),
            isMarketPlace: false,
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'delete payment failed api remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.deleteCustomerPayment(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              paymentAmount: paymentSummaryDetails.paymentAmount.toString(),
              paymentBatchAdditionalInfo:
                  paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
              paymentId: paymentSummaryDetails.paymentID.getOrCrash(),
              transactionCurrency: paymentSummaryDetails.transactionCurrency
                  .getOrDefaultValue(''),
              paymentDate:
                  paymentSummaryDetails.paymentDate.apiDateWithDashString,
              zzAdvice: paymentSummaryDetails.zzAdvice.getOrCrash(),
              shipToCode: ShipToInfo.empty().shipToCustomerCode,
              isMarketPlace: true,
            ),
          ).thenAnswer(
            (_) async => false,
          );
          final result = await repository.deletePaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: paymentSummaryDetails,
            salesOrganization: fakeVNSalesOrganisation,
            shipToInfo: ShipToInfo.empty(),
            isMarketPlace: true,
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'delete payment success remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.deleteCustomerPayment(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
              paymentAmount: paymentSummaryDetails.paymentAmount.toString(),
              paymentBatchAdditionalInfo:
                  paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
              paymentId: paymentSummaryDetails.paymentID.getOrCrash(),
              transactionCurrency: paymentSummaryDetails.transactionCurrency
                  .getOrDefaultValue(''),
              paymentDate:
                  paymentSummaryDetails.paymentDate.apiDateWithDashString,
              zzAdvice: paymentSummaryDetails.zzAdvice.getOrCrash(),
              shipToCode: ShipToInfo.empty().shipToCustomerCode,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.deletePaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: paymentSummaryDetails,
            salesOrganization: fakeVNSalesOrganisation,
            shipToInfo: ShipToInfo.empty(),
            isMarketPlace: false,
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'cancel payment success locally ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.cancelPaymentAdvice(),
          ).thenAnswer(
            (_) async => PaymentItemLocalDataSource().cancelPaymentAdvice(),
          );
          final result = await repository.cancelPaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            referenceId: paymentSummaryDetails.paymentID.getValue(),
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'cancel payment failed locally ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.cancelPaymentAdvice(),
          ).thenThrow(MockException());
          final result = await repository.cancelPaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            referenceId: paymentSummaryDetails.paymentID.getValue(),
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'cancel payment success remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.cancelPaymentAdvice(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              referenceId: paymentSummaryDetails.paymentID.getValue(),
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
            ),
          ).thenAnswer(
            (_) async => PaymentItemLocalDataSource().cancelPaymentAdvice(),
          );
          final result = await repository.cancelPaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            referenceId: paymentSummaryDetails.paymentID.getValue(),
          );

          expect(result.isRight(), true);
        },
      );
      test(
        'cancel payment failed remotely ',
        () async {
          final paymentSummaryDetails =
              await PaymentItemLocalDataSource().getPaymentSummaryDetails();
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.cancelPaymentAdvice(
              customerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
              referenceId: paymentSummaryDetails.paymentID.getValue(),
              salesOrg: fakeVNSalesOrganisation.salesOrg.getOrCrash(),
            ),
          ).thenThrow(MockException());
          final result = await repository.cancelPaymentAdvice(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: fakeVNSalesOrganisation,
            referenceId: paymentSummaryDetails.paymentID.getValue(),
          );

          expect(result.isLeft(), true);
        },
      );
      test(
        'Currency PH Bank-in: Pending ',
        () async {
          final paymentSummaryDetails = await PaymentItemLocalDataSource()
              .getPaymentSummaryDetailsByPaymentId(
            PaymentItemLocalDataSource.phBankInId,
          );

          expect(
            paymentSummaryDetails.status,
            FilterStatus('Pending'),
          );
        },
      );
      test(
        'Currency SG: Pending ',
        () async {
          final paymentSummaryDetails = await PaymentItemLocalDataSource()
              .getPaymentSummaryDetailsByPaymentId(
            PaymentItemLocalDataSource.sgQrCodeId,
          );

          expect(
            paymentSummaryDetails.status,
            FilterStatus('Pending'),
          );
        },
      );
      test(
        'Currency Other Payment Gateway: In Progress ',
        () async {
          final paymentSummaryDetails = await PaymentItemLocalDataSource()
              .getPaymentSummaryDetailsByPaymentId(
            PaymentItemLocalDataSource.phPaymentGatewayId,
          );

          expect(
            paymentSummaryDetails.status,
            FilterStatus('In Progress'),
          );
        },
      );
    },
  );
}
