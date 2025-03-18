import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_search_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/scan_material_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ScanMaterialInfoRepositoryMock extends Mock
    implements ScanMaterialInfoRepository {}

class ProductSearchRepositoryMock extends Mock
    implements ProductSearchRepository {}

class MockBarcodeCaptureSession extends Mock implements BarcodeCaptureSession {}

class MockBarcodeCapture extends Mock implements BarcodeCapture {}

class MockBarcode extends Mock implements Barcode {}

class BarcodeCaptureFake extends Fake implements BarcodeCapture {
  @override
  void addListener(BarcodeCaptureListener listener) {}

  @override
  void removeListener(BarcodeCaptureListener listener) {}
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ScanMaterialInfoRepository scanRepository;
  late ProductSearchRepository searchRepository;
  late MaterialFilter fakeMaterialFilter;
  late MaterialInfo fakeMaterial;
  late ScanMaterialInfoBloc bloc;
  late StreamController<String> scanResultController;
  final fakeEan = Ean('fake');
  final initialState = ScanMaterialInfoState.initial().copyWith(
    salesOrgConfigs: fakeMYSalesOrgConfigs,
    salesOrganisation: fakeMYSalesOrganisation,
    customerCodeInfo: fakeCustomerCodeInfo,
    shipToInfo: fakeShipToInfo,
    user: fakeClientUser,
  );

  final session = MockBarcodeCaptureSession();
  final barcodeCapture = MockBarcodeCapture();
  final barcodeCode = MockBarcode();

  setUpAll(() async {
    fakeMaterialFilter = await MaterialFilterLocalDataSource().getFilters();
    fakeMaterial = await ProductDetailLocalDataSource().getProductDetails();
  });

  setUp(() {
    scanRepository = ScanMaterialInfoRepositoryMock();
    scanResultController = StreamController<String>();
    searchRepository = ProductSearchRepositoryMock();
    bloc = ScanMaterialInfoBloc(
      scanInfoRepository: scanRepository,
      productSearchRepository: searchRepository,
    );
    when(() => scanRepository.fetchBarcodeCapture())
        .thenReturn(BarcodeCaptureFake());
    bloc.scanResultController = scanResultController;
  });

