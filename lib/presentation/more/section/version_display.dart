import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

class VersionDisplay extends StatelessWidget {
  const VersionDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      key: WidgetKeys.versionDisplay,
      alignment: Alignment.topLeft,
      child: FutureBuilder<String>(
        future: locator<PackageInfoService>().getString(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Material(
            color: ZPColors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
              minVerticalPadding: 0,
              dense: true,
              title: Text(
                'eZRx+ Ver. ${snapshot.data ?? ''}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsGrey),
              ),
            ),
          );
        },
      ),
    );
  }
}
