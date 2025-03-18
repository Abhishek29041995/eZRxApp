import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

class CameraFilesPermission extends StatelessWidget {
  final PermissionType type;
  const CameraFilesPermission({
    super.key,
    required this.type,
  });

  String get title {
    switch (type) {
      case PermissionType.camera:
        return 'eZRx+ is unable to turn on camera';
      case PermissionType.files:
        return 'eZRx+ is unable to access your files';
      default:
        return '';
    }
  }

  String get subTitle {
    switch (type) {
      case PermissionType.camera:
        return 'Camera access was denied. Grant camera access permission in Settings to capture photos on eZRx+.';
      case PermissionType.files:
        return 'Photos and files access was denied. Grant photos and files access permission in Settings to upload photos and documents on eZRx+.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subTitle.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 35,
          ),
          _OpenSettingsSection(type: type),
        ],
      ),
    );
  }
}

class _OpenSettingsSection extends StatelessWidget {
  final PermissionType type;
  const _OpenSettingsSection({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              key: WidgetKeys.cancelButton,
              onPressed: () => type == PermissionType.camera
                  ? context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name)
                  : context.router.maybePop(),
              child: Text(context.tr('Cancel')),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              key: WidgetKeys.confirmButton,
              onPressed: () async {
                final router = context.router;
                await openAppSettings();
                type == PermissionType.camera
                    ? router
                        .popUntilRouteWithName(HomeNavigationTabbarRoute.name)
                    : router.maybePop();
              },
              child: Text('Open Settings'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
