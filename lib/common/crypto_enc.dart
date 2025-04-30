import 'dart:math';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:typed_data';

class CryptoEncryption {
  final String secureKey;

  CryptoEncryption(this.secureKey);

  String encryptMyData(String text) {
    if (text == null) throw ArgumentError('text cannot be null');
    if (secureKey == null) throw ArgumentError('secureKey cannot be null');

    try {
      // Derive 256-bit key via SHA-256(keyString)
      final keyHash = sha256.convert(utf8.encode(secureKey)).bytes;
      final key = enc.Key(Uint8List.fromList(keyHash));

      // Derive 128-bit IV via HMAC-SHA256(key) and take first 16 bytes
      final hmac = Hmac(sha256, keyHash);
      final fullIv = hmac.convert([]).bytes;
      final iv = enc.IV(Uint8List.fromList(fullIv.sublist(0, 16)));

      // AES-CBC encryption with PKCS7 padding
      final encrypter = enc.Encrypter(
        enc.AES(
          key,
          mode: enc.AESMode.cbc,
          padding: 'PKCS7'
        )
      );

      final encrypted = encrypter.encrypt(text, iv: iv);
      return encrypted.base64;
    } catch (e) {
      throw StateError('Encryption failed: $e');
    }
  }

  String decryption(String encryptedText) {
    if (encryptedText == null) throw ArgumentError('encryptedText cannot be null');
    if (secureKey == null) throw ArgumentError('secureKey cannot be null');

    try {
      // Derive key and IV same as in encrypt()
      final keyHash = sha256.convert(utf8.encode(secureKey)).bytes;
      final key = enc.Key(Uint8List.fromList(keyHash));

      final hmac = Hmac(sha256, keyHash);
      final fullIv = hmac.convert([]).bytes;
      final iv = enc.IV(Uint8List.fromList(fullIv.sublist(0, 16)));

      final encrypter = enc.Encrypter(
        enc.AES(
          key,
          mode: enc.AESMode.cbc,
          padding: 'PKCS7'
        )
      );

      try {
        return encrypter.decrypt(
          enc.Encrypted.from64(encryptedText),
          iv: iv
        );
      } catch (e) {
        print("Decryption error: $e");
        return "keyError";
      }
    } catch (e) {
      print("Encryption setup error: $e");
      return "keyError";
    }
  }

  String hashString(String input) {
    if (input == null) throw ArgumentError('input cannot be null');

    final hash = sha256.convert(utf8.encode(input)).bytes;
    return hash.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  String hashPassword(String password, [String? saltBase64]) {
    if (password == null) throw ArgumentError('password cannot be null');

    late List<int> salt;
    if (saltBase64 == null || saltBase64.isEmpty) {
      // Generate random 16 byte salt
      salt = List<int>.generate(16, (_) => Random.secure().nextInt(256));
      saltBase64 = base64Encode(salt);
    } else {
      salt = base64Decode(saltBase64);
    }

    // Compute SHA256(salt || password)
    final pwdBytes = utf8.encode(password);
    final saltedPwd = [...salt, ...pwdBytes];
    final hash = sha256.convert(saltedPwd).bytes;
    
    return '${saltBase64}:${base64Encode(hash)}';
  }

  bool verifyPassword(String password, String saltedHash) {
    if (password == null) throw ArgumentError('password cannot be null');
    if (saltedHash == null) throw ArgumentError('saltedHash cannot be null');

    final parts = saltedHash.split(':');
    if (parts.length != 2) return false;
    
    // Recompute using the same salt
    final recomputed = hashPassword(password, parts[0]);
    return recomputed == saltedHash;
  }
}
