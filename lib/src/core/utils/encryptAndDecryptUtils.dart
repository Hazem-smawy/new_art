// ignore_for_file: file_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class EncrypterUtils {
  static String encrypt({required String plainText}) {
    final stringKey = utf8.encode('buildyourownsystemwitheraproerpt');
    final keySha256 = sha256.convert(stringKey).bytes;
    final iv = utf8.encode('buildyourownsyst');

    final encrypter = Encrypter(
      AES(
        Key(Uint8List.fromList(keySha256)),
        mode: AESMode.cbc,
      ),
    );

    final encrypted = encrypter.encrypt(
      plainText,
      iv: IV(iv),
    );

    return encrypted.base64;
  }

  static String decrypt({required String plainText}) {
    final stringKey = utf8.encode('buildyourownsystemwitheraproerpt');
    final keySha256 = sha256.convert(stringKey).bytes;
    final iv = utf8.encode('buildyourownsyst');

    final encrypter = Encrypter(
      AES(
        Key(Uint8List.fromList(keySha256)),
        mode: AESMode.cbc,
      ),
    );

    final decrypted =
        encrypter.decrypt(Encrypted.fromBase64(plainText), iv: IV(iv));
    return decrypted;
  }
}
