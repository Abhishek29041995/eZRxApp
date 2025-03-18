import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(' valid', () async {
    final bodyMessage =
        UpgraderLocalizationMessage().message(UpgraderMessage.body);
    final buttonTitleIgnoreMessage = UpgraderLocalizationMessage()
        .message(UpgraderMessage.buttonTitleIgnore);
    final buttonTitleLaterMessage =
        UpgraderLocalizationMessage().message(UpgraderMessage.buttonTitleLater);
    final buttonTitleUpdate = UpgraderLocalizationMessage()
        .message(UpgraderMessage.buttonTitleUpdate);
    final promptMessage =
        UpgraderLocalizationMessage().message(UpgraderMessage.prompt);
    final releaseNotesMessage =
        UpgraderLocalizationMessage().message(UpgraderMessage.releaseNotes);
    final titleMessage =
        UpgraderLocalizationMessage().message(UpgraderMessage.title);

    expect(UpgraderLocalizationMessage(), isNotNull);
    expect(bodyMessage, 'A new version of {{appName}} is available!');
    expect(buttonTitleIgnoreMessage, 'Ignore');
    expect(buttonTitleLaterMessage, 'Later');
    expect(buttonTitleUpdate, 'Update Now');
    expect(promptMessage, '');
    expect(releaseNotesMessage, 'Release Notes');
    expect(titleMessage, 'Update App?');
  });
}
