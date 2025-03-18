import 'dart:convert';

import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TokenStorage {
  static const _boxName = 'ezrx_token_box';
  static const _tokenKey = 'ezrx_auth_token';
  static const _secureKey = 'ezrx_auth_secure';
  late Box _encryptedBox;
  SecureStorage secureStorage;

  TokenStorage({required this.secureStorage});

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(JWTDtoAdapter());
    // https://docs.hivedb.dev/#/advanced/encrypted_box
    final encryprionKey = await secureStorage.read(key: _secureKey);
    if (encryprionKey.isEmpty) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: _secureKey, value: base64UrlEncode(key));
    }
    final key = await secureStorage.read(key: _secureKey);
    final encryptionKey = base64Url.decode(key);
    _encryptedBox = await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  Future<JWTDto> get() async {
    try {
      return await _encryptedBox.get(
        _tokenKey,
        defaultValue: JWTDto(access: '', refresh: ''),
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future set(JWTDto jwtDto) async {
    try {
      await _encryptedBox.put(_tokenKey, jwtDto);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future clear() async {
    try {
      await _encryptedBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
