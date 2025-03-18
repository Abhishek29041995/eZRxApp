import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';

@RoutePage()
class ScanMaterialInfo extends StatefulWidget {
  const ScanMaterialInfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScanMaterialInfoState();
  }
}

class _ScanMaterialInfoState extends State<ScanMaterialInfo>
    with WidgetsBindingObserver {
  late ScanMaterialInfoBloc scanMaterialInfoBloc =
      context.read<ScanMaterialInfoBloc>();
  _ScanMaterialInfoState();

  @override
  void initState() {
    super.initState();
    scanMaterialInfoBloc.add(
      ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
        materialFilter: context.read<MaterialFilterBloc>().state.materialFilter,
      ),
    );
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);
  }

  @override
  void dispose() {
    scanMaterialInfoBloc.add(const ScanMaterialInfoEvent.disableScan());
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanMaterialInfoBloc, ScanMaterialInfoState>(
      listenWhen: (previous, current) =>
          previous.isScanInProgress != current.isScanInProgress &&
          !current.isScanInProgress,
      listener: (context, state) => context.router.maybePop(),
      child: Scaffold(
        body: Stack(
          children: [
            AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: locator<MaterialInfoScanner>().dataCaptureView,
            ),
            const _ScannerTorchButton(),
            const _ScannerBackButton(),
            const _PhotoGalleryButton(),
            const _InfoSection(),
          ],
        ),
      ),
    );
  }

  T? _ambiguate<T>(T value) => value;
}

class _ScannerTorchButton extends StatelessWidget {
  const _ScannerTorchButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanMaterialInfoBloc, ScanMaterialInfoState>(
      buildWhen: (previous, current) =>
          previous.isTorchStateEnabled != current.isTorchStateEnabled,
      builder: (context, state) {
        return Positioned(
          top: 30,
          right: 10,
          child: IconButton(
            onPressed: () => context.read<ScanMaterialInfoBloc>().add(
                  ScanMaterialInfoEvent.updateTorchState(
                    torchState: !state.isTorchStateEnabled,
                  ),
                ),
            icon: CircleAvatar(
              maxRadius: 16,
              backgroundColor: ZPColors.black,
              child: Icon(
                state.isTorchStateEnabled ? Icons.flash_on : Icons.flash_off,
                color: ZPColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ScannerBackButton extends StatelessWidget {
  const _ScannerBackButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      child: IconButton(
        onPressed: () {
          context
              .read<ScanMaterialInfoBloc>()
              .add(const ScanMaterialInfoEvent.disableScan());
          context.router.maybePop();
        },
        icon: const CircleAvatar(
          maxRadius: 16,
          backgroundColor: ZPColors.black,
          child: Icon(
            Icons.chevron_left,
            color: ZPColors.white,
          ),
        ),
      ),
    );
  }
}

class _PhotoGalleryButton extends StatelessWidget {
  const _PhotoGalleryButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: IconButton(
        onPressed: () => context.read<ScanMaterialInfoBloc>().add(
              const ScanMaterialInfoEvent.scanImageFromDeviceStorage(),
            ),
        icon: const Icon(
          Icons.photo_library_outlined,
          color: ZPColors.white,
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.3,
      left: 30,
      right: 30,
      child: Column(
        children: [
          Text(
            'Please scan one code at a time.'.tr(),
            style: Theme.of(context).textTheme.labelSmall?.apply(
                  color: ZPColors.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Scan the product barcode to find out more\n about the product.'
                .tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.apply(
                  color: ZPColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
