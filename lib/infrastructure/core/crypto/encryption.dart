import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:ezrxmobile/domain/order/entities/order_encryption.dart';

class Encryption {
  OrderEncryption encryptionData({
    required Map<String, dynamic> data,
    required String secretKey,
  }) {
    final dataNeedEncrypt = {'NewOrderInput': data};
    try {
      final iv = IV.fromSecureRandom(16);
      final key = Key.fromUtf8(secretKey);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(json.encode(dataNeedEncrypt), iv: iv);
      final cipherText = iv.bytes + encrypted.bytes;
      final cipherTextHex = cipherText
          .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
          .join('');

      final hash = Hmac(sha256, key.bytes).convert(utf8.encode(cipherTextHex));

      return OrderEncryption(data: cipherTextHex, hash: hash.toString());
    } catch (e) {
      return OrderEncryption(data: '', hash: '');
    }
  }
}
