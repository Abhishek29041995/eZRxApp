import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';

part 'scan_material_info_event.dart';
part 'scan_material_info_state.dart';
part 'scan_material_info_bloc.freezed.dart';

class ScanMaterialInfoBloc
    extends Bloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements BarcodeCaptureListener {
  final IScanMaterialInfoRepository scanInfoRepository;
  final IProductSearchRepository productSearchRepository;
  late StreamController scanResultController;
  ScanMaterialInfoBloc({
    required this.scanInfoRepository,
    required this.productSearchRepository,
  }) : super(ScanMaterialInfoState.initial()) {
    on<ScanMaterialInfoEvent>(_onEvent);
    scanResultController = StreamController<String>();
    scanResultController.stream.listen((scannedData) {
      add(ScanMaterialInfoEvent.emitScannedData(scannedRes: Ean(scannedData)));
    });
  }

  Future<void> _onEvent(
    ScanMaterialInfoEvent event,
    Emitter<ScanMaterialInfoState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        scanInfoRepository.fetchBarcodeCapture().addListener(this);
        emit(
          ScanMaterialInfoState.initial().copyWith(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
            salesOrgConfigs: e.salesOrgConfigs,
          ),
        );
      },
      scanMaterialNumberFromCamera: (e) async {
        emit(
          state.copyWith(
            isScanInProgress: true,
            materialFilter: e.materialFilter,
            material: MaterialInfo.empty(),
          ),
        );

        final permissionsResult = await scanInfoRepository.getPermission(
          type: PermissionType.camera,
        );
        await permissionsResult.fold(
          (failure) {
            if (isClosed) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(permissionsResult),
              ),
            );
          },
          (permissionStatus) async {
            final failureOrSuccess =
                await scanInfoRepository.scanMaterialNumberFromDeviceCamera();
            failureOrSuccess.fold(
              (failure) {
                emit(
                  state.copyWith(
                    apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                    isScanInProgress: false,
                  ),
                );
              },
              (scanMaterialNumberFromCamera) {},
            );
          },
        );
      },
      scanImageFromDeviceStorage: (e) async {
        emit(
          state.copyWith(
            isScanInProgress: true,
            material: MaterialInfo.empty(),
          ),
        );

        final permissionsResult = await scanInfoRepository.getPermission(
          type: PermissionType.files,
        );

        await permissionsResult.fold(
          (failure) {
            if (isClosed) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(permissionsResult),
              ),
            );
          },
          (permissionResult) async {
            emit(
              state.copyWith(isScanInProgress: false),
            );
            final failureOrSuccess =
                await scanInfoRepository.scanImageFromDeviceStorage();
            failureOrSuccess.fold(
              (failure) {
                emit(
                  state.copyWith(
                    apiFailureOrSuccessOption: optionOf(
                      failureOrSuccess,
                    ),
                  ),
                );
              },
              (scanImageFromDeviceStorage) {},
            );
          },
        );
      },
      disableScan: (e) async {
        final failureOrSuccess = await scanInfoRepository.disableMaterialScan();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(
                  failureOrSuccess,
                ),
              ),
            );
          },
          (disableMaterialScan) {},
        );
      },
      emitScannedData: (e) async {
        emit(
          state.copyWith(
            isScanInProgress: false,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productSearchRepository.getScanProduct(
          salesOrganization: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          eanNumber: e.scannedRes,
          user: state.user,
          salesOrgConfig: state.salesOrgConfigs,
          materialFilter: state.materialFilter,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(
                failureOrSuccess,
              ),
            ),
          ),
          (material) => emit(
            state.copyWith(
              material: material,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
        );
        await scanInfoRepository.disableMaterialScan();
      },
      updateTorchState: (e) async {
        final failureOrSuccess =
            await scanInfoRepository.updateTorchState(torchState: e.torchState);
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(
                failureOrSuccess,
              ),
            ),
          ),
          (updatedTorchState) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              isTorchStateEnabled: updatedTorchState,
            ),
          ),
        );
      },
    );
  }

  @override
  void didScan(BarcodeCapture barcodeCapture, BarcodeCaptureSession session) {
    scanInfoRepository.disableMaterialScan();

    final barcode = session.newlyRecognizedBarcodes.first;
    final scannedMessage = barcode.data ?? '';

    scanResultController.sink.add(scannedMessage);
  }

  @override
  void didUpdateSession(
    BarcodeCapture barcodeCapture,
    BarcodeCaptureSession session,
  ) {}

  @override
  Future<void> close() {
    scanInfoRepository.fetchBarcodeCapture().removeListener(this);
    scanResultController.close();

    return super.close();
  }
}
