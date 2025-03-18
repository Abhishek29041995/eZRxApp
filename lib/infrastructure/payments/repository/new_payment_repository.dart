import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_credit_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_invoice_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_invoice_filter_dto.dart';
import 'package:flutter/foundation.dart';

class NewPaymentRepository extends INewPaymentRepository {
  final Config config;
  final NewPaymentLocalDataSource localDataSource;
  final NewPaymentRemoteDataSource remoteDataSource;
  final FileSystemHelper fileSystemHelper;
  final DeviceInfo deviceInfo;
  final DeviceStorage deviceStorage;

  NewPaymentRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.fileSystemHelper,
    required this.deviceInfo,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getOutstandingInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required OutstandingInvoiceFilter appliedFilter,
    required SearchKey searchKey,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getCustomerOpenItems();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      var filterList =
          OutstandingInvoiceFilterDto.fromDomain(appliedFilter).toMapList;

      if (searchKey.validateNotEmpty) {
        final searchMap = <String, String>{};
        searchMap.putIfAbsent('field', () => 'accountingDocument');
        searchMap.putIfAbsent('value', () => searchKey.searchValueOrEmpty);
        filterList.add(searchMap);
      }
      if (salesOrganisation.salesOrg.isID) {
        filterList = filterList
            .map(
              (map) => map['field'] == 'postingDate'
                  ? {...map, 'field': 'documentDate'}
                  : map,
            )
            .toList();
      }
      final response = await remoteDataSource.getOutstandingInvoices(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        filterList: filterList,
        isMarketPlace: isMarketPlace,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getAvailableCreditNotes({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required AvailableCreditFilter appliedFilter,
    required SearchKey searchKey,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getCustomerOpenItems();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final filterList =
          AvailableCreditFilterDto.fromDomain(appliedFilter).toMapList;

      if (searchKey.validateNotEmpty) {
        final searchMap = <String, String>{};
        searchMap.putIfAbsent('field', () => 'accountingDocument');
        searchMap.putIfAbsent('value', () => searchKey.searchValueOrEmpty);
        filterList.add(searchMap);
      }
      final response = await remoteDataSource.getAvailableCreditNotes(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        filterList: filterList,
        isMarketPlace: isMarketPlace,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PaymentInfo>> pay({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> customerOpenItems,
    required String paymentMethod,
    required User user,
    required ShipToInfo shipToInfo,
    required bool isMarketPlace,
  }) async {
    final baseUrl = config.baseUrl(
      marketDomain: AppMarket(deviceStorage.currentMarket()).marketDomain,
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.pay(
          salesOrg: salesOrganisation.salesOrg,
          baseUrl: baseUrl,
        );

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final customerInvoices = customerOpenItems
          .map(
            (customerOpenItem) => CustomerInvoiceDto.fromDomain(
              customerOpenItem,
            ).toJson(),
          )
          .toList();

      final response = await remoteDataSource.pay(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        customerInvoices: customerInvoices,
        paymentMethod: paymentMethod,
        transactionCurrency:
            customerOpenItems.first.transactionCurrency.getValue(),
        userName: user.username.getValue(),
        shipToCode: shipToInfo.shipToCustomerCode,
        isMarketPlace: isMarketPlace,
        baseUrl: baseUrl,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> updatePaymentGateway({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required bool isMarketPlace,
    required PaymentStatus paymentStatus,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        await localDataSource.updatePaymentGateway();

        return const Right(unit);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      await remoteDataSource.updatePaymentGateway(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        isMarketPlace: isMarketPlace,
        txnStatus: paymentStatus.transactionStatus.getOrDefaultValue(''),
        paymentID: paymentStatus.paymentId,
        transactionRef: paymentStatus.transactionReference,
      );

      return const Right(unit);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PaymentInvoiceInfoPdf>> getPaymentInvoiceInfoPdf({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required PaymentInfo paymentInfo,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPaymentInvoiceInfoPdf();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final invoiceInfoPdf = await remoteDataSource.getPaymentInvoiceInfoPdf(
        customerName: user.username.getValue(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganisation.salesOrg.getValue(),
        accountingDocExternalReference:
            paymentInfo.accountingDocExternalReference,
        paymentBatchAdditionalInfo: paymentInfo.paymentBatchAdditionalInfo,
        paymentId: paymentInfo.paymentID,
        zzAdviceNumber: paymentInfo.zzAdvice,
        isMarketPlace: isMarketPlace,
      );

      return Right(invoiceInfoPdf);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<NewPaymentMethod>>> fetchPaymentMethods({
    required SalesOrganisation salesOrganisation,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.fetchPaymentMethods();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.fetchPaymentMethods(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        isMarketPlace: isMarketPlace,
      );

      return Right(response.reversed.toList());
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, AttachmentFileBuffer>> saveFile({
    required Uint8List pdfData,
  }) async {
    try {
      final attachmentBuffer = AttachmentFileBuffer(
        buffer: pdfData,
        name: 'invoice_${DateTime.now().millisecondsSinceEpoch}.pdf',
      );
      await fileSystemHelper.getDownloadedFile(attachmentBuffer);

      return Right(attachmentBuffer);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, CreateVirtualAccount>> createVirtualAccount({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> invoices,
    required PaymentMethodOption paymentMethodOption,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.createVirtualAccount();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final customerInvoices = invoices
          .map(
            (customerOpenItem) => CustomerInvoiceDto.fromDomain(
              customerOpenItem,
            ).accountingDocument,
          )
          .toList();

      final response = await remoteDataSource.createVirtualAccount(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        bankID: paymentMethodOption.bankOptionId.getOrDefaultValue(''),
        provider: paymentMethodOption.prodiver.getOrDefaultValue(''),
        invoices: customerInvoices,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PrincipalCutoffs>> getPrincipalCutoffs({
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPrincipalCutoffs();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getPrincipalCutoffs(
        branches: [shipToInfo.plant],
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> viewSavedAdvice({
    required AttachmentFileBuffer savedAdvice,
  }) async {
    try {
      final result = await fileSystemHelper.openFile(savedAdvice);
      if (result.type != ResultType.done) {
        return Left(ApiFailure.openDownloadedFileError(result.message));
      }

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
