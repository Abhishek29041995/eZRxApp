import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Privacy control', () {
    final privacyControl = PrivacyControl.empty().copyWith(
      automatedPersonalisation: true,
      viaEmails: false,
      viaPushNotification: true,
      viaSMS: false,
      directMarketing: true,
    );

    expect(privacyControl.automatedPersonalisation, true);
    expect(privacyControl.directMarketing, true);
    expect(privacyControl.viaEmails, false);
    expect(privacyControl.viaPushNotification, true);
    expect(privacyControl.viaEmails, false);
  });
}
