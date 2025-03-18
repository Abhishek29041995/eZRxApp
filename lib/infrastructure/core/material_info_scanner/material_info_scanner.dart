import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/config.dart';

class MaterialInfoScanner {
  final Config config;
  MaterialInfoScanner({required this.config});

  late Camera? _camera;
  late CameraSettings _cameraSettings;
  late BarcodeCaptureSettings _barcodeCaptureSettings;
  late DataCaptureContext _dataCaptureContext;
  late BarcodeCapture _barcodeCapture;
  late DataCaptureView _dataCaptureView;
  late BarcodeCaptureOverlay _overlay;

  DataCaptureContext get dataCaptureContext {
    return _dataCaptureContext;
  }

  BarcodeCapture get barcodeCapture {
    return _barcodeCapture;
  }

  Camera? get camera {
    return _camera;
  }

  DataCaptureView get dataCaptureView {
    return _dataCaptureView;
  }

  RectangularViewfinder get _rectangularViewfinder =>
      _overlay.viewfinder as RectangularViewfinder;

  SizeWithUnit get _scanArea => SizeWithUnit(
        DoubleWithUnit(0.9, MeasureUnit.fraction),
        DoubleWithUnit(0.1, MeasureUnit.fraction),
      );

  void switchCameraOff() {
    _camera?.switchToDesiredState(FrameSourceState.off);
  }

  void enableSymbologies(List<Symbology> symbologies) {
    _barcodeCaptureSettings.enableSymbologies(symbologies.toSet());
  }

  void applyCameraSettings() {
    _camera?.applySettings(_cameraSettings);
  }

  void applyBarcodeCaptureSettings() {
    _barcodeCapture.applySettings(_barcodeCaptureSettings);
  }

  Future<void> init() async {
    _camera = Camera.defaultCamera;
    _cameraSettings = BarcodeCapture.recommendedCameraSettings;
    _barcodeCaptureSettings = BarcodeCaptureSettings();
    await _camera?.applySettings(_cameraSettings);

    _dataCaptureContext =
        DataCaptureContext.forLicenseKey(config.scanditLicenseKey);

    if (_camera != null) await _dataCaptureContext.setFrameSource(_camera!);

    enableSymbologies(config.enabledSymbologies);
    _barcodeCaptureSettings.locationSelection =
        RectangularLocationSelection.withSize(_scanArea);
    _barcodeCapture =
        BarcodeCapture.forContext(_dataCaptureContext, _barcodeCaptureSettings);

    _dataCaptureView = DataCaptureView.forContext(dataCaptureContext);

    _overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
      _barcodeCapture,
      _dataCaptureView,
      BarcodeCaptureOverlayStyle.frame,
    );
    _overlay.viewfinder =
        RectangularViewfinder.withStyle(RectangularViewfinderStyle.rounded);

    _rectangularViewfinder.setSize(_scanArea);
    _rectangularViewfinder.color = ZPColors.kPrimaryColor;
  }

  Future<void> scanMaterialNumberfromDeviceStorage(
    ImageFrameSource source,
  ) async {
    _dataCaptureContext =
        DataCaptureContext.forLicenseKey(config.scanditLicenseKey);
    await _dataCaptureContext.setFrameSource(source);

    final imageFrameSourceSettings = BarcodeCaptureSettings();

    imageFrameSourceSettings
        .enableSymbologies(config.enabledSymbologies.toSet());

    _barcodeCapture = BarcodeCapture.forContext(
      _dataCaptureContext,
      imageFrameSourceSettings,
    );

    _dataCaptureView = DataCaptureView.forContext(dataCaptureContext);

    _overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
      _barcodeCapture,
      _dataCaptureView,
      BarcodeCaptureOverlayStyle.frame,
    );
  }
}
