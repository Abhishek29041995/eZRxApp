import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart' hide Key;
import 'dart:typed_data';
import 'package:tuple/tuple.dart';
import 'package:convert/convert.dart';

import 'package:encrypt/encrypt.dart';

class Decryption {
  String decrypt(String encrypted) {
    try {
      final encryptedBytesWithSalt = encrypt.decodeHexString(encrypted);
      final encryptedBytes =
          encryptedBytesWithSalt.sublist(16, encryptedBytesWithSalt.length);
      final salt = encryptedBytesWithSalt.sublist(8, 16);
      final keyndIV = _deriveKeyAndIV('wWa6zg3xL0N', salt);
      final key = encrypt.Key(keyndIV.item1);
      final iv = encrypt.IV(keyndIV.item2);

      final encrypter = encrypt.Encrypter(
        encrypt.AES(
          key,
          mode: encrypt.AESMode.cbc,
          padding: 'PKCS7',
        ),
      );

      return encrypter.decrypt64(base64.encode(encryptedBytes), iv: iv);
    } catch (error) {
      rethrow;
    }
  }

  String orderDecrypt({required String encryptedText, required String secretKey}) {
    // Extract the IV from the first 32 characters
    final ivHex = encryptedText.characters.getRange(0, 32).string;
    final iv = IV.fromBase16(ivHex);

    // Convert the rest of the data from hex to bytes
    final encryptedBytes = Uint8List.fromList(
      hex.decode(encryptedText.characters.getRange(32).string),
    );

    // Create the key and the encrypter
    final key = Key.fromUtf8(secretKey);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // Decrypt the data
    return encrypter.decrypt(Encrypted(encryptedBytes), iv: iv);
  }

  Tuple2<Uint8List, Uint8List> _deriveKeyAndIV(
    String passphrase,
    Uint8List salt,
  ) {
    final password = _createUint8ListFromString(passphrase);
    var concatenatedHashes = Uint8List(0);
    var currentHash = Uint8List(0);
    var enoughBytesForKey = false;
    var preHash = Uint8List(0);

    while (!enoughBytesForKey) {
      preHash = currentHash.isNotEmpty
          ? Uint8List.fromList(currentHash + password + salt)
          : Uint8List.fromList(password + salt);

      currentHash = Uint8List.fromList(md5.convert(preHash).bytes);
      concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash);
      if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
    }

    final keyBtyes = concatenatedHashes.sublist(0, 32);
    final ivBtyes = concatenatedHashes.sublist(32, 48);

    return Tuple2(keyBtyes, ivBtyes);
  }

  Uint8List _createUint8ListFromString(String s) {
    final ret = Uint8List(s.length);
    for (var i = 0; i < s.length; i++) {
      ret[i] = s.codeUnitAt(i);
    }

    return ret;
  }
}
