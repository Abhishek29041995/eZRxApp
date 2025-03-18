import 'package:ezrxmobile/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:okta_oidc/okta_oidc.dart';

class OktaLoginServices {
  final _oktaOidcPlugin = OktaOidc();
  final Config config;

  OktaLoginServices({required this.config});

  Future<bool?> init() async {
    if (kIsWeb) {
      return false;
    }

    return _oktaOidcPlugin.initOkta(config.oktaConfig).then((value) {
      return value ?? (throw PlatformException(code: '0'));
    }).catchError((error) => throw error as PlatformException);
  }

  Future<Map?> login() {
    return _oktaOidcPlugin.login().then((value) {
      return !value?['status']
          ? throw PlatformException(code: '0', message: value?['message'])
          : value;
    }).catchError((error) => throw error as PlatformException);
  }

  Future<Map?> getAccessToken() {
    return _oktaOidcPlugin.getAccessToken().then((value) {
      return !value?['status']
          ? throw PlatformException(code: '0', message: value?['message'])
          : value;
    }).catchError((error) => throw error as PlatformException);
  }

  Future<bool?> logout() {
    return _oktaOidcPlugin.logout().then((value) {
      return value ?? (throw PlatformException(code: '0'));
    }).catchError((error) => throw error as PlatformException);
  }

  Future<dynamic> getUserProfile() {
    return _oktaOidcPlugin.getUserProfile().then((value) {
      return value;
    }).catchError((error) => throw error as PlatformException);
  }
}
