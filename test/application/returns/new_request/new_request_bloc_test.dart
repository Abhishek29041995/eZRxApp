import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestRepositoryMock extends Mock
    implements ReturnRequestRepository {}

void main() {
  late ReturnRequestRepository newRequestRepository;
  late ReturnMaterial fakeReturnMaterial;
  late ReturnItemDetails fakeReturnItemDetail;
  late SalesOrganisationConfigs fakeSalesOrganisationConfigs;
  late SalesOrg fakeSalesOrg;

  const fakeFileName = 'fake-file-name';

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    newRequestRepository = ReturnRequestRepositoryMock();
  });

  setUp(() async {
    fakeSalesOrganisationConfigs = await SalesOrgLocalDataSource().getConfig();
    fakeSalesOrg = fakeSalesOrganisationConfigs.salesOrg;

    fakeReturnMaterial =
        (await ReturnRequestLocalDataSource().searchReturnMaterials()).items[1];

    fakeReturnItemDetail = ReturnItemDetails.empty().copyWith(
      materialNumber: fakeReturnMaterial.materialNumber,
      itemNumber: fakeReturnMaterial.itemNumber,
      assignmentNumber: fakeReturnMaterial.assignmentNumber,
      batch: fakeReturnMaterial.batch,
      priceOverride: CounterOfferValue('10'),
      returnQuantity: ReturnQuantity('2'),
    );
  });

  group(
    'New Request Bloc Invoices ',
    () {
      blocTest(
        ' => Initialize',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.initialized(
            salesOrg: fakeSalesOrg,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
          ),
        ],
      );

      blocTest(
        ' => verify state function',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnItemDetail.assignmentNumber,
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        verify: (NewRequestBloc bloc) {
          expect(
            bloc.state.isIncludeBonus(fakeReturnMaterial.uuid),
            true,
          );
          expect(
            bloc.state.isReturnQuantityValid,
            true,
          );
          expect(
            bloc.state.returnItemTotal(fakeReturnItemDetail.assignmentNumber),
            fakeReturnItemDetail.priceOverride.doubleValue *
                fakeReturnItemDetail.returnQuantity.getIntValue,
          );
          expect(
            bloc.state.returnTotal,
            bloc.state.returnItemTotal(fakeReturnItemDetail.assignmentNumber),
          );
        },
      );

      blocTest(
        ' => verify getInvoiceDetail function with invoiceDetails empty',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        verify: (NewRequestBloc bloc) {
          expect(
            bloc.state.getInvoiceDetail(fakeReturnItemDetail.assignmentNumber),
            InvoiceDetails.empty(),
          );
        },
      );

      blocTest(
        ' => verify getInvoiceDetail function with invoiceDetails not empty',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnItemDetail.assignmentNumber,
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        verify: (NewRequestBloc bloc) {
          expect(
            bloc.state.getInvoiceDetail(fakeReturnItemDetail.assignmentNumber),
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnItemDetail.assignmentNumber,
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          );
        },
      );

      blocTest(
        ' => verify getReturnMaterial function with selectedItems empty',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        verify: (NewRequestBloc bloc) {
          expect(
            bloc.state.getReturnMaterial(fakeReturnItemDetail.itemNumber),
            ReturnMaterial.empty(),
          );
        },
      );

      blocTest(
        ' => verify getReturnMaterial function with selectedItems not empty',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '',
            ),
          ],
        ),
        verify: (NewRequestBloc bloc) {
          expect(
            bloc.state.getReturnMaterial(fakeReturnItemDetail.itemNumber),
            fakeReturnMaterial.bonusItems.first,
          );
        },
      );

      blocTest(
        ' => toggleReturnItem deselect a return material item',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          salesOrg: fakeSalesOrg,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleReturnItem(
            item: fakeReturnMaterial,
            selected: false,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [fakeReturnItemDetail],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => toggleReturnItem select not a return material item',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrg,
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleReturnItem(
            item: fakeReturnMaterial,
            selected: true,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeReturnMaterial.assignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  fakeReturnMaterial.validatedItemDetails,
                ],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => toggleReturnItem select a return material item',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrg,
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleReturnItem(
            item: fakeReturnMaterial.copyWith(
              balanceQuantity: IntegerValue('0'),
            ),
            selected: true,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            salesOrg: fakeSalesOrg,
            selectedItems: [
              fakeReturnMaterial.copyWith(
                balanceQuantity: IntegerValue('0'),
              ),
            ],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeReturnMaterial.assignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  fakeReturnMaterial.validatedItemDetails
                      .copyWith(balanceQty: IntegerValue('0')),
                  ...fakeReturnMaterial.bonusItems.map(
                    (bonusItem) => bonusItem.validatedItemDetails,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => additionInfoChanged test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(
                  // change batch value to make sure item is different
                  batch: 'fake-batch',
                ),
              ],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.additionInfoChanged(
            additionInfo: fakeReturnItemDetail,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [fakeReturnItemDetail],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => toggleFiles included = true test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleFiles(
            included: true,
            uuid: fakeReturnItemDetail.uuid,
            files: [
              PoDocuments.empty().copyWith(name: fakeFileName),
            ],
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetail.copyWith(
                    uploadedFiles: [
                      PoDocuments.empty().copyWith(name: fakeFileName),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => toggleFiles included = false test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(
                  uploadedFiles: [
                    PoDocuments.empty().copyWith(name: fakeFileName),
                  ],
                ),
              ],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.toggleFiles(
            included: false,
            uuid: fakeReturnItemDetail.uuid,
            files: [
              PoDocuments.empty().copyWith(name: fakeFileName),
            ],
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [fakeReturnItemDetail],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => validateStep step 1 selectedItems empty test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        act: (NewRequestBloc bloc) => bloc.add(
          const NewRequestEvent.validateStep(
            step: 1,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            showErrorMessages: true,
          ),
        ],
      );

      blocTest(
        ' => validateStep step 1 selectedItems not empty test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          showErrorMessages: true,
          selectedItems: [
            ReturnMaterial.empty(),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          const NewRequestEvent.validateStep(
            step: 1,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            selectedItems: [
              ReturnMaterial.empty(),
            ],
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        ' => validateStep step 2 test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => bloc.add(
          const NewRequestEvent.validateStep(
            step: 2,
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [fakeReturnItemDetail],
              ),
            ],
            showErrorMessages: true,
          ),
        ],
      );

      blocTest(
        ' => returnReferenceChanged test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        act: (NewRequestBloc bloc) => bloc.add(
          const NewRequestEvent.returnReferenceChanged(
            'fake-return-reference',
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            returnReference: 'fake-return-reference',
          ),
        ],
      );

      blocTest(
        ' => specialInstructionsChanged test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        act: (NewRequestBloc bloc) => bloc.add(
          const NewRequestEvent.specialInstructionsChanged(
            'fake-instruction',
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            specialInstructions: 'fake-instruction',
          ),
        ],
      );

      blocTest(
        ' => submit failed test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        setUp: () {
          when(
            () => newRequestRepository.addRequest(
              requestParams: AddRequestParams.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.submit(
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            isSubmitting: true,
          ),
          NewRequestState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
      blocTest(
        ' => submit success test',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        setUp: () {
          when(
            () => newRequestRepository.addRequest(
              requestParams: AddRequestParams.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              'fake-id',
            ),
          );
        },
        act: (NewRequestBloc bloc) => bloc.add(
          NewRequestEvent.submit(
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          NewRequestState.initial().copyWith(
            isSubmitting: true,
          ),
          NewRequestState.initial().copyWith(
            returnRequestId: 'fake-id',
          ),
        ],
      );
    },
  );

  group(
    'New Request Bloc Fill return',
    () {
      blocTest(
        ' => toggle state of include bonus button',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.assignmentNumber,
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [fakeReturnItemDetail],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => [
          bloc.add(
            NewRequestEvent.toggleBonusItem(
              item: fakeReturnMaterial,
              included: false,
            ),
          ),
          bloc.add(
            NewRequestEvent.toggleBonusItem(
              item: fakeReturnMaterial,
              included: true,
            ),
          ),
        ],
        expect: () => [
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeReturnMaterial.assignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [],
              ),
            ],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeReturnMaterial.assignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  fakeReturnMaterial.validatedItemDetails
                      .copyWith(returnType: ReturnType.returnItem()),
                ],
              ),
            ],
          ),
        ],
      );

      blocTest(
        ' => test event toggleBonusItem',
        build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
        seed: () => NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.assignmentNumber,
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [
                fakeReturnItemDetail,
              ],
            ),
          ],
        ),
        act: (NewRequestBloc bloc) => [
          bloc.add(
            NewRequestEvent.toggleBonusItem(
              item: fakeReturnMaterial,
              included: true,
            ),
          ),
        ],
        expect: () => [
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                invoiceNumber: fakeReturnMaterial.assignmentNumber,
                salesOrg: fakeSalesOrg,
                returnItemDetailsList: [
                  fakeReturnItemDetail,
                  fakeReturnMaterial.validatedItemDetails.copyWith(
                    returnType: fakeReturnItemDetail.returnType,
                    priceOverride: fakeReturnItemDetail.priceOverride,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );

  group('New Request State getter -', () {
    group('invalidSelectedReturnItemMsg -', () {
      test(
          'Should return MP warning message when selected items contains both ZP and MP',
          () {
        final selectedItems = [
          ReturnMaterial.empty().copyWith(isMarketPlace: true),
          ReturnMaterial.empty(),
        ];

        expect(
          NewRequestState.initial()
              .copyWith(selectedItems: selectedItems)
              .invalidSelectedReturnItemMsg,
          'Please note that ZP and MP products cannot be returned together. Additionally, MP products must be from the same seller in each request.',
        );
      });

      test(
          'Should return MP warning message when selected items contains MP items from different seller',
          () {
        final selectedItems = [
          ReturnMaterial.empty()
              .copyWith(isMarketPlace: true, principalCode: PrincipalCode('a')),
          ReturnMaterial.empty()
              .copyWith(isMarketPlace: true, principalCode: PrincipalCode('b')),
        ];

        expect(
          NewRequestState.initial()
              .copyWith(selectedItems: selectedItems)
              .invalidSelectedReturnItemMsg,
          'Please note that ZP and MP products cannot be returned together. Additionally, MP products must be from the same seller in each request.',
        );
      });

      test(
          'Should return ZP warning message when selected items contains only ZP items',
          () {
        final selectedItems = [
          ReturnMaterial.empty().copyWith(principalCode: PrincipalCode('a')),
          ReturnMaterial.empty().copyWith(principalCode: PrincipalCode('b')),
        ];

        expect(
          NewRequestState.initial()
              .copyWith(selectedItems: selectedItems)
              .invalidSelectedReturnItemMsg,
          'Please ensure that the items selected for return are from the same Principal.',
        );
      });
    });
  });

  group('Test updateRequestCounterOffer & updateSelectedReturnType event', () {
    blocTest(
      ' => test updateRequestCounterOffer event when isChangeMaterialCounterOffer is true then false',
      build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
      seed: () => NewRequestState.initial().copyWith(
        invoiceDetails: [
          InvoiceDetails.empty().copyWith(
            returnItemDetailsList: [
              fakeReturnItemDetail,
            ],
          ),
        ],
      ),
      act: (NewRequestBloc bloc) => bloc
        ..add(
          NewRequestEvent.updateRequestCounterOffer(
            uuid:
                '${fakeReturnMaterial.assignmentNumber}${fakeReturnMaterial.itemNumber}',
            isChangeMaterialCounterOffer: true,
            counterOfferValue: CounterOfferValue('6'),
          ),
        )
        ..add(
          NewRequestEvent.updateRequestCounterOffer(
            uuid:
                '${fakeReturnMaterial.assignmentNumber}${fakeReturnMaterial.itemNumber}',
            isChangeMaterialCounterOffer: false,
            counterOfferValue: CounterOfferValue('9'),
          ),
        ),
      expect: () => [
        NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(
                  priceOverride: CounterOfferValue('6'),
                ),
              ],
            ),
          ],
        ),
        NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(
                  priceOverride: CounterOfferValue('9'),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    blocTest(
      ' => test event updateSelectedReturnType',
      build: () => NewRequestBloc(newRequestRepository: newRequestRepository),
      seed: () => NewRequestState.initial().copyWith(
        invoiceDetails: [
          InvoiceDetails.empty().copyWith(
            returnItemDetailsList: [
              fakeReturnItemDetail,
            ],
          ),
        ],
      ),
      act: (NewRequestBloc bloc) => bloc.add(
        NewRequestEvent.updateSelectedReturnType(
          returnType: ReturnType('fake-type'),
          assignmentNumber: fakeReturnMaterial.assignmentNumber,
        ),
      ),
      expect: () => [
        NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(
                  returnType: ReturnType('fake-type'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  });

  group('Unit test for newRequestState', () {
    test('Test get validInvoiceDetails', () {
      expect(
        NewRequestState.initial()
            .copyWith(
              invoiceDetails: [
                InvoiceDetails.empty().copyWith(
                  returnItemDetailsList: [
                    fakeReturnItemDetail.copyWith(
                      balanceQty: IntegerValue('0'),
                    ),
                    fakeReturnItemDetail.copyWith(
                      balanceQty: IntegerValue('1'),
                    ),
                  ],
                ),
              ],
            )
            .validInvoiceDetails
            .first
            .returnItemDetailsList,
        [
          fakeReturnItemDetail.copyWith(balanceQty: IntegerValue('1')),
        ],
      );
    });

    test('Test mixpanelTrackingInfo', () {
      expect(
          NewRequestState.initial().copyWith(
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetail.copyWith(
                    returnQuantity: ReturnQuantity('1'),
                  ),
                  fakeReturnItemDetail.copyWith(
                    returnQuantity: ReturnQuantity('1'),
                  ),
                ],
              ),
            ],
          ).mixpanelTrackingInfo(
            reasonList: [
              Usage(
                usageCode: fakeReturnItemDetail.returnReason,
                usageDescription: 'fake-description',
              ),
            ],
          ),
          {
            TrackingProps.returnId: '',
            TrackingProps.totalQty: 2,
            TrackingProps.totalPrice: 20.0,
            TrackingProps.isSingle: true,
            TrackingProps.isBonusIncluded: false,
            TrackingProps.returnReason: [
              'fake-description',
              'fake-description',
            ],
            TrackingProps.productName: ['', ''],
            TrackingProps.productManufacturer: ['NA', 'NA'],
            TrackingProps.unitPrice: [0.0, 0.0],
          });
    });

    test('Test mixpanelTrackingInfo', () {
      expect(
        NewRequestState.initial().copyWith(
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetail.copyWith(returnReason: 'fake-reason'),
              ],
            ),
          ],
        ).mixpanelTrackingInfo(
          reasonList: [
            const Usage(
              usageCode: 'fake-code',
              usageDescription: 'fake-description',
            ),
          ],
        ),
        containsPair(TrackingProps.returnReason, ['fake-reason']),
      );
    });
  });
}
