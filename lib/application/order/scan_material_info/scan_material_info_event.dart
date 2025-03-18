part of 'scan_material_info_bloc.dart';

@freezed
class ScanMaterialInfoEvent with _$ScanMaterialInfoEvent {
  const factory ScanMaterialInfoEvent.initialized({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisationConfigs salesOrgConfigs,
  }) = _initialized;
  const factory ScanMaterialInfoEvent.scanMaterialNumberFromCamera({
    required MaterialFilter materialFilter,
  }) = _scanMaterialNumberFromCamera;
  const factory ScanMaterialInfoEvent.disableScan() = _disableScan;
  const factory ScanMaterialInfoEvent.scanImageFromDeviceStorage() =
      _scanImageFromDeviceStorage;
  const factory ScanMaterialInfoEvent.emitScannedData({
    required Ean scannedRes,
  }) = _emitScannedData;
  const factory ScanMaterialInfoEvent.updateTorchState({
    required bool torchState,
  }) = _UpdateTorchState;
}

enum PermissionType {
  camera,
  files,
}
