import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late DeliveryInfoData data;
  group(
    'Additional Details Bloc Test',
    () {
      setUp(
        () {
          data = DeliveryInfoData.empty();
        },
      );
      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc with futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: fakeIDSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DateTimeStringValue(''),
              mobileNumber: PhoneNumber(''),
            ),
            config: fakeIDSalesOrgConfigs,
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Load Bloc without futureDeliveryDay',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initialized(
            config: fakeIDSalesOrgConfigs.copyWith(
              futureDeliveryDay: FutureDeliveryDay(''),
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              deliveryDate: DateTimeStringValue(''),
              mobileNumber: PhoneNumber(''),
            ),
            config: fakeIDSalesOrgConfigs.copyWith(
              futureDeliveryDay: FutureDeliveryDay(''),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'initiateFromHistory test',
        build: () => AdditionalDetailsBloc(),
        act: (bloc) => bloc.add(
          AdditionalDetailsEvent.initiateFromHistory(
            config: fakeIDSalesOrgConfigs,
            data: data,
          ),
        ),
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            config: fakeIDSalesOrgConfigs,
            deliveryInfoData: data.copyWith(
              mobileNumber: PhoneNumber(data.mobileNumber.validPhoneNumber),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details AdditionalDetails Form OnTextChange',
        build: () => AdditionalDetailsBloc(),
        act: (AdditionalDetailsBloc bloc) {
          bloc
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.poReference,
                newValue: 'Sample Reference',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.contactPerson,
                newValue: 'Person Name',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.deliveryDate,
                newValue: '2012-12-10',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.referenceNote,
                newValue: 'Reference Note',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.deliveryInstruction,
                newValue: 'Special Instruction',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.paymentTerm,
                newValue: '0001-Test',
              ),
            )
            ..add(
              const AdditionalDetailsEvent.onTextChange(
                label: DeliveryInfoLabel.mobileNumber,
                newValue: '1234567890',
              ),
            );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: StringValue('Reference Note'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: StringValue('Reference Note'),
              deliveryInstruction: StringValue('Special Instruction'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: StringValue('Reference Note'),
              deliveryInstruction: StringValue('Special Instruction'),
              paymentTerm: PaymentTerm('0001-Test'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: data.copyWith(
              poReference: StringValue('Sample Reference'),
              contactPerson: StringValue('Person Name'),
              deliveryDate: DateTimeStringValue('2012-12-10'),
              referenceNote: StringValue('Reference Note'),
              deliveryInstruction: StringValue('Special Instruction'),
              paymentTerm: PaymentTerm('0001-Test'),
              mobileNumber: PhoneNumber('1234567890'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Change showWarningBlock to false when form validated',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue('PERSON'),
            mobileNumber: PhoneNumber(''),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: StringValue('Reference Note Test'),
            deliveryInstruction: StringValue('Instruction Test'),
          ),
          showErrorMessages: true,
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.onTextChange(
              label: DeliveryInfoLabel.mobileNumber,
              newValue: '1234567890',
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue('PERSON'),
              mobileNumber: PhoneNumber('1234567890'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: StringValue('Reference Note Test'),
              deliveryInstruction: StringValue('Instruction Test'),
            ),
            showErrorMessages: true,
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Success',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue('PERSON'),
            mobileNumber: PhoneNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: StringValue('Reference Note Test'),
            deliveryInstruction: StringValue('Instruction Test'),
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue('PERSON'),
              mobileNumber: PhoneNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: StringValue('Reference Note Test'),
              deliveryInstruction: StringValue('Instruction Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Success - after first time api failure ',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
          ),
          isValidated: true,
          focusTo: null,
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
            ),
          ),
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form failure when payment term is invalid',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          config: fakeTWSalesOrgConfigs,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue('PERSON'),
            mobileNumber: PhoneNumber('123456'),
            paymentTerm: PaymentTerm(''),
            referenceNote: StringValue('Reference Note Test'),
            deliveryInstruction: StringValue('Instruction Test'),
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            config: fakeTWSalesOrgConfigs,
            focusTo: DeliveryInfoLabel.paymentTerm,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue('PERSON'),
              mobileNumber: PhoneNumber('123456'),
              paymentTerm: PaymentTerm(''),
              referenceNote: StringValue('Reference Note Test'),
              deliveryInstruction: StringValue('Instruction Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form failure when po attachment is invalid',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          config: fakeIDSalesOrgConfigs,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            referenceNote: StringValue('Reference Note Test'),
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            config: fakeIDSalesOrgConfigs,
            isPoAttachmentValidated: false,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              referenceNote: StringValue('Reference Note Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Validate AdditionalDetails Form Failure',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue(''),
            mobileNumber: PhoneNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            referenceNote: StringValue('Reference Note Test'),
            deliveryInstruction: StringValue('Instruction Test'),
          ),
          config: fakeTHSalesOrgConfigs.copyWith(enableMobileNumber: true),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.validateForm(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            config: fakeTHSalesOrgConfigs.copyWith(enableMobileNumber: true),
            focusTo: DeliveryInfoLabel.contactPerson,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue(''),
              mobileNumber: PhoneNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              referenceNote: StringValue('Reference Note Test'),
              deliveryInstruction: StringValue('Instruction Test'),
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery true',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue(''),
            mobileNumber: PhoneNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: false,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery());
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue(''),
              mobileNumber: PhoneNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              greenDeliveryEnabled: true,
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details toggleGreenDelivery test enableGreenDelivery false',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poReference: StringValue('CO REF'),
            contactPerson: StringValue(''),
            mobileNumber: PhoneNumber('123456'),
            paymentTerm: PaymentTerm('0001-TEST'),
            greenDeliveryEnabled: true,
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(const AdditionalDetailsEvent.toggleGreenDelivery());
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poReference: StringValue('CO REF'),
              contactPerson: StringValue(''),
              mobileNumber: PhoneNumber('123456'),
              paymentTerm: PaymentTerm('0001-TEST'),
              greenDeliveryEnabled: false,
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Add',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          isValidated: false,
          showErrorMessages: true,
          config: fakeIDSalesOrgConfigs,
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [PoDocuments.empty()],
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
            showErrorMessages: true,
            config: fakeIDSalesOrgConfigs,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [PoDocuments.empty()],
            ),
          ),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poDocuments: [PoDocuments.empty()],
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            AdditionalDetailsEvent.removePoDocument(
              poDocument: PoDocuments.empty(),
            ),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial()
              .copyWith(isPoAttachmentValidated: false),
        ],
      );

      blocTest<AdditionalDetailsBloc, AdditionalDetailsState>(
        'Additional Details Po Document Remove All',
        build: () => AdditionalDetailsBloc(),
        seed: () => AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            poDocuments: [
              PoDocuments.empty().copyWith(
                name: 'fake-name1',
                url: 'fake-name1',
              ),
              PoDocuments.empty().copyWith(
                name: 'fake-name2',
                url: 'fake-name2',
              ),
            ],
          ),
        ),
        act: (AdditionalDetailsBloc bloc) {
          bloc.add(
            const AdditionalDetailsEvent.removeAllPoDocument(),
          );
        },
        expect: () => [
          AdditionalDetailsState.initial(),
        ],
      );
    },
  );
}
