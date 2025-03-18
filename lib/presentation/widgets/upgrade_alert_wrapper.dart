import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeAlertWrapper extends StatefulWidget {
  final Widget child;
  const UpgradeAlertWrapper({super.key, required this.child});

  @override
  State<UpgradeAlertWrapper> createState() => _UpgradeAlertWrapperState();
}

class _UpgradeAlertWrapperState extends State<UpgradeAlertWrapper> {
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    _streamSubscription = locator<Upgrader>().stateStream.listen(
      (state) {
        trackMixpanelEvent(
          TrackingEvents.forceUpgradeCheck,
          props: {
            TrackingProps.screensPlaced: context.router.stackData
                .map(
                  (e) => e.name,
                )
                .join(', '),
            TrackingProps.forceUpgradeVersionInfo: state.versionInfo.toString(),
            TrackingProps.forceUpgradePackageInfo: state.packageInfo.toString(),
            TrackingProps.forceUpgradeShouldDisplayUpgrade:
                locator<Upgrader>().shouldDisplayUpgrade(),
            TrackingProps.forceUpgradeBlocked: locator<Upgrader>().blocked(),
            TrackingProps.forceUpgradeAlertTooSoon:
                locator<Upgrader>().isTooSoon(),
            TrackingProps.forceUpgradeIgnoredAlert:
                locator<Upgrader>().alreadyIgnoredThisVersion(),
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return locator<Config>().appFlavor == Flavor.mock
        ? widget.child
        : UpgradeAlert(
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
            upgrader: locator<Upgrader>(),
            child: widget.child,
          );
  }
}
