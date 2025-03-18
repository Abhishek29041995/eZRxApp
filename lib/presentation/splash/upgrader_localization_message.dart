import 'package:easy_localization/easy_localization.dart';
import 'package:upgrader/upgrader.dart';

class UpgraderLocalizationMessage extends UpgraderMessages {
  @override
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return 'A new version of {{appName}} is available!'.tr();
      case UpgraderMessage.buttonTitleIgnore:
        return 'Ignore'.tr();
      case UpgraderMessage.buttonTitleLater:
        return 'Later'.tr();
      case UpgraderMessage.buttonTitleUpdate:
        return 'Update Now'.tr();
      case UpgraderMessage.prompt:
        return '';
      case UpgraderMessage.releaseNotes:
        return 'Release Notes'.tr();
      case UpgraderMessage.title:
        return 'Update App?'.tr();
    }
  }
}
