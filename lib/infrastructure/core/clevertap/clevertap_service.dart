import 'dart:convert';

import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:universal_io/io.dart';

class ClevertapService {
  final Config config;
  final PushNotificationService pushNotificationService;

  ClevertapService({
    required this.config,
    required this.pushNotificationService,
  });

  Future<void> init() async {
    await CleverTapPlugin.setDebugLevel(3);
    await createNotificationChannel();
    await setPushToken();
    if (Platform.isIOS) {
      await CleverTapPlugin.registerForPush();
    }
  }

  Future<void> createNotificationChannel() async {
    await CleverTapPlugin.createNotificationChannel(
      config.packageName,
      config.channelName,
      config.appName,
      3,
      true,
    );
  }

  Future<void> setPushToken() async {
    final token = await pushNotificationService.getToken();
    await CleverTapPlugin.setPushToken(token);
  }

  Future<void> setUser({
    required String name,
    required String username,
    required String phone,
    required String email,
    required String role,
    required String market,
  }) async {
    await CleverTapPlugin.onUserLogin(
      {
        'Name': name,
        'Identity': username,
        'Email': email,
        'Phone': phone,
        'Role': role,
        'MSG-push': true,
        'market': market,
        'platform': 'app',
      },
    );
  }

  Future<void> updateUserProfile({
    required Map<String, dynamic> updatedProfile,
  }) async {
    await CleverTapPlugin.profileSet(updatedProfile);
  }

  Future<void> logout() async {
    await CleverTapPlugin.profileSet(
      {'MSG-push': false},
    );
  }

  void trackEvent({
    required String eventName,
    required Map<String, dynamic> properties,
  }) {
    // we need to convert Map/List value using jsonEncode to jsonString
    // because cleverTap not accept those data types
    final convertedProperties = properties.map((key, value) {
      if (value is List || value is Map) {
        return MapEntry(key, jsonEncode(value));
      }

      return MapEntry(key, value);
    });

    try {
      CleverTapPlugin.recordEvent(
        eventName,
        convertedProperties,
      );
    } catch (_) {}
  }
}