  group('Scan material info bloc -', () {
    blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
      'Initialize event',
      build: () => bloc,
      act: (bloc) => bloc.add(
        ScanMaterialInfoEvent.initialized(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
        ),
      ),
      expect: () => [initialState],
      verify: (bloc) {
        verify(() => scanRepository.fetchBarcodeCapture()).called(2);
      },
    );

    group('Scan material number from camera event -', () {
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure when no permission',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.camera))
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
            materialFilter: fakeMaterialFilter,
          ),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
            materialFilter: fakeMaterialFilter,
          ),
          initialState.copyWith(
            isScanInProgress: true,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            material: MaterialInfo.empty(),
            materialFilter: fakeMaterialFilter,
          ),
        ],
      );

      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure when scan failed',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.camera))
              .thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(() => scanRepository.scanMaterialNumberFromDeviceCamera())
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
            materialFilter: fakeMaterialFilter,
          ),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
            materialFilter: fakeMaterialFilter,
          ),
          initialState.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            material: MaterialInfo.empty(),
            materialFilter: fakeMaterialFilter,
          ),
        ],
      );

      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Success',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.camera))
              .thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(() => scanRepository.scanMaterialNumberFromDeviceCamera())
              .thenAnswer((_) async => const Right(true));
        },
        act: (bloc) => bloc.add(
          ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
            materialFilter: fakeMaterialFilter,
          ),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
            materialFilter: fakeMaterialFilter,
          ),
        ],
      );
    });

    group('Scan material number from storage event -', () {
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure when no permission',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.files))
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          const ScanMaterialInfoEvent.scanImageFromDeviceStorage(),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
          ),
          initialState.copyWith(
            isScanInProgress: true,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            material: MaterialInfo.empty(),
          ),
        ],
      );

      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure when scan failed',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.files))
              .thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(() => scanRepository.scanImageFromDeviceStorage())
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          const ScanMaterialInfoEvent.scanImageFromDeviceStorage(),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
          ),
          initialState.copyWith(
            material: MaterialInfo.empty(),
          ),
          initialState.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            material: MaterialInfo.empty(),
          ),
        ],
      );

      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Success',
        build: () => bloc,
        seed: () => initialState.copyWith(material: fakeMaterial),
        setUp: () {
          when(() => scanRepository.getPermission(type: PermissionType.files))
              .thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(() => scanRepository.scanImageFromDeviceStorage())
              .thenAnswer((_) async => const Right(true));
        },
        act: (bloc) => bloc.add(
          const ScanMaterialInfoEvent.scanImageFromDeviceStorage(),
        ),
        expect: () => [
          initialState.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
          ),
          initialState.copyWith(
            material: MaterialInfo.empty(),
          ),
        ],
      );
    });

    group('Disable scan event -', () {
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure',
        build: () => bloc,
        seed: () => initialState,
        setUp: () {
          when(() => scanRepository.disableMaterialScan())
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(const ScanMaterialInfoEvent.disableScan()),
        expect: () => [
          initialState.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
          ),
        ],
      );
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Success',
        build: () => bloc,
        seed: () => initialState,
        setUp: () {
          when(() => scanRepository.disableMaterialScan())
              .thenAnswer((_) async => const Right(true));
        },
        act: (bloc) => bloc.add(const ScanMaterialInfoEvent.disableScan()),
        expect: () => [],
      );
    });

    group('Emit scanned data event -', () {
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure',
        build: () => bloc,
        seed: () => initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(const Right(true)),
          materialFilter: fakeMaterialFilter,
        ),
        setUp: () {
          when(() => scanRepository.disableMaterialScan())
              .thenAnswer((_) async => const Right(true));
          when(
            () => searchRepository.getScanProduct(
              salesOrganization: initialState.salesOrganisation,
              customerCodeInfo: initialState.customerCodeInfo,
              shipToInfo: initialState.shipToInfo,
              eanNumber: fakeEan,
              salesOrgConfig: initialState.salesOrgConfigs,
              user: initialState.user,
              materialFilter: fakeMaterialFilter,
            ),
          ).thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          ScanMaterialInfoEvent.emitScannedData(scannedRes: fakeEan),
        ),
        expect: () => [
          initialState.copyWith(materialFilter: fakeMaterialFilter),
          initialState.copyWith(
            materialFilter: fakeMaterialFilter,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
          ),
        ],
        verify: (bloc) {
          verify(() => scanRepository.disableMaterialScan()).called(1);
        },
      );

      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Success',
        build: () => bloc,
        seed: () => initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(const Right(true)),
          materialFilter: fakeMaterialFilter,
        ),
        setUp: () {
          when(() => scanRepository.disableMaterialScan())
              .thenAnswer((_) async => const Right(true));
          when(
            () => searchRepository.getScanProduct(
              salesOrganization: initialState.salesOrganisation,
              customerCodeInfo: initialState.customerCodeInfo,
              shipToInfo: initialState.shipToInfo,
              eanNumber: fakeEan,
              salesOrgConfig: initialState.salesOrgConfigs,
              user: initialState.user,
              materialFilter: fakeMaterialFilter,
            ),
          ).thenAnswer((_) async => Right(fakeMaterial));
        },
        act: (bloc) => bloc.add(
          ScanMaterialInfoEvent.emitScannedData(scannedRes: fakeEan),
        ),
        expect: () => [
          initialState.copyWith(materialFilter: fakeMaterialFilter),
          initialState.copyWith(
            materialFilter: fakeMaterialFilter,
            material: fakeMaterial,
            apiFailureOrSuccessOption: optionOf(Right(fakeMaterial)),
          ),
        ],
        verify: (bloc) {
          verify(() => scanRepository.disableMaterialScan()).called(1);
        },
      );
    });

    group('Update torch state event -', () {
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Failure',
        build: () => bloc,
        seed: () => initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(const Right(true)),
        ),
        setUp: () {
          when(() => scanRepository.updateTorchState(torchState: true))
              .thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          const ScanMaterialInfoEvent.updateTorchState(torchState: true),
        ),
        expect: () => [
          initialState.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
          ),
        ],
      );
      blocTest<ScanMaterialInfoBloc, ScanMaterialInfoState>(
        'Success',
        build: () => bloc,
        seed: () => initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(const Right(true)),
        ),
        setUp: () {
          when(() => scanRepository.updateTorchState(torchState: true))
              .thenAnswer((_) async => const Right(false));
        },
        act: (bloc) => bloc.add(
          const ScanMaterialInfoEvent.updateTorchState(torchState: true),
        ),
        expect: () => [
          initialState.copyWith(
            isTorchStateEnabled: false,
          ),
        ],
      );
    });

    test(
        'should add scanned data to scanResultController when didScan is called',
        () async {
      final barcodeCode = MockBarcode();
      final session = MockBarcodeCaptureSession();
      when(() => scanRepository.disableMaterialScan())
          .thenAnswer((_) async => const Right(true));
      when(() => session.newlyRecognizedBarcodes).thenReturn([barcodeCode]);
      when(() => barcodeCode.data).thenReturn('fake-data');
      bloc.didScan(MockBarcodeCapture(), session);
      expect(await scanResultController.stream.first, 'fake-data');
    });

    test(
        'should add scanned data to scanResultController when didScan is called',
        () async {
      when(() => scanRepository.disableMaterialScan())
          .thenAnswer((_) async => const Right(true));
      when(() => session.newlyRecognizedBarcodes).thenReturn([barcodeCode]);
      when(() => barcodeCode.data).thenReturn('fake-data');
      bloc.didUpdateSession(barcodeCapture, session);
      bloc.didScan(barcodeCapture, session);
      expect(await scanResultController.stream.first, 'fake-data');
    });
  });
}
