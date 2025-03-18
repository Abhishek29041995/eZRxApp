import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';

import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/customer_code_mock.dart';

class DeepLinkingRepositoryMock extends Mock
    implements IDeepLinkingRepository {}

void main() {
  late IDeepLinkingRepository repository;
  late ChatBotService chatBotService;
  late MaterialFilter materialFilter;
  final fakeCustomerCode = fakeCustomerCodeInfo;
  final fakeShipToCode = fakeShipToInfo;
  const fakeError = ApiFailure.other('fake-error');
  const fakeLinkInvalid = ApiFailure.other('Link is not valid');
  final materialNumber = MaterialNumber('000000000011002079');
  const orderDetailLink = '/my-account/orders/order-detail';
  const contactUsLink = '/contact-us';
  const productDetailsLink = '/product-details';
  const bundleDetailsLink = '/bundle-details';
  const productListingLink = '/product-listing';
  const returnSummaryLink = '/my-account/return-summary-details';
  const zpPaymentSummaryDetailLink =
      '/payments/payment-summary/invoice-details';
  const mpPaymentSummaryDetailLink =
      '/marketplace-payments/payment-summary/invoice-details';
  const zpInvoiceDetailLink = '/payments/account-summary/invoice-details';
  const mpInvoiceDetailLink =
      '/marketplace-payments/account-summary/invoice-details';
  const paymentLink = '/my-account/payments';
  const faqLink = '/faq';
  const resetPasswordLink =
      'https://clicktime.symantec.com/15tStdYPVXVZm3CGiHwjj?h=AajXDPaRNcBc9HqeqM_8ZyhyH7ej6-GwTxaPE9fxEqU=&amp;u=https://uat-sg.ezrxplus.com/login/set-password?username%3DFakeUser%26token%3DFakeToken';
  const tncLink = '/tnc';
  const privacyLink = '/privacy';
  const settingLink = '/my-account/Settings';
  const cartLink = '/cart';
  const orderItemDetailLink = '/my-account/orders/item-detail';
  const annoucementLink = '/announcement/view-all/announcements';
  const articleLink = '/announcement/view-all/articles';
  const returnLink = '/my-account/returns';
  const creditDetailLink =
      '/marketplace-payments/account-summary/creditnote-details';
  const claimSubmissionLink = '/my-account/payments/claim-submission';
  const returnRequestLink = '/my-account/new-return-request';
  const raiseTicketLink = '/raise-ticket';
  final fakeEzrxLink = EzrxLink(raiseTicketLink);
  const resetPasswordKey = 'fake-reset-password-key';

  setUpAll(() {
    repository = DeepLinkingRepositoryMock();
    chatBotService = ChatBotServiceMock();
    materialFilter = MaterialFilter.empty();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(() => repository.initializeDeepLink())
          .thenAnswer((_) async => const Left(fakeError));
      when(() => repository.watchDeepLinkValue()).thenAnswer(
        (_) => const Stream<EzrxLink>.empty(),
      );
    },
    expect: () => [
      const DeepLinkingState.error(fakeError),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(() => repository.initializeDeepLink())
          .thenAnswer((_) async => const Right(unit));
      when(() => repository.watchDeepLinkValue()).thenAnswer(
        (_) => Stream.fromIterable([EzrxLink(faqLink)]),
      );
      when(() => chatBotService.closeChatBot()).thenAnswer((_) async => true);
    },
    expect: () => [DeepLinkingState.linkPending(EzrxLink(faqLink))],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Add pending link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(() => chatBotService.closeChatBot())
          .thenAnswer((invocation) => Future.value(true));
    },
    act: (bloc) => bloc.add(
      DeepLinkingEvent.addPendingLink(
        EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
      ),
    ),
    expect: () => [
      DeepLinkingState.linkPending(
        EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
      ),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume pending link when state is not DeepLinkingState.linkPending',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume an unsupported pending link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(scheme: 'fakeScheme', host: 'fakeHost').toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [const DeepLinkingState.error(fakeLinkInvalid)],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume an supported link require shipTo when not select shipTo',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(EzrxLink(productDetailsLink)),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: ShipToInfo.empty(),
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(ApiFailure.other('Please login to proceed')),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCodeInfo,
          selectedShipTo: fakeShipToInfo,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(Right(OrderNumber('fake-order-history')));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(path: orderDetailLink).toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      DeepLinkingState.redirectOrderDetail(OrderNumber('fake-order-history')),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCodeInfo,
          selectedShipTo: fakeShipToInfo,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(
        const Left(ApiFailure.orderDetailRoute()),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(Uri(path: orderDetailLink).toString()),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCodeInfo,
        selectedShipTo: fakeShipToInfo,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    ],
  );

  group('Redirect contact-us', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect contact-us success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(Right(AppMarket.defaultMarket()));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(contactUsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectContactUs(AppMarket.defaultMarket()),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect contact-us failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.getCurrentMarket(),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(contactUsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });

  group('Product Redirection ', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: productDetailsLink),
          ),
        ).thenReturn(Right(materialNumber));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectProductDetail(materialNumber),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: productDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect bundle details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: bundleDetailsLink),
          ),
        ).thenReturn(Right(materialNumber));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(bundleDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectBundleDetail(materialNumber),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect bundle details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractMaterialNumber(
            link: Uri(path: bundleDetailsLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(bundleDetailsLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product listing success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractProductSearchKey(
            link: Uri(path: productListingLink),
          ),
        ).thenReturn(Right(SearchKey.search(materialNumber.getValue())));
        when(
          () => repository.extractMaterialFilter(
            link: Uri(path: productListingLink),
            materialFilter: materialFilter,
          ),
        ).thenReturn(materialFilter);
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productListingLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectProductsTab(
          SearchKey.search(materialNumber.getValue()),
          materialFilter,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect product listing failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractProductSearchKey(
            link: Uri(path: productListingLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(productListingLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });

  group('Return redirection', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Return Summary success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractReturnItem(
            link: Uri(path: returnSummaryLink),
          ),
        ).thenReturn(
          Right(ReturnItem.empty().copyWith(requestId: 'fake-request-id')),
        );
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(returnSummaryLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectReturnDetail(
          ReturnItem.empty().copyWith(requestId: 'fake-request-id'),
        ),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Return Summary failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractReturnItem(
            link: Uri(path: returnSummaryLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(returnSummaryLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });

  group('Payment redirection', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Payment home success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentParams(
            link: Uri(path: paymentLink),
          ),
        ).thenAnswer((_) => Right(PaymentParams.empty()));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(paymentLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectPaymentHome(
          params: PaymentParams.empty(),
          isMarketPlace: false,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect MP Payment home success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        EzrxLink('/my-account/marketplace-payments'),
      ),
      setUp: () {
        when(
          () => repository.extractPaymentParams(
            link: Uri(path: '/my-account/marketplace-payments'),
          ),
        ).thenAnswer((_) => Right(PaymentParams.empty()));
      },
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectPaymentHome(
          params: PaymentParams.empty(),
          isMarketPlace: true,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect ZP Payment Summary invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentIdentifierInfo(
            link: Uri(path: zpPaymentSummaryDetailLink),
          ),
        ).thenReturn(
          Right(
            PaymentSummaryDetails.empty().copyWith(
              paymentID: StringValue('fake-payment-id'),
            ),
          ),
        );
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(zpPaymentSummaryDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectPaymentDetail(
          paymentIdentifierInfo: PaymentSummaryDetails.empty().copyWith(
            paymentID: StringValue('fake-payment-id'),
          ),
          isMarketPlace: false,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect MP Payment Summary invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentIdentifierInfo(
            link: Uri(path: mpPaymentSummaryDetailLink),
          ),
        ).thenReturn(
          Right(
            PaymentSummaryDetails.empty().copyWith(
              paymentID: StringValue('fake-payment-id'),
            ),
          ),
        );
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(mpPaymentSummaryDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        DeepLinkingState.redirectPaymentDetail(
          paymentIdentifierInfo: PaymentSummaryDetails.empty().copyWith(
            paymentID: StringValue('fake-payment-id'),
          ),
          isMarketPlace: true,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect Payment Summary invoice Details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractPaymentIdentifierInfo(
            link: Uri(path: zpPaymentSummaryDetailLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(zpPaymentSummaryDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect ZP invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractInvoiceNumber(
            link: Uri(path: zpInvoiceDetailLink),
          ),
        ).thenReturn(const Right('fake-invoice-number'));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(zpInvoiceDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectInvoiceDetail(
          invoiceNumber: 'fake-invoice-number',
          isMarketPlace: false,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect MP invoice Details success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractInvoiceNumber(
            link: Uri(path: mpInvoiceDetailLink),
          ),
        ).thenReturn(const Right('fake-invoice-number'));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(mpInvoiceDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectInvoiceDetail(
          invoiceNumber: 'fake-invoice-number',
          isMarketPlace: true,
        ),
      ],
    );

    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect invoice details failure',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractInvoiceNumber(
            link: Uri(path: zpInvoiceDetailLink),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(zpInvoiceDetailLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });
  group('Redirect FAQ', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume redirect FAQ success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(faqLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectFAQ(),
      ],
    );
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect About us success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(EzrxLink('/about-us')),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectAboutUs(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect User guide success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(EzrxLink('/user-guide')),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectUserGuide(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect Order tab success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(EzrxLink('/my-account/Orders')),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectOrder(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume tnc link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(tncLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectTnC(),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume privacy link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(privacyLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectPrivacy(),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume my payment account link failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractPaymentParams(
          link: Uri(path: paymentLink),
        ),
      ).thenReturn(const Left(fakeError));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(paymentLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(fakeError),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume setting link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(settingLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectSetting(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume cart link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(cartLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectCart(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume order item detail link failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderItemParams(
          link: Uri(path: orderItemDetailLink),
          selectedShipTo: fakeShipToCode,
          selectedCustomerCode: fakeCustomerCode,
        ),
      ).thenReturn(const Left(fakeError));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(orderItemDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(fakeError),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume order item detail link success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractOrderItemParams(
          link: Uri(path: orderItemDetailLink),
          selectedShipTo: fakeShipToCode,
          selectedCustomerCode: fakeCustomerCode,
        ),
      ).thenReturn(Right(OrderItemParams.empty()));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(orderItemDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      DeepLinkingState.redirectOrderItemDetail(
        params: OrderItemParams.empty(),
      ),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume announcement link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(annoucementLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectAnnouncement(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume article link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(articleLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectArticle(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume return link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(returnLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectReturn(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume claim submission link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(claimSubmissionLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectClaimSubmission(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume return request link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(returnRequestLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectNewReturnRequest(),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume raise ticket link',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractChatUrl(
          link: fakeEzrxLink.uri,
        ),
      ).thenReturn(const Right('fake-chatUrl'));
    },
    seed: () => DeepLinkingState.linkPending(
      fakeEzrxLink,
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectRaiseTicket(
        chatUrl: 'fake-chatUrl',
      ),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume credit detail link failure',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractCreditId(
          link: Uri(path: creditDetailLink),
        ),
      ).thenReturn(const Left(fakeError));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(creditDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(fakeError),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume credit detail link success',
    build: () => DeepLinkingBloc(
      repository: repository,
      chatBotService: chatBotService,
    ),
    setUp: () {
      when(
        () => repository.extractCreditId(
          link: Uri(path: creditDetailLink),
        ),
      ).thenReturn(const Right('fake-id'));
    },
    seed: () => DeepLinkingState.linkPending(
      EzrxLink(creditDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        materialFilter: materialFilter,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectCreditDetail(
        creditId: 'fake-id',
        isMarketPlace: true,
      ),
    ],
  );
  group('Redirect To Reset Password', () {
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume reset password link success',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractResetPasswordKey(
            link: Uri(
              path: '/login/set-password',
              host: 'uat-sg.ezrxplus.com',
              port: 443,
              queryParameters: {'username': 'FakeUser', 'token': 'FakeToken'},
              scheme: 'https',
            ),
          ),
        ).thenReturn(const Right(resetPasswordKey));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(resetPasswordLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.redirectResetPassword(resetPasswordKey),
      ],
    );
    blocTest<DeepLinkingBloc, DeepLinkingState>(
      'Consume reset password link fail',
      build: () => DeepLinkingBloc(
        repository: repository,
        chatBotService: chatBotService,
      ),
      setUp: () {
        when(
          () => repository.extractResetPasswordKey(
            link: Uri(
              path: '/login/set-password',
              host: 'uat-sg.ezrxplus.com',
              port: 443,
              queryParameters: {'username': 'FakeUser', 'token': 'FakeToken'},
              scheme: 'https',
            ),
          ),
        ).thenReturn(const Left(fakeError));
      },
      seed: () => DeepLinkingState.linkPending(
        EzrxLink(resetPasswordLink),
      ),
      act: (bloc) => bloc.add(
        DeepLinkingEvent.consumePendingLink(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          materialFilter: materialFilter,
        ),
      ),
      expect: () => [
        const DeepLinkingState.error(fakeError),
      ],
    );
  });
}
