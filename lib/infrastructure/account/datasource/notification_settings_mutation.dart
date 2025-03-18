class NotificationSettingsMutation {
  String getNotificationSettings() {
    return '''
    query getNotificationSettings {
      getNotificationSettings {
        settings {
          orderConfirmation
          paymentConfirmation
          ereturnConfirmation
        }
      }
    }
    ''';
  }

  String setNotificationSettings() {
    return '''
    mutation setNotificationSettings(\$request: NotificationSettingsInput!) {
      setNotificationSettings(input: \$request) {
        settings {
          orderConfirmation
          paymentConfirmation
          ereturnConfirmation
        }
      }
    }
    ''';
  }
}
