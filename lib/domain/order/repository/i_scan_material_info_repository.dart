import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IScanMaterialInfoRepository {
  Future<Either<ApiFailure, bool>> scanMaterialNumberFromDeviceCamera();
  Future<Either<ApiFailure, bool>> disableMaterialScan();
  Future<Either<ApiFailure, bool>> scanImageFromDeviceStorage();
  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required PermissionType type,
  });
  Future<Either<ApiFailure, bool>> updateTorchState({required bool torchState});
  BarcodeCapture fetchBarcodeCapture();
}
