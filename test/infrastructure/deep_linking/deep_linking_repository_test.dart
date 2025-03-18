import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/deep_linking/repository/deep_linking_repository.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../chatbot/repository/chatbot_repository_test.dart';

class _DeepLinkServiceMock extends Mock implements DeepLinkingService {}

void main() {
  late Config mockConfig;
  late DeviceStorage deviceStorage;
  late _DeepLinkServiceMock deepLinkServiceMock;
  late DeepLinkingRepository repository;
  final fakeError = MockException(message: 'fake-exception');
  const domain = 'https://uat-my.ezrxplus.com';
  const resetPasswordKey = 'reset-password-key';

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockConfig = ConfigMock();
    deviceStorage = DeviceStorageMock();
    deepLinkServiceMock = _DeepLinkServiceMock();
    repository = DeepLinkingRepository(
      config: mockConfig,
      deviceStorage: deviceStorage,
      service: deepLinkServiceMock,
    );
  });

  group('Extract Material Number', () {
    final materialNumber = MaterialNumber('fake-material-number');
    final materialDetailLink = Uri.parse(
      '$domain/product-details/${materialNumber.getValue()}',
    );
    test('=> success', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractMaterialNumber(
        link: materialDetailLink,
      );

      expect(
        result,
        Right(materialNumber),
      );
    });

    test('=> fail', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractMaterialNumber(
        link: materialDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.productDetailRoute()),
      );
    });
  });

  group('Extract Product SearchKey', () {
    final materialNumber = MaterialNumber('fake-material-number');
    final materialListLink = Uri.parse(
      '$domain/product-listing?q=${materialNumber.getValue()}',
    );
    test('=> success', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractProductSearchKey(
        link: materialListLink,
      );

      expect(
        result,
        Right(materialNumber),
      );
    });
  });

  group('Extract Invoice Number', () {
    const invoiceNumber = 'invoice-number';
    final accountInvoiceDetailsLink = Uri.parse(
      '$domain/payments/account-summary/invoice-details?invoiceNumber=$invoiceNumber',
    );
    test('=> success', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractInvoiceNumber(
        link: accountInvoiceDetailsLink,
      );
      expect(
        result,
        const Right(invoiceNumber),
      );
    });

    test('=> fail', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractInvoiceNumber(
        link: accountInvoiceDetailsLink,
      );
      expect(
        result,
        const Left(ApiFailure.invoiceDetailRoute()),
      );
    });
  });
  group('Extract order history', () {
    final orderNumber = OrderNumber('fake_order-number');
    final orderDetailLink = Uri.parse(
      '$domain/orders/order-detail?orderNumber=${orderNumber.getValue()}&SoldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&ShipTo=${fakeShipToInfo.shipToCustomerCode}',
    );
    test('=> success', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractOrderNumber(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: orderDetailLink,
      );

      expect(
        result,
        Right(orderNumber),
      );
    });

    test('=> fail', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);
      final result = repository.extractOrderNumber(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        link: orderDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.orderDetailRoute()),
      );
    });
  });

  group('Extract return id', () {
    const returnId = 'fake-return-Id';
    final returnDetailLink = Uri.parse(
      '$domain/my-account/return-summary-details?requestID=$returnId&soldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&shipTo=${fakeShipToInfo.shipToCustomerCode}',
    );
    test('=> success', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractReturnItem(
        link: returnDetailLink,
      );

      expect(
        result,
        Right(ReturnItem.empty().copyWith(requestId: returnId)),
      );
    });

    test('=> fail', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractReturnItem(
        link: returnDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.returnDetailRoute()),
      );
    });
  });

  group('Extract Payment Identifier Info', () {
    final paymentId = PaymentSummaryDetails.empty().copyWith(
      paymentID: StringValue('fake-payment-id'),
      paymentBatchAdditionalInfo:
          StringValue('fake-payment-batch-additional-info'),
    );
    final returnDetailLink = Uri.parse(
      '$domain/payments/payment-summary/invoice-details?paymentID.c=${utf8.encode(paymentId.paymentID.getValue())}&paymentBatchAdditionalInfo=${paymentId.paymentBatchAdditionalInfo.getValue()}',
    );

    test('=> success', () {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: returnDetailLink,
      );

      expect(
        result,
        Right<ApiFailure, PaymentSummaryDetails>(
          paymentId.copyWith(
            paymentID: StringValue(''),
          ),
        ),
      );
    });

    test('=> fail', () {
      when(
        () => deviceStorage.currentMarket(),
      ).thenThrow(fakeError);

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: returnDetailLink,
      );

      expect(
        result,
        const Left(ApiFailure.paymentDetailRoute()),
      );
    });

    test('=> Success when link contains zzAdvice', () {
      const zzAdvice = '09EZ240002356801';
      final link = Uri.parse(
        '$domain/marketplace-payments/payment-summary/invoice-details?zzAdvice=$zzAdvice',
      );

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentIdentifierInfo(
        link: link,
      );

      expect(
        result,
        Right(
          PaymentSummaryDetails.empty()
              .copyWith(zzAdvice: StringValue(zzAdvice)),
        ),
      );
    });
  });

  group('Extract reset password credentials', () {
    final resetPasswordValidUri = Uri.parse(
      '$domain/login/set-password?key%3D$resetPasswordKey',
    );
    final resetPasswordInvalidUri = Uri.parse(
      '$domain/login/set-password?key%3D',
    );
    test('=> success', () {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = repository.extractResetPasswordKey(
        link: resetPasswordValidUri,
      );

      expect(
        result,
        const Right<ApiFailure, String>(resetPasswordKey),
      );
    });

    test('=> fail', () {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = repository.extractResetPasswordKey(
        link: resetPasswordInvalidUri,
      );

      expect(
        result,
        const Left(ApiFailure.passwordResetFail()),
      );
    });
  });

  group('Extract material filter', () {
    test('=> success', () {
      final materialFilterUri = Uri.parse(
        '$domain/product-listing?favourite=true&itemsWithOffers=false',
      );

      final fakeLocalMaterialFilter = MaterialFilter.empty();

      final result = repository.extractMaterialFilter(
        link: materialFilterUri,
        materialFilter: fakeLocalMaterialFilter,
      );

      expect(
        result,
        fakeLocalMaterialFilter.copyWith(
          isFavourite: true,
          isProductOffer: false,
        ),
      );
    });

    test('=> success url with full filter', () async {
      final materialFilterUri = Uri.parse(
        '$domain/product-listing?favourite=true&itemsWithOffers=false&marketPlace=true&bundleOffers=true&manufacturer=Abbvie%20Sdn%20Bhd%2BAbbott%20Medical%20Optics&sort=price_desc&country=Viet%20Nam%2BHong%20Kong&combo=true&tender=true&covid=true',
      );

      final data = json.decode(
        await rootBundle.loadString(
          'assets/json/get_material_filter/getMaterialFilterForDeepLinkResponse.json',
        ),
      )['data']['GetFilterList'];
      final materialFilterMockData =
          MaterialFilterDto.fromJson(data).toDomain();

      final result = repository.extractMaterialFilter(
        link: materialFilterUri,
        materialFilter: materialFilterMockData,
      );

      expect(
        result,
        materialFilterMockData.copyWith(
          isFavourite: true,
          isProductOffer: false,
          bundleOffers: true,
          isMarketPlace: true,
          sortBy: Sort.priceHighToLow,
          manufactureListSelected: ['Abbvie Sdn Bhd', 'Abbott Medical Optics'],
          countryListSelected: [
            const MaterialFilterCountry(code: 'HK', name: 'Hong Kong'),
            const MaterialFilterCountry(code: 'VN', name: 'Viet Nam'),
          ],
          comboOffers: true,
          hasAccessToCovidMaterial: false,
          isCovidSelected: true,
          isTender: true,
          brandList: [],
        ),
      );
    });
  });

  group('Extract Order Item params', () {
    test('=> success', () {
      const orderNumber = '0200524347';
      const lineNumber = '000040';
      final orderItemUri = Uri.parse(
        '$domain/my-account/orders/item-detail?&SoldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&ShipTo=${fakeShipToInfo.shipToCustomerCode}&orderNumber=$orderNumber&lineNumber=$lineNumber',
      );
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractOrderItemParams(
        link: orderItemUri,
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      );

      expect(
        result,
        Right(
          OrderItemParams(
            lineNumber: LineNumber(lineNumber),
            orderNumber: OrderNumber(orderNumber),
          ),
        ),
      );
    });

    test('=> failure', () {
      const orderNumber = '0200524347';
      const lineNumber = '000040';
      final orderItemUri = Uri.parse(
        '$domain/my-account/orders/item-detail?&SoldTo=${fakeCustomerCodeInfo.customerCodeSoldTo}&ShipTo=${fakeShipToInfo.shipToCustomerCode}&orderNumber=$orderNumber&lineNumber=$lineNumber',
      );

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => '');

      final result = repository.extractOrderItemParams(
        link: orderItemUri,
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
      );

      expect(
        result,
        const Left(ApiFailure.orderDetailRoute()),
      );
    });
  });

  group('Extract Payment Params', () {
    test('=> success', () {
      const tab = 'account-summary';
      const subTab = 'full-summary';
      final paymentUri = Uri.parse(
        '$domain/my-account/payments?tab=$tab&subtab=$subTab',
      );
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractPaymentParams(
        link: paymentUri,
      );

      expect(
        result,
        Right(
          PaymentParams(tab: PaymentTab(tab), subTab: PaymentSubTab(subTab)),
        ),
      );
    });

    test('=> failure', () {
      const tab = 'account-summary';
      const subTab = 'full-summary';
      final paymentUri = Uri.parse(
        '$domain/my-account/payments?tab=$tab&subtab=$subTab',
      );

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => '');

      final result = repository.extractPaymentParams(
        link: paymentUri,
      );

      expect(
        result,
        const Left(ApiFailure.invalidDomain()),
      );
    });
  });

  group('Extract credit id', () {
    test('=> success', () {
      const creditId = 'fake-id';
      final creditUri = Uri.parse(
        '$domain/payments/account-summary/creditnote-details?creditNoteNumber=$creditId',
      );
      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => domain);

      final result = repository.extractCreditId(
        link: creditUri,
      );

      expect(
        result,
        const Right(creditId),
      );
    });

    test('=> failure', () {
      const creditId = 'fake-id';
      final creditUri = Uri.parse(
        '$domain/payments/account-summary/creditnote-details?creditNoteNumber=$creditId',
      );

      when(
        () => deviceStorage.currentMarket(),
      ).thenAnswer((_) => fakeMYSalesOrg.country.toLowerCase());

      when(
        () => mockConfig.baseUrl(
          marketDomain: fakeMYSalesOrg.country.toLowerCase(),
        ),
      ).thenAnswer((_) => '');

      final result = repository.extractCreditId(
        link: creditUri,
      );

      expect(
        result,
        const Left(ApiFailure.creditDetailRoute()),
      );
    });
  });

  group('initialize deep link', () {
    test('=> success', () async {
      when(() => deepLinkServiceMock.init())
          .thenAnswer((_) => Future.value(const Stream.empty().listen((_) {})));

      final result = await repository.initializeDeepLink();

      expect(result, const Right(unit));
    });

    test('=> fail', () async {
      when(() => deepLinkServiceMock.init()).thenThrow(fakeError);

      final result = await repository.initializeDeepLink();

      expect(result, Left(FailureHandler.handleFailure(fakeError)));
    });
  });

  test('success watch deep link', () {
    const fakeStream = Stream<EzrxLink>.empty();

    when(() => deepLinkServiceMock.getStream).thenAnswer((_) => fakeStream);

    final result = repository.watchDeepLinkValue();

    expect(result, fakeStream);
  });
}
